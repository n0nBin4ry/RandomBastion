/// @param target InstID of target obj

// Method for NPC objects to tell if there is a wall between the current object
// and the target object

var target = argument0;

// get calling-object's x and y coord in grid
var my_x = x / CELL_WIDTH;
var my_y = y / CELL_HEIGHT;

// get target's x and y coord in grid
var tar_x = target.x / CELL_WIDTH;
var tar_y = target.y / CELL_HEIGHT;

// find out where to begin and end cylcing
var i_begin = min(tar_x, my_x);
var i_end = max(tar_x, my_x);
var j_begin = min(tar_y, my_y);
var j_end = max(tar_y, my_y);

// check all cells in grid section between the object and target
// return true if there is a wall, false if there isnt
// NOTE: the problem with this is that either:
// 1) there is no wall buffer so it is a full on mini grid which will almost
//	  always have a wall in it, except for rare instances but then if the object
//	  moves just a slight bit then there will most likely be a wall in the new 
//	  cehcking grid
// 2) with any buffer then the grid is small/unexistant which will get no walls
//	  even when there should be
for (var j = j_begin + WALL_BUFFER; j <= j_end - WALL_BUFFER; j++) {
	for (var i = i_begin + WALL_BUFFER; i <= i_end - WALL_BUFFER; i++) {
		if (obj_level.board[# i, j] == FLOOR) return true;
	}
}

return false;

// FAILED, gonna do Try2 (for now, might revisit and tweak)