function __Srn_Vec2_Dot(a, b) {
    return a.x * b.x + a.y * b.y;
}

function __Srn_Vec2_Distance(a, b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
}


function __Srn_Vec2(_x, _y) constructor {
    x = _x;
    y = _y;
    
    static add = function(_vector) {
        x += _vector.x;
        y += _vector.y;
        
        return self;
    };
    
    static subtract = function(_vector) {
        x -= _vector.x;
        y -= _vector.y;
        
        return self;
    };
    
    static scale = function(_s) {
        x *= _s;
        y *= _s;
        return self;
    };
    
    static copy = function() {
        return new __Srn_Vec2(x, y);
    };
    
    
    static length = function() {
        return sqrt(x * x + y * y);
    };

    static normalize = function() {
        var _len = length();
        if (_len != 0) {
            x /= _len;
            y /= _len;
        }
    };
}
