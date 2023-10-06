// Inherit the parent event
//event_inherited();

// Pressure Mechanic
if (pressure < min_pressure) {
	pressure = min_pressure; // set pressure to minimum if it's less than min_pressure
} else if (pressure > max_pressure) {
	pressure = max_pressure; // set pressure to maximum if it's greater than max_pressure
}

if (global.HELD) {
	 if (pressure < pressure_threshold) pressure++;
} else if (is_npc) {
	pressure = 10;
} else {
	pressure = 0;	
}

if (is_player) {

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
					if (pressure >= pressure_threshold) { //ADDITIONAL CODE FOR PRESSURE-BASED MOVEMENT	
						target_x = to_room(new_tile_x + 0.5); //0.5 is the offset based on the origin of the chara
						target_y = to_room(new_tile_y + 0.5);
		
					// Enable moving
					moving = true;
					}
					else{ 
					//makes it so the character changes faces if helding button even if couldn't move due to pressure levels
					move_direction = point_direction(0, 0, input_x, input_y);
					}
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
	
			set_state(player_data.states.walk);
	
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
		//else if and else are for when moving = false (reached collision, for example)
		else if (global.HELD){ 
			//animates sprite when player input is detected (even when colliding with something)
				image_speed = 0.6;
				//audio for colliding
				//if (!audio_is_playing(snd_cancel)) audio_play_sound(snd_cancel, 1, false);
			}
		else { // Not Moving/Idle
			//image_speed = 0;
			//image_index = 0;
			set_state(player_data.states.idle);
		}

		sprite_index = get_chara_sprite(id, move_direction);

		#endregion 2ND PART - MOVE TO TARGET POSITION / STOP MOVEMENT
	
	} //end of (!global.paused)
	else { // means (global.paused == true)
		image_index = 0;
	}

} // end of if (is_player)


#region NPC interaction

// Check for the cell where player is facing and trying to find a NPC there
npc_inst = noone;
//var npc_inst = noone;
var offset_x = 0;
var offset_y = 0;

if (facing == RIGHT) {
    npc_inst = instance_position(x + 20, y, obj_npc_parent);
    offset_x = 20;
} else if (facing == UP) {
    npc_inst = instance_position(x, y - 20, obj_npc_parent);
    offset_y = -20;
} else if (facing == LEFT) {
    npc_inst = instance_position(x - 20, y, obj_npc_parent);
    offset_x = -20;
} else if (facing == DOWN) {
    npc_inst = instance_position(x, y + 20, obj_npc_parent);
    offset_y = 20;
}

// Check if the player is colliding with the tile above/below or to the left/right
if (!npc_inst) {
    var box_top = y - 25;
    var box_left = x - 5;
    var box_right = x + 5;
    var box_bottom = y + 8;
    
    if (facing == RIGHT) {
        box_left = x + 6;
        box_right = x + 18;
    } else if (facing == UP) {
        box_top = y - 33;
        box_bottom = y - 25;
    } else if (facing == LEFT) {
        box_left = x - 18;
        box_right = x - 6;
    } else if (facing == DOWN) {
        box_top = y + 8;
        box_bottom = y + 16;
    }

    if (place_meeting(x, y + offset_y, obj_npc_parent)) {
        npc_inst = instance_position(x + offset_x, y + offset_y, obj_npc_parent);
    } else if (place_meeting(x + offset_x, y, obj_npc_parent)) {
        npc_inst = instance_position(x + offset_x, y + offset_y, obj_npc_parent);
    } else if (place_meeting(box_left + offset_x, box_top + offset_y, obj_npc_parent)
               || place_meeting(box_right + offset_x, box_top + offset_y, obj_npc_parent)
               || place_meeting(box_left + offset_x, box_bottom + offset_y, obj_npc_parent)
               || place_meeting(box_right + offset_x, box_bottom + offset_y, obj_npc_parent)) {
        npc_inst = instance_position(x + offset_x, y + offset_y, obj_npc_parent);
    }
}


// Drawing speech bubble and dialogue when NPC instance is interacted with
if ((npc_inst != noone) && (!instance_exists(obj_textbox))) {
    // NPC found, do something
	
	// Speech Bubble stuff
	if (npc_inst.is_npc == true) { // Instance is a speaker NPC
		npc_inst.show_speech_bubble = true;
	} 
	
    // Activate dialogue if instance is an NPC and has a speech bubble, OR if it is an instance of obj_interaction
	if ( global.PRESSED_CONFIRM && ( (npc_inst.has_speech_bubble && !instance_exists(obj_textbox)) ) ) {
		textbox_inst = create_textbox(npc_inst.default_dialogue);
		
		// Make NPC face the player
		npc_inst.move_direction = point_direction(npc_inst.x, npc_inst.y, x, y);
	}
}
#endregion NPC interaction
