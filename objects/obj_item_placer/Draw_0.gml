// Draw the semi-transparent "ghost" sprite
draw_set_alpha(0.5);
draw_sprite(sprite_to_draw, 0, x, y);
draw_set_alpha(1.0);

// Draw instructions on the GUI layer so they are always visible
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _text = "Left-click to place\nRight-click to cancel";
draw_text(display_get_gui_width() / 2, 20, _text);