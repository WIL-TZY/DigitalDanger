// Check for collision (Tilemap Collision System)
function _player_collision() {
	var col = false;
	
	// Horizontal Tiles
	if (tilemap_get_at_pixel(collision_map, x + h_speed, y)) {
		// Left tile
		x -= x mod TILE_SIZE;	
		
		// Right tile
		if (sign(h_speed) == 1) x += TILE_SIZE - 1;
		
		// Stop movement
		h_speed = 0;
		col = true;
	}
	
	// Horizontal Move Commit
	x += h_speed;
	
	// Vertical Tiles
	if (tilemap_get_at_pixel(collision_map, x, y + v_speed)) {
		// Top tile
		y -= y mod TILE_SIZE;	
		
		// Bottom tile
		if (sign(v_speed) == 1) y += TILE_SIZE - 1;
		
		// Stop movement
		v_speed = 0;
		col = true;
	}
	
	// Vertical Move Commit
	y += v_speed;
	
	
	return col;
}