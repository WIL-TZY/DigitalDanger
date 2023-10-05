// Depth Sorting
SetDepth(0); // Determines DepthID of each instance

// Entity
is_player = false;
is_npc = false;
has_shadow = true;

//Input
input_x = 0;
input_y = 0;
//sprite_offset = 0; ---> set on variable definitions

//Movement
move_spd = 1;
moving = false;
//move_dir = 0; //declared in variable definitions
target_x = x;
target_y = y;
dir = 270;

//changing sprites in ALL characters that inherit from this
get_sprite = function (dir) { // anon function that is stored inside get_sprite method variable
	if (dir == 0) return state.right;
	else if (dir == 90) return state.up;
	else if (dir == 180) return state.left;
	else if (dir == 270) return state.down;

	//returning chara's current sprite for safety reasons
	return sprite_index; //this only runs if the dir was invalid for some reason
}

//changing from idle state to move state and vice versa
set_state = function(new_state) {
	if (state == new_state) return; //if chara is already using the given state the function ends
	
	state = new_state;
	
	//resetting subimage for the sprite when the state changes so the anim plays from the beginning
	image_index = 0; 
}

//code to fix annoying bug where we would need to manually position the player or NPC objects 
//in the center of tile to avoid the initial diagonal movement
script_execute(fix_placement);

//ADDITIONAL VARIABLES FOR PRESSURE-BASED MOVEMENT
min_pressure = 0; //minimum pressure needed to trigger movement
max_pressure = 8; //maximum pressure
pressure_threshold = 8; //pressure threshold to trigger movement
pressure = 0; //current pressure

// Doesn't work for my purposes
//depth = room_height - y; 


