// Get mouse position on the GUI
var _mouse_gui_x = device_mouse_x_to_gui(0);
var _mouse_gui_y = device_mouse_y_to_gui(0);
var _left_mouse_pressed = mouse_check_button_pressed(mb_left);

// Only run the shop logic if we are NOT in placement mode.
if (!placement_mode) {

    // Toggle shop with 'I' key
    if (keyboard_check_pressed(ord("I"))) {
        shop_open = !shop_open;
    }

    // Close with ESC key
    if (shop_open && keyboard_check_pressed(vk_escape)) {
        shop_open = false;
    }

    if (shop_open) {
        // --- PURCHASE ITEM ---
        if (_left_mouse_pressed) {
            var _item_clicked = -1;

            // Check if the click is on an item
            for (var i = 0; i < array_length(shop_items); i++) {
                var _col = i mod columns;
                var _row = floor(i / columns);
                var _item_x1 = grid_start_x + (_col * (item_size + grid_padding));
                var _item_y1 = grid_start_y + (_row * (item_size + grid_padding));
                var _item_x2 = _item_x1 + item_size;
                var _item_y2 = _item_y1 + item_size;

                if (_mouse_gui_x > _item_x1 && _mouse_gui_x < _item_x2 &&
                    _mouse_gui_y > _item_y1 && _mouse_gui_y < _item_y2) {
                    _item_clicked = i;
                    break;
                }
            }

            if (_item_clicked != -1) {
                menu_index = _item_clicked;
                placement_mode = true;
                shop_open = false;

                var _item_data = shop_items[menu_index];
                var _placer = instance_create_layer(mouse_x, mouse_y, "Instances", obj_item_placer);
                _placer.object_to_place = _item_data.object;
                _placer.sprite_to_draw = _item_data.sprite;
            }
        }
    }
}