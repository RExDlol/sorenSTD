varying vec2 v_vTexcoord;
varying vec4 v_vColour;

/* Parameter 1, "frequency"
 * The frequency of the little circles! Higher means more.
*/
uniform float frequency;

/* Parameter 1, "resolution"
 * The resolution of your screen! Pass this as a array of two elements.
*/
uniform vec2 resolution;


void main() {
    vec4 tex = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    float luma = dot(tex.rgb, vec3(0.299, 0.587, 0.114));
    
    float aspect = resolution.x / resolution.y;
    
    vec2 uv_quadrada = v_vTexcoord;
    uv_quadrada.x *= aspect;
    
    vec2 dist = fract(uv_quadrada * frequency) - 0.5;
    
    float radius = (1.0 - luma) * 0.8;
    float circle = smoothstep(radius, radius - 0.1, length(dist));
    
    vec3 final_rgb = tex.rgb * (1.0 - circle * 0.5);
    
    gl_FragColor = vec4(final_rgb, tex.a);
}