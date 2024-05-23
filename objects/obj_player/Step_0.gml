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

x += h_speed;
y += v_speed;
#endregion Movement

