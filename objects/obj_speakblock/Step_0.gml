if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left) && !instance_exists(obj_dialog_box)
	{
		textbox_inst = create_dialog_box(text_id);
	}
	