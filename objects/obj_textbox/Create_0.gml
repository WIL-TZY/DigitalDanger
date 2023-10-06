depth = -9999;

//textbox parameters
textbox_width = 200;
textbox_height = 64;
border = 8;
line_sep = 12;
line_width = textbox_width - border*2;
txtb_spr[0] = spr_textbox;
txtb_img = 0;
txtb_img_spd = 6/60;

// the text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
char[0, 0] = ""; // this is not position 1 and position 2, it's position 1 (index) + how many characters (count).
char_x[0, 0] = 0; // represents the position of the char in the page (x)
char_y[0, 0] = 0; // represents the position of the char in the page (y)
draw_char = 0;
text_spd = 1;
// options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

// SOUND
snd_delay = 4;
snd_count = snd_delay;

// EFFECTS
scr_set_defaults_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16; // Good value. Indicates how many frames to pause.






