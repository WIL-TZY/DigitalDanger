if (global.debug) {
		if (npc_inst != noone) {
		
				var start_x = npc_inst.x - TILE_SIZE/2;
				var end_x = start_x + TILE_SIZE;
				var start_y = npc_inst.y + TILE_SIZE/2;
				var end_y = start_y - TILE_SIZE;
	
	
			draw_set_color(c_purple);
			draw_circle(npc_inst.x, npc_inst.y, 4, true);
			draw_rectangle(start_x, start_y, end_x, end_y, true);
			draw_set_color(c_white);
		}
}