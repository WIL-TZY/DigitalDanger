/// @description Movement

// Assign variables to controls
key_left = global.HELD_LEFT;
key_right = global.HELD_RIGHT;
key_up = global.HELD_UP;
key_down = global.HELD_DOWN;
key_confirm = global.PRESSED_CONFIRM;
// key_item = global.PRESSED_START;
key_attack = global.PRESSED_SELECT;

#region Get Player Input
// Get the angle between two coordinates
input_direction = point_direction(0, 0, key_right-key_left, key_down-key_up);

// Shouldn't press both horizontal keys simultaneously nor both vertical keys simultaneously
input_magnitude = (key_right - key_left != 0) || (key_down - key_up != 0);

#endregion Get Player Input

#region Movement
h_speed = lengthdir_x(input_magnitude * speed_walk, input_direction);
v_speed = lengthdir_y(input_magnitude * speed_walk, input_direction);


// Check for collision before moving
_player_collision();

// Moving
/*
if (!col) {
	x += h_speed;
	y += v_speed;
} 
*/

#endregion Movement

#region Animation

// Update Sprite Index
var old_sprite = sprite_index;
if (input_magnitude != 0) {
	direction = input_direction; // direction is useful because it wraps around its angles 
	sprite_index = sprite_walk;
}
else sprite_index = sprite_idle;
if (old_sprite != sprite_index) current_subimage = 0; // Reset sprite

#region Update Image Index (could be a script)
// Logic for converting degrees (0-360) into a number (0-3)
var cardinal_direction = round(direction/90); // For 8 directions use: round(direction/45)
// show_debug_message("Cardinal Direction:" + string(cardinal_direction));
var total_frames = sprite_get_number(sprite_index) / NUMBER_OF_DIRECTIONS;
// show_debug_message("Total Frames:" + string(total_frames));
image_index = current_subimage + (cardinal_direction * total_frames);
// show_debug_message("Local Frame::" + string(current_subimage));

// Incremend my image speed
var sprite_speed = sprite_get_speed(sprite_index);
current_subimage += sprite_speed / FRAME_RATE;

// If animation would loop on next game step
if (current_subimage >= total_frames) {
		animation_end = true;
		// (Loop animation) Go back to the beginning
		current_subimage -= total_frames;
}
else animation_end = false;

#endregion Update Image Index

#endregion Animation
