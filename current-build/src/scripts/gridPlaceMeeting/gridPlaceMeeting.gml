/// @description like place_meeting() but for the grid class named board
// The args are the x and y postitions of where to check respectively, then the value 
// you are checking on the grid.


var xx = argument0;
var yy = argument1;
var target = argument2;

// keep track of current positions to revert to them later
var old_x = x;
var old_y = y;

// move object to postition you are searching at
x = xx;
y = yy;

// check if object boundaries touch a cell with target value
var meeting_top_sides = (obj_level.board[# bbox_right / CELL_WIDTH, bbox_top / CELL_HEIGHT] == target) && 
						(obj_level.board[# bbox_left / CELL_WIDTH, bbox_top / CELL_HEIGHT] == target);
var meeting_bot_sides = (obj_level.board[# bbox_right / CELL_WIDTH, bbox_bottom / CELL_HEIGHT] == target) &&
						(obj_level.board[# bbox_left / CELL_WIDTH, bbox_bottom / CELL_HEIGHT] == target);

// revert object to original position
x = old_x;
y = old_y;

// Returns True if the object on grid is touching the cell containing the target value
// if object were at given position. False otherwise.

return (meeting_bot_sides && meeting_top_sides);

// NOTE: Fucking demorgan's law really came in clutch here. I'm sure no one can see why, don't worry bout it