// Pause
if (global.pause) {
	set_state(states.idle);
	sprite_index = get_sprite(move_direction);
	exit; // rest of step code doesn't run in this case
}
	

if (!global.pause) {

	#region 1ST PART - READ INPUT / SET TARGET POSITION
	//Input
	if (input_x != 0 || input_y != 0){
		if (!moving) {
			//Prefer horizontal movement over vertical movement	
				if (input_x != 0) input_y = 0;

			//New position - getting tile coordinates
			var new_tile_x = to_tile(x) + input_x;
			var new_tile_y = to_tile(y) + input_y;
			//show_debug_message(_new_tile_x);
			//show_debug_message(_new_tile_y);

			//Collision
			var _col = collision(new_tile_x, new_tile_y); //collision check
		
			if (!_col) { //if it's not colliding with anything... chara can move there
					target_x = to_room(new_tile_x + 0.5); //0.5 is the offset based on the origin of the chara
					target_y = to_room(new_tile_y + 0.5);
		
				// Enable moving
				moving = true;

			}
			else {
				// If there are collisions, at least face in that direction
				move_direction = point_direction(0, 0, input_x, input_y);
			}
		}
	}

	#endregion 1ST PART - READ INPUT / SET TARGET POSITION



	#region 2ND PART - MOVE TO TARGET POSITION / STOP MOVEMENT

	//Move
	if (moving) { 
		image_speed = 1;
	
		set_state(states.walk);
	
		//this function gives the distance between two point
		//and it's storing this pixel distance in the _distance local variable
		var _distance = point_distance(x, y, target_x, target_y);

		if (_distance > move_spd) { //player IS MOVING but hasn't reached the final position yet
			//sign function simplifies value received, if it's positive it's 1 and if it's negative becomes -1. If 0, keeps as 0
			//getting constant speed
			x += sign(target_x - x) * move_spd; //subtracting current position from the target position, which means...
			y += sign(target_y - y) * move_spd; //... how much the chara needs to move to get to the target_x
		
			//finding which sprite to change based on direction
			move_direction = point_direction(x, y, target_x, target_y);
			/*
			if (global.HELD){
				//finding which sprite to change based on direction
				move_direction = point_direction(x, y, target_x, target_y);
			}
			*/
	
		}
		else { //if the chara has reached target position
			x = target_x;
			y = target_y;
			//movement stops
			moving = false;
		}
	}
	else { // Not Moving/Idle
		image_speed = 0;
		image_index = 0;
		//set_state(states.idle);
	}

	sprite_index = get_sprite(move_direction);

	#endregion 2ND PART - MOVE TO TARGET POSITION / STOP MOVEMENT
	
} //end of (!global.paused)
else { // means (global.paused == true)
	image_index = 0;
}