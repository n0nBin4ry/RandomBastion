/// @description self-healing method for obj_player, though could be used w/objs
//				 w/same instance var; no args, returns nothing

// before going into healing, must go through "casting-time"
if (state != "casting_heal" && state != "healing") {
	state = "casting_heal";
	cast_counter = SEC / 2; // half-second cast-time
}

// go through "casting"
if (state == "casting_heal" && cast_counter > 0) 
	cast_counter--;
// if "casting" and the counter finishes, start healing
else if (state == "casting_heal") {
	state = "healing";
	hp_increase = 0;
}

// inst var hp_increase is used to store when the rate reaches 1 so that hp can
// increase by 1
if (state == "healing") {
	hp_increase += healing_rate;
	heal_resource_cntr--; // decrease the healing_resource cntr
	if (hp_increase >= 1) {
		hp_increase -= 1;
		if (hp < maxHp)
			hp++;
		else if (armor < maxArmor)
			armor++;
	}
}
