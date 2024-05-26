/// @description DEBUG

draw_text(10, 10, "h_speed: " + string(h_speed));
draw_text(10, 20, "v_speed: " + string(v_speed));
draw_text(10, 30, 
	"Sprite Offset Horizontal:" + 
	string(sprite_get_width(spr_player_idle) - sprite_get_xoffset(spr_player_idle)));
	