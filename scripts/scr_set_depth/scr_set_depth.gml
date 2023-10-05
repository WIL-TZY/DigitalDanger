function SetDepth(yy){
	depth_id = 10000*(y+yy)+10000-x;
}

// The yy argument can be used to offset the center point of depth sorting in the object sprite
// relative to the sprite origin of the instance

// The depth_id number is basically the "numbered pixel in the room", counting right to left, then row per row.
// This gives the instance a depth priority, with single-pixel precision.
// The depth sorter object (obj_draw_master) will sort these instances left to right, then top to bottom.
// Currently maximum dimension for rooms is: 9999x9999

 