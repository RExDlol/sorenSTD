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

float get_bayer4x4(vec2 p) {
    int x = int(mod(p.x, 4.0));
    int y = int(mod(p.y, 4.0));
    int index = x + y * 4;
    
    float m[16];
    m[0]=0.0;  m[1]=8.0;  m[2]=2.0;  m[3]=10.0;
    m[4]=12.0; m[5]=4.0;  m[6]=14.0; m[7]=6.0;
    m[8]=3.0;  m[9]=11.0; m[10]=1.0; m[11]=9.0;
    m[12]=15.0;m[13]=7.0; m[14]=13.0;m[15]=5.0;
    
    return m[index] / 16.0;
}

void main() {
    vec4 tex = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    float luma = dot(tex.rgb, vec3(0.299, 0.587, 0.114));
    
    float bayerValue = get_bayer4x4(gl_FragCoord.xy);
    
    float dither = step(bayerValue, luma);
    
    vec3 final_rgb = mix(color_dark, color_light, dither);
    
    gl_FragColor = vec4(final_rgb, tex.a);
}