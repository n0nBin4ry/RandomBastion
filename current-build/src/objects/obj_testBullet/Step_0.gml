/// @description COLLISIONS

var hrz = x + lengthdir_x(speed, direction);
var ver = y + lengthdir_y(speed, direction);

// if it hits a wall it's gone
if (gridPlaceMeeting(hrz, ver, WALL) || gridPlaceMeeting(hrz, ver, DOOR) 
	|| gridPlaceMeeting(hrz, ver, NULL))
	instance_destroy();