draw_set_font(global.font_main);

// If LOST the minigame:
if (global.flag[14]) {
	draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 200, "Putz! Mais sorte na proxima vez :(");
}

// If WON the minigame:
if (global.flag[15]) {
	draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 200, "Parabens!");
}
