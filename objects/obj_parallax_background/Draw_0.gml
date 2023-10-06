var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _p = 1; //the parallax value, can be multyplied. Ex: 0 (stationary), 0.5, 1.5... 

draw_sprite_tiled(spr_bg_city, 0, _camx*_p, _camy*_p);

//draw_sprite_tiled(bg_forest, 1, _camx*0.25, _camy*0.25);
