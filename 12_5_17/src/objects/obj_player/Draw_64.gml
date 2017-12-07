/// @description PLAYER HUD

// NOTE: Might be nice (not something needed) to make a seperate object to keep
//		 track of obj_player stats. Object would also be in charge of doing 
//		 the GUI HUD for player. Would clean up code and shrink size of obj_player
//		 constructor. ALSO could be helpful if I want poer-ups in the future.

// draw healthBar to scale of xurrent health
draw_sprite_ext(spr_healthBar, 0, 34, 481, max(0, hp / maxHp), 1, 0, c_white, .95);
// draw armorBar to scale of current armor
draw_sprite_ext(spr_armorBar, 0, 231, 481, max(0, armor / maxArmor), 1, 0, c_white, .95);

// draw big part of GUI
draw_sprite(spr_GUI_back, 0, 0, 0);

// draw a little logo at bottom right to show gun type of current mode
var gl_sprite;
var am_max;
if (mode == "recon") {
	gl_sprite = spr_reconLogo;
	am_max = rec_ammo;	
}
else if (mode == "turret") {
	gl_sprite = spr_turretLogo;
	am_max = tur_ammo;
}
draw_sprite(gl_sprite, 0, 784, 448);

// draw ammo-count
draw_sprite(spr_ammoCount, 0, 784, 368);
draw_set_color(0x9BADB7); // color used in most-all GUI stuff so far
draw_set_font(fnt_ammo);
draw_text(804, 328, ammo); // current ammo
draw_text(864, 404, am_max); // max ammo


// show heal-resource bar as soon as button pressed, and keep it there until the
// the resource fully replenishes
if (heal_resource_cntr < heal_resource || ms_clickR) {
	draw_sprite_ext(spr_healingBar, 0, 721, 415, 1, max(0, heal_resource_cntr / heal_resource), 0, c_white, 1);
	draw_sprite(spr_healing_back, 0, 719, 416);
}

// reloading indicator
if (state == "reloading")
	draw_sprite_ext(spr_reloading, 0, 864, 400, 2, 2, 0, c_white, 1); // woops made sprite too small, so increasing scale
if (state == "casting_transform")
	draw_sprite(spr_transforming, 0, 479, 269);