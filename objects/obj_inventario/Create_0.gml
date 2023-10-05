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
