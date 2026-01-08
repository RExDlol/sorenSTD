#macro Effects global.__Srn_Namespace_Effects

/* this starts with this default value on purpose! */
global.__Srn_Inst_Effects = ERROR_EFFECTS_CONTROLLER_NOT_FOUND;

function __Srn_Effect_Generic_Class(_shader) constructor {
    shd = _shader;
    params = {};

    static set_param = function(_name, _value) {
        params[$ _name] = _value;
        /* anotha chaining man */
        return self;
    }

    static apply = function() {
        shader_set(shd);
        var _names = variable_struct_get_names(params);
        for (var i = 0; i < array_length(_names); i++) {
            var _n = _names[i];
            var _v = params[$ _n];
            var _uni = shader_get_uniform(shd, _n);
            
            if (is_array(_v)) {
                var _count = array_length(_v);
                if (_count == 2) shader_set_uniform_f(_uni, _v[0], _v[1]);
                else if (_count == 3) shader_set_uniform_f(_uni, _v[0], _v[1], _v[2]);
                else if (_count == 4) shader_set_uniform_f(_uni, _v[0], _v[1], _v[2], _v[3]);
            } else {
                shader_set_uniform_f(_uni, _v);
            }
        }
    }
    
    static reset = function() {
        shader_reset();
    }
}

global.__Srn_Namespace_Effects = {
    create_effect_class: __Srn_Effect_Generic_Class,
}