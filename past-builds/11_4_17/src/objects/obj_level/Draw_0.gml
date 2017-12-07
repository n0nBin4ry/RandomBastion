/// @description draw level

for (var j = 0; j < h; j++) {
	for (var i = 0; i < w; i++) {
		if (board[# i, j] == FLOOR) draw_sprite_part(bg_floor, 0, 0, 0, CELL_WIDTH, CELL_HEIGHT, i * CELL_WIDTH, j * CELL_HEIGHT);
		else if (board[# i, j] == WALL) draw_sprite_part(bg_wall, 0, 0, 0, CELL_WIDTH, CELL_HEIGHT, i * CELL_WIDTH, j * CELL_HEIGHT);
	}
}