// Draw semi-transparent ghost preview with color feedback
draw_set_alpha(0.5);
draw_sprite_ext(sprite_to_draw, 0, x, y, current_scale * flip_x, current_scale, 0, ghost_color, 1);
draw_set_alpha(1.0);

// --- Draw Instructions ---
var _text = "Left-click to place | Right-click to cancel\nScroll wheel or [ and ] to resize | F to flip";
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_set_font(Font3);

// Draw a black box behind the text to make it readable
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(x - 120, y - 55, x + 120, y - 10, false);
draw_set_alpha(1.0);

// Draw the instructional text
draw_set_color(c_white);
var text_width = 300; // Set this to the width of your box minus some padding
draw_text_ext(x, y - 15, _text, -1, text_width);