my_physics = new Math.verlet_create_world(0.5);

corda = my_physics.add_rope(0, 0, 10, 15);
corda2 = my_physics.add_rope(0, 0, 80, 1);
corda3 = my_physics.add_rope(0, 0, 100, 1);
corda4 = my_physics.add_grid(200, 100, 5, 5, 10);
corda.points[0].fixed = true;
corda2.points[0].fixed = true;
corda3.points[0].fixed = true;

corda3.points[99].fixed = true;

start_x = 100;

PostProcessing.remove("retro")

PostProcessing.add("r", __shader_bayer_dithering_4x4_game_color_pp).set_param("u_quantize", 4.0).set_param("u_factor", 1.0);

for (var i = 0; i < 5; i ++) {
    corda4.grid_data[i][0].fixed = true;
}

corda3.points[99].x = start_x;
corda3.points[99].y = 200;