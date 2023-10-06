if(!global.ovwrd_menu) {
exit;
}

input_up_p		= keyboard_check_pressed(global.key_up);
input_down_p 	= keyboard_check_pressed(global.key_down);
input_enter_p	= keyboard_check_pressed(global.key_enter);

var ds_grid = menu_pages[page]; //the default page (main page, id 0)
var ds_height = ds_grid_height(ds_grid);

if (inputting){ //prevent from moving to other elements when selecting 
		
	switch(ds_grid[# 1, menu_option[page]]){
		//no case for script_runner
		
		//no case for page_transfer
		
		case menu_element_type.shift : 
			var _horizontal_input = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left); //results in three possible values: -1, 0 and 1.
			if(_horizontal_input != 0){
				//play audio
				audio_play_sound(snd_select, 1, false);
				//changes index4 of ds_menu_difficulty according to player input. index4 = "EASY"/"NORMAL"/"HARD"
				ds_grid[# 3, menu_option[page]] += _horizontal_input;
				//to check whether the value is between index0, index1 and index2. And the "-1" at the end is to make it equal to the resulting value of var _horizontal_input
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length(ds_grid[# 4, menu_option[page]])- 1);
			}
		break;
		
		case menu_element_type.slider :
		
		///sound test
			switch(menu_option[page]){
				case 0: if(!audio_is_playing(snd_master_test))	{ audio_play_sound(snd_master_test, 1, false);	} break; 
				case 1: if(!audio_is_playing(snd_sfx_test))		{ audio_play_sound(snd_sfx_test, 1, false);		} break;
				case 2: if(!audio_is_playing(snd_mus_test))		{ audio_play_sound(snd_mus_test, 1, false);		} break;
			}

			
			var _horizontal_input = keyboard_check(global.key_right) - keyboard_check(global.key_left);
			if(_horizontal_input != 0){
				ds_grid[# 3, menu_option[page]] += _horizontal_input*0.01; //to make it a value between 0-1
				//to check whether the value is between index0, index1 and index2.
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				//for audio to play whenever input is happening for the slider
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
			}
		break;
		
		case menu_element_type.toggle :
			var _horizontal_input = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left); //results in three possible values: -1, 0 and 1.
			if(_horizontal_input != 0){
				//play audio
				audio_play_sound(snd_select, 1, false);
				//changes index4 of ds_menu_difficulty according to player input. index4 = "EASY"/"NORMAL"/"HARD"
				ds_grid[# 3, menu_option[page]] += _horizontal_input;
				//to check whether the value is between index0, index1 and index2. And the "-1" at the end is to make it equal to the resulting value of var _horizontal_input
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length(ds_grid[# 4, menu_option[page]])- 1);
			}
		break;
		
		case menu_element_type.input :
			var _kk = keyboard_lastkey;
			if(_kk != vk_enter) { //and... [any other legal key]{
					//play audio
					if(_kk != ds_grid[# 3, menu_option[page]]){
						audio_play_sound(snd_select, 1, false);
					}
				ds_grid[# 3, menu_option[page]] = _kk;
				variable_global_set(ds_grid[# 2, menu_option[page]], _kk);
				//add "Reset to defaults" option
			}
		break;	
	}

} else { 
	//if we're not currently inputting...
	audio_stop_all(); //to stop misplaced music (sliders)
	
	var our_change = input_down_p - input_up_p; //can be 1 (moves down) or -1 (moves up)
	if(our_change != 0){
		menu_option[page] += our_change;
		//if selection goes beyond last option, 
		if(menu_option[page] > ds_height-1) {
		//go back to the top
			menu_option[page] = 0;		
		}
		//if selection goes beyond first option,
		if(menu_option[page] < 0) { 
		//go back to the bottom
			menu_option[page] = ds_height - 1;
		}
	}
}

//setting up scripts so they run and impact/change variables in the game (before was just registering input and visual response)
if(input_enter_p){
	switch(ds_grid[# 1, menu_option[page]]){ //x1 ---> argument 1 (the type)
		case menu_element_type.script_runner : script_execute(ds_grid[# 2, menu_option[page]]); break;
		//it runs a script assigned to it by argument2
		case menu_element_type.page_transfer : page = ds_grid[# 2, menu_option[page]]; break;
		//it accesses a page assigned to it by argument2 (i.e. when clicking "SETTINGS" in the main menu, goes to menu_page.settings
			page = ds_grid[# 2, menu_option[page]]; //x2 ---> argument2
			break;
			//next cases don't have breaks, which means, all the following code is gonna run without pauses
		case menu_element_type.shift :
		case menu_element_type.slider :
		case menu_element_type.toggle : if(inputting){ script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); }
		case menu_element_type.input :
				inputting = !inputting;
	}

	//play audio
	audio_play_sound(snd_pick, 1, false);
}