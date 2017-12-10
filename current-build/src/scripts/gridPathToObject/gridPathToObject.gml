/// @description Method for NPC, assigns path to given object using the grid of 
/// the the level; if there isn't a path, it sets a path to itself

/// @param path	 arg0
/// @param target arg1

// initialize given path variable
argument0 = path_add();
// try to make path; if there isn't, then reset given path variable
if (!mp_grid_path(obj_level.path_grid, argument0, x, y, argument1.x, argument1.y, 0)) {
	resetGridPath(argument0);
}
else // if there is a path, start it
	path_start(argument0, .75, path_action_stop, false);