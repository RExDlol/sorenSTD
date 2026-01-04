if (keyboard_check_pressed(vk_alt)) {
    
    
    parameters = new Scene.transition_config_class(c_black, SCENE_TRANSITION.FADE, Math.ease_expo_in_out, Math.ease_sine_out)
    
    Scene.transition(rm_5, parameters);
}