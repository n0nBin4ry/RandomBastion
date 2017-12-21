// uses the calling object's x and y positions to "open" directly adjacent doors
var half_cell_width = CELL_WIDTH / 2;
var half_cell_height = CELL_WIDTH / 2;
// if door to right
if (gridPlaceMeeting(x + half_cell_width, y, DOOR))
	obj_level.board[# xToGridCoord(x + half_cell_width), yToGridCoord(y)] = FLOOR;
// if door above
if (gridPlaceMeeting(x, y - half_cell_height, DOOR))
	obj_level.board[# xToGridCoord(x), yToGridCoord(y - half_cell_height)] = FLOOR;
// if door to left
if (gridPlaceMeeting(x - half_cell_width, y, DOOR))
	obj_level.board[# xToGridCoord(x - half_cell_width), yToGridCoord(y)] = FLOOR;
// if door under
if (gridPlaceMeeting(x, y + half_cell_height, DOOR))
	obj_level.board[# xToGridCoord(x), yToGridCoord(y + half_cell_height)] = FLOOR;