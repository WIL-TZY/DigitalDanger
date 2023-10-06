// Inherit the parent event
event_inherited();

// Depth Sorting
SetDepth(0); // Determines DepthID of each instance

visible = true;
//active = false;
				
is_player = true;
moving = false;

// Variable definitions
// move_direction = 270;
// sprite_offset = 8;
player_data = new char_data();

state = player_data.states.idle;

facing = DOWN;

// To start idle
image_speed = 0;
