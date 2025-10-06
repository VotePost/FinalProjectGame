if (room != Room1) { return; }
// If we are in placement mode, draw nothing from the shop.
if (placement_mode) {
    return; 
}

// If the shop is open, draw the full interface.
if (shop_open) {
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
        
        var _box_color = (i == menu_index) ? c_green : c_dkgray;
        draw_set_color(_box_color);
        draw_rectangle(_item_x, _item_y, _item_x + item_size, _item_y + item_size, true);
        
        draw_sprite(_item_data.sprite, 0, _item_x + item_size / 2, _item_y + 40);
        
        draw_set_color(c_white);
        var _text = _item_data.name + "\n$" + string(_item_data.price);
        draw_text(_item_x + item_size / 2, _item_y + item_size - 20, _text);
    }
} 
// If the shop is closed, draw the "Open Shop" button.
else {
    var _button_x = 20;
    var _button_y = 20;
    var _button_w = 140;
    var _button_h = 40;
	draw_set_color(c_dkgray);
	draw_rectangle(_button_x, _button_y, _button_x + _button_w, _button_y + _button_h, false);

    // Draw the button background and text
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_rectangle(_button_x, _button_y, _button_x + _button_w, _button_y + _button_h, false);
    draw_set_color(c_white);
    draw_text(_button_x + _button_w / 2, _button_y + _button_h / 2, "Shop [I]");
}