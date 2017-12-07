// get input
var hspd = keyboard_check(vk_right) - keyboard_check(vk_left);
var vspd = keyboard_check(vk_down) - keyboard_check(vk_up);

// move
movePlayer(hspd, vspd);