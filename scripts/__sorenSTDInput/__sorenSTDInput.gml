
/* the descentralized input system of sorenSTD! */

/* interface */

#macro Input global.__Srn_Namespace_Input

/* better idea: encapsulate this in an internal object! */
// __Srn_Input_Key_Map = ds_map_create();

/* this starts with this default value on purpose! */
global.__Srn_Inst_Input = ERROR_INPUT_CONTROLLER_NOT_FOUND;

/* creates the map */

/// @func create(key)
/// @param {String} key The key that you're going to create and assigning binds to.
/// @description Creates an assignable key. Assign binds with Input.bind().
function __Srn_Input_Create_Key(_key) {
    if (ds_map_exists(global.__Srn_Inst_Input.key_map, _key)) {
        return;
    }
    
    var _action = {
        binds    : [],
        down     : false,
        pressed  : false,
        released : false
    };
    
    ds_map_add(global.__Srn_Inst_Input.key_map, _key, _action);
}

/// @func bind(key, bind)
/// @param {String} key The key that you're going to assign the "bind" paramater to.
/// @param {String} bind The bind that you're going to assign to "key". Can be a lot of different Constants, like mouse, gamepad, keyboard...
/// @description Binds one constant to the key in the first parameter. Needs a existing "key" (Input.create()).
function __Srn_Input_Bind(_key, _bind) {
    
    /*
     * garants that it exists. if it already existed, 
     * nothing will occur (by the "if" in the create_key func)
    */
    __Srn_Input_Create_Key(_key);
    
    var _action = global.__Srn_Inst_Input.key_map[? _key];
    
    var _type;
    
    _type = "keyboard";
    
    if (_bind >= gp_face1) {
        _type = "gamepad";
    }
    
    if (_bind == mb_left || _bind == mb_right || _bind == mb_middle || _bind == mb_any || 
        _bind == mb_none || _bind == mb_side1 || _bind == mb_side2) {
        _type = "mouse";
    }
    
    var _bind_map = {
        type        : _type,
        code        : _bind
    }
    
    array_push(_action.binds, _bind_map);
    
    global.__Srn_Inst_Input.key_map[? _key] = _action;
}

/// @func pressed(key)
/// @param {String} key The key that's going to be checked.
/// @description Checks if the "key" parameter is pressed.
/// @return {Bool} False if not pressed at that frame/don't exist key and True if was pressed.
function __Srn_Input_Pressed(_key) {
    if (!ds_map_exists(global.__Srn_Inst_Input.key_map, _key)) {
        return false;
    }
    return global.__Srn_Inst_Input.key_map[? _key].pressed;
}

/// @func pressed(key)
/// @param {String} key The key that's going to be checked.
/// @description Checks if the "key" parameter is currently down.
/// @return {Bool} False if is not currently down/don't exist key and True if is currently down.
function __Srn_Input_Down(_key) {
    if (!ds_map_exists(global.__Srn_Inst_Input.key_map, _key)) {
        return false;
    }
    
    return global.__Srn_Inst_Input.key_map[? _key].down;
}

/// @func pressed(key)
/// @param {String} key The key that's going to be checked.
/// @description Checks if the "key" parameter was released.
/// @return {Bool} False if was not released at that frame/don't exist key and True if was released.
function __Srn_Input_Released(_key) {
    if (!ds_map_exists(global.__Srn_Inst_Input.key_map, _key)) {
        return false;
    }
    
    return global.__Srn_Inst_Input.key_map[? _key].released;
}

/// @func fetch_keys()
/// @description Fetches all the keys. For debug purposes
function __Srn_Input_Fetch_Keys() {
    var _keys = ds_map_keys_to_array(global.__Srn_Inst_Input.key_map);

    for (var i = 0; i < array_length(_keys); i++) {
        var k = _keys[i];
        var a = global.__Srn_Inst_Input.key_map[? k];

        show_debug_message(
            "\n" +
            "[Input] " + k +
            " D:" + string(a.down) +
            " P:" + string(a.pressed) +
            " R:" + string(a.released) +
            " B:" + string(array_length(a.binds)) + "\n"
        );
    }
}

global.__Srn_Namespace_Input = {
    create_key: __Srn_Input_Create_Key,
    bind_key: __Srn_Input_Bind,
    is_pressed: __Srn_Input_Pressed,
    is_down: __Srn_Input_Down,
    is_released: __Srn_Input_Released,
    fetch_keys: __Srn_Input_Fetch_Keys
}
