/// @description Zooming in and out

// for now will get input to zoom, but will change it to having another obeject
// let obj_display_manager to zoom in or out

if (keyboard_check_pressed(ord("Z")))
	z = true;

if (keyboard_check_pressed(ord("Z"))) {
	zoom++;
	if (zoom > max_zoom)
		zoom = 1;
	window_set_size(ideal_width * zoom, ideal_height * zoom);
	z = false;
	alarm[0] = 1;
}

// center view on player
camera_set_view_pos(view_camera[0], obj_player.x - (camera_get_view_width(view_camera[0]) / 2),  obj_player.y - (camera_get_view_height(view_camera[0]) / 2))