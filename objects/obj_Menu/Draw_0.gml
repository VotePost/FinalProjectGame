
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var cx = display_get_width()/2;
var cy = display_get_height()/2;

for (var i = 0; i < array_length(menu_options); i++) {
    var col = c_white;
    if (i == menu_index) col = c_blue; // highlight selected option
    
    draw_set_color(col);
    draw_text(cx - 25, (cy-128) + (i * 40), menu_options[i]);
}
draw_text(800,600,"use arrow keys and enter to select options")