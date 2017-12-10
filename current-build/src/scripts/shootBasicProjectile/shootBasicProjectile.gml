/// @description For basic shooting of given projectile, no return
/// @param x-pos_base		arg0
/// @param y-pos_base		arg1
/// @param target_x-pos		arg2
/// @param target_y-pos		arg3
/// @param projectile		arg4
/// @param len_from_base	arg5
/// @param projectile_speed	arg6

// direction from base to target
var dir = point_direction(argument0, argument1, argument2, argument3);
// x and y coords of where projectile instance is created
var out_x = lengthdir_x(argument5, dir);
var out_y = lengthdir_y(argument5, dir);
// create projectile and store ID to set instance vars
var out = instance_create_layer(argument0 + out_x, argument1 + out_y, "Instances" , argument4);
// set its direction and speed based on given args
out.direction = dir;
out.image_angle = dir;
out.speed = argument6;