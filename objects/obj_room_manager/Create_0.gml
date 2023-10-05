/// @description room management & camera

#region COLLISION SETUP

//getting the layer name "Collision"
layer_id = layer_get_id("Collision");
col_tilemap = layer_tilemap_get_id(layer_id);

#endregion COLLISION SETUP

#region MP Grid

var _grid_width = to_tile(room_width);
var _grid_height = to_tile(room_height);
//Create 20x20 MP Grid
global.AI_grid = mp_grid_create(0, 0, _grid_width, _grid_height, TILE_WIDTH, TILE_HEIGHT);

//Can register objects into the grid, like for example obj_collision
//mp_grid_add_instances(global.AI_grid, obj_collision, false); //false for precise collision because we're doing rectangular/tile collisions
//mp_grid_add_instances(global.AI_grid, obj_character_parent, false);
//Telling the grid where are the collidable tiles by looping through each tile inside the tilemap
for (var _x = 0; _x < _grid_width; _x++) {
	for (var _y = 0; _y < _grid_height; _y++) {
		//checks every obstacle inside the tilemap for the "Collision" layer in current room
		var _col = tilemap_get(col_tilemap, _x, _y);
		//registering tile obstacle in the MP Grid
		if (_col) mp_grid_add_cell(global.AI_grid, _x, _y);
	}
}

#endregion MP Grid