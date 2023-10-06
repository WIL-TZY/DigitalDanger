/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_control) and obj_minigame.markers > 0 and self.marked = false and self.hit = true
{
	obj_minigame.markers -= 1;
	self.marked = true;	
}

else if keyboard_check_pressed(vk_control) and self.marked = true and self.hit = true
{
	obj_minigame.markers += 1;
	self.marked = false;	
}


//if keyboard_check_pressed(vk_control) and self.marked = true
//{
//	obj_minigame.markers += 1;
//	self.marked = false;
//}
