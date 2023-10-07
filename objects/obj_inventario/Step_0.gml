/// @description Insert description here
// You can write your code in this editor


if (!global.pause && !instance_exists(obj_warp)) {
	// Abrir o inventario 
	if (room != rm_title) {
		if (global.PRESSED_START) {
			inventario = !inventario;
		}
	}
}

