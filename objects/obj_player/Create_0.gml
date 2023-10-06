// Inherit the parent event
event_inherited();

// Depth Sorting
SetDepth(0); // Determines DepthID of each instance

visible = true;
//active = false;
//wasd_movement(oPlayer);
				
// Rename this object to: obj_pl_fol
is_player = true;

// char1 and char2 will inherit from it
// based on if they're player or followers, they'll run a certain step code

// Variable definitions
// move_direction = 270;
// sprite_offset = 8;
player_data = new char_data();

state = player_data.states.idle;

facing = DOWN;
