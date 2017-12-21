/// @description Delete data structures used by object
if (path_exists(alert_path))
	path_delete(alert_path);
obj_master_controller.enemy_count--; // reduce enemy count