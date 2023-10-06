/// @description Insert description here
// You can write your code in this editor
inventario = false;
escala = 3;

// variaveis provisorias para decidi localidade do inventario
x_start = 15 * escala;
y_start = 24 * escala;



// slots

slots_h = 5;
slots_w = 5;

total_slots = slots_h * slots_w;
tamanho_slots = 16 * escala;
buffer = 1 * escala;

inventario_w = sprite_get_width(spr_inventario) * escala;
inventario_h = sprite_get_height(spr_inventario) * escala;

item_selecionado = -1;
pos_selecionado = -1;

enum Armas {
	Drive,
	Disk,
	CD,
	Altura
}

// nomes sujeitos a mudanca
enum Craftaveis {
	Dados,
	Malware,
	Antivirus,
	Altura
}

enum Infos {
	Item, 
	Quantidade,
	Sprite,
	Altura
}

grid_items = ds_grid_create(Infos.Altura, total_slots);
ds_grid_set_region(grid_items, 0, 0, Infos.Altura - 1, total_slots - 1, -1);

ds_grid_add_item(Armas.Disk, 3, spr_items);
ds_grid_add_item(Armas.Drive, 2, spr_items);
ds_grid_add_item(Armas.CD, 6, spr_items);

ds_grid_add_item(Craftaveis.Malware, 5, spr_craftaveis);
ds_grid_add_item(Craftaveis.Antivirus, 2, spr_craftaveis);
ds_grid_add_item(Craftaveis.Dados, 9, spr_craftaveis);
