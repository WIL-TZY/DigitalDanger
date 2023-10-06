// Inherit the parent event
event_inherited();

// Depth Sorting
SetDepth(0);

states = {
	//structs inside structs use ":" instead of "="
	idle: {
		left:	spr_npc_idle_down,
		right:	spr_npc_idle_down,
		up:		spr_npc_idle_down,
		down: 	spr_npc_idle_down
	},

	walk: {
		left:	spr_npc_idle_down,
		right:	spr_npc_idle_down,
		up:		spr_npc_idle_down,
		down: 	spr_npc_idle_down
	}
}

state = states.idle;

interacted = false;