/// @description Insert description here
// You can write your code in this editor

camx = camera_get_view_x(view_camera[0]);
camy = camera_get_view_y(view_camera[0]);

draw_text(camx+240,camy+5,string(dt_value div 60) + ":" + string(dt_value mod 60));
draw_text(camx+210,camy+25,string("Threat") + ":" + string(threat));

if self.attempts = 2
{
	draw_sprite(spr_attempts,1,240,192);
	draw_sprite(spr_attempts,1,272,192);
}

if self.attempts = 1
{
	draw_sprite(spr_attempts,0,240,192);
	draw_sprite(spr_attempts,1,272,192);
}

if self.attempts = 0
{
	draw_sprite(spr_attempts,0,240,192);
	draw_sprite(spr_attempts,0,272,192);
}