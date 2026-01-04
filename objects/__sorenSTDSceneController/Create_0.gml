current_transition_obj = noone;
next_room_target = noone;
enum __SCENE_STATE {
    READY,
    OUT_TRANSITION,
    LOADING,
    IN_TRANSITION
}

enum __TRANSITION_ANIMATION_STATE {
    FADE_IN,
    PAUSED,
    FADE_OUT,
    COMPLETE
}

state = __SCENE_STATE.READY

/// @func __Srn_Scene_Load_Obj(room_name_or_id)
/// @desc EXECUTS the room change immediately. 
/// @param {Asset.GMRoom} room_name_or_id The room that will be loaded.
__Srn_Scene_Load_Obj = function(_target_room) {
    if (state != __SCENE_STATE.READY && state != __SCENE_STATE.LOADING) {
        show_debug_message("<<!>> so/renSTD: [Scene.load()] " + string(ERROR_ROOM_NOT_READY));
        return;
    }
    
    state = __SCENE_STATE.LOADING;
    next_room_target = _target_room;
    
    show_debug_message("<<!>> so/renSTD: [Scene.load()] Executing clean-ups and room_goto(" + string(_target_room) + ")!");

    room_goto(_target_room);
    
    if (instance_exists(current_transition_obj)) {
        current_transition_obj.anim_state = __TRANSITION_ANIMATION_STATE.FADE_IN;
    } else {
        state = __SCENE_STATE.READY;
        transition_type = SCENE_TRANSITION.NONE;
        show_debug_message("<<!>> so/renSTD: [Scene.load()] Concluded!");
    }
    
};

/// @method __Srn_Scene_TransitionTo(room_name_or_id, transition_type, in easing, out easing)
/// @desc Initiates the animated transition process.
/// @param {Asset.GMRoom} room_name_or_id The room that will be transitioned to.
/// @param {}
__Srn_Scene_TransitionTo_Obj = function(_target_room, params) {
    if (state != __SCENE_STATE.READY) {
        show_debug_message("<<!>> so/renSTD: [Scene.TransitionTo()] " + string(ERROR_ROOM_NOT_READY));
        return;
    }
    
    state = __SCENE_STATE.OUT_TRANSITION;
    
    current_transition_obj = instance_create_layer(0, 0, __Srn_Default_Layer_For_Gui, __sorenSTDSceneTransitionController);
    next_room_target = _target_room;
    current_transition_obj.__Srn_Scene_Start_Transition(params, id); 
    
    show_debug_message("<<!>> so/renSTD: [Scene.TransitionTo()] Initiating animated transition for " + string(_target_room) + "!");
};

/// @method __Srn_Notify_Transition_Complete()
/// @desc Called by the Transition Object when the Transition Ends.
__Srn_Notify_Transition_Complete = function(_is_exit_anim) {
    if (_is_exit_anim) {
        state = __SCENE_STATE.LOADING;
        __Srn_Scene_Load_Obj(next_room_target);
    } else {
        state = __SCENE_STATE.READY;
        current_transition_obj = noone;
        show_debug_message("<<!>> so/renSTD: [Scene.load()] Transition Ended!");
    }
};