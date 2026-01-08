/* all of the easing formulas for sorenSTD */

/* 
 * you can use it with your code or other modules that suport it, 
 * like transitions with the Scene module.
 * 
 */

#macro Math global.__Srn_Namespace_Math

/* ------------------------------------------ */

/// @func __Srn_Ease_Linear(t)
/// @desc Easies the normalized "t" param using the linear function.
/// @param {Real} t The value normalized (0.0 - 1.0) to be eased.
/// @return {Real} The eased value.
function __Srn_Ease_Linear(_t) {
    return _t;
}


/* ------------------------------------------ */
/* Quadratic Formulas (t^2) */
/* ------------------------------------------ */

/// @func __Srn_Ease_Quad_In(t)
/// @desc Easies the normalized "t" param using the "in quadratic" function.
/// @param {Real} t The value normalized (0.0 - 1.0) to be eased.
/// @return {Real} The eased value.
function __Srn_Ease_Quad_In(_t) {
    return _t * _t;
}

/// @func __Srn_Ease_Quad_Out(t)
/// @desc Easies the normalized "t" param using the "out quadratic" function.
/// @param {Real} t The value normalized (0.0 - 1.0) to be eased.
/// @return {Real} The eased value.
function __Srn_Ease_Quad_Out(_t) {
    return 1 - (1 - _t) * (1 - _t);
}

/// @func __Srn_Ease_Quad_InOut(t)
/// @desc Easies the normalized "t" param using the "inout quadratic" function.
/// @param {Real} t The value normalized (0.0 - 1.0) to be eased.
/// @return {Real} The eased value.
function __Srn_Ease_Quad_InOut(_t) {
    if (_t < 0.5) {
        return 2 * _t * _t;
    } else {
        return 1 - power(-2 * _t + 2, 2) / 2;
    }
}


/* ------------------------------------------ */
/* Cubic Formulas (t^3) */
/* ------------------------------------------ */

/// @func __Srn_Ease_Cubic_In(t)
function __Srn_Ease_Cubic_In(_t) {
    return _t * _t * _t;
}

/// @func __Srn_Ease_Cubic_Out(t)
function __Srn_Ease_Cubic_Out(_t) {
    return 1 - power(1 - _t, 3);
}

/// @func __Srn_Ease_Cubic_InOut(t)
function __Srn_Ease_Cubic_InOut(_t) {
    if (_t < 0.5) {
        return 4 * _t * _t * _t;
    } else {
        return 1 - power(-2 * _t + 2, 3) / 2;
    }
}


/* ------------------------------------------ */
/* Quart Formulas (t^4) */
/* ------------------------------------------ */

/// @func __Srn_Ease_Quart_In(t)
function __Srn_Ease_Quart_In(_t) {
    return _t * _t * _t * _t;
}

/// @func __Srn_Ease_Quart_Out(t)
function __Srn_Ease_Quart_Out(_t) {
    return 1 - power(1 - _t, 4);
}

/// @func __Srn_Ease_Quart_InOut(t)
function __Srn_Ease_Quart_InOut(_t) {
    if (_t < 0.5) {
        return 8 * _t * _t * _t * _t;
    } else {
        return 1 - power(-2 * _t + 2, 4) / 2;
    }
}


/* ------------------------------------------ */
/* Quint Formulas (t^5) */
/* ------------------------------------------ */

/// @func __Srn_Ease_Quint_In(t)
function __Srn_Ease_Quint_In(_t) {
    return _t * _t * _t * _t * _t;
}

/// @func __Srn_Ease_Quint_Out(t)
function __Srn_Ease_Quint_Out(_t) {
    return 1 - power(1 - _t, 5);
}

/// @func __Srn_Ease_Quint_InOut(t)
function __Srn_Ease_Quint_InOut(_t) {
    if (_t < 0.5) {
        return 16 * _t * _t * _t * _t * _t;
    } else {
        return 1 - power(-2 * _t + 2, 5) / 2;
    }
}


/* ------------------------------------------ */
/* Sine, Circular, Exponential */
/* ------------------------------------------ */

/// @func __Srn_Ease_Sine_In(t)
function __Srn_Ease_Sine_In(_t) {
    return 1 - cos(_t * pi / 2);
}

/// @func __Srn_Ease_Sine_Out(t)
function __Srn_Ease_Sine_Out(_t) {
    return sin(_t * pi / 2);
}

/// @func __Srn_Ease_Sine_InOut(t)
function __Srn_Ease_Sine_InOut(_t) {
    return -(cos(pi * _t) - 1) / 2;
}


/// @func __Srn_Ease_Circ_In(t)
function __Srn_Ease_Circ_In(_t) {
    return 1 - sqrt(1 - power(_t, 2));
}

/// @func __Srn_Ease_Circ_Out(t)
function __Srn_Ease_Circ_Out(_t) {
    return sqrt(1 - power(_t - 1, 2));
}

/// @func __Srn_Ease_Circ_InOut(t)
function __Srn_Ease_Circ_InOut(_t) {
    if (_t < 0.5) {
        return (1 - sqrt(1 - power(2 * _t, 2))) / 2;
    } else {
        return (sqrt(1 - power(-2 * _t + 2, 2)) + 1) / 2;
    }
}


