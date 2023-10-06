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

enum Armas {
	Drive,
	Disk,
	CD,
	Altura
}

enum Infos {
	Item, 
	Quantidade,
	Altura
}

grid_items = ds_grid_create(Infos.Altura, total_slots);
ds_grid_set_region(grid_items, 0, 0, 1, total_slots - 1, -1);

// primeiro slots
grid_items[# Infos.Item, 0] = Armas.Drive;
grid_items[# Infos.Quantidade, 0] =  3;

grid_items[# Infos.Item, 1] = Armas.Disk;
grid_items[# Infos.Quantidade, 1] =  5;

grid_items[# Infos.Item, 2] = Armas.CD;
grid_items[# Infos.Quantidade, 2] =  7;

grid_items[# Infos.Item, 3] = Armas.Disk;
grid_items[# Infos.Quantidade, 3] =  9;