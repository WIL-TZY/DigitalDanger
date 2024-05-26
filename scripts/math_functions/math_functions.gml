//this function converts room coordinates to tile coordinates
function to_tile(val){
	//div makes sure the resulting value is an integer
	return (val div TILE_SIZE);
}


//this function converts tile coordinates to room coordinates
//val must be a tile coordinate
function to_room(val){
	return (val * TILE_SIZE);
}