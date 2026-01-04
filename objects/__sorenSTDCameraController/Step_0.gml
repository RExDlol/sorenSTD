var _dt = delta_time / 1000000;
var _dt_lerp = 1 - power(1 - cfg.follow_speed, _dt * 60);
var _dt_zoom = 1 - power(1 - cfg.zoom_speed, _dt * 60);

var _target_x = dest_x;
var _target_y = dest_y;

if (instance_exists(cfg.target)) {
    _target_x = cfg.target.x + cfg.offset_x;
    _target_y = cfg.target.y + cfg.offset_y;
    
    if (cfg.lookahead_amount != 0) {
        var _dir = sign(cfg.target.image_xscale);
        _target_x += _dir * cfg.lookahead_amount;
    }
}

if (first_frame && instance_exists(cfg.target)) {
    final_x = _target_x;
    final_y = _target_y;
    dest_x = _target_x;
    dest_y = _target_y;
    cur_zoom = cfg.zoom_level; 
    first_frame = false;
}

var _diff_x = _target_x - final_x;
var _diff_y = _target_y - final_y;

if (abs(_diff_x) < cfg.deadzone_w) _target_x = final_x;
else _target_x -= sign(_diff_x) * cfg.deadzone_w;

if (abs(_diff_y) < cfg.deadzone_h) _target_y = final_y;
else _target_y -= sign(_diff_y) * cfg.deadzone_h;

final_x = lerp(final_x, _target_x, _dt_lerp);
final_y = lerp(final_y, _target_y, _dt_lerp);
cur_zoom = lerp(cur_zoom, cfg.zoom_level, _dt_zoom);

dest_x = _target_x;
dest_y = _target_y;

var _new_w = cfg.base_w / cur_zoom;
var _new_h = cfg.base_h / cur_zoom;

var _shk_x = 0;
var _shk_y = 0;
if (cfg.shake_dur > 0) {
    _shk_x = random_range(-cfg.shake_mag, cfg.shake_mag);
    _shk_y = random_range(-cfg.shake_mag, cfg.shake_mag);
    cfg.shake_dur -= _dt; 
}

var _cam_x = final_x - (_new_w / 2) + _shk_x;
var _cam_y = final_y - (_new_h / 2) + _shk_y;

if (is_struct(cfg.limit_rect)) {
    _cam_x = clamp(_cam_x, cfg.limit_rect.x1, cfg.limit_rect.x2 - _new_w);
    _cam_y = clamp(_cam_y, cfg.limit_rect.y1, cfg.limit_rect.y2 - _new_h);
}

camera_set_view_size(cam, _new_w, _new_h);
camera_set_view_pos(cam, _cam_x, _cam_y);