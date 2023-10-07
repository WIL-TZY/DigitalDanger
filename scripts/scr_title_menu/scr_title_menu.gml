function Ball(_x,_y) constructor

{
	xx = _x;
	yy = _y;
	
	range = [ 2, 6];
	size = 0;
	time = random(100);
	
	function Update()
	{ 
		var _dist = 32 - (point_distance(xx, yy, mouse_x , mouse_y) / 1024);
		var _dir = point_direction(xx, yy, mouse_x, mouse_y);
		
		x = xx - lengthdir_x(_dist, _dir);
		y = yy - lengthdir_y(_dist, _dir);
		
		size = range[0] + (((sin(time++ / 10) + 1) / 2) * range[1]);
	}
	function Draw()
	{
		draw_set_colour(
			merge_colour(c_blue, c_red, clamp(point_distance(xx, yy, mouse_x, mouse_y) / 512, 0, 1)));
		draw_circle(x, y, size, false);
	}
}