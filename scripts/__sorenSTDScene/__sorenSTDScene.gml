#macro Scene global.__Srn_Namespace_Scene

enum SCENE_TRANSITION {
    NONE,
    FADE,
    BARS_VERTICAL,
    BARS_HORIZONTAL,
    SINE_BARS,
    SLATS,
    WAVE,
    BOX_GRID,
    DIAMOND_WIPE,
    STAR_GRID,
    CIRCLE_WIPE,
    // random ahh animation (gonna add others),
}

/* interface */

/* this starts with this default value on purpose! */
global.__Srn_Inst_Scene = ERROR_SCENE_CONTROLLER_NOT_FOUND;

/// @func load(room_id)
/// @param {Asset.GMRoom} room_id The id of the Room that you're going to load.
function __Srn_Scene_Load(room_id) {
    global.__Srn_Inst_Scene.__Srn_Scene_Load_Obj(room_id);
}

/// @func transition(room_id)
/// @param {Asset.GMRoom} room_id The id of the Room that you're going to transition to.
/// @param {Struct.__Srn_Scene_Transition_Class} room_id The parameters of the transition. Should be an object of Scene.transition_class()
function __Srn_Scene_TransitionTo(room_name_or_id, params) {
    global.__Srn_Inst_Scene.__Srn_Scene_TransitionTo_Obj(room_name_or_id, params);
}

function __Srn_Scene_Transition_Config_Class(_color, _transition_type, _in_ease, _out_ease, _arg1 = 10, _arg2 = 0.5) constructor {
    color = _color;
    transition_type = _transition_type;
    in_ease = _in_ease;
    out_ease = _out_ease;
    arg1 = _arg1;
    arg2 = _arg2;
};

global.__Srn_Namespace_Scene = {
    load: __Srn_Scene_Load,
    transition: __Srn_Scene_TransitionTo,
    transition_config_class: __Srn_Scene_Transition_Config_Class
}

