/// @description Constructor

//resize room
room_width = (CELL_WIDTH / 16) * 720;
room_height = (CELL_HEIGHT / 16) * 720;

// create grid for level
w = room_width / CELL_WIDTH;
h = room_height / CELL_HEIGHT;
board = ds_grid_create(w, h);
// all grid cells start empty
ds_grid_set_region(board, 0, 0, w - 1, h - 1, NULL);

// set RNG seed
randomize();

// set current cell at center-most of grid
// will start instantiating floor cells at random from here
var c_x = w / 2;
var c_y = h / 2;

//create player at center-most area of grid
instance_create_layer(c_x * CELL_WIDTH, c_y * CELL_HEIGHT, "Instances", obj_player);

// choose random next cell next to current cell using random int [0,3]
var cdir = irandom(3);

// the odds variable for changing direction
var odds = 1;

// move to n NULL cells to create level
var floor_size = 1000; // experimental number
for (var i = 0; i < floor_size; i++) {
	//place floor tile at current cell
	board[# c_x, c_y] = FLOOR;
	// use odds to see if we change direction
	if (irandom(odds) == odds) {
		cdir = irandom(3);
	}
	// move to next cell
	switch (cdir) {
		// right
		case 0: c_x++; break;
		// up
		case 1: c_y--; break;
		// left
		case 2: c_x--; break;
		// down
		case 3: c_y++; break;
		default: break;
	}
	// keep a 1-pixel border around board for room for a wall
	c_x = clamp(c_x, 1, w - 2);
	c_y = clamp(c_y, 1, h - 2);
}

// move along board and place walls on nulls adjacent to walls
for (var j = 0; j < h - 1; j++) {
	for (var i = 0; i < w - 1; i++) {
		if (board[# i, j] == FLOOR) {
			// null to right?
			if (board[# i + 1, j] != FLOOR) board[# i + 1, j] = WALL;
			// null to left?
			if (board[# i - 1, j] != FLOOR) board[# i - 1, j] = WALL;
			// null to top?
			if (board[# i, j - 1] != FLOOR) board[# i, j - 1] =	WALL;
			// null to bottom?
			if (board[# i, j + 1] != FLOOR) board[# i, j + 1] = WALL;
		}
	}
}