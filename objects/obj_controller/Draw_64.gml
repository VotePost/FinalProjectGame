// Draw the coin count in the top-right corner
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(c_black);
// draw_set_font(fnt_main); // Use your own font

var _text = "Coins: " + string(global.coins);
draw_text(display_get_gui_width() - 20, 20, _text);