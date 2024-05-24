// Inherit the parent event
event_inherited();

// Variable definitions
// move_direction = 270;
// sprite_offset = 8;

visible = true;

// Disables automatic animation
image_speed = 0;
h_speed = 0;
v_speed = 0;
speed_walk = 2.0;

npc_inst = noone;
sprite_idle = spr_player_idle;
sprite_walk = spr_player_walk;
animation_end = false;
current_subimage = 0;

// Depth Sorting
SetDepth(0); // Determines DepthID of each instance