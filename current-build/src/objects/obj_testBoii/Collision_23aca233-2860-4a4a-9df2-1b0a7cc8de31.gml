/// @description Don't go inside each other

// opposite direction from the other
var dir = point_direction(other.x, other.y, x, y);
movePlayer( lengthdir_x(spd, dir), lengthdir_y(spd, dir) );