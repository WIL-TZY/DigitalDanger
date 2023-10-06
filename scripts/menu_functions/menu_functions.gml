function resume_game(){
	global.ovwrd_menu = false;
	global.pause = false;
	instance_destroy(obj_game.overworld_menu_instance);	
}

function exit_game(){
	game_end();
}

///@description change_volume
///@arg value
function change_volume(){
	//show_debug_message("changed volume to " + string(argument0));

	var type = menu_option[page];

	switch(type){
		case 0: audio_master_gain(argument0); break;
		case 1: audio_group_set_gain(audiogroup_sfx, argument0, 0); break;
		case 2: audio_group_set_gain(audiogroup_music, argument0, 0); break;
	}

//show_debug_message("changed volume to " + string(argument0));
}

///@description change_difficulty
///@arg value
function change_difficulty(){
/* Examples:
- Changing (global) Variables: health, difficulty, detection radius
- Including/discluding particulart AI abilities
*/

var type = menu_option[page];

	if(type == 0){ //ENEMIES
		switch(argument0){
			case 0:
				//easy
				global.enemy_health_multiplier = 1;
			break;
		
			case 1:
				//medium
				global.enemy_health_multiplier = 2;
			break;

			case 2:
				//hard
				global.enemy_health_multiplier = 3;
			break;
		}
	}

	else { //ALLIES?
		switch(argument0){
			case 0:
				//easy
			break;
		
			case 1:
				//medium
			break;

			case 2:
				//hard
			break;
		}
	}
}

///@description change_difficulty
///@arg value
function change_resolution(){ //   >:(
	switch(argument0){
		case 0: //320x240
			/*
			((Set in obj_game now))
			global.res = {
				xx: 0,
				yy: 0,
				width: 320,
				height: 240,
				scale: 1
			}
			*/
			global.res.scale = 1; //(320x240)
			
			global.view_width = global.res.width * global.res.scale;
			global.view_height = global.res.height * global.res.scale;

			window_set_size(global.view_width, global.view_height);
			surface_resize(application_surface, global.view_width, global.view_height);
			//display_set_gui_size(global.view_width, global.view_height);
			//camera_set_view_size(view_camera[0], global.view_width, global.view_height);
			//Center window
			var _display_width = display_get_width();
			var _display_height = display_get_height();

			window_set_position(
				_display_width 	/ 2 - global.view_width		/ 2,
				_display_height	/ 2 - global.view_height	/ 2
			);
		break;
		
		case 1: //640x480
			global.res.scale = 2; //(640x480)
			
			global.view_width = global.res.width * global.res.scale;
			global.view_height = global.res.height * global.res.scale;
			
			window_set_size(global.view_width, global.view_height);
			surface_resize(application_surface, global.view_width, global.view_height);
			//display_set_gui_size(global.view_width, global.view_height);
			//camera_set_view_size(view_camera[0], global.view_width, global.view_height);
			//Center window
			var _display_width = display_get_width();
			var _display_height = display_get_height();

			window_set_position(
				_display_width 	/ 2 - global.view_width		/ 2,
				_display_height	/ 2 - global.view_height	/ 2
			);
		break;
		
		case 2: //1280x960
			global.res.scale = 4; //(1280x960)
		
			global.view_width = global.res.width * global.res.scale;
			global.view_height = global.res.height * global.res.scale;

			window_set_size(global.view_width, global.view_height);
			surface_resize(application_surface, global.view_width, global.view_height);
			//display_set_gui_size(global.view_width, global.view_height);
			//camera_set_view_size(view_camera[0], global.view_width, global.view_height);
			//Center window
			var _display_width = display_get_width();
			var _display_height = display_get_height();

			window_set_position(
				_display_width 	/ 2 - global.view_width		/ 2,
				_display_height	/ 2 - global.view_height	/ 2
			);
		break;
	}
}

///@description change_window_mode
///@arg value
function change_window_mode(){

	switch(argument0){
		case 0: 
			window_set_fullscreen(true);
			global.is_fullscreen = true;
		break;
		case 1: 
			window_set_fullscreen(false);
			global.is_fullscreen = false;
		break;
	}
}