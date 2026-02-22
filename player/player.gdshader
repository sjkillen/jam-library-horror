shader_type canvas_item;

uniform sampler2D raidal;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	COLOR.rgb = texture(raidal, UV).rgb;
	if (COLOR.r < 0.5) {
		discard;
	}
	COLOR.a = 0.3;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
