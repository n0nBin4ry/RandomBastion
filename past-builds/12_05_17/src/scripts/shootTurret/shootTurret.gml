/// @description Shoots a hitscan shot at from player's turret mode

// NOTE: I feel like there is a better way to do this (without creating an object
//		 per shot or at all), but this all I can imagine for now; but for now 
//		 this is the base idea all hitscan shots in game will be based off of (like a widowmaker boss maybe???)

/// @param x-pos_base	 arg0
/// @param y-pos_base	 arg1
/// @param cursor_x-pos	 arg2
/// @param cursor_y-pos	 arg3
/// @param histscan_obj	 arg4
/// @param len_from_base arg5
/// @param aim_buffer	 arg6

// get direction from base to cursor
var dir = point_direction(argument0, argument1, argument2, argument3);

// set where scan variables
var curr = 0;
var curr_x = argument0 + lengthdir_x(argument5, dir);
var curr_y = argument1 + lengthdir_y(argument5, dir);
var hit = false;

// set varables for base, needed multiple times
var base_x = curr_x;
var base_y = curr_y;

// apply, aim-buffer of shot now that scan variables are set
dir = wrap(random_range(dir - argument6, dir + argument6), 0, 359); // wrap from 0 - 359 because of GM2's angle/direction system

// holds instance of instance ID of hit enemy, if one is hit
var hit_inst = noone;

while (!hit) {
	var check_x = curr_x / CELL_WIDTH;
	var check_y = curr_y / CELL_HEIGHT;
	// if obstacle hit, we reach the end of the scan
	if ( (obj_level.board[# check_x, check_y] == WALL) 
	|| (obj_level.board[# check_x, check_y] == NULL) || (obj_level.board[# check_x, check_y] == DOOR) )
		hit = true;
	// if enemy hit, end scan and store enemy instance ID
	else if (position_meeting(curr_x, curr_y, obj_testBoii)) {
		hit = true;
		hit_inst = instance_position(curr_x, curr_y, obj_testBoii);
	}
	// if not increase range of scan
	else {
		curr++;
		curr_x = base_x + lengthdir_x(curr, dir);
		curr_y = base_y + lengthdir_y(curr, dir);
	}
}


//show_debug_message(curr);
// create hitscan bullet
var bullet_trail = instance_create_layer(base_x, base_y, "Instances", argument4);
// apply length of bullet based off scan
bullet_trail.image_xscale = ++curr;
// set angle of bullet
bullet_trail.image_angle = dir;
// dynamically make bullet visible
bullet_trail.visible = true;
// assign target to bullet_trail
bullet_trail.victim = hit_inst;
