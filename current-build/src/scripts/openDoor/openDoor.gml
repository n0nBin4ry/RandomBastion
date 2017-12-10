// uses the calling object's x and y positions to "open" directly adjacent doors
var half_cell_width = CELL_WIDTH / 2;
var half_cell_height = CELL_WIDTH / 2;
// if door to right
if (gridPlaceMeeting(x + half_cell_width, y, DOOR)) {
	var grid_curr_i = xToGridCoord(x + half_cell_width), grid_curr_j = yToGridCoord(y);
	// "open" door by replacing with floor tile
	obj_level.board[# grid_curr_i, grid_curr_j] = FLOOR;
	// remove cell of new floor from pathfinding grid
	mp_grid_clear_cell(obj_level.path_grid, grid_curr_i, grid_curr_j);
}
// if door above
if (gridPlaceMeeting(x, y - half_cell_height, DOOR)) {
	var grid_curr_i = xToGridCoord(x), grid_curr_j = yToGridCoord(y - half_cell_height);
	// "open" door by replacing with floor tile
	obj_level.board[# grid_curr_i, grid_curr_j] = FLOOR;
	// remove cell of new floor from pathfinding grid
	mp_grid_clear_cell(obj_level.path_grid, grid_curr_i, grid_curr_j);
}
// if door to left
if (gridPlaceMeeting(x - half_cell_width, y, DOOR)) {
	var grid_curr_i = xToGridCoord(x - half_cell_width), grid_curr_j = yToGridCoord(y);
	// "open" door by replacing with floor tile
	obj_level.board[# grid_curr_i, grid_curr_j] = FLOOR;
	// remove cell of new floor from pathfinding grid
	mp_grid_clear_cell(obj_level.path_grid, grid_curr_i, grid_curr_j);
}
// if door under
if (gridPlaceMeeting(x, y + half_cell_height, DOOR)) {
	var grid_curr_i = xToGridCoord(x), grid_curr_j = yToGridCoord(y + half_cell_height);
	// "open" door by replacing with floor tile
	obj_level.board[# grid_curr_i, grid_curr_j] = FLOOR;
	// remove cell of new floor from pathfinding grid
	mp_grid_clear_cell(obj_level.path_grid, grid_curr_i, grid_curr_j);
}