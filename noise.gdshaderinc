/* https://www.shadertoy.com/view/XsX3zB
 *
 * The MIT License
 * Copyright © 2013 Nikita Miropolskiy
 *
 * ( license has been changed from CCA-NC-SA 3.0 to MIT
 *
 *   but thanks for attributing your source code when deriving from this sample
 *   with a following link: https://www.shadertoy.com/view/XsX3zB )
 *
 */

/* discontinuous pseudorandom uniformly distributed in [-0.5, +0.5]^3 */
vec3 random3(vec3 c) {
	float j = 4096.0*sin(dot(c,vec3(17.0, 59.4, 15.0)));
	vec3 r;
	r.z = fract(512.0*j);
	j *= .125;
	r.x = fract(512.0*j);
	j *= .125;
	r.y = fract(512.0*j);
	return r-0.5;
}

vec3 hash33(vec3 p){
    float n = sin(dot(p, vec3(7, 157, 113)));
    return fract(vec3(2097152, 262144, 32768)*n);
}


float worley(vec3 uv, float local_scale) {
	vec3 prod = uv * local_scale;
	vec3 index_uv = floor(prod);
	vec3 fract_uv = fract(prod);

	float minimum_dist = 0.6;

	for (int y = -1; y <= 1; y++) {
		for (int x = -1; x <= 1; x++) {
			for (int z = -1; z <= 1; z++) {
				vec3 neighbor = vec3(float(x),float(y), float(z));
				vec3 point = hash33(index_uv + neighbor);

				vec3 diff = neighbor + point - fract_uv;
				float dist = length(diff);
				minimum_dist = min(minimum_dist, dist);
			}
		}
	}

	return minimum_dist;
}

// FROM: https://www.shadertoy.com/view/XtBGDG
//http://webstaff.itn.liu.se/~stegu/simplexnoise/simplexnoise.pdf
//simplex pretty much 99% copied from there
//adjusted by getting "completely random" gradients instead of randoming from 12 preset ones
//and normalizing the gradient vector
float noise3D(vec3 p)
{
	return fract(sin(dot(p ,vec3(12.9898,78.233,128.852))) * 43758.5453)*2.0-1.0;
}

float simplex3D(vec3 p)
{

	float f3 = 1.0/3.0;
	float s = (p.x+p.y+p.z)*f3;
	int i = int(floor(p.x+s));
	int j = int(floor(p.y+s));
	int k = int(floor(p.z+s));

	float g3 = 1.0/6.0;
	float t = float((i+j+k))*g3;
	float x0 = float(i)-t;
	float y0 = float(j)-t;
	float z0 = float(k)-t;
	x0 = p.x-x0;
	y0 = p.y-y0;
	z0 = p.z-z0;

	int i1,j1,k1;
	int i2,j2,k2;

	if(x0>=y0)
	{
		if(y0>=z0){ i1=1; j1=0; k1=0; i2=1; j2=1; k2=0; } // X Y Z order
		else if(x0>=z0){ i1=1; j1=0; k1=0; i2=1; j2=0; k2=1; } // X Z Y order
		else { i1=0; j1=0; k1=1; i2=1; j2=0; k2=1; }  // Z X Z order
	}
	else
	{
		if(y0<z0) { i1=0; j1=0; k1=1; i2=0; j2=1; k2=1; } // Z Y X order
		else if(x0<z0) { i1=0; j1=1; k1=0; i2=0; j2=1; k2=1; } // Y Z X order
		else { i1=0; j1=1; k1=0; i2=1; j2=1; k2=0; } // Y X Z order
	}

	float x1 = x0 - float(i1) + g3;
	float y1 = y0 - float(j1) + g3;
	float z1 = z0 - float(k1) + g3;
	float x2 = x0 - float(i2) + 2.0*g3;
	float y2 = y0 - float(j2) + 2.0*g3;
	float z2 = z0 - float(k2) + 2.0*g3;
	float x3 = x0 - 1.0 + 3.0*g3;
	float y3 = y0 - 1.0 + 3.0*g3;
	float z3 = z0 - 1.0 + 3.0*g3;

	vec3 ijk0 = vec3(float(i),float(j),float(k));
	vec3 ijk1 = vec3(float(i)+float(i1),float(j)+float(j1),float(k)+float(k1));
	vec3 ijk2 = vec3(float(i)+float(i2),float(j)+float(j2),float(k)+float(k2));
	vec3 ijk3 = vec3(float(i)+1.,float(j)+1.,float(k)+1.);

	vec3 gr0 = normalize(vec3(noise3D(ijk0),noise3D(ijk0*2.01),noise3D(ijk0*2.02)));
	vec3 gr1 = normalize(vec3(noise3D(ijk1),noise3D(ijk1*2.01),noise3D(ijk1*2.02)));
	vec3 gr2 = normalize(vec3(noise3D(ijk2),noise3D(ijk2*2.01),noise3D(ijk2*2.02)));
	vec3 gr3 = normalize(vec3(noise3D(ijk3),noise3D(ijk3*2.01),noise3D(ijk3*2.02)));

	float n0 = 0.0;
	float n1 = 0.0;
	float n2 = 0.0;
	float n3 = 0.0;

	float t0 = 0.5 - x0*x0 - y0*y0 - z0*z0;
	if(t0>=0.0)
	{
		t0*=t0;
		n0 = t0 * t0 * dot(gr0, vec3(x0, y0, z0));
	}
	float t1 = 0.5 - x1*x1 - y1*y1 - z1*z1;
	if(t1>=0.0)
	{
		t1*=t1;
		n1 = t1 * t1 * dot(gr1, vec3(x1, y1, z1));
	}
	float t2 = 0.5 - x2*x2 - y2*y2 - z2*z2;
	if(t2>=0.0)
	{
		t2 *= t2;
		n2 = t2 * t2 * dot(gr2, vec3(x2, y2, z2));
	}
	float t3 = 0.5 - x3*x3 - y3*y3 - z3*z3;
	if(t3>=0.0)
	{
		t3 *= t3;
		n3 = t3 * t3 * dot(gr3, vec3(x3, y3, z3));
	}
	return 96.0*(n0+n1+n2+n3);

}

