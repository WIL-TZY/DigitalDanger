function scr_anim_selection()
{
	is_anim_complete = self.image_index;
	if is_anim_complete >= 62 {
		self.image_speed=0;
		self.image_index=62;
	}
}

function scr_menu_keyboard() 
{
	standard_value = 1
	switch (room)
	{
		case rm_title:
		
		if obj_selection_keyboard.selection < 0
		{
			obj_selection_keyboard.selection = 1	
		}
		
		else if obj_selection_keyboard.selection > 2
		{
			obj_selection_keyboard.selection = 0	
		}
		
		if (global.PRESSED_DOWN)
		{
			obj_selection_keyboard.selection += standard_value
		}
		
		else if (global.PRESSED_UP)
		{
			obj_selection_keyboard.selection -= standard_value
		}
		
		with (obj_selection_keyboard)
		{	
			switch (selection)
			{	
				case 0:
					self.x = obj_selection_1_sp.x
					self.y = obj_selection_1_sp.y
					
					if (position_meeting(self.x,self.y,obj_selection_1_sp) and global.PRESSED_CONFIRM)
					{
					room_goto(rm_1);
					}
				
				break;
			
				case 1:
				//move to obj_2 position
					self.x = obj_selection_2_exit.x
					self.y = obj_selection_2_exit.y
					
					if (position_meeting(self.x,self.y,obj_selection_2_exit) and global.PRESSED_CONFIRM)
					{
					game_end();	
					}
					
				break;
				
				case 2:
					if (global.debug) {
					//move to obj_2 position
						self.x = obj_selection_3_testemini.x
						self.y = obj_selection_3_testemini.y
					
						if (position_meeting(self.x,self.y,obj_selection_3_testemini) and global.PRESSED_CONFIRM)
						{
						room_goto(rm_minigame);	
						}
					}
				break;
			}
		}
	}
}