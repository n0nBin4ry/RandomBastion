/// @description Decide resolution

//Display Properties
ideal_width = 0 // calculated later
ideal_height = 180;
aspect_ratio = display_get_width() / display_get_height(); // screen's aspect ratio

// calculate ideal width
ideal_width = round(ideal_height * aspect_ratio);

if (display_get_width() % ideal_width != 0) {
	var d = round (display_get_width() / ideal_width);
	ideal_width = display_get_width() / d;
}

// variables for dynamic window increase
z = false;
zoom = 2;
max_zoom = floor(display_get_width() / ideal_width);

// check if calculated width is an odd number, then turn even
if (ideal_width & 1)
	ideal_width++;

// set view for every rom; starting at 1, because the room this obj is in is 
// always first room in list of rooms s it's room 0
for (var i = 1; i <= room_last; i++) {
	if (room_exists(i)) {
		room_set_view_enabled(i, true);
		room_set_viewport(i, 0, true, 0, 0, ideal_width, ideal_height);
	}
}

// change the size of the surface to and game window to ideal resolution, then 
// move to the beginning room
surface_resize(application_surface, ideal_width * 3, ideal_height * 3);
//display_set_gui_size(ideal_width, ideal_height);
display_set_gui_size(960, 540);
window_set_size(ideal_width * zoom, ideal_height * zoom);
room_goto(room0); // this is beginning room for now, will be menu room eventually