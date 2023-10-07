/// @description Persistent Game Manager
// Initialize all globals

// Randomize seed for true randomness
// Feel free to comment it for debugging purposes
randomize();


#region GAME VARIABLES
global.pause = false;
global.ovwrd_menu = false;
global.textbox_active = false;
//global.AI_grid;
// global.money = 20;
// global.player_can_warp = true;
// global.level = 1;
#endregion GAME VARIABLES

#region DEBUG
global.debug = false; //PRESS Q
#endregion

#region ROOMS & NAVIGATION
global.rm_current = room_get_name(room);

#endregion ROOMS

#region AUDIOGROUPS
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);

#endregion AUDIOGROUPS

#region CAMERA
global.is_fullscreen = false;
global.camera_id = -1;
// Resolution struct
global.res = { // See menu_functions script
	xx: 0,
	yy: 0,
	width: 320,
	height: 240,
	scale: 1 //1 ---> 320x240 (default)
}
#endregion CAMERA


#region SETUP INPUTS & CONTROLS
//held
global.HELD = false;
global.HELD_UP = false; 
global.HELD_DOWN = false;
global.HELD_LEFT = false;
global.HELD_RIGHT = false;
//global.HELD_CANCEL = false;
//global.HELD_CONFIRM = false;
//pressed
global.PRESSED_UP = false;
global.PRESSED_DOWN = false;
global.PRESSED_LEFT = false;
global.PRESSED_RIGHT = false;
global.PRESSED_CONFIRM = false;	//"Z"
global.PRESSED_CANCEL = false;	//"X"
global.PRESSED_SELECT = false;	//registered item ("V" or SPACE)
global.PRESSED_START = false;	//menu ("C" or ENTER)
//released
global.RELEASED_UP = false;
global.RELEASED_DOWN = false;
global.RELEASED_LEFT = false;
global.RELEASED_RIGHT = false;
global.RELEASED_CONFIRM = false;
global.RELEASED_CANCEL = false;
//shoulder
//global.SHOULDER_LEFT = false;
//global.SHOULDER_RIGHT = false;
#endregion SETUP INPUTS & CONTROLS

enum	e_direction{ //FACING CONSTANTS (also set in scr_macros)
	north, //FACE = RIGHT (east)
	east, //FACE = UP (north)
	south, //FACE = LEFT (west)
	west, //FACE = DOWN (SOUTH)
}

#region STATES

//GAME STATES
//all game states: OVERWORLD, BATTLE, SHOP, GAMEOVER, LEAVE
enum	e_game_states{
	overworld,
	battle,
	shop,
	gameover,
	leave //returns to title
}

states[e_game_states.overworld] = "overworld";
states[e_game_states.battle] = "battle";
states[e_game_states.shop] = "shop";
states[e_game_states.gameover] = "gameover";

//world states
//all world states: GAMEPLAY, FADING, MENU
enum	e_world_states{
	gameplay,
	fading, //for room transitions
	menu
}

world_states[e_world_states.gameplay] = "gameplay";
world_states[e_world_states.fading] = "fading";
world_states[e_world_states.menu] = "menu";


global.state = states[e_game_states.overworld]; //default game state is overworld
global.world_state = world_states[e_world_states.gameplay]; //default world state is gameplay

#endregion STATES

#region NPC TYPES

enum e_npc_roles {
	normal,		// ----> default
	inn_keeper,
	shop_keeper,
	//wanderer
}

enum e_npc_types { 
	silent,	// ----> default
	speaker,
	interactable,
	opponent,
	boss,
	last
}

#endregion NPC TYPES


#region ROOM TYPES & TRAVELLING

enum e_room_types {
	world_map,
	village,
	basic,
	dungeon
}

// This global needs to be set in the creation code of every room the obj_player is in
global.room_type = e_room_types.basic;

#endregion ROOM TYPES & TRAVELLING

#region ITEMS
#endregion ITEMS

#region INVENTORY
// No-Nothing

#endregion INVENTORY