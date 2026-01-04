velh = (Input.is_down("right") - Input.is_down("left")) * 10;
velv = (Input.is_down("down") - Input.is_down("up")) * 10;

var _dir = point_direction(0, 0, Input.is_down("right") - Input.is_down("left"), Input.is_down("down") - Input.is_down("up"));


velh = lengthdir_x(10, _dir)
velv = lengthdir_y(10, _dir)

if ((Input.is_down("right") xor Input.is_down("left")) || ((Input.is_down("down") - Input.is_down("up"))))
x += velh;
y += velv;