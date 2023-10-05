function char_data() constructor {
	#region STATES

		states = {
			idle: {
				left:	spr_player_idle_left,
				right:	spr_player_idle_right,
				up:		spr_player_idle_up,
				down:	spr_player_idle_down
			},
	
			walk: {
				left:	spr_player_walk_left,
				right:	spr_player_walk_right,
				up:		spr_player_walk_up,
				down:	spr_player_walk_down
			}			
		}

	#endregion STATES
}

//changing sprites in ALL characters that inherit from this
function get_chara_sprite(_char, _dir) { // Also set as method variable called get_sprite() inside obj_character parent (for NPCs)
	if (_dir == 0) return _char.state.right;
	else if (_dir == 90) return _char.state.up;
	else if (_dir == 180) return _char.state.left;
	else if (_dir == 270) return _char.state.down;

	// Returning chara's current sprite for safety reasons
	return sprite_index; // This only runs if _dir was invalid for some reason
}

//changing from idle state to move state and vice versa
function set_chara_state(new_state) { // Also set as method variable called set_sprite() inside obj_character parent (for NPCs)
	if (state == new_state) return; // If chara is already using the given state the function ends
	
	state = new_state;
	
	// Resetting subimage for the sprite when the state changes so the anim plays from the beginning
	image_index = 0; 
}


