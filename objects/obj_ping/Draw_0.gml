/// @description Insert description here
// You can write your code in this editor

if self.sized < 3
{
	draw_sprite_ext(spr_ping, 0, self.x, self.y, self.sized, self.sized, 0, $FFFFFF & $ffffff, 1);
}

if self.sized >= 3
{
	draw_sprite_ext(spr_ping, 0, self.x, self.y, self.sized, self.sized, 0, $FFFFFF & $ffffff, 4-self.sized);
}



