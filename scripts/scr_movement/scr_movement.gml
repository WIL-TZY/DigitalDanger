function movePlayer()
{
	disabled = false;
	oPlayer.image_speed = 1;
}

function lockPlayer() //movement locked
{
	disabled = true;
	oPlayer.image_speed = 0;
	//target_x = x;
	//target_y = y;
}

/*
function isMoving()
{
	if target_x != x or target_y != y return true
}
*/

// Fixing annoying bug

function fix_placement() {
	with (obj_character_parent) {
	
	var _tx = to_tile(x);
	var _ty = to_tile(y);
	x = to_room(_tx + 0.5);
	y = to_room(_ty + 0.5);
	
	}
	
}