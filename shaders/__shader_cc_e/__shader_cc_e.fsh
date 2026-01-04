varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_brightness;
uniform float u_contrast;
uniform float u_saturation;
uniform float u_gamma;
uniform float u_exposure;

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    
    col.rgb *= pow(2.0, u_exposure);
    
    col.rgb += u_brightness;
    
    col.rgb = (col.rgb - 0.5) * u_contrast + 0.5;
    col.rgb = clamp(col.rgb, 0.0, 1.0);
    
    float lum = dot(col.rgb, vec3(0.2126, 0.7152, 0.0722));
    col.rgb = mix(vec3(lum), col.rgb, u_saturation);
    
    col.rgb = pow(max(col.rgb, vec3(0.0)), vec3(1.0 / max(u_gamma, 0.01)));
    
    gl_FragColor = v_vColour * vec4(col.rgb, col.a);
}