draw_set_font(font_game);
draw_set_color(c_blue);


var dist = 55;
var gui_largura = display_get_gui_width()
var gui_altura = display_get_gui_height()
var x1 = gui_largura/2;
var y1 = gui_altura/2
var margin = 20;
var m_x = device_mouse_x_to_gui(0)
var m_y = device_mouse_y_to_gui(0)


for(var i=0;i<op_max;i++){
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	if(index == i){
		draw_set_font(global.font_selector);
		draw_set_color(c_white)
		} else{
			draw_set_color(c_red)
			draw_set_font(global.font_selector);
		}
	
	var y2 = y1 + (margin * i);
	var string_w = string_width(opcoes[i]);
	var string_h = string_height(opcoes[i]);
	
	if(point_in_rectangle(m_x,m_y,x1 - string_w/ 2,y2 - string_h/ 2,x1 + string_w/ 2,y2 + string_h/ 2)){
		draw_set_color(c_red);
		index = i;
		if(mouse_check_button_pressed(mb_left))
			if(index == 1){
				game_end();
			
	
}else if(mouse_check_button(mb_left))
	if(index == 0){
		room_goto_next()
}
	}else{
		draw_set_color(c_white);
	}
	
	draw_text(x1,y1 +(dist * i),opcoes[i])

draw_set_font(-1)




}