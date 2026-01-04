/* Linear */

function vec2(_x, _y) constructor {
    x = _x;
    y = _y;
    
    static add = function(_vector) {
        x += _vector.x;
        y += _vector.y;
    };
    
    static subtract = function(_vector) {
        x -= _vector.x;
        y -= _vector.y;
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
