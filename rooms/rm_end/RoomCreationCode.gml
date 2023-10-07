// Little Background Animation using 2px/2px sprite
var bg = layer_background_get_id("Background");
//layer_background_xscale(bg, 64);
//layer_background_yscale(bg, 64);
//layer_background_stretch(bg,false);
layer_background_speed(bg,0);
layer_vspeed("Background", -0.2);
