// Scripts run at the beginning of the game just like Create Events.

//List of Game Constants
// No matter the resolution, the screen's width and height will keep between 320 width and 240 height
#macro SCREEN_WIDTH 320
#macro SCREEN_HEIGHT 240
#macro GRID_SIZE 16
#macro TILE_WIDTH 16
#macro TILE_HEIGHT 16
#macro NUMBER_OF_DIRECTIONS 4
#macro FRAME_RATE 60

// Directions
#macro RIGHT 0
#macro UP 1
#macro LEFT 2
#macro DOWN 3

//---> Cardinal
#macro EAST 0
#macro NORTH 90
#macro WEST 180
#macro SOUTH 270

// Inventory
#macro INVENTORY_MAX_SIZE 20

// Color Palette
/* 
	For organization, it's recommended that 
	hex numbers for colors will be written using the "CSS colours" format
	So, RRGGBB format with the hash symbol (#) in the beginning
	If you want to add the alpha component, add "AA" at the beginning
	Like this: #AARRGGBB
	But you can also use the HEX indicator (0x) instead of (#) at the beginning too
	Like this: 0xAABBGGRR
	In fact, it's preferred to writed it this way, 
	because the numbers is displayed coloured in GitHub
*/
#macro RED			0xFF0000FF	// same as c_red
#macro GREEN		0xFF00FF00	// classic green from RGB, different than GM's c_green
#macro BLUE			0x00FF0000	// same as c_blue
#macro LIGHT_BLUE	#11CCFF		// light blue color 
#macro LIGHT_GREEN	0xAFFF50	// light green color
#macro CYAN			#00eaff		// cyan color

