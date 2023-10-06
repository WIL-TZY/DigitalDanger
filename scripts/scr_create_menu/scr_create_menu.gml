///@description scr_create_menu_page
///@arg ["name1", type1, entries1...]
///@arg ["name2", type2, entries2...]
function scr_create_menu_page(){
	//argument_count is a read-only variable normally used in conjunction with 
	//an argument array (argument[0...15]) to permit varying input arguments for a given function

	var arg, i = 0;
	repeat(argument_count){ //could be a for loop
		arg[i] = argument[i]; //because each argument is an array of its own
		i++; //loop through all arrays and give them an index
	}

	//height of the grid = y. i = y
	//width will be an arbitraty number of "5" (the maximum of x options in a row in this menu)

	var ds_grid_id = ds_grid_create(5, argument_count);
	//filling the grid with the values from each argument
	i = 0; repeat(argument_count){
		var array = arg[i]; //getting the right 1d array from each arg. Ex: resume, or audio, etc	
		var array_len = array_length(array); //to know how much data each array holds
	//the x axis/widtht is what we'll be looping through to fill each grid cell

		var xx = 0; repeat(array_len){
			ds_grid_id[# xx, i] = array[xx];
			xx++;
			//Example of what will happen:
			//ds_grid_id[ 0, 0 ] = array[0]; -> x 0
			//ds_grid_id[ 1, 0 ] = array[1]; -> x 1
			//ds_grid_id[ 2, 0 ] = array[1]; -> x 2
			//ds_grid_id[ 3, 0 ] = array[1]; -> x 3 (if there's one)
			//ds_grid_id[ 4, 0 ] = array[1]; -> x 4 (if there's one)

		}	
		i++;
			//Example of what will happen:
			//ds_grid_id[ 0, 0 ] = array[0]; -> arg/y 0
			//ds_grid_id[ 0, 1 ] = array[1]; -> arg/y 1
			//ds_grid_id[ 0, 2 ] = array[1]; -> arg/y 2
			//ds_grid_id[ 0, 3 ] = array[1]; -> arg/y 3 (if there's one)
			//ds_grid_id[ 0, 4 ] = array[1]; -> arg/y 4 (if there's one)
		
			//This way, every cell inside the grid will be filled with the appropriate data
	}

	return ds_grid_id;

}