/// @description Insert description here
// You can write your code in this editor
var _guiw = display_get_gui_width();
var _guih = display_get_gui_height();


var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if inventario == true {
	var _invy = _guih/2 - inventario_h/2;
	var _invx = _guiw/2 - inventario_w/2;
	
	draw_sprite_ext(spr_inventario, 0, _invx, _invy, escala, escala, 0, c_white, 1);
	
	var ix = 0;
	var iy = 0;
	for(var i = 0; i < total_slots; i ++) {
		var _slotsx = _invx + x_start +((tamanho_slots + buffer) * ix);
		var _slotsy = _invy + y_start + ((tamanho_slots + buffer) * iy);
		
		if point_in_rectangle(_mx, _my, _slotsx, _slotsy, _slotsx + tamanho_slots, _slotsy + tamanho_slots) {
			draw_sprite_ext(spr_inventario_selector, 0, _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			// agarra item e soltar em outro slot
			if mouse_check_button_pressed(mb_left) {
				// caso nao tenha item selecionado
				if item_selecionado == -1 {
					item_selecionado = grid_items[# Infos.Item, i];
					pos_selecionado = i;
				}// caso tenha item selecionado
				else {
					// 1- caso o item selecionado seja igual o item que deseja trocar
					if item_selecionado == grid_items[# Infos.Item, i] and pos_selecionado != i {
						grid_items[# Infos.Quantidade, i] += grid_items[# Infos.Quantidade, pos_selecionado];
						
						grid_items[# Infos.Item, pos_selecionado] = -1;
						grid_items[# Infos.Quantidade, pos_selecionado] = -1;
						
						item_selecionado = -1;
						pos_selecionado = -1;
					}// 2- caso o slot selecionado seja vazio
					else if grid_items[# Infos.Item, i] == -1 {
						grid_items[# Infos.Item, i] = grid_items[# Infos.Item, pos_selecionado];
						grid_items[# Infos.Quantidade,  i] = grid_items[# Infos.Quantidade, pos_selecionado];
						
						grid_items[# Infos.Item, pos_selecionado] = -1;
						grid_items[# Infos.Quantidade, pos_selecionado] = -1;
						
						item_selecionado = -1;
						pos_selecionado = -1;
					}// 3- caso o slot selecionado ja tenha um item 
					else if grid_items[# Infos.Item, pos_selecionado] != grid_items[# Infos.Item, i] {
						var _item = grid_items[# Infos.Item, i];
						var _quantidade = grid_items[# Infos.Quantidade, i];
						
						grid_items[# Infos.Item, i] = grid_items[# Infos.Item, pos_selecionado];
						grid_items[# Infos.Quantidade,  i] = grid_items[# Infos.Quantidade, pos_selecionado];
						
						grid_items[# Infos.Item, pos_selecionado] = _item;
						grid_items[# Infos.Quantidade, pos_selecionado] = _quantidade;
						
						item_selecionado = -1;
						pos_selecionado = -1;
					}
				}
			}
		}
		
		
		// desenhar sprites de itens
		if grid_items[# Infos.Item, i] != -1{
			draw_sprite_ext(spr_items, grid_items[# 0, i], _slotsx, _slotsy, escala, escala, 0, c_white, 1);
			
			draw_set_halign(fa_center);
			draw_text_color(_slotsx + tamanho_slots, _slotsy + tamanho_slots - 8, grid_items[# Infos.Quantidade, i], c_white, c_white, c_white, c_white, 1);
		}
	
		ix++;
		if ix >= slots_h {
			ix = 0;
			iy ++;
		}
	}
	
	// larga o item selecionado
	if mouse_check_button_pressed(mb_right) {
		item_selecionado = -1;
		pos_selecionado = -1;
	}
	
	if item_selecionado != -1 {
		draw_sprite_ext(spr_items, item_selecionado, _mx, _my, escala, escala, 0, c_white, 0.5);
	}
}
