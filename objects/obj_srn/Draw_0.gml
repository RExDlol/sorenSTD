color_correction.apply();
draw_self();
if (room == rm_4) {
    draw_text(x, y - 10, "esse eh o shader de crt (scanline, curvatura de uv...)");
}
else {
    draw_text(x, y - 10, "esse é o dithering (ignora essas corda ai)");
}

color_correction.reset();