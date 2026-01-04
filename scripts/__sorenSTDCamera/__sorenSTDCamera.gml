/* sorenSTD Camera Module */
#macro Camera global.__Srn_Namespace_Camera
global.__Srn_Inst_Camera = noone;
function __Srn_Camera_Config_Class() constructor {
    target      = noone;
    follow_speed= 0.1;
    zoom_level  = 1;
    zoom_speed  = 0.1;
    
    offset_x    = 0;
    offset_y    = 0;
    lookahead_amount = 0;
    
    deadzone_w  = 0;
    deadzone_h  = 0;
    
    cam         = view_camera[0];
    
    base_w      = camera_get_view_width(cam);
    base_h      = camera_get_view_height(cam);
    
    shake_mag   = 0;
    shake_dur   = 0;
    
    limit_rect  = { x1: 0, y1: 0, x2: room_width, y2: room_height };
}

function __Srn_Camera_Set(_config_struct) {
    if (!instance_exists(__sorenSTDCameraController)) {
        //@@@ throw cool error
    }
    
    with(global.__Srn_Inst_Camera) {
        if (is_struct(cfg)) {
            var _names = variable_struct_get_names(_config_struct);
            /* to kinda mix it instead of replacing */
            for (var i = 0; i < array_length(_names); i++) {
                var _name = _names[i];
                variable_struct_set(cfg, _name, variable_struct_get(_config_struct, _name));
            }
        } else {
            cfg = _config_struct;
        }
    }
}

global.__Srn_Namespace_Camera = {
    set: __Srn_Camera_Set,
    create_config_class: __Srn_Camera_Config_Class,
    
    shake: function(_amount, _frames) {
        if (instance_exists(global.__Srn_Inst_Camera)) {
            global.__Srn_Inst_Camera.cfg.shake_mag = _amount;
            global.__Srn_Inst_Camera.cfg.shake_dur = _frames;
        }
    },
}