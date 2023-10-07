if (timer >= time_till_appear) {

	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);

	draw_set_font(global.font_main);

	x1 = xx - (string_width(text) / 2);
	y1 = yy - (font_get_size(global.font_main) * 1.5);
	x2 = xx + (string_width(text) / 2);
	y2 = yy + (font_get_size(global.font_main)); 

	draw_set_color(c_black);

	draw_rectangle(x1, y1, x2, y2, false);

	draw_set_color(c_white);

	draw_text(xx, yy, text);

	// Reset alignment
	draw_set_halign(-1);
	draw_set_valign(-1);

}

/*
	// Como usar (pode chamar de qualquer lugar):
	if instance_exists(obj_announcement) instance_destroy(obj_announcement);

	announcement = instance_create_layer(0, 0, "Special", obj_announcement);
	announcement.text = "The spell fizzles out...";
*/