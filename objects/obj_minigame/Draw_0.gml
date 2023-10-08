/// @description Insert description here
// You can write your code in this editor

camx = camera_get_view_x(view_camera[0]);
camy = camera_get_view_y(view_camera[0]);

draw_text(camx+240,camy+5,string(dt_value div 60) + ":" + string(dt_value mod 60));
draw_text(camx+210,camy+25,string("Threat") + ":" + string(threat));

