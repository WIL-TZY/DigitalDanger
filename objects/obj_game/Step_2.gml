// Fullscreen
if keyboard_check_released(vk_escape){
	window_set_fullscreen(!window_get_fullscreen());
	window_center();
}
//alarm[0] = 1; //calling window_center() function in alarm0
