draw_self();

draw_set_font(font_game);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x + 0, y + 0, string(selection_text) + "");

draw_set_halign(fa_left);
draw_set_valign(fa_top);