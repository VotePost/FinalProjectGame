if (shop_open) {
    // --- Draw Dimming Overlay ---
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1.0);

    // --- Draw the Shop Panel ---
    draw_set_color(c_dkgray);
    draw_rectangle(window_x, window_y, window_x + window_w, window_y + window_h, false);
    draw_set_color(c_white);
    draw_rectangle(window_x, window_y, window_x + window_w, window_y + window_h, true);

    // --- Draw Title ---
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_shop_title); // Consider creating fonts for a nicer look
    draw_text(window_x + window_w / 2, window_y + 40, "Furniture & Decor");

    // --- Draw Grid Items ---
    draw_set_font(fnt_shop_item);
    for (var i = 0; i < array_length(shop_items); i++) {
        var _col = i mod columns;
        var _row = floor(i / columns);
        var _item_x = grid_start_x + (_col * (item_size + grid_padding));
        var _item_y = grid_start_y + (_row * (item_size + grid_padding));
        
        // Draw highlight for the selected item
        if (i == menu_index) {
            draw_set_color(c_green);
            draw_rectangle(_item_x - 2, _item_y - 2, _item_x + item_size + 2, _item_y + item_size + 2, false);
        }

        // Draw item background
        draw_set_color(c_gray);
        draw_rectangle(_item_x, _item_y, _item_x + item_size, _item_y + item_size, false);
        
        // Draw the item's sprite
        var _item_data = shop_items[i];
        draw_sprite(_item_data.sprite, 0, _item_x + item_size / 2, _item_y + 40);
        
        // Draw item name and price text
        draw_set_color(c_white);
        var _text = _item_data.name + "\n$" + string(_item_data.price);
        draw_text(_item_x + item_size / 2, _item_y + item_size - 20, _text);
    }
    
} else { // Shop is closed, draw the OPEN button
    
    // Draw the button background
    draw_set_color(c_dkgray);
    draw_rectangle(button_x, button_y, button_x + button_w, button_y + button_h, false);
    draw_set_color(c_white);
    draw_rectangle(button_x, button_y, button_x + button_w, button_y + button_h, true);
    
    // Draw button text
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(button_x + button_w / 2, button_y + button_h / 2, "Shop [I]");
}