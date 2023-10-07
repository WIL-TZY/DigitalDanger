/// @description Insert description here
// You can write your code in this editor

if self.hit = false and self.corrupt_node = false
{
	obj_minigame.threat += 10;
	self.hit = true;
}

if self.hit = false and self.corrupt_node = true and instance_exists(obj_ping)
{
	obj_minigame.threat += 25;
	self.hit = true;	
}

