
/* the post processing script for the lib */

/* -------------------------------------------------------------
/* 
 * i LOVE the foxy of the jungle's lib, 
 * but i don't have it rn (kinda tough
 * to pay), so i made this bonus library 
 * for me and those who can't pay it
 * 
 * his library is a lot better than this one,
 * but i think my version is kinda suitable for you!
 * 
 * don't forget to check his library too!! (it's the best one i ever saw).
 * https://foxyofjungle.itch.io/post-processing-fx
*/
/* -------------------------------------------------------------
/* interface */

#macro PostProcessing global.__Srn_Namespace_PostProcessing

/* this starts with this default value on purpose! */
global.__Srn_Inst_PostProcessing = ERROR_POSTPROCESSING_CONTROLLER_NOT_FOUND;

global.__Srn_Post_Effects_List = [];

/* this an constructor with member-funcs because you can use multiple inst for 
cooler efefcts*/
function __Srn_Post_Effect_Generic_Class(_id, _shader) constructor {
    id = _id;
    shader   = _shader;
    enabled  = true;
    params   = {};

    static set_param = function(_name, _value) {
        params[$ _name] = _value;
        /* oh my goshshshshhsh chaining (x1.0) */
        return self;
    }
    
    static apply_params = function() {
        var _names = variable_struct_get_names(params);
        for (var i = 0; i < array_length(_names); i++) {
            var _name = _names[i];
            var _val  = params[$ _name];
            
            var _uni = shader_get_uniform(shader, _name);
            
            if (is_array(_val)) {
                /* no switches? */
                /* srr i had to do it, it was stronger than me */
                /* https://imgur.com/a/1CHsDoH */
                var _count = array_length(_val);
                if (_count == 2) shader_set_uniform_f(_uni, _val[0], _val[1]);
                else if (_count == 3) shader_set_uniform_f(_uni, _val[0], _val[1], _val[2]);
                else if (_count == 4) shader_set_uniform_f(_uni, _val[0], _val[1], _val[2], _val[3]);
            } else {
                shader_set_uniform_f(_uni, _val);
            }
        }
    }
}

function __Srn_Post_Effect_Add(_id, _shader) {
    var _s = new __Srn_Post_Effect_Generic_Class(_id, _shader);
    array_push(global.__Srn_Post_Effects_List, _s);
    /* oh my goshshshshhsh chaining (x2.0) */
    return _s;
}

function __Srn_Post_Effect_Get(_id) {
    var _list = global.__Srn_Post_Effects_List;
    for (var i = 0; i < array_length(_list); i++) {
        if (_list[i].id == _id) {
            /* oh my goshshshshhsh chaining (x3.0) */
            return _list[i];
        }
    }
    return noone;
}
function __Srn_Post_Effect_Remove(_id) {
    var _list = global.__Srn_Post_Effects_List;
    for (var i = 0; i < array_length(_list); i++) {
        if (_list[i].id == _id) {
            array_delete(_list, i, 1);
            return true;
        }
    }
    return false;
}
global.__Srn_Namespace_PostProcessing = {
    add: __Srn_Post_Effect_Add,
    get: __Srn_Post_Effect_Get,
    remove: __Srn_Post_Effect_Remove,
}
