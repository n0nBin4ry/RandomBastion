/// @description Script that only affect's player; takes int damage calculates

/// @param int_damage arg0


var dam = argument0;
var hp_dam = 0; // damage given to hp, not armor
with (obj_player) {
	// if in turret mode, give 20% reduction because of ironclad ability
	if (mode == "turret")
		dam = dam - (dam / 5);
	
	// if there is armor damage it first
	if (armor > 0) {
		// armor reduces damage by 50%, capped at 5
		armor -= dam - clamp(dam / 2, 1, 5);
		// if there is leftover damage after armor destroyed. give it to hp_dam
		if (armor < 0) {
			hp_dam = -1 * armor;
			armor = 0; // set armor to 0
		}
	}
	// if there is no armor, give all damage to hp_dam
	else 
		hp_dam = dam;
	
	// aply hp_damage
	hp -= hp_dam;
}
	