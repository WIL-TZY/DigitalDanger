//parameters are tile coordinates x and y
function collision(tile_x, tile_y){
	//Check Tile Collision
	var _tilemap = obj_room_manager.col_tilemap;

	if (tilemap_get(_tilemap, tile_x, tile_y)) return true;	//tile was found, chara cannot move

	//Check Objects Collision
	var _room_x = to_room(tile_x + 0.5);
	var _room_y = to_room(tile_y + 0.5);

	//if mask_index is set to -1 it means the collision mask for that instance is deactivated
	if (position_meeting(_room_x, _room_y, obj_collision) and (!mask_index == -1)) {
		
		return true;
	}
	
	//Check NPCs Collision
	if (instance_position(_room_x, _room_y, obj_character_parent)) return true;
	
	//No Collision
	return false; //tile not found, chara can move

}