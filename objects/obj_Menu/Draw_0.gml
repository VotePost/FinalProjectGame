draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var btn_width = 240;
var btn_height = 48;
var btn_spacing = 24;
var menu_count = array_length(global.menu_options);

var cx = room_width / 2;
var menu_y_offset = 400; // Must match Step Event
var cy = menu_y_offset;

var total_height = menu_count * btn_height + (menu_count - 1) * btn_spacing;
var start_y = cy;

for (var i = 0; i < menu_count; i++) {
    var btn_x = cx - btn_width / 2;
    var btn_y = start_y + i * (btn_height + btn_spacing);

    var base_col = make_color_rgb(82,44,160); // purple
    var hover_col = make_color_rgb(44,25,44); // darker purple
    var text_col = c_white;

    var col = base_col;
    if (i == hovered_index) {
        col = hover_col;
    } else if (hovered_index == -1 && i == global.menu_index) {
        col = hover_col;
    }

    draw_set_color(col);
    draw_rectangle(btn_x, btn_y, btn_x + btn_width, btn_y + btn_height, false);
    draw_set_color(text_col);
    draw_text(cx, btn_y + btn_height / 2, global.menu_options[i]);
}

// Instructions (placed under the menu)
draw_set_color(c_white);
draw_text(cx, start_y + total_height + 48, "Use Arrow keys/WASD or click to select. Enter/Space/Click to confirm.");