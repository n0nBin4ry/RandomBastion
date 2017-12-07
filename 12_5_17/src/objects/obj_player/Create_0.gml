/// @description Constructor

depth -= 10;

//psuedo state machine
state = "normal";

// variable to tell mode player is in; recon is default mode
mode = "recon";

// speed of player movement
spd = 3;

// speed of recon bullet
recBullet_speed = 5;

// fire-rate for recon; Actual bastion does 8 shots per sec,
// the math to convert to frames is 60 / 8 = 7.5 (which is rounded from int division)
rec_fire_rate = (SEC / 8) + 1;
// fire-rate for turret; Actual bastion does 35 rounds per sec; 60 / 35 = 1.7 (rounded)
tur_fire_rate = (SEC / 35) + 1;

// ammo capacity of recon mode and turret mode
rec_ammo = 25;
tur_ammo = 300;

// current ammo; defaulted at recon ammo
ammo = rec_ammo;

// reload time and cnt
reload_rate = 2 * SEC;
reload_cntr = 0;

// fire rate counter
fire_rate_cntr = 0;

// hit points
maxHp = 200;
hp = maxHp;
// armor
maxArmor = 100;
armor = maxArmor;

// healing resource stuff
heal_resource = 4 * SEC;
heal_resource_cntr = heal_resource;
healing_rate = 75 / SEC;
hp_increase = 0;

// gun sprite reference
g_spr = spr_reconGun;

// offset-pos for guns
g_off_x = 0;
g_off_y = 0;
// offset length for each mode
g_dis_r = 4;
g_dis_t = 2;

// might be needed ???
if (instance_exists(obj_master_controller)) obj_master_controller.player_ID = instance_id;

// 11/6/17
// NOTE: flavor idea: bastion vs tanks or something.. but bastion
//		 - have a recon, turret, tank mode (ult)
//		 - simulate similar damage, ammo, fire rate, ult charge, hp scaled to
//		   to this game
//		 - * Don't stress too much over this. don't overwhelm yourself like in the
//			 development of the junkrat game. In the end you can just use a bastion theme
//			 and that's it
//		 - Balance Idea: Turret might be too OP since you can just wait for each
//		   enemy to turn corner so gun down. So maybe increase radius enemies notice you
//		   or increase their speed or both.

// keyboard mapping; wasd == dpad
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);
