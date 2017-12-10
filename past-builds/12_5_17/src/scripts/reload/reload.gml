/// @description Method for obj_player to reload, takes into acount canceling
//				  when healing and transforming (and melee maybe?)

/// @param relod_rate arg0

// NOTE: made it take in reload rate as arg in case I want to have power ups
//		 affecting reload rate

// if first time calling reload, set reload rate, change to reloading
if (state == "normal") {
	state = "reloading";
	reload_cntr = argument0;
}
// decrease reloading counter, then when at 0 fill ammo
else if (state == "reloading") {
	if (reload_cntr > 0)
		reload_cntr--;
	else {
		if (mode == "recon")
			ammo = rec_ammo;
		else if (mode == "turret")
			ammo = tur_ammo;
		state = "normal";
	}
}

// cancel reloading when healing
// NOTE: commented out for now until it is confirmed this works with GUI
/*if (ms_clickR)
	state = "normal";*/