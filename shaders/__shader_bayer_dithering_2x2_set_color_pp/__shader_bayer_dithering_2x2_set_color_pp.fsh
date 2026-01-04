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

float get_bayer2x2(vec2 p) {
    int x = int(mod(p.x, 2.0));
    int y = int(mod(p.y, 2.0));
    int index = x + y * 2;
    
    float m[4];
    m[0] = 0.0; m[1] = 2.0;
    m[2] = 3.0; m[3] = 1.0;
    
    return m[index] / 4.0;
}

void main() {
    vec4 tex = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    float luma = dot(tex.rgb, vec3(0.299, 0.587, 0.114));
    
    float bayerValue = get_bayer2x2(gl_FragCoord.xy);
    float dither = step(bayerValue, luma);
    
    gl_FragColor = vec4(mix(color_dark, color_light, dither), tex.a);
}