var _conf = new Camera.create_config_class();
_conf.target = obj_srn;
_conf.follow_speed = 0.5;
_conf.lookahead_amount = 0;
_conf.deadzone_w = 48;
_conf.deadzone_h = 72;
_conf.cam        = view_camera[0];
/* dont really know why this specific numbers tbh */
_conf.limit_rect = {x1: 150, y1: 100, x2: room_width, y2: room_height};
Camera.set(_conf);