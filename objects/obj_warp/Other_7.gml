room_goto(target_rm);
//immediately sends the player's coordinate based on the room it's places
obj_player.x = target_x; 
obj_player.y = target_y;
obj_player.move_dir = target_face;

image_speed = -1; //putting a "-" before it makes the animation play backwards
