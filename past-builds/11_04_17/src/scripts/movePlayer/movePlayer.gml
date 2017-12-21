/// Description Moves character, taking collisions into account
// takes speed array to change the vert and horiz postiion of player by reference
// it is done by reference so that we can accelerate and decelerate speed

var horiz = argument[0];
var vert = argument[1];

// horizontal collisions
if (!gridPlaceMeeting(x + horiz, y, FLOOR)) {
	while (gridPlaceMeeting(x + sign(horiz), y, FLOOR)) {
		x += sign(horiz);
	}
	horiz = 0;
}

// move horizontally
x += horiz;

// verticle collisions
 if (!gridPlaceMeeting(x, y + vert, FLOOR)) {
	while (gridPlaceMeeting(x, y + sign(vert), FLOOR)) {
		y += sign(vert);
	}
	vert = 0;
}
 
// move vertically
y += vert;