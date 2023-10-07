
// DEBUG
if (keyboard_check_pressed(ord("Q"))) {
	global.debug = !global.debug;	
}

/*
// Pausing the world when textbox is active
if (instance_exists(obj_dialog_box)) {
	global.pause = true;
} // global.pause is set to false when the textbox instance is destroyed (obj_dialog_box)
*/

#region CALLING (OVERWORLD) MENU

/*
	Note:
	I should probably make a script for making it easier to call this entire condition: 
	(!oPlayer.moving) && (!instance_exists(obj_dialog_box)) && !instance_exists(obj_battle)
	Maybe even make the oPlayer.moving variable a global one
*/

// If pressed C and player has finished movement
if (instance_exists(obj_player)) {
	if ( (global.PRESSED_START) && (obj_player.moving == false) ) { // && (!instance_exists(obj_dialog_box))
		global.ovwrd_menu = true;
	
		if (!instance_exists(obj_overworld_menu)) {
			overworld_menu_instance = instance_create_depth(x, y, -900, obj_overworld_menu);
		}
	
		if instance_exists(obj_overworld_menu){
			global.pause = true;
		}	
	}
}

#endregion (OVERWORLD) MENU


#region INPUT

	#region HELD

	if (global.HELD_UP || global.HELD_DOWN || global.HELD_LEFT || global.HELD_RIGHT) {
		global.HELD = true;
	} else {
		global.HELD = false;
	}

	if	(gamepad_button_check(0, gp_padu)) ||
		(keyboard_check(vk_up)) ||
		(keyboard_check(ord("W"))){

		global.HELD_UP = true;
	}else{
		global.HELD_UP = false;
	}

	if	(gamepad_button_check(0, gp_padd)) ||
		(keyboard_check(vk_down)) ||
		(keyboard_check(ord("S"))){

		global.HELD_DOWN = true;
	}else{
		global.HELD_DOWN = false;
	}

	if	(gamepad_button_check(0, gp_padl)) ||
		(keyboard_check(vk_left)) ||
		(keyboard_check(ord("A"))){

		global.HELD_LEFT = true;
	}else{
		global.HELD_LEFT = false;
	}

	if	(gamepad_button_check(0, gp_padr)) ||
		(keyboard_check(vk_right)) ||
		(keyboard_check(ord("D"))){

		global.HELD_RIGHT = true;
	}else{
		global.HELD_RIGHT = false;
	}

	#endregion

	#region RELEASED

	if	(gamepad_button_check_released(0, gp_padu)) ||
		(keyboard_check_released(vk_up)) ||
		(keyboard_check_released(ord("W"))){

		global.RELEASED_UP = true;
	}else{ 
		global.RELEASED_UP = false;
	}

	if	(gamepad_button_check_released(0, gp_padd)) ||
		(keyboard_check_released(vk_down)) ||
		(keyboard_check_released(ord("S"))){

		global.RELEASED_DOWN = true;
	}else{
		global.RELEASED_DOWN = false;
	}

	if	(gamepad_button_check_released(0, gp_padl)) ||
		(keyboard_check_released(vk_left)) ||
		(keyboard_check_released(ord("A"))){

		global.RELEASED_LEFT = true;
	}else{
		global.RELEASED_LEFT = false;
	}

	if (gamepad_button_check_released(0, gp_padr)) ||
		(keyboard_check_released(vk_right)) ||
		(keyboard_check_released(ord("D"))){

		global.RELEASED_RIGHT = true;
	}else{
		global.RELEASED_RIGHT = false;
	}

	#endregion

	#region PRESSED

	if	(gamepad_button_check_pressed(0, gp_padu)) ||
		(keyboard_check_pressed(vk_up)) ||
		(keyboard_check_pressed(ord("W"))){

		global.PRESSED_UP = true;
	}else{ 
		global.PRESSED_UP = false;
	}

	if	(gamepad_button_check_pressed(0, gp_padd)) ||
		(keyboard_check_pressed(vk_down)) ||
		(keyboard_check_pressed(ord("S"))){

		global.PRESSED_DOWN = true;
	}else{
		global.PRESSED_DOWN = false;
	}

	if	(gamepad_button_check_pressed(0, gp_padl)) ||
		(keyboard_check_pressed(vk_left)) ||
		(keyboard_check_pressed(ord("A"))){

		global.PRESSED_LEFT = true;
	}else{
		global.PRESSED_LEFT = false;
	}

	if (gamepad_button_check_pressed(0, gp_padr)) ||
		(keyboard_check_pressed(vk_right)) ||
		(keyboard_check_pressed(ord("D"))){

		global.PRESSED_RIGHT = true;
	}else{
		global.PRESSED_RIGHT = false;
	}

	#endregion

	#region OK

	if	(keyboard_check_pressed(ord("Z"))) ||
		(gamepad_button_check_pressed(0, gp_face1)){
			global.PRESSED_CONFIRM = true;
	}else{
		global.PRESSED_CONFIRM = false;
	}


	//released
	if	(keyboard_check_released(ord("Z"))) ||
		(mouse_check_button_released(mb_left)) ||
		(gamepad_button_check_released(0, gp_face1)){
			global.RELEASED_CONFIRM = true;
	}else{
		global.RELEASED_CONFIRM = false;
	}

	#endregion

	#region CANCEL

	//pressed
	if	(keyboard_check_pressed(vk_backspace)) ||
		(keyboard_check_pressed(ord("X"))) ||
		(mouse_check_button_pressed(mb_right)) ||
		(gamepad_button_check_pressed(0, gp_face2))||
		(gamepad_button_check_pressed(0, gp_face3)){
			global.PRESSED_CANCEL = true;
	}else{
		global.PRESSED_CANCEL = false;
	}

	//released
	if	(keyboard_check_released(vk_backspace)) ||
		(keyboard_check_released(ord("X"))) ||
		(mouse_check_button_released(mb_right)) ||
		(gamepad_button_check_released(0, gp_face2)) ||
		(gamepad_button_check_released(0, gp_face3)) {
			global.RELEASED_CANCEL = true;
	}else{
		global.RELEASED_CANCEL = false;
	}

	#endregion

	#region START
	//pressed
	if	(keyboard_check_pressed(vk_enter)) ||
		(keyboard_check_pressed(ord("C"))) ||
		(gamepad_button_check_pressed(0, gp_start)) {
			global.PRESSED_START = true;
	}else{
		global.PRESSED_START = false;
	}

	//released
	if	(keyboard_check_released(vk_enter)) ||
		(keyboard_check_released(ord("C"))) ||
		(gamepad_button_check_pressed(0, gp_start)) {
			global.RELEASED_START = true;
	}else{
		global.RELEASED_START = false;
	}

	#endregion START

	#region SELECT
	//pressed
	if	(keyboard_check_pressed(vk_shift)) ||
		(keyboard_check_pressed(ord("V"))) {
			global.PRESSED_SELECT = true;
	}else{
		global.PRESSED_SELECT = false;
	}

	//released
	if	(keyboard_check_released(vk_shift)) ||
		(keyboard_check_released(ord("V"))) {
			global.RELEASED_SELECT = true;
	}else{
		global.RELEASED_SELECT = false;
	}
	#endregion SELECT

#endregion INPUT


/*
#region CLEANING UP DIALOGUE SEQUENCES
if (!instance_exists(obj_dialog_box)) {
	// Cleaning up sequence after all instances of obj_dialog_box are destroyed
	for (var i = 0; i < array_length(global.textbox_sequence); i++) {
		var seq = global.textbox_sequence[i];
		// Deleting all sequences in the array
		layer_sequence_destroy(seq);
		// Cleaning up the array
		array_delete(global.textbox_sequence, 0, i + 1);
	}
}
#endregion CLEANING UP DIALOGUE SEQUENCES
*/
