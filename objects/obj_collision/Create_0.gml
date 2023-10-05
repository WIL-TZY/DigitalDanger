SetDepth(0); // For non-moving objects, required only in the Create Event
// this function's argument gives an offset for positioning the object
// by using 0, it uses it's origin point as the y
// This is great to position sprites that need to appear on top of others
// but that are too small, so their y isn't lower than the y of other objects


//depth = room_height - y; 