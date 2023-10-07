/// @param text_id
function scr_game_text(_text_id){
switch(_text_id) {
	
		//scr_text_float(4, 17);
		//scr_text_shake(4, 17);
		//just to show you can use more than one function to change colorfor the same line.
		//scr_text_color(12, 22, c_yellow,  c_yellow,  c_white,  c_white);
		
//------------------------------------ CONVERSATION 1 ----------------------------------------//
		case "npc1":
			scr_text("Vejo que voce esta fazendo um bom trabalho.");
			// Dá o item
			scr_text("Isso aqui vai te ajudar.");
			scr_text("");
			break;	
//------------------------------------ CONVERSATION 1 ----------------------------------------//
		case "door":
			scr_text("A porta esta trancada.");
			break;
//------------------------------------ CONVERSATION 2 ----------------------------------------//
		case "painel1":
			if (global.flag[1] == false) {
				scr_text("Tzzzt.");
			}

			if (global.flag[1] == true) {
				room_goto(rm_minigame);
			}
			break;
//------------------------------------ CONVERSATION 3 ----------------------------------------//
		case "item1":
			if (global.flag[1] == false) {
				var _nome = obj_item.nome;
				scr_text($"Voce encontrou um {_nome}!");
				scr_text($"Voce guardou {_nome} no seu inventario.");
				global.flag[1] = true;
			}
			ds_grid_add_item(Armas.Drive, spr_items);
			scr_text("");
			break;
//--------------------------------------------------------------------------------------------//
		}
}