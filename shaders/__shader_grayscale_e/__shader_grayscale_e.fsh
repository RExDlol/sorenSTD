varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    float lum = dot(col.rgb, vec3(0.299, 0.587, 0.114));
    
    gl_FragColor = v_vColour * vec4(lum, lum, lum, col.a);
}
