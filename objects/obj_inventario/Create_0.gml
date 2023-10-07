/// @description Insert description here
// You can write your code in this editor
inventario = false;
escala = 1;

// variaveis provisorias para decidi localidade do inventario
x_start = 30 * escala;
y_start = 24 * escala;


// slots
slots_h = 5;
slots_w = 5;

total_slots = slots_h * slots_w;
tamanho_slots = 16 * escala;
buffer = 5 * escala;

inventario_w = sprite_get_width(spr_inventario) * escala;
inventario_h = sprite_get_height(spr_inventario) * escala;

item_selecionado = -1;
pos_selecionado = -1;

enum Armas {
	Drive,		// PCB (0)
	Disk,		// Antena (1)
	CD,			// Emissor (2)
	// EXTRA	// Cell (3)
	Altura		// Jammer (4) ----> final
			
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
	Sprite,
	Altura,
}

grid_items = ds_grid_create(Infos.Altura, total_slots);
ds_grid_set_region(grid_items, 0, 0, Infos.Altura - 1, total_slots - 1, -1);

/*
ds_grid_add_item(Armas.Disk, spr_items);
ds_grid_add_item(Armas.Drive, spr_items);
ds_grid_add_item(Armas.CD, spr_items);

ds_grid_add_item(Craftaveis.Malware, spr_craftaveis);
ds_grid_add_item(Craftaveis.Antivirus, spr_craftaveis);
ds_grid_add_item(Craftaveis.Dados, spr_craftaveis);
*/