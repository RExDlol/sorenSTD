var _keys = ds_map_keys_to_array(key_map);
var _len  = array_length(_keys);

for (var i = 0; i < _len; i++) {
    var _name   = _keys[i];
    var _action = key_map[? _name];

    var _is_down = false;

    for (var b = 0; b < array_length(_action.binds); b++) {
        var _bind = _action.binds[b];
        
        switch (_bind.type) {
            case "keyboard":
                if (keyboard_check(_bind.code)) _is_down = true;
                
                break;
            case "mouse":
                if (mouse_check_button(_bind.code)) _is_down = true;
                break;
            case "gamepad":
                if (gamepad_button_check(0, _bind.code)) _is_down = true;
                break;
        }
        if (_is_down) break;
    }
  

    _action.pressed  = _is_down && !_action.down;
    _action.released = !_is_down && _action.down;
    _action.down     = _is_down;

    key_map[? _name] = _action;
}
