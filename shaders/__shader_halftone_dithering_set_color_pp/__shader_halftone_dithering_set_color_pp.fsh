varying vec2 v_vTexcoord;
varying vec4 v_vColour;

/* Parameter 1, "color_light"
 * The lightest color of your palette.
*/
uniform vec3 color_light;

/* Parameter 1, "color_dark"
 * The darkest color of your palette!
*/
uniform vec3 color_dark;

/* Parameter 2, "frequency"
 * The frequency of the little circles! Higher means more.
*/
uniform float frequency;

/* Parameter 2, "resolution"
 * The resolution of your screen! Pass this as a array of two elements.
*/
uniform vec2 resolution;

vec2 rotate(vec2 uv, float angle) {
    float s = sin(angle);
    float c = cos(angle);
    return vec2(c * uv.x - s * uv.y, s * uv.x + c * uv.y);
}

void main() {
    vec4 tex = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    float luma = dot(tex.rgb, vec3(0.299, 0.587, 0.114));
    
    vec2 aspect_uv = v_vTexcoord * vec2(resolution.x / resolution.y, 1.0);
    
    vec2 rotated_uv = rotate(aspect_uv, 0.7854);
    
    vec2 dist = fract(rotated_uv * frequency) - 0.5;
    
    float radius = (1.0 - luma) * 0.75; 
    
    float delta = fwidth(length(dist));
    float circle = smoothstep(radius, radius - delta, length(dist));
    
    vec3 final_rgb = mix(color_light, color_dark, circle);
    
    gl_FragColor = vec4(final_rgb, tex.a);
}