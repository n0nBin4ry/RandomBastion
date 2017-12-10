/// @description Insert description here

// only have a brain if player is in certain radius
if (distance_to_object(obj_player) <= 300) {
	// basic state for enemy
	if (state == "idle") {
		// patrol: walk in one direction of square, clockwise,
		// NOTE: plan to do dynamic path-finding but for now will try something
		//		 basic
		var wall_b = CELL_WIDTH / 4;
		switch (pat_dir) {
			// right
			case 0 : {
				movePlayer(spd, 0);
				// if at a wall (or not floor), turn clockwise
				if (!gridPlaceMeeting(x + wall_b, y, FLOOR) || place_meeting(x + wall_b, y, obj_testBoii))
					pat_dir = 3;
				break;
			}
			// up
			case 1 : {
				movePlayer(0, -spd);
				if (!gridPlaceMeeting(x, y - wall_b, FLOOR) || place_meeting(x, y - wall_b, obj_testBoii))
					pat_dir = 0;
				break;
			}
			// left
			case 2 : {
				movePlayer(-spd, 0);
				if (!gridPlaceMeeting(x - wall_b, y, FLOOR) || place_meeting(x - wall_b, y, obj_testBoii))
					pat_dir = 1;
				break;
			}
			// down
			case 3 : {
				movePlayer(0, spd);
				if (!gridPlaceMeeting(x, y + wall_b, FLOOR) || place_meeting(x, y + wall_b, obj_testBoii))
					pat_dir = 2;
				break;
			}
		}
		// if player seen
		if ( (distance_to_object(obj_player) <= 100) && (!checkBetween(obj_player, WALL) && !checkBetween(obj_player, DOOR)) )
			state = "chase";
		/* IMPLEMENTING IN DIFFERENT WAY, OFF GUNSHOTS AND TRANSFORMING ETC
		// if not seen but close enough to be "heard"
		else if (distance_to_object(obj_player) <= 50)
			state = "alert";*/
	
	}
	
	else if (state == "chase") {
		// if player is out of sight, move to where you last saw them
		if (checkBetween(obj_player, WALL) || checkBetween(obj_player, DOOR))
			state = "alert";
		// when at certain radius of player, OPEN FIRE
		else if (distance_to_object(obj_player) <= 70)
			state = "attack";
		// move towards player
		var dir_to_plyr = point_direction(x, y, obj_player.x, obj_player.y);
		var hspd = lengthdir_x (spd, dir_to_plyr);
		var vspd = lengthdir_y (spd, dir_to_plyr);
		movePlayer(hspd, vspd);
		
	}
	// OPEN FIRE
	else if (state == "attack") {
		if (checkBetween(obj_player, WALL) || checkBetween(obj_player, DOOR))
			state = "alert";
		else if (distance_to_object(obj_player) > 70)
			state = "chase";
		if (fire_rate_cntr <= 0) {
			// NOTE(for when sober): might have to use instance ID of player object for this...
			var gun_crosshair = point_direction(x, y, obj_player.x, obj_player.y);
			fire_rate_cntr = fire_rate;
			var bullet = instance_create_layer(x, y, "Instances", obj_testBullet);
			bullet.direction = gun_crosshair;
		}
	}
	// if enemy alert by player or sound
	else if (state == "alert") {
		// this is where I will use pathfinding to move NPC to a goal position 
		// where it last saw player, then from there if state not set to chase
		// it will be set back to idle patrolling
		// NOTE: for now it will target its own position so that everything can
		// run

		// if player in range and sight, end path and and start chasing
		if (!checkBetween(obj_player, WALL) && !checkBetween(obj_player, DOOR)) {
			if (alert_path != noone)
				path_end(); // end path
			resetGridPath(alert_path); // reset path variable
			state = "chase"; // chase player
		}
		// if there isn't a path, make one
		if (alert_path == noone) {
			gridPathToObject(alert_path, obj_player);
			if (alert_path == noone)
				state = "idle";
		}
		// if there is a path
		else {
			// if player in range and sight, end path and and start chasing
			if (!checkBetween(obj_player, WALL) && !checkBetween(obj_player, DOOR)) {
				path_end(); // end path
				resetGridPath(alert_path); // reset path variable
				state = "chase"; // chase player
			}
			// if end of alert path reached without finding player, end path and
			// return to idle patrol
			else if (path_position >= .75) {
				path_end();
				resetGridPath(alert_path);
				state = "idle";
			}
		}
	}
	
	// every frame, decriment fire_rate_cntr
	if (fire_rate_cntr > 0) fire_rate_cntr--;
}

// destroy instance if dead
if (hp <= 0)
	instance_destroy();
