/// @description DEBUG

draw_self();

//Collision Mask
if (global.debug) {
	draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, true);
}
