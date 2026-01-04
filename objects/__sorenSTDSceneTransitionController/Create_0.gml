
anim_state = -1;

transition_type = SCENE_TRANSITION.NONE;

manager_id = noone; 

timer = 0;
duration = 100;
time_normalized = 0;

in_ease_func = 0;
out_ease_func = 0;

color = c_black;
arg1 = 10;
arg2 = 10;

/// @func __Srn_Scene_Start_Transition(params, manager_instance_id)
/// @desc Receives the manager instruction and initiates it.
__Srn_Scene_Start_Transition = function(_params, _manager_id) {
    color = _params.color
    transition_type = _params.transition_type;
    manager_id = _manager_id;
    anim_state = __TRANSITION_ANIMATION_STATE.FADE_OUT;
    in_ease_func = _params.in_ease;
    out_ease_func = _params.out_ease;
    arg1 = _params.arg1
    arg2 = _params.arg2
    timer = 0;
};