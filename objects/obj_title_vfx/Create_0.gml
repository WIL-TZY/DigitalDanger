var _col = c_white;

draw_set_font(font_game);
draw_set_colour(_col);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(room_width / 2,room_height /3, "DIGITAL \n HOME");

balls = [];

var _o = 0.5, _res = 0.5;

for (var i = 0; i < room_width ; i += _res;)
{
	for (var j = 0; j< room_height;j += _res;)
	{
		var _val = draw_getpixel(i, j);
		if _val == _col
		{
			array_push(balls, new Ball(i + random_range(-_o, _o), j + random_range(_o, _o)));
		}
	}
}

opcoes=["Novo Jogo", "Sair do jogo"];
index= 0;
op_max= array_length(opcoes);




