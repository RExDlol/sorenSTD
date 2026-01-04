
/* the physics code for the verlet integration and its constraints!!1!!11 */

/// @desc Configuration struct for the Verlet World visuals
function __Srn_Verlet_World_Config_Class(_color, _alpha, _size, _use_circles) constructor {
    color = _color;
    use_circles = _use_circles;
    alpha = _alpha;
    size = _size;
};

/// @func __Srn_Verlet_Create_World(gravity, [params])
/// @param {Real} _gravity The gravity force applied every frame
/// @param {Struct} [_params] Optional configuration struct
function __Srn_Verlet_Create_World(_gravity, _params = 0) constructor {
    gravity_y = _gravity;
    points = [];
    constraints = [];
    bodies = [];
    
    color = c_white;
    use_circles = false;
    alpha = 1;
    size = 2;
    
    if (_params != 0 && is_struct(_params)) {
        color = _params.color;
        use_circles = _params.use_circles;
        alpha = _params.alpha;
        size = _params.size;
    }
    
    /// @desc Adds a single physical point to the world
    static add_point = function(_x, _y) {
        var _p = { x: _x, y: _y, old_x: _x, old_y: _y, fixed: false };
        array_push(points, _p);
        return _p;
    }
    
    /// @desc Connects two points with a fixed distance constraint
    static add_constraint = function(_p1, _p2, _dist) {
        var _c = { p1: _p1, p2: _p2, dist: _dist };
        array_push(constraints, _c);
        return _c;
    }
    
    /// @desc Updates physics: moves points and solves constraints
    /// @param {Real} _iterations Number of times to calculate constraints (higher = stiffer physics)
    static update = function(_iterations) {
        for (var i = 0; i < array_length(points); i++) {
            var p = points[i];
            if (!p.fixed) {
                var vx = p.x - p.old_x;
                var vy = p.y - p.old_y;
                p.old_x = p.x; p.old_y = p.y;
                p.x += vx; 
                p.y += vy + gravity_y;
            }
        }
        
        repeat(_iterations) {
            for (var i = 0; i < array_length(constraints); i++) {
                var c = constraints[i];
                var dx = c.p2.x - c.p1.x;
                var dy = c.p2.y - c.p1.y;
                var d = sqrt(dx*dx + dy*dy);
                if (d == 0) d = 0.001;
                
                var diff = (c.dist - d) / d;
                var ox = dx * diff * 0.5;
                var oy = dy * diff * 0.5;
                
                if (!c.p1.fixed) { c.p1.x -= ox; c.p1.y -= oy; }
                if (!c.p2.fixed) { c.p2.x += ox; c.p2.y += oy; }
            }
        }
    }
    
    /// @desc Standard debug draw for all bodies in the world
    static draw = function() {
        draw_set_color(color);
        draw_set_alpha(alpha);
        
        for (var i = 0; i < array_length(constraints); i++) {
            var _c = constraints[i];
            draw_line_width(_c.p1.x, _c.p1.y, _c.p2.x, _c.p2.y, size);
        }
        
        if (use_circles) {
            for (var i = 0; i < array_length(points); i++) {
                var _p = points[i];  
                draw_circle(_p.x, _p.y, size * 2, false);
            }
        }
        draw_set_alpha(1);
    }
    
    /// @desc Helper: Creates a hanging rope
    static add_rope = function(_x, _y, _nodes, _spacing) {
        var _new_body = { points: [], constraints: [], active: true };
        for (var i = 0; i < _nodes; i++) {
            var _p = add_point(_x, _y + (i * _spacing));
            array_push(_new_body.points, _p);
            if (i > 0) add_constraint(_new_body.points[i-1], _p, _spacing);
        }
        return _new_body;
    }

    /// @desc Helper: Creates a grid (cloth-like structure)
    static add_grid = function(_x,_y,_cols,_rows,_spacing){
        var _new_body = {
            points : [],
            constraints : [],
            active : true,
            grid_data : array_create(_cols)
        };
        
        for(var c = 0; c < _cols; c++){
            
            _new_body.grid_data[c]=array_create(_rows);
            for(var r = 0;r < _rows; r++){
                var p = add_point(_x + c * _spacing,_y + r * _spacing);
                
                array_push(_new_body.points,p);
                
                _new_body.grid_data[c][r]=p;
                
                if(c>0){
                    var _c = add_constraint(_new_body.grid_data[c-1][r],p,_spacing);
                    array_push(_new_body.constraints,_c);
                }
                
                if(r>0){
                    var _c = add_constraint(_new_body.grid_data[c][r-1],p,_spacing);
                    array_push(_new_body.constraints,_c);
                }
            }
        }
        array_push(bodies,_new_body);
        return _new_body;
    }
    
    /// @desc Simple bounding box collision for all points
    static collide_with_rect = function(_x1, _y1, _x2, _y2) {
        for (var i = 0; i < array_length(points); i++) {
            var p = points[i];
            if (!p.fixed) {
                if (p.x < _x1) p.x = _x1;
                if (p.x > _x2) p.x = _x2;
                if (p.y < _y1) p.y = _y1;
                if (p.y > _y2) p.y = _y2;
            }
        }
    }

    /// @desc Circular collision for all points (radial projection)
    static collide_with_circle = function(_cx, _cy, _radius) {
        for (var i = 0; i < array_length(points); i++) {
            var p = points[i];
            var _dist = point_distance(p.x, p.y, _cx, _cy);
            if (_dist < _radius && !p.fixed) {
                var _dir = point_direction(_cx, _cy, p.x, p.y);
                p.x = _cx + lengthdir_x(_radius, _dir);
                p.y = _cy + lengthdir_y(_radius, _dir);
            }     
        }
    }
}
