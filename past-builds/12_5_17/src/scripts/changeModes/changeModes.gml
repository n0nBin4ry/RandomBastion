/// @description method for obj_player; transforms player between player between
///				 turret and recon mode

// if not transforming, start transforming
if (state != "casting_transform") {
	if (mode == "recon")
		cast_counter = SEC; // takes 1 sec to go to turret
	else if (mode == "turret")
		cast_counter = SEC / 2; // takes half sec to go to recon
	state = "casting_transform";
}
// when transforming, reduce counter
else if (cast_counter > 0)
	cast_counter--;
// when counter reaches 0, transforming is done; change to new form, fill ammo
// and set state out of transforming
else {
	if (mode == "recon") {
		mode = "turret";
		ammo = tur_ammo;
	}
	else if (mode == "turret") {
		mode = "recon";
		ammo = rec_ammo;
	}
	state = "normal";
}