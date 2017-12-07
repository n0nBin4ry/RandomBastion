/// @description Insert description here
depth -= 5;

// hit points; 0 means death
hp = 100;


// movement speed
spd = .5;

// don't think this is supposed to be here..
// wait.. commenting this out breaks checkWallBetween by letting there not be a wall if
// there are corners touching... FIND OUT WHY
if (instance_exists(obj_master_controller)) obj_master_controller.player_ID = instance_id;

// initial state of Finite State Machine
state = "idle";

// position for alert-state object to follow
alert_target = [pointer_null, pointer_null];

// direction enemy is moving in when idly patroling.
// 0 = right, 1 = up, 2 = left, 3 = down
// this value is only needed for now until I implement dynamic pathfinding
pat_dir = 0;

// variables for firing, can use same system for ability cooldowns
fire_rate_cntr = 0; // counter: every time it is zero, bullet fires and sets cntr to fire rate and counts down every frame
fire_rate = 1 * SEC; // rate: # * 60 (because 60 frames per second, hence the SEC constant); bullet fires every <fire_rate> frames

// NOTE: 11/25/17
/******************************************************************************
There is a bug in the chase/attack/alert state segments that allow testBoiis to
get inside each-other. Most likely has to do with where in step event I'm putting
the place_meeting() check for other test_Boiis. Will consider just making a 
collision event. But we'll see. UPDATE: made a collision event for now.d
******************************************************************************/