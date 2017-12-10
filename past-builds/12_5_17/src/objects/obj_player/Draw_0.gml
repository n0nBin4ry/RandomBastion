/// @description rendering

var spr; 
// draw different sprites for different modes
if (mode == "recon") {
	spr   = spr_player_recon;
	g_spr = spr_reconGun;
	
}
else if (mode == "turret") {
	spr   = spr_player_turret;
	g_spr = spr_turretGun;
}

object_set_sprite(self, spr);

// change sprite orientation due to mouse position
var dir = point_direction(x, y, ms_x, ms_y);
// face right
if (dir <= 45 || dir > 315)	{
	image_angle = 0;  
	// set gun offset based off direction and mode
	if (mode == "recon") {
		g_off_x = x;
		g_off_y = y + g_dis_r;
	}
	else if (mode == "turret") {
		g_off_x = x + g_dis_t;
		g_off_y = y;
	}	
}
// face upward
else if (dir > 45 && dir <= 135) {
	image_angle = 90; 
	if (mode == "recon") {
		g_off_x = x + g_dis_r;
		g_off_y = y;
	}
	else if (mode == "turret") {
		g_off_x = x;
		g_off_y = y - g_dis_t;
	}
}
// face left
else if (dir > 135 && dir <= 225) {
	image_angle = 180; 
	if (mode == "recon") {
		g_off_x = x;
		g_off_y = y - g_dis_r;
	}
	else if (mode == "turret") {
		g_off_x = x - g_dis_t;
		g_off_y = y;
	}	
}
// face downward
else {
	image_angle = 270; 
	if (mode == "recon") {
		g_off_x = x - g_dis_r;
		g_off_y = y;
	}
	else if (mode == "turret") {
		g_off_x = x;
		g_off_y = y + g_dis_t;
	}	
}

// direction of gun
var g_dir = point_direction(g_off_x, g_off_y, ms_x, ms_y);

// draw sprites
draw_self(); // player
draw_sprite_ext(g_spr, 0, g_off_x, g_off_y, 1, 1, g_dir, c_white, 1); // gun
