if (global.debug) {
		if (npc_inst != noone) {
		
				var start_x = npc_inst.x - GRID_SIZE/2;
				var end_x = start_x + GRID_SIZE;
				var start_y = npc_inst.y + GRID_SIZE/2;
				var end_y = start_y - GRID_SIZE;
	
	
			draw_set_color(c_purple);
			draw_circle(npc_inst.x, npc_inst.y, 4, true);
			draw_rectangle(start_x, start_y, end_x, end_y, true);
			draw_set_color(c_white);
		}
}