/// @description Destroys itself
if (global.flag[11] = true) {		
	instance_destroy();
}

if (instance_exists(global.temp)) {
	instance_destroy(global.temp);	
}
