/// @description Exist for half a second then destroy itself


if (existance_cntr-- == 0)
	instance_destroy();
	
// apply damage if it is not already applied
if (victim != noone) {
	victim.hp -= damage;
	victim = noone;
}