/// @func __Srn_Ease_Expo_In(t)
function __Srn_Ease_Expo_In(_t) {
    return (_t == 0) ? 0 : power(2, 10 * _t - 10);
}

/// @func __Srn_Ease_Expo_Out(t)
function __Srn_Ease_Expo_Out(_t) {
    return (_t == 1) ? 1 : 1 - power(2, -10 * _t);
}

/// @func __Srn_Ease_Expo_InOut(t)
function __Srn_Ease_Expo_InOut(_t) {
    if (_t == 0) return 0;
    if (_t == 1) return 1;
    
    if (_t < 0.5) {
        return power(2, 20 * _t - 10) / 2;
    } else {
        return (2 - power(2, -20 * _t + 10)) / 2;
    }
}


/* ------------------------------------------ */
/* Back, Elastic                              */
/* ------------------------------------------ */

/// @func __Srn_Ease_Back_In(t)
function __Srn_Ease_Back_In(_t) {
    var _c1 = 1.70158;
    return _c1 * _t * _t * _t - _c1 * _t * _t;
}

/// @func __Srn_Ease_Back_Out(t)
function __Srn_Ease_Back_Out(_t) {
    var _c1 = 1.70158;
    return 1 + _c1 * power(_t - 1, 3) + _c1 * power(_t - 1, 2);
}

/// @func __Srn_Ease_Back_InOut(t)
function __Srn_Ease_Back_InOut(_t) {
    var _c1 = 1.70158;
    var _c2 = _c1 * 1.525;
    if (_t < 0.5) {
        return (power(2 * _t, 2) * ((_c2 + 1) * 2 * _t - _c2)) / 2;
    } else {
        return (power(2 * _t - 2, 2) * ((_c2 + 1) * (2 * _t - 2) + _c2) + 2) / 2;
    }
}


/// @func __Srn_Ease_Elastic_In(t)
function __Srn_Ease_Elastic_In(_t) {
    if (_t == 0) return 0;
    if (_t == 1) return 1;
    
    var _c3 = 2 * pi / 3;
    
    return -power(2, 10 * _t - 10) * sin((_t * 10 - 10.75) * _c3);
}

/// @func __Srn_Ease_Elastic_Out(t)
function __Srn_Ease_Elastic_Out(_t) {
    if (_t == 0) return 0;
    if (_t == 1) return 1;
    
    var _c3 = 2 * pi / 3;
    
    return power(2, -10 * _t) * sin((_t * 10 - 0.75) * _c3) + 1;
}

/// @func __Srn_Ease_Elastic_InOut(t)
function __Srn_Ease_Elastic_InOut(_t) {
    if (_t == 0) return 0;
    if (_t == 1) return 1;
    var _c4 = 2 * pi / 4.5;
    if (_t < 0.5) {
        return -(power(2, 20 * _t - 10) * sin((20 * _t - 11.125) * _c4)) / 2;
    } else {
        return (power(2, -20 * _t + 10) * sin((20 * _t - 11.125) * _c4)) / 2 + 1;
    }
}

global.__Srn_Namespace_Math = {
    // Linear
    ease_linear: __Srn_Ease_Linear,
    
    // Quadratic
    ease_quad_in: __Srn_Ease_Quad_In,
    ease_quad_out: __Srn_Ease_Quad_Out,
    ease_quad_in_out: __Srn_Ease_Quad_InOut,
    
    // Cubic
    ease_cubic_in: __Srn_Ease_Cubic_In,
    ease_cubic_out: __Srn_Ease_Cubic_Out,
    ease_cubic_in_out: __Srn_Ease_Cubic_InOut,
    
    // Quart
    ease_quart_in: __Srn_Ease_Quart_In,
    ease_quart_out: __Srn_Ease_Quart_Out,
    ease_quart_in_out: __Srn_Ease_Quart_InOut,
    
    // Quint
    ease_quint_in: __Srn_Ease_Quint_In,
    ease_quint_out: __Srn_Ease_Quint_Out,
    ease_quint_in_out: __Srn_Ease_Quint_InOut,
    
    // Sine
    ease_sine_in: __Srn_Ease_Sine_In,
    ease_sine_out: __Srn_Ease_Sine_Out,
    ease_sine_in_out: __Srn_Ease_Sine_InOut,
    
    // Circ (Circular)
    ease_circ_in: __Srn_Ease_Circ_In,
    ease_circ_out: __Srn_Ease_Circ_Out,
    ease_circ_in_out: __Srn_Ease_Circ_InOut,
    
    // Expo (Exponential)
    ease_expo_in: __Srn_Ease_Expo_In,
    ease_expo_out: __Srn_Ease_Expo_Out,
    ease_expo_in_out: __Srn_Ease_Expo_InOut,

    // Back (Overshoot)
    ease_back_in: __Srn_Ease_Back_In,
    ease_back_out: __Srn_Ease_Back_Out,
    ease_back_in_out: __Srn_Ease_Back_InOut,

    // Elastic (Spring)
    ease_elastic_in: __Srn_Ease_Elastic_In,
    ease_elastic_out: __Srn_Ease_Elastic_Out,
    ease_elastic_in_out: __Srn_Ease_Elastic_InOut,
    
    verlet_create_world: __Srn_Verlet_Create_World,
    verlet_config_class: __Srn_Verlet_World_Config_Class,
    
    vec2: __Srn_Vec2,
};