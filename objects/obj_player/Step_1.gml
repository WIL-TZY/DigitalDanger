/// @description Input

// Inherit the parent event
event_inherited();

// Calculating input for the player based on Key Input
// NPCs calculate input through pathfinding
if (is_player = true) {
	input_x = (global.HELD_RIGHT) - (global.HELD_LEFT); 
	input_y = (global.HELD_DOWN) - (global.HELD_UP);
}

#region Direction

if move_direction = 0 {
	facing = RIGHT;
}
else if move_direction = 90 {
	facing = UP;
}
else if move_direction = 180 {
	facing = LEFT;
}
else if move_direction = 270 {
	facing = DOWN;
}

#endregion Direction


#region SET INTERACTION X/Y

if	facing == LEFT{
	square_width	= 20;
	square_height	= 15; 
	int_x1 = x - GRID_SIZE;
	int_x2 = x - GRID_SIZE + square_width;
	int_y1 = y + 2;
	int_y2 = (y - 3) + square_height;
	
	//intX = x - GRID_SIZE;
	//intY = y;
}

if	facing == RIGHT{
	square_width	= 20;
	square_height	= 15; 
	int_x1 = x;
	int_x2 = x + square_width;
	int_y1 = y + 2;
	int_y2 = (y - 3) + square_height;
	
	//intX = x + GRID_SIZE;
	//intY = y;
}

offset = 7;

if	facing == UP{
	square_width	= 14;
	square_height	= 19; 
	int_x1 = x - offset;
	int_x2 = x + square_width - offset;
	int_y1 = (y - 6) - GRID_SIZE / 2;
	int_y2 = (y - 6) - GRID_SIZE / 2 + square_height;
	
	//intX = x;
	//intY = y - GRID_SIZE / 2;
}

if	facing == DOWN{
	square_width	= 14;
	square_height	= 19; 
	int_x1 = x - offset;
	int_x2 = x + square_width - offset;
	int_y1 = (y - 6) + GRID_SIZE / 2;
	int_y2 = (y - 6) + GRID_SIZE / 2 + square_height;
	
	//intX = x;
	//intY = y + GRID_SIZE / 2;
}

#endregion SET INTERACTION X/Y