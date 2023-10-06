/// @description Insert description here
// You can write your code in this editor



if self.marked = true
{
	image_blend = make_color_hsv(85,255,255);
}

if self.marked = false and self.corrupt_node = false
{
	image_blend = make_color_hsv(255,0,255);	
}

if self.hit = true and self.corrupt_node = true and marked = true
{
	self.image_speed = 1
	obj_minigame.timer_cond = false;
}

if self.marked = true and self.hit = false and self.corrupt_node = false
{
	self.marked = false;	
}