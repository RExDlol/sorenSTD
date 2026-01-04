var _len = array_length(global.__Srn_Post_Effects_List);

if (_len <= 0) {
    draw_surface(application_surface, 0, 0);
    exit;
}

var _w = surface_get_width(application_surface);
var _h = surface_get_height(application_surface);

if (!surface_exists(surf_a)) surf_a = surface_create(_w, _h);
if (!surface_exists(surf_b)) surf_b = surface_create(_w, _h);

var _current_source = application_surface;
var _current_dest   = surf_a;

for (var i = 0; i < _len; i++) {
    var _e = global.__Srn_Post_Effects_List[i];
    if (!_e.enabled) continue;

    surface_set_target(_current_dest);
    draw_clear_alpha(c_black, 0);
    
    shader_set(_e.shader);
    _e.apply_params();
    draw_surface(_current_source, 0, 0);
    shader_reset();
    
    surface_reset_target();
    
    _current_source = _current_dest;
    
    _current_dest = (_current_source == surf_a) ? surf_b : surf_a;
}

draw_surface(_current_source, 0, 0);