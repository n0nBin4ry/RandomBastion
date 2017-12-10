/// @description Little method to keep me from retyping a path reset

/// @param path arg0

if (path_exists(argument0))
	path_delete(argument0);
//argument0 = path_add();
argument0 = noone;
//show_debug_message( path_get_number(argument0) );
//show_debug_message( "Path reset" );