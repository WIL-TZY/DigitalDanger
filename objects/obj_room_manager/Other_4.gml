/// @description Layers
// This event runs once, when any room starts

// Create textbox layer
layer_create(-9999, "textbox");

// Check current room name 
global.rm_current = room_get_name(room);
