// Check for collision (Tilemap Collision System)
function _player_collision() {
	var col = false;
  
	// ------------------ Horizontal Tiles ------------------ //
	
	// RIGHT
	if (sign(h_speed) == 1) {
		if (tilemap_get_at_pixel(collision_map, x + h_speed + offset_h, y)) {
			// Check collision
			x -= x mod TILE_SIZE;	
			
			// Adjust positioning to grid
			x += TILE_SIZE - 1 - offset_h;
			
			// Stop movement
			h_speed = 0;
			col = true;
		}
	}
		
	// LEFT
	if (sign(h_speed) == -1) {
		if (tilemap_get_at_pixel(collision_map, x + h_speed - offset_h, y)) {
			// Check collision
			x -= x mod TILE_SIZE;
			
			// Adjust positioning to grid
			x += offset_h;
			
			// Stop movement
			h_speed = 0;
			col = true;
		}
	}
	
	// Horizontal Move Commit
	x += h_speed;
	
	// ------------------ Vertical Tiles ------------------ //

	// DOWN
	if (sign(v_speed) == 1) {
	  if (tilemap_get_at_pixel(collision_map, x, y + v_speed + offset_v)) {
	    // Check collision
	    y -= y mod TILE_SIZE;

	    // Adjust positioning to grid
	    y += TILE_SIZE - 1 - offset_v;

	    // Stop movement
	    v_speed = 0;
	    col = true;
	  }
	}

	// UP
	if (sign(v_speed) == -1) {
	  if (tilemap_get_at_pixel(collision_map, x, y + v_speed)) {
	    // Check collision
	    y -= y mod TILE_SIZE;

	    // No need to adjust positioning to grid when colliding north

	    // Stop movement
	    v_speed = 0;
	    col = true;
	  }
	}

	// Vertical Move Commit
	y += v_speed;
	
	
	return col;
}