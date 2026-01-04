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

float get_bayer8x8(vec2 p) {
    vec2 pos = mod(floor(p), 8.0);
    int x = int(pos.x);
    int y = int(pos.y);
    
    vec4 row;
    if (y == 0) row = (x < 4) ? vec4(0, 32, 8, 40) : vec4(2, 34, 10, 42);
    else if (y == 1) row = (x < 4) ? vec4(48, 16, 56, 24) : vec4(50, 18, 58, 26);
    else if (y == 2) row = (x < 4) ? vec4(12, 44, 4, 36) : vec4(14, 46, 6, 38);
    else if (y == 3) row = (x < 4) ? vec4(60, 28, 52, 20) : vec4(62, 30, 54, 22);
    else if (y == 4) row = (x < 4) ? vec4(3, 35, 11, 43) : vec4(1, 33, 9, 41);
    else if (y == 5) row = (x < 4) ? vec4(51, 19, 59, 27) : vec4(49, 17, 57, 25);
    else if (y == 6) row = (x < 4) ? vec4(15, 47, 7, 39) : vec4(13, 45, 5, 37);
    else row = (x < 4) ? vec4(63, 31, 55, 23) : vec4(61, 29, 53, 21);

    int modX = int(mod(float(x), 4.0));
    if (modX == 0) return row.x;
    if (modX == 1) return row.y;
    if (modX == 2) return row.z;
    return row.w;
}

void main() {
    vec4 tex = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    float bayerValue = get_bayer8x8(gl_FragCoord.xy) / 64.0;
    
    vec3 color = tex.rgb + (bayerValue * u_factor - (u_factor * 0.5));
    
    color = floor(color * u_quantize) / u_quantize;
    
    gl_FragColor = vec4(color, tex.a);
}