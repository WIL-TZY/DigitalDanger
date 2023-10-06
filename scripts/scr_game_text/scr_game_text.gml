/// @param text_id
function scr_game_text(_text_id){
switch(_text_id) {
	
		
		
//------------------------------------ CONVERSATION 1 ----------------------------------------//
		case "npc 1":
		scr_text("You hear a passing conversation...");
			scr_text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "player");
			scr_text_float(4, 17);
			//scr_text_shake(4, 17);
			scr_text_color(8, 15, c_aqua, c_aqua, c_aqua, c_aqua); // scr_text_color(28, 35, c_purple,  c_purple,  c_white,  c_blue);
			//just to show you can use more than one function to change colorfor the same line.
			scr_text("Lorem ipsum dolor...", "player", -1);
			scr_text("Lorem ipsum dolor?", "player");
			scr_text_color(12, 22, c_yellow,  c_yellow,  c_white,  c_white);
			scr_text("Lorem ipsum dolor... Lorem ipsum?", "player", -1);
				scr_option("Yeah!", "npc 1 - yes");
				scr_option("Nah", "npc 1 - no");
			break;
			case "npc 1 - yes":
				scr_text("OF COURSE!!!", "player");
				break;
			case "npc 1 - no":
				scr_text("I-I... No, I don't...", "player");
				break;
				
				
				
//------------------------------------ CONVERSATION 1 ----------------------------------------//
		case "door":
			scr_text("I guess that's a door.");
			scr_text("Llalalalala");
			scr_text("Llalalalala");
			scr_text("Llalalalala");
			break;
			
			
			
//------------------------------------ CONVERSATION 3 ----------------------------------------//

			

			
			
//--------------------------------------------------------------------------------------------//
		}
}