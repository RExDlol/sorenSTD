switch (anim_state) {
    
    case __TRANSITION_ANIMATION_STATE.FADE_OUT:
        timer++;
        
        time_normalized = timer / duration;
        
        if (timer >= duration) {
            time_normalized = 1; 
            
            anim_state = __TRANSITION_ANIMATION_STATE.PAUSED;
            
            timer = duration;
            
            if (instance_exists(manager_id)) {
                manager_id.__Srn_Notify_Transition_Complete(true); 
            }
        }
        break;
        
    case __TRANSITION_ANIMATION_STATE.FADE_IN:
        timer--;
        time_normalized = timer / duration;
        
        if (timer <= 0) {
            time_normalized = 0;    
            anim_state = __TRANSITION_ANIMATION_STATE.COMPLETE;
            
            if (instance_exists(manager_id)) {
                manager_id.__Srn_Notify_Transition_Complete(false); 
            }
            
            instance_destroy();
        }
        break;
}