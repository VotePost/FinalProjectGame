// Draw the shop button when the shop is closed
if (!shop_open) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_rectangle(20, 20, 160, 60, false);
    draw_set_color(c_white);
    draw_text(90, 40, "Shop [I]");
    return; // Stop here if the shop is closed
}

// --- Draw Dimming Overlay ---
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1.0);

// --- Draw the Shop Panel ---
draw_rectangle(window_x, window_y, window_x + window_w, window_y + window_h, false);

// --- Draw Title ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(window_x + window_w / 2, window_y + 40, "Furniture & Decor");

// --- Draw Grid Items ---
for (var i = 0; i < array_length(shop_items); i++) {
    var _col = i mod columns;
    var _row = floor(i / columns);
    var _item_x = grid_start_x + (_col * (item_size + grid_padding));
    var _item_y = grid_start_y + (_row * (item_size + grid_padding));
    var _item_data = shop_items[i];

    // Draw item box and highlight if selected
    var _box_color = (i == menu_index) ? c_green : c_dkgray;
    draw_set_color(_box_color);
    draw_rectangle(_item_x, _item_y, _item_x + item_size, _item_y + item_size, true);

    // Draw the item's sprite
    draw_sprite(_item_data.sprite, 0, _item_x + item_size / 2, _item_y + 40);

    // Draw item name and price text
    draw_set_color(c_white);
    var _text = _item_data.name + "\n$" + string(_item_data.price);
    draw_text(_item_x + item_size / 2, _item_y + item_size - 20, _text);
}