
var _progress = 0; 
var _eased_time;
var _current_ease_func;

/* yes, two switches: for more organization and for the "order" (this needs to be set before) */

switch (anim_state) {
    case __TRANSITION_ANIMATION_STATE.FADE_OUT:
    case __TRANSITION_ANIMATION_STATE.PAUSED:
        _current_ease_func = in_ease_func; 
        break;
        
    case __TRANSITION_ANIMATION_STATE.FADE_IN:
        _current_ease_func = out_ease_func;
        break;
}

_eased_time = _current_ease_func(time_normalized);

switch (anim_state) {
    case __TRANSITION_ANIMATION_STATE.FADE_OUT:
    case __TRANSITION_ANIMATION_STATE.PAUSED:
        _progress = clamp(_eased_time, 0, 1);
        break;
        
    case __TRANSITION_ANIMATION_STATE.FADE_IN:
        _progress = clamp(_eased_time, 0, 1);
        break;
}

// ------------------------------------
// drawrdrawradrwa
// ------------------------------------


draw_set_color(color);
var _target_width = display_get_gui_width()
var _target_height = display_get_gui_height()
switch (transition_type) {
    
    case SCENE_TRANSITION.FADE:
        draw_set_alpha(_progress);
        draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
        draw_set_alpha(1);
    break;
    case SCENE_TRANSITION.SINE_BARS:
        var _num_bars = arg1;
        var _bar_width = _target_width / _num_bars;
        
        for (var i = 0; i < _num_bars; i++) {
            var _phase = i / _num_bars;
            
            var _delay = (sin(_phase * pi) * 0.3);
            
            var _t = clamp((_progress - _delay) / (1 - 0.3), 0, 1);
            var _e = _current_ease_func(_t);
            
            var _h = _target_height * _e;
            
            draw_rectangle(
                i * _bar_width,
                _target_height - _h,
                (i + 1) * _bar_width,
                _target_height,
                false
            );
        }
    break;
    
    case SCENE_TRANSITION.WAVE:
        var _steps = arg1;
        var _h = _target_height / _steps;
        
        for (var i = 0; i < _steps; i++) {
            var _phase = i / _steps;
            var _delay = _phase * 0.3;
            
            var _t = clamp((_progress - _delay) / (1 - 0.3), 0, 1);
            var _e = _current_ease_func(_t);
            
            var _w = _target_width * _e;
            
            draw_rectangle(
                0,
                i * _h,
                _w,
                (i + 1) * _h,
                false
            );
        }
    break;
    
    case SCENE_TRANSITION.BARS_VERTICAL:
        var _num_bars = arg1;
        var _bar_width = _target_width / _num_bars;
        
        
        var _max_total_delay = arg2; 
        
        for (var i = 0; i < _num_bars; i++) {
            var _delay = (i / _num_bars) * _max_total_delay; 
            
            var _local_t = clamp((_progress - _delay) / (1 - _max_total_delay), 0, 1);
            
            var _e = _current_ease_func(_local_t);
            
            draw_set_alpha(1);
            draw_rectangle(
                i * _bar_width - 1, 
                -2, 
                (i + 1) * _bar_width, 
                _target_height * _e -1,
                false
            );
        }
    break;
    /* update this */
    case SCENE_TRANSITION.BARS_HORIZONTAL:
        var _num_bars = arg1;
        var _bar_height = _target_height / _num_bars;
        
        for (var i = 0; i < _num_bars; i++) {
            var _delay = i * 0.05;
            var _local_t = clamp((_progress - _delay) / (1 - 0.5), 0, 1);
            var _e = _current_ease_func(_local_t);
            
            var _w = _target_width * _e;
            
            draw_rectangle(
                0,
                i * _bar_height,
                _w,
                (i + 1) * _bar_height,
                false
            );
        }
    break;
    case SCENE_TRANSITION.SLATS:
        var _num = arg1;
        var _h = _target_height / _num;
        
        for (var i = 0; i < _num; i++) {
            var _dir = (i & 1) ? -1 : 1;
            
            var _delay = i * 0.04;
            var _t = clamp((_progress - _delay) / (1 - 0.5), 0, 1);
            var _e = _current_ease_func(_t);
            
            var _w = _target_width * _e;
            
            var _x1 = (_dir > 0) ? 0 : _target_width - _w;
            
            draw_rectangle(
                _x1,
                i * _h,
                _x1 + _w,
                (i + 1) * _h,
                false
            );
        }
    break;
    
    
    case SCENE_TRANSITION.BOX_GRID: 
        
        var _box_size = arg1;
        var _cols = ceil(_target_width / _box_size);
        var _rows = ceil(_target_height / _box_size);
          
        var _cxg = (_cols - 1) * 0.5;
        var _cyg = (_rows - 1) * 0.5;
        var _max_dist = point_distance(0, 0, _cxg, _cyg);
      
        for (var _c = 0; _c < _cols; _c++) {
            for (var _r = 0; _r < _rows; _r++) {
                var _cx = (_c + 0.5) * _box_size;
                var _cy = (_r + 0.5) * _box_size;
                
                var _dist = point_distance(_c, _r, _cxg, _cyg);
                var _delay = (_dist / _max_dist) * 0.4;
                
                var _local_t = clamp((_progress - _delay) / (1 - 0.4), 0, 1);
                var _e = _current_ease_func(_local_t);
                
                
                var _half = (_box_size / 2) * _e;
                
                draw_rectangle(
                    _cx - _half, _cy - _half,
                    _cx + _half, _cy + _half,
                    false
                );
            }
        }
    break;
    case SCENE_TRANSITION.CIRCLE_WIPE:
        var _size = arg1;
        var _cols = ceil(_target_width / _size) + 1;
        var _rows = ceil(_target_height / _size) + 1;
          
        var _max_radius = (_size / 2) * 1.42; 
          
        for (var _c = 0; _c < _cols; _c++) {
            for (var _r = 0; _r < _rows; _r++) {
                var _delay = ((_c + _r) / (_cols + _rows)) * 0.4;
                var _local_p = clamp((_progress - _delay) / (1 - 0.4), 0, 1);
                var _e = _current_ease_func(_local_p);
          
                var _cx = (_c * _size);
                var _cy = (_r * _size);

                if (_e > 0) {
                    draw_circle(_cx, _cy, _max_radius * _e, false);
                }
            }
        }
    break;
    case SCENE_TRANSITION.DIAMOND_WIPE:
        
        var _max_size = point_distance(0, 0, _target_width/2, _target_height/2) * 2.5;
        var _current_size = _max_size * _progress;
        
        draw_set_alpha(1);
        draw_circle(_target_width/2, _target_height/2, _current_size, false);
    break;
}

draw_set_colour(c_white)
draw_set_alpha(1)