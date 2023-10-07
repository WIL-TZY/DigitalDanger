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
//------------------------------------ CONVERSATION 2 ----------------------------------------//
		case "door":
			scr_text("A porta esta trancada.");
			break;
//------------------------------------ CONVERSATION 3 ----------------------------------------//
		case "painel1":
			if (global.flag[8] == false) {
				scr_text("Tzzzt.");
			}

			if (global.flag[8] == true) {
				room_goto(rm_minigame);
			}
			break;
//------------------------------------ CONVERSATION 4 ----------------------------------------//
		case "item0":
			if (global.flag[0] == false) {
				var _nome = obj_item.nome;
				scr_text($"Voce encontrou um {_nome}!");
				scr_text($"Voce guardou {_nome} no seu inventario.");
				global.flag[0] = true;
			}
			ds_grid_add_item(Armas.Drive, spr_items);
			scr_text("");
			break;
//------------------------------------ CONVERSATION 5 ----------------------------------------//
		case "npc2":
			scr_text("Uai, o que foi?");
			scr_text("Vai dizer que voce tambem nao remexe as latas de lixo?");
			scr_text("Acaba sempre tendo algo valioso dentro delas~");
			// Dá o item
			//scr_text("Isso aqui vai te ajudar.");
			//scr_text("");
			break;	
//------------------------------------ CONVERSATION 6 ----------------------------------------//
		case "cone-sus":
			if (global.flag[10] == false) {
				scr_text("Um cone.");
			}

			if (global.flag[10] == true) {
				// ...
			}
			break;
//------------------------------------ CONVERSATION 7 ----------------------------------------//
		case "item1":
			if (global.flag[1] == false) {
				var _nome = obj_item.nome;
				scr_text($"Voce encontrou um {_nome}!");
				scr_text($"Voce guardou {_nome} no seu inventario.");
				global.flag[1] = true;
			}
			ds_grid_add_item(Armas.Disk, spr_items);
			scr_text("");
			break;
//------------------------------------ CONVERSATION 8 ----------------------------------------//
		case "item2":
			if (global.flag[2] == false) {
				var _nome = obj_item.nome;
				scr_text($"Voce encontrou um {_nome}!");
				scr_text($"Voce guardou {_nome} no seu inventario.");
				global.flag[2] = true;
			}
			ds_grid_add_item(Armas.CD, spr_items);
			scr_text("");
			break;
//------------------------------------ CONVERSATION 9 ----------------------------------------//
		case "item3":
			if (global.flag[3] == false) {
				var _nome = obj_item.nome;
				scr_text($"Voce encontrou um {_nome}!");
				scr_text($"Voce guardou {_nome} no seu inventario.");
				global.flag[3] = true;
			}
			ds_grid_add_item(Armas.CD, spr_items);
			scr_text("");
			break;
//--------------------------------------------------------------------------------------------//
		}
}