event_inherited();

states = {
	//structs inside structs use ":" instead of "="
	idle: {
		left:	spr_placeholder,
		right:	spr_placeholder,
		up:		spr_placeholder,
		down: 	spr_placeholder
	}, // <----- coma

	walk: {
		left:	spr_placeholder,
		right:	spr_placeholder,
		up:		spr_placeholder,
		down: 	spr_placeholder
	}
}

state = states.idle;