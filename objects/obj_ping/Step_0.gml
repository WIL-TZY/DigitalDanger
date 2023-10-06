/// @description Insert description here
// You can write your code in this editor

self.sized += self.size_increment;
self.image_xscale = self.sized;
self.image_yscale = self.sized;
if self.sized < 3
{
	image_alpha = 1;	
}

if self.sized >= 3
{
	image_alpha	= 4-self.sized;
}

if self.sized > 4
{
	instance_destroy();	
}

ping_collision();
