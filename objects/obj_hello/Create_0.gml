PostProcessing.add("retro", __shader_crt_pp)

var _dither = PostProcessing.get("retro");

_dither.set_param("u_resolution", [display_get_gui_width(), display_get_gui_height()]);
_dither.set_param("u_curvature", 0.1);
_dither.set_param("u_scanline_strength", 0.5);