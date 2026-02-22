shader_type spatial;
render_mode unshaded, fog_disabled, depth_test_disabled;

#include "noise.gdshaderinc"

uniform float vignette_width = 0.3;
uniform sampler2D alpha_falloff : repeat_disable;
uniform sampler2D pulse_curve : repeat_disable;
global uniform float panic_speed;
uniform sampler2D depth_texture : hint_depth_texture;

void vertex() {
	POSITION = vec4(VERTEX.xy, 1.0, 1.0);
}

void fragment() {
	float depth = texture(depth_texture, vec2(SCREEN_UV)).r;
	vec3 ndc = vec3(SCREEN_UV * 2.0 - 1.0, depth);
	vec4 view = INV_PROJECTION_MATRIX * vec4(ndc, 1.0);
	view.xyz /= view.w;
	float linear_depth = -view.z;
	linear_depth/=400.;
	linear_depth = 1.0 - linear_depth;
	
	float aspect_x = VIEWPORT_SIZE.x / VIEWPORT_SIZE.y;
	float aspect_y = VIEWPORT_SIZE.y / VIEWPORT_SIZE.x;
	vec2 uv = SCREEN_UV * vec2(aspect_x, aspect_y);
	uv.y * .1;
	float time = TIME * 0.1;
	float r_1 = shell_worley(vec3(uv, SCREEN_UV.y - time), 250.);
	float r_2 = shell_worley(vec3(uv, SCREEN_UV.y + time), 1000.);
	bool keep = r_1 + r_2 < .6;
	
	float width = vignette_width;
	float time_w = texture(pulse_curve, vec2(mod(TIME * panic_speed * .5, 1.0))).r;
	width += time_w;
	float d = 1.0 - length(SCREEN_UV - vec2(.5, .5));
	if (!keep && d > width) {
		discard;
	}
	ALBEDO = vec3(0.0);
	float alpha_w = mix(0.0, 1.0, (1.0 / width) * d);
	ALPHA = texture(alpha_falloff, vec2(alpha_w)).r;
	if (keep) {
		ALPHA = 1.0;
	}
}