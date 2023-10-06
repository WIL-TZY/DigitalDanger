////////// CREATE CONFIG SUBMENU //////////

//global.view_width		= camera_get_view_width(view_camera[0]);
//global.view_height	= camera_get_view_height(view_camera[0]);

//these are for the menu only, not the player object
global.key_revert	= ord("X");
global.key_enter	= ord("Z"); //or vk_enter
global.key_left		= vk_left; 
global.key_right	= vk_right;
global.key_up		= vk_up;
global.key_down		= vk_down;

//display_set_gui_size(global.view_width, global.view_height);

enum menu_page {	//makes code more readable than only using numbers
	main, 			//0
	settings, 		//1
	audio, 			//2
	difficulty, 	//3
	graphics,		//4
	controls,		//5
	height			//last enum entry
}

enum menu_element_type {
	script_runner,	//0
	page_transfer,	//1
	slider,			//2
	shift,			//3
	toggle,			//4
	input			//5
}

//CREATE MENU PAGES ------> each variable with the "ds" prefix stores a ds grid returned by the scr_create_menu_page function
//every argument in this function is actually assigning this grid each of its cells
//it's done by using 1d arrays. 
//For example, the 1st array here contains the string data "RESUME" in index0, the enumID 0 in index1, and a function ID in the index2
//2nd array here contains the string data "SETTINGS" in index0, the enumID 1 in index1, and the enumID 1 in the index2
//3rd array here contains the string data "EXIT" in index0, the enumID 0 in index1, and a function ID in the index2
//So the 1st grid called "ds_menu_main" has 3 arrays inside of it
//Visually, this world result in a structure like this:
//-------------------------------- MAIN (ds_menu_main) --------------------------------------
//			[0]				[1]				[2]				[3]			[4]		
//	[0]	  "RESUME"	enum.script_runner	resume_game	       unused     unused
//	[1]  "SETTINGS"	enum.page_transfer	enum.settings	   unused     unused
//	[2]    "EXIT"	enum.script_runner	exit_game          unused     unused

ds_menu_main = scr_create_menu_page(
	["RESUME",		menu_element_type.script_runner, 	resume_game],					//argument0
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings],			//argument1
	["EXIT",		menu_element_type.script_runner, 	exit_game]						//argument2
);

ds_settings = scr_create_menu_page(
	["AUDIO",		menu_element_type.page_transfer,	menu_page.audio],				//argument0
	["DIFFICULTY",	menu_element_type.page_transfer,	menu_page.difficulty],			//argument1
	["GRAPHICS",	menu_element_type.page_transfer,	menu_page.graphics],			//argument2
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls],			//argument3
	["BACK",		menu_element_type.page_transfer,	menu_page.main]					//argument4
);

ds_menu_audio = scr_create_menu_page(
	["MASTER",	menu_element_type.slider,			change_volume,				1,		[0,1]],			//argument0
	["SOUNDS",	menu_element_type.slider,			change_volume,				1,		[0,1]],			//argument1
	["MUSIC",	menu_element_type.slider,			change_volume,				1,		[0,1]],			//argument2
	["BACK",	menu_element_type.page_transfer,	menu_page.settings]									//argument3
);

ds_menu_difficulty = scr_create_menu_page(
	["ENEMIES",	menu_element_type.shift,			change_difficulty,			0,		["EASY", "NORMAL", "HARD"]],					//argument0
	["ALLIES",	menu_element_type.shift,			change_difficulty,			0,		["EASY", "NORMAL", "HARD"]],					//argument1
	["BACK",	menu_element_type.page_transfer,	menu_page.settings]																	//argument2
);

ds_menu_graphics = scr_create_menu_page(
	["RESOLUTION",	menu_element_type.shift,			change_resolution,			0,		["320 x 240", "640 x 480", "1280 x 960"]],		//argument0
	["WINDOW MODE",	menu_element_type.toggle,			change_window_mode,			1,		["FULLSCREEN", "WINDOWED"]],					//argument1
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_controls = scr_create_menu_page(
	["UP",		menu_element_type.input,			"key_up",				vk_up],				//argument0
	["LEFT",	menu_element_type.input,			"key_left",				vk_left],			//argument1
	["RIGHT",	menu_element_type.input,			"key_right",			vk_right],			//argument2
	["DOWN",	menu_element_type.input,			"key_down",				vk_down],			//argument3
	["BACK",	menu_element_type.page_transfer,	menu_page.settings]							//argument4
);

page = 0;		//0				//1			//2				//3					//4					//5
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_difficulty, ds_menu_graphics, ds_menu_controls];
//menu_pages is an array that stores all of these arrays
//so we can use "page" to access different pages
//page = 0 means the default page is the main page

//setting up another important variable, menu_option (another 1d array)
//it will loop through the number of pages we have in menu pages and update it depending on how many options there are in each page
var i = 0, array_len = array_length(menu_pages); //what is the length of the menu_pages array?
repeat(array_len){
	menu_option[i] = 0;
	i++;
}

inputting = false; //when inputting is true, it means the selection was made and we can start changing settings