float fbm(vec3 p)
{
	float f;
    f  = 0.50000*simplex3D( p ); p = p*2.01;
    f += 0.25000*simplex3D( p ); p = p*2.02; //from iq
    f += 0.12500*simplex3D( p ); p = p*2.03;
    f += 0.06250*simplex3D( p ); p = p*2.04;
    f += 0.03125*simplex3D( p );
	return f;
}

float noise(vec3 noise_uv, float noise_scale) {
	return fbm(noise_uv * noise_scale);
}


/* https://www.shadertoy.com/view/XsX3zB
 *
 * The MIT License
 * Copyright © 2013 Nikita Miropolskiy
 *
 * ( license has been changed from CCA-NC-SA 3.0 to MIT
 *
 *   but thanks for attributing your source code when deriving from this sample
 *   with a following link: https://www.shadertoy.com/view/XsX3zB )
 *
 */

/* discontinuous pseudorandom uniformly distributed in [-0.5, +0.5]^3 */
vec3 shell_random3(vec3 c) {
	float j = 4096.0*sin(dot(c,vec3(17.0, 59.4, 15.0)));
	vec3 r;
	r.z = fract(512.0*j);
	j *= .125;
	r.x = fract(512.0*j);
	j *= .125;
	r.y = fract(512.0*j);
	return r-0.5;
}

vec3 shell_hash33(vec3 p){
    float n = sin(dot(p, vec3(7, 157, 113)));
    return fract(vec3(2097152, 262144, 32768)*n);
}


float shell_worley(vec3 uv, float local_scale) {
	vec3 prod = uv * local_scale;
	vec3 index_uv = floor(prod);
	vec3 fract_uv = fract(prod);

	float minimum_dist = 1.0;

	for (int y = -1; y <= 1; y++) {
		for (int x = -1; x <= 1; x++) {
			for (int z = -1; z <= 1; z++) {
				vec3 neighbor = vec3(float(x),float(y), float(z));
				vec3 point = shell_random3(index_uv + neighbor);

				vec3 diff = neighbor + point - fract_uv;
				float dist = length(diff);
				minimum_dist = min(minimum_dist, dist);
			}
		}
	}

	return minimum_dist;
}


float shell_worley_color(vec3 uv, float local_scale, out vec3 vcolor) {
	vec3 prod = uv * local_scale;
	vec3 index_uv = floor(prod);
	vec3 fract_uv = fract(prod);

	float minimum_dist = 1.0;
	// This is magic, fixed some weird noisy glitches
	vcolor = vec3(-1.0);

	for (int y = -1; y <= 1; y++) {
		for (int x = -1; x <= 1; x++) {
			for (int z = -1; z <= 1; z++) {
				vec3 neighbor = vec3(float(x),float(y), float(z));
				vec3 point = shell_random3(index_uv + neighbor);

				vec3 diff = neighbor + point - fract_uv;
				float dist = length(diff);
				if (dist < minimum_dist) {
					minimum_dist = dist;
					vcolor = point;
				}
			}
		}
	}

	return minimum_dist;
}


float tastebud_worley(vec3 uv, float local_scale, out vec3 chosen_point) {
	vec3 prod = uv * local_scale;
	vec3 index_uv = floor(prod);
	vec3 fract_uv = fract(prod);

	float minimum_dist = 1.0;
	// This is magic, fixed some weird noisy glitches
	chosen_point = vec3(-1.0);

	for (int y = -1; y <= 1; y++) {
		for (int x = -1; x <= 1; x++) {
			for (int z = -1; z <= 1; z++) {
				vec3 neighbor = vec3(float(x),float(y), float(z));
				const float distort = 0.5;
				vec3 point = shell_random3(index_uv + neighbor) * distort;
				//vec3 point = vec3(1.);

				vec3 diff = neighbor + point - fract_uv;
				float dist = length(diff);
				if (dist < minimum_dist) {
					minimum_dist = dist;
					chosen_point = diff;
				}
			}
		}
	}
	return minimum_dist;
}


