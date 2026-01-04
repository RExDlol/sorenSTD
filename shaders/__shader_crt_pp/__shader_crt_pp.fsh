varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_resolution;
uniform float u_curvature;
uniform float u_scanline_strength;

void main() {
    // 1. Distorção de Curvatura (Lente)
    vec2 uv = v_vTexcoord - 0.5;
    float dist = dot(uv, uv);
    uv = uv * (1.0 + dist * u_curvature) + 0.5;

    // Se as coordenadas saírem do limite (0.0 a 1.0), pintamos de preto
    if (uv.x < 0.0 || uv.y < 0.0 || uv.x > 1.0 || uv.y > 1.0) {
        gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }

    // 2. Pegar a cor da textura
    vec4 base_col = texture2D(gm_BaseTexture, uv);

    // 3. Scanlines (Baseadas na resolução vertical)
    float scanline = sin(uv.y * u_resolution.y * 1.5) * u_scanline_strength;
    base_col.rgb -= scanline * 0.2;

    // 4. Efeito de Máscara RGB (Simula os sub-pixels)
    float mask = 1.0;
    if (mod(uv.x * u_resolution.x, 3.0) < 1.0) {
        base_col.r *= 1.2;
    } else if (mod(uv.x * u_resolution.x, 3.0) < 2.0) {
        base_col.g *= 1.2;
    } else {
        base_col.b *= 1.2;
    }

    gl_FragColor = v_vColour * base_col;
}