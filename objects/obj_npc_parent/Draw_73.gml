/// @description Drawing speech bubble icon

// Using Draw End Event so the icon draws above everything else
var _width_offset  = sprite_width / 2;
var _height_offset = sprite_height / 2 + round(GRID_SIZE/4);

if (	(show_speech_bubble) && (has_speech_bubble)		) {
	draw_sprite(spr_speech_bubble, 0, x + _width_offset, y - _height_offset);
	show_speech_bubble = false;
}
