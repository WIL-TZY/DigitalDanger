function scr_set_defaults_for_text() { // NO ARGUMENTS NEEDED HERE
	line_break_pos[0, page_number] = 999; // it's going to store where in your big page of text, what positions should the text move on to next line instead of keep drawing one way.
	line_break_num[page_number] = 0; // keeps track of the number of line breaks that your textbox has.
	line_break_offset[page_number] = 0; // the width in pixels that you need to reset each individual char's x position. Necessary to know how long it is to make the line break.

	// variables for every letter/character
	for (var c = 0; c < 500; c++)
		{
		col_1[c, page_number] = c_white;
		col_2[c, page_number] = c_white;
		col_3[c, page_number] = c_white;
		col_4[c, page_number] = c_white;

		float_text[c, page_number] = 0; // " 0 " also means "false". Just as " 1 " also means "true".
		float_dir[c, page_number] = c*20; // "20" represents the degrees. You can change it to 40 or 60+ to make the letters move at different pacings.
		// it means that the 1st letter will start at 0º, 2nd at 20º, 3rd at 40º and 4th 60º degrees.
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4); // to only shake every 4 frames.
		}

	txtb_spr[page_number] = spr_textbox; // this defaults the default textbox sprite for all textboxes with noone.
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	snd[page_number] = snd_sfx_test;
	}


//----------------------------------- Text VFX ----------------------------------//
/// @param 1st_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4){
//---------------------- order: top left, top right, bottom right, bottom left colors.

for (var c = _start; c <= _end; c++)
	{
	col_1[c, page_number-1] = _col1;
	col_2[c, page_number-1] = _col2;
	col_3[c, page_number-1] = _col3;
	col_4[c, page_number-1] = _col4;
	}

}

/// @param 1st_char
/// @param last_char
function scr_text_float(_start, _end){

	for (var c = _start; c <= _end; c++)
		{
		float_text[c, page_number-1] = true;
		}

}

/// @param 1st_char
/// @param last_char
function scr_text_shake(_start, _end){

	for (var c = _start; c <= _end; c++)
		{
		shake_text[c, page_number-1] = true;
		}

}

//---------------------------------- END OF VFX ------------------------------------------//


/// @param text
/// @param [character]
/// @param [side]
function scr_text(_text){
// now for every single page that you have with this function, it will set all the correct defaults with this variable.
	scr_set_defaults_for_text(); // DEFAULTS SHOULD ALWAYS BE AT THE TOP.

	text[page_number] = _text;

	// get character info
	if argument_count > 1 {
		switch (argument[1])
			{
		
		// blue kid
			case "player":
				speaker_sprite[page_number] = spr_player_spk; // the specific character portrait.
				txtb_spr[page_number] = spr_textbox;     // the specific textbox.
				snd[page_number] = snd_sfx_test;
				break;
			case "player-emote":
			speaker_sprite[page_number] = spr_player_spk; // the specific character portrait.
			txtb_spr[page_number] = spr_textbox;           // the specific textbox.
			snd[page_number] = snd_sfx_test;
			break;
			}
		}

	// side the character is on.
if argument_count > 2 {
	speaker_side[page_number] = argument[2];
	}

	page_number++;

}





/// @param option
/// @param link_id
function scr_option(_option, _link_id) {

	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;

}


/// @param text_id
function create_textbox(_text_id) {
	// Pause player movement
	global.pause = true;
	
	var textbox_inst = instance_create_layer(0, 0, "textbox", obj_textbox);
	with (textbox_inst) {
			scr_game_text(_text_id);
		}
		return textbox_inst;
}


/*
function close_dialog_box(_textbox_inst) { //-----------> Call this instead of just instance_destroy()
	instance_destroy(_textbox_inst);
	
	// Resume world
	global.pause = false;
	
	// Clear confirm key input
	//global.PRESSED_CONFIRM = false;
}
/*
