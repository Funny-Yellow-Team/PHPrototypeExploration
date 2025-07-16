shader_type spatial;
render_mode unshaded;

uniform sampler2D viewport_texture;

vec3 to_linear(vec3 srgb) {
    return pow(srgb, vec3(2.2));
}

void fragment() {
	vec4 background_pixel = texture(viewport_texture, SCREEN_UV);
	ALBEDO = to_linear(background_pixel.rgb);
	//ALBEDO = vec3(1.0, 0.0, 0.0);
}