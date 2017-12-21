/// @description Method for NPCs where the grid is used to see if there is a cell with given value between calling NPC and target object
/// @param target_object  arg0
/// @param value_to_check arg1

// TODO: fix corner-to-corner bug where enemies can see you; try using the 
// the "diagonal" idea commented out below.

// version where instead of checking a grid section for a wall, the object checks
// all cells including or touching the line between the object and target

var target = argument0;
var check = argument1;

// use direction from calling object to target object to see if the angle is
// "diagonal", which is said to be if angle is within 15 degrees of diagonal
// lines in unit circle; note that 15 is test threshold for now
// UPDATE: was gonna delete all this since I improved this method but might
//		   still need this for corner-to-corner problem
var dir = point_direction(x, y, target.x, target.y);
/*var diagonal;
if ( (dir >= 30 && dir <= 60) || (dir >= 120 && dir <= 150) || (dir >= 210 && dir <= 240) || (dir >= 300 && dir <= 330) )
	diagonal = true;
else
	diagonal = false;*/

// get starting position for grid-search
var my_x = x / CELL_WIDTH;
var my_y = y / CELL_HEIGHT;

// distance to target object
var tar_dist = distance_to_object(target);

// following the line between the calling obj and the target obj in 1-pixel 
// incriments, check to see if the target value is in the cooresponding grid-cell
// if target is in cell then return true
for (var n = 0; n <= tar_dist; n ++) {
	var i = my_x + (lengthdir_x(n, dir) / CELL_WIDTH);
	var j = my_y + (lengthdir_y(n, dir) / CELL_HEIGHT);
	// NOTE: maybe try finding way to use gridPlaceMoving() or similar for this
	//		 check to help with enemies getting caught on walls, but pathfinding
	//		 of alert state might help here; I guess this only pertains to the use
	//		 of this method with testBoiis
	if (obj_level.board[# i, j] == check) return true;
}

// if target was never reached, return false
return false;