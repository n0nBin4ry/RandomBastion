// get input needed always
// mouse_pos is instance var to use with drawing as well
ms_x	  = mouse_x;
ms_y	  = mouse_y;
// mouse clicks are instance vars to also draw gun flash and repair tool
ms_clickL = mouse_check_button(mb_left);
ms_clickR = mouse_check_button(mb_right);

// r key for reloading
var r	  = keyboard_check_pressed(ord("R"));
// t key for reloading
var t	  = keyboard_check_pressed(ord("T"));

// abilities and states independent of mode

// reload; comes before heal in loop because healing has priority if that makes sense
// NOTE: need to move this into one for each node to check its max ammo..
/*if ((ammo < rec_ammo) && (r || ammo <= 0 || state == "reloading"))
	reload(reload_rate);*/



//heal
if (ms_clickR && state != "casting_transform" && heal_resource_cntr > 0) /*&& (state == "normal" || state == "healing" || state == "casting_heal")*/ {
	// NOTE: the conditional part is commented out to emulate healing's top priority.
		selfHeal();
} // regain resouce when not healing
else if (mouse_check_button_released(mb_right))
	state = "normal";
// when not healing, refill healing-resource
if (state != "healing" && heal_resource_cntr < heal_resource) {
	// every every heal_resource_rate frames, increase resource by 1
	if (heal_resource_rate_cntr < heal_resource_rate)
		heal_resource_rate_cntr++;
	else {
		heal_resource_cntr++;
		heal_resource_rate_cntr = 0;
	}
}
/*if (state != "healing" && heal_resource_cntr < heal_resource)
	heal_resource_cntr++;*/
	

// recon-mode
if (mode == "recon") {
	// get input needed by recon mode
	var hspd = (keyboard_check(vk_right) - keyboard_check(vk_left)) * spd;
	var vspd = (keyboard_check(vk_down) - keyboard_check(vk_up)) * spd;
	var shft = keyboard_check(vk_shift);

	// move
	movePlayer(hspd, vspd);

	// open doors
	if (shft)
		openDoor();
		
	// TODO: This and below
	
	// shoot
	if (ammo > 0 && fire_rate_cntr <= 0 && ms_clickL) && (state == "normal") {
		shootBasicProjectile(g_off_x, g_off_y, ms_x, ms_y, obj_reconBullet, sprite_get_width(spr_reconGun), recBullet_speed);
		fire_rate_cntr = rec_fire_rate;
		ammo--;
	}
	
	// reload
	if ((ammo < rec_ammo) && (r || ammo <= 0 || state == "reloading"))
	reload(reload_rate);
	
	
	// change mode
	if (t || state == "casting_transform" /* && state != "casting_heal"*/) {
		changeModes();
	}
	
	
	// ult (?)
}

// turret-mode
if (mode == "turret") {
	// shoot
	if (ammo > 0 && fire_rate_cntr <= 0 && ms_clickL) && (state == "normal") {
		shootTurret(x, y, ms_x, ms_y, obj_turretBulletTrail, sprite_get_width(spr_turretGun), 10);
		fire_rate_cntr = tur_fire_rate;
		ammo--;
	}
	
	// reload
	if ((ammo < tur_ammo) && (r || ammo <= 0 || state == "reloading"))
	reload(reload_rate);
	
	
	// change mode
	if (t || state == "casting_transform" /* && state != "casting_heal"*/) {
		changeModes();
	}
	
}



// final chacks and such


//  every frame, reduce fire rate cntr to shoot again
fire_rate_cntr--;
// every frame if heal resource cntr less than set heal_resource, increase cntr
if (state != "healing" && heal_resource_cntr < heal_resource) {
	if (heal_resource_rate_cntr < heal_resource_rate)
		heal_resource_rate_cntr++;
	else {
		heal_resource_cntr++;
		heal_resource_rate_cntr = 0;
	}
}
	
if (hp <= 0)
	room_restart();