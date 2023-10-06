if (!global.ovwrd_menu) {	
exit;
}

//draw_set_font(global.font_main);

//// This return the res.scale
// var scale_factor = min(global.view_width / 320, global.view_height / 240);

//var gwidth = global.view_width; //640		-------------> Why is this NOT working??
//var gheight = global.view_height; //480	-------------> Why is this NOT working??
var gwidth = SCREEN_WIDTH; //320			-------------> Why is this working??
var gheight = SCREEN_HEIGHT; //240			-------------> Why is this working??

var ds_grid = menu_pages[page]; //the default page - main page
var ds_height = ds_grid_height(ds_grid);
var x_BUFFER = 8; //horizontal offset
var y_BUFFER = 16; //vertical offset

//the start_x and start_y variables are the starting x and y positions for drawing the text
//the "-1" is there so that the first element isn't affected by the buffer
var start_x = gwidth/2; 
var start_y = (gheight/2) - ((((ds_height-1)/2) * y_BUFFER));

//Draw Pause Menu "Back"
var c = c_black;
//draw_rectangle_color(0,0,gwidth, gheight,c, c, c, c, false);


//Draw Elements on the Left Side
draw_set_valign(fa_middle);
//draw_set_halign(fa_center);
draw_set_halign(fa_right);

//ltx stands for "left text x" and lty stands for "left text y"
var ltx = start_x - x_BUFFER;
var lty;
var xo; //x offset for when the option is selected

var yy = 0; repeat(ds_height){
	//lty is the amount
	lty = start_y + (yy*y_BUFFER);
	c = c_white;
	xo = 0;

	if(yy == menu_option[page]) {
		 scale = lerp(scale, 1.4, 0.15); // The selected option grows in scale
		 //scale[page] = round(lerp(scale[page], 1.4, 0.15));
		c = c_fuchsia;
		xo = -(x_BUFFER/2); // This makes it so that the selected option starts a bit more to the left compared to the other options		
	}
	else {
		scale = lerp(scale, 1, 0.15);
		//scale[page] = round(lerp(scale[page], 1, 0.15));
	}
	//the string is the y = 0 of the ds_grid
	draw_text_transformed_color(ltx+xo, lty, ds_grid[# 0, yy], scale, scale, 0, c, c, c, c, 1);
	//TO ACCOUNT FOR SCALING, COULD ALSO USE:
	//draw_text_transformed(x, y, text, scale_factor, scale_factor, 0);
	//OR
	//draw_text_transformed_colour(x, y, string, xscale, yscale, angle, c1, c2, c3, c4, alpha);
	//OR EVEN
	//draw_text_ext_transformed_colour(x, y, string, sep, w, xscale, yscale, angle, c1, c2, c3, c4, alpha);

	yy++;
}

//Draw Dividing Line
//draw_line(start_x, start_y, start_x, lty);
//adding the BUFFER to make the line align with the text in the top and bottom
draw_line(start_x, start_y - y_BUFFER, start_x, lty + y_BUFFER);


//Draw Elements on the Right Side
draw_set_halign(fa_left);

//rtx stands for "right text x" and rty stands for "right text y"
var rtx = start_x + x_BUFFER;
var rty;

yy = 0; repeat(ds_height){
	rty = start_y + (yy*y_BUFFER);
	
	switch(ds_grid[# 1, yy]){ 
		case menu_element_type.shift :
			var current_val		= ds_grid[# 3, yy];
			var current_array	= ds_grid[# 4, yy];
			var left_shift		= "<< ";
			var right_shift		= ">> ";
			c = c_white;
			
			if(current_val == 0) left_shift = ""; //empty string
			if (current_val == array_length(ds_grid[# 4, yy]) - 1) right_shift = "";
			
			//changing selected to yellow and then back to white
			if (inputting and yy == menu_option[page]){ c = c_yellow; }
			draw_text_color(rtx, rty, left_shift + current_array[current_val] + right_shift, c, c, c, c, 1);

		break;	
		
		case menu_element_type.slider :
			var len = 64;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			c = c_white;
			//drawing the slider line	
			draw_line_width(rtx, rty, rtx + len, rty, 2);
			//changing selected circle and text to yellow and then back to white
			if (inputting and yy == menu_option[page]){ c = c_yellow; }
			//drawing slider circle
			draw_circle_color(rtx + (current_val * len), rty, 4, c, c, false);
			//draw slider text
			draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos*100)) + "%", c, c, c, c, 1);
		break;
			
		case menu_element_type.toggle :
			c = c_white;
			var current_val = ds_grid[# 3, yy];
			var c1, c2;
			//changing selected circle and text to yellow and then back to white
			if (inputting and yy == menu_option[page]){ c = c_yellow; }

			if(current_val == 0) { c1 = c; c2 = c_dkgray; }
			else{ c1 = c_dkgray; c2 = c; }
			//rtx + 32 ---> offset
			draw_text_color(rtx, rty, "ON", c1, c1, c1, c1, 1);
			draw_text_color(rtx + 32, rty, "OFF", c2, c2, c2, c2, 1);
		break;
		
	case menu_element_type.input :
			var current_val = ds_grid[# 3, yy];
			var string_val;

			switch(current_val){
				case vk_up:		string_val = "UP KEY"; break;
				case vk_left:	string_val = "LEFT KEY"; break;
				case vk_right:	string_val = "RIGHT KEY"; break;
				case vk_down:	string_val = "DOWN KEY"; break;
				default:		string_val = chr(current_val); break; //chr returns a char's respective unicode code in string form
			}

			c = c_white;
			//changing selected circle and text to yellow and then back to white
			if (inputting and yy == menu_option[page]){ c = c_yellow; }
			draw_text_color(rtx, rty, string_val, c, c, c, c, 1);

		break;

	}
	
	yy++;
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);