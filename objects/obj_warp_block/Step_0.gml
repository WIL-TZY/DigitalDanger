if place_meeting(x, y, obj_player) && !instance_exists(obj_warp)
	{
	var inst = instance_create_depth(0, 0, -9999, obj_warp);
	inst.target_x = target_x;
	inst.target_y = target_y;
	inst.target_rm = target_rm;
	inst.target_face = target_face;
	}
// can store a new instance created in a local variable like this to call it elsewhere.
//The 'id' is a read-only variable that holds the unique identifying number for the instance.
//Every instance that is created is given a number that is used internally to identify the instance and this variable is what you can use to reference it".
//This way, you're storing the id of this new instance in your obj_warp in your local variable "inst".
