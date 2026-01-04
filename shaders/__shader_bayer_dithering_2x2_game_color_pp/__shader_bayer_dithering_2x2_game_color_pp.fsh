varying vec2 v_vTexcoord;
varying vec4 v_vColour;

/* Parameter 1, "u_quantize"
 * How the colors will be "crushed" or reduced. Try set this to 4.0!
*/
uniform float u_quantize;

/* Parameter 1, "u_quantize"
 * Dithering Intensity!
*/
uniform float u_factor;

float get_bayer2x2(vec2 p) {
    vec2 pos = mod(floor(p), 2.0);
    int x = int(pos.x);
    int y = int(pos.y);
    
    if (y == 0) {
        if (x == 0) return 0.0; return 2.0;
    } else {
        if (x == 0) return 3.0; return 1.0;
    }
}

void main() {
    vec4 tex = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    float bayerValue = get_bayer2x2(gl_FragCoord.xy) / 4.0;
    
    vec3 color = tex.rgb + (bayerValue * u_factor - (u_factor * 0.5));
    
    color = floor(color * u_quantize) / u_quantize;
    
    gl_FragColor = vec4(color, tex.a);
}