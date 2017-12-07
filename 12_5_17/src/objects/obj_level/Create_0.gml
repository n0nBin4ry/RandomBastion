/// @description Constructor

// radius around the player that is the size of the intro room
var start_radius = 3;

//resize room
room_width = (CELL_WIDTH / 16) * 720;
room_height = (CELL_HEIGHT / 16) * 720;

// some postitions need adjustment so these variables are for that
var x_adjust = CELL_WIDTH / 2;
var y_adjust = CELL_HEIGHT / 2;


// create grid for level
w = room_width / CELL_WIDTH;
h = room_height / CELL_HEIGHT;
board = ds_grid_create(w, h);
// all grid cells start empty
ds_grid_set_region(board, 0, 0, w - 1, h - 1, NULL);

// set RNG seed
randomize();

// store center positiion components for later
var center_i = w / 2;
var center_j = h / 2;

// set up bounds of mini grid for starting from around player in center.
// using set radius value
var c_room_lower_i = center_i - start_radius;
var c_room_lower_j = center_j + start_radius;
var c_room_higher_i = center_i + start_radius;
var c_room_higher_j = center_j - start_radius;

// set current cell at center-most of grid
// will start instantiating floor cells at random from here
var c_x = center_i;
var c_y = center_j;

//create player at center-most area of grid
instance_create_layer(c_x * CELL_WIDTH, c_y * CELL_HEIGHT, "Instances", obj_player);

// choose random next cell next to current cell using random int [0,3]
var cdir = irandom(3);

// the odds variable for changing direction
var odds = 1;

// used to keep track of number of floor tiles
var floor_counter = 0;

// move to n NULL cells to create level
var floor_size = 1000; // experimental number
for (var i = 0; i < floor_size; i++) {
	if (board[# c_x, c_y] != FLOOR) {
		floor_counter ++;
		//place floor tile at current cell
		board[# c_x, c_y] = FLOOR;
	}
	
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

/******************************************************************************

NOTE (11/22/17)
IDEA: can build floor_position array in above loop and that way it can iterate 
through starting at positions closest to the player then outward, which could
lead to a difficulty distrubution alg if enemies have different levels/difficulties.
Meaning I could put harder enemies farther from player beggining area. Or concentrate
the amount of them in farther areas. But how it is right now works fine for now.

******************************************************************************/

// decided just to do a seperate loop for building starting room..
// NOTE: optimize when sober.. if needed, works fine tbh
// another NOTE: Bug found where very rarely spawned in an enclosed room w/ nofoor, fix
// NOTE (anotha' one!) : mybe try that all walls in perimeter are doors, unless
//		 adjacent to a NULL cell
for (var j = c_room_higher_j; j <= c_room_lower_j; j++)
	for (var i = c_room_lower_i; i <= c_room_higher_i; i++) {
		if (board[# i, j] == FLOOR)
			floor_counter--;
		// if on the outer walls, turn walls into doors if needed
		if ( (i == c_room_lower_i || i == c_room_higher_i) || (j == c_room_lower_j || j == c_room_higher_j) ) {
			   // check bottom boundary for door positions
			if (( (j == c_room_lower_j) && (i > c_room_lower_i && i < c_room_higher_i) && (board[# i, j + 1] == FLOOR) ) ||
			   // check top boundary for door positions
			   ( (j == c_room_higher_j) && (i > c_room_lower_i && i < c_room_higher_i) && (board[# i, j - 1] == FLOOR) ) ||
			   // check right boundary for door positions
			   ( (i == c_room_higher_i) && (j < c_room_lower_j && j > c_room_higher_j) && (board[# i + 1 ,j] == FLOOR) ) ||
			   // check left boundary for door positions
			   ( (i == c_room_lower_i) && (j < c_room_lower_j && j > c_room_higher_j) && (board[# i - 1, j] == FLOOR) ))
				board[# i, j] = DOOR;
			else 
				board[# i, j] =	WALL;
		}
		else
			board[# i, j] = FLOOR;
	}

// array of size-2 arrays to keep track of floor positions
floor_positions = ds_grid_create(2, floor_counter);
var floor_counter_cntr = floor_counter;


// move along board and place walls on nulls adjacent to walls
for (var j = 0; j < h - 1; j++) {
	for (var i = 0; i < w - 1; i++) {
		if ( (i < c_room_lower_i || i > c_room_higher_i) || (j > c_room_lower_j || j < c_room_higher_j) )
			if (board[# i, j] == FLOOR) {		
				floor_positions[# 0, floor_counter - floor_counter_cntr] = i;
				floor_positions[# 1, floor_counter - floor_counter_cntr--] = j;
				// null to right?
				if (board[# i + 1, j] == NULL) board[# i + 1, j] = WALL;
				// null to left?
				if (board[# i - 1, j] == NULL) board[# i - 1, j] = WALL;
				// null to top?
				if (board[# i, j - 1] == NULL) board[# i, j - 1] = WALL;
				// null to bottom?
				if (board[# i, j + 1] == NULL) board[# i, j + 1] = WALL;
			}
	}
}

// 11/5/17
// NOTE: Work on an alg for exact distribution to be generalized for variables
// set by an init method
// - the current one works alright, maybe make a little more scarce
// - a good idea would be not to spawn an enemy in a set radius of player and/or
//   use said radius to make a starting room around player.
//   - maybe made special/informational in some way or have something that's also
//     randomly/proceduraly generated

// spawn enemies
var monster_odds = 10;
var max_monsters = 75;
for (var j = 0; j < floor_counter; j++) {
	if (monster_odds = irandom(monster_odds)) {
		instance_create_layer(floor_positions[# 0, j] * CELL_WIDTH + x_adjust, 
			floor_positions[# 1, j] * CELL_HEIGHT + y_adjust, "Instances", obj_testBoii);
		monster_odds += 5;
		max_monsters--;
		if (max_monsters < 0) { break; }
	}
	else monster_odds--;
}


