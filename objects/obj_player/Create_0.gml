// Inherit the parent event
//event_inherited();

// Variable definitions
// move_direction = 270;
// sprite_offset = 8;

#region Collision
collision_map = layer_tilemap_get_id(layer_get_id("Collision"));
// Offsets
offset_h = sprite_get_width(sprite_index) - sprite_get_xoffset(sprite_index);
offset_v = sprite_get_height(sprite_index) - sprite_get_yoffset(sprite_index);
// Width of the bounding box
bounding_box_h = bbox_right + 1 - bbox_left; 
// Height of the bounding box
bounding_box_v = bbox_bottom + 1 - bbox_top; 
#endregion Collision

visible = true;

// Disables automatic animation
image_speed = 0;
h_speed = 0;
v_speed = 0;
speed_walk = 1.5;

npc_inst = noone;
sprite_idle = spr_player_idle;
sprite_walk = spr_player_walk;
animation_end = false;
current_subimage = 0;

// Depth Sorting
SetDepth(0); // Determines DepthID of each instance