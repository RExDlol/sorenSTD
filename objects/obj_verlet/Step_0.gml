

corda.points[0].x = mouse_x;
corda2.points[0].x = mouse_x;
corda.points[0].y = mouse_y;
corda2.points[0].y = mouse_y;

start_x = sin(current_time/100) * 10;

corda3.points[99].x = 100 + start_x;
my_physics.collide_with_circle(mouse_x, mouse_y, 30)


my_physics.update(10);
