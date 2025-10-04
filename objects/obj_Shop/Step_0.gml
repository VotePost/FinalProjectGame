// --- START OF CODE ---

// Get mouse position on the GUI
mouse_gui_x = device_mouse_x_to_gui(0);
mouse_gui_y = device_mouse_y_to_gui(0);

// Check for a single left mouse press
var _left_mouse_pressed = mouse_check_button_pressed(mb_left);


// --- MAIN LOGIC WRAPPER ---
// Only run the shop logic if we are NOT in placement mode.
if (!placement_mode) {

    // --- Shop Toggles ---

    // Toggle with 'I' key
    if (keyboard_check_pressed(ord("I"))) {
        shop_open = !shop_open;
    }

    // Close with ESC key
    if (shop_open && keyboard_check_pressed(vk_escape)) {
        shop_open = false;
    }


    // --- Shop Open/Closed Logic ---

    if (shop_open) {
        // Pause the game in the background
        instance_deactivate_all(true);

        // --- MOUSE CLICK LOGIC ---
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

                if (mouse_gui_x >= _item_x1 && mouse_gui_x <= _item_x2 &&
                    mouse_gui_y >= _item_y1 && mouse_gui_y <= _item_y2) {
                    _item_clicked = i;
                    break;
                }
            }

            if (_item_clicked != -1) {
                // --- PURCHASE AND ENTER PLACEMENT MODE ---
                menu_index = _item_clicked;

                // 1. Enter placement mode
                placement_mode = true;
                
                // 2. Close the shop window
                shop_open = false;
                
                // 3. Create the placer object and tell it what to place
                var _placer = instance_create_layer(mouse_x, mouse_y, "Instances", obj_item_placer);
                _placer.object_to_place = obj_placeholderitem; // The final object to place

            } else {
                // Check if the click is OUTSIDE the shop window to close it
                if (mouse_gui_x < window_x || mouse_gui_x > window_x + window_w ||
                    mouse_gui_y < window_y || mouse_gui_y > window_y + window_h) {
                    shop_open = false;
                }
            }
        }

        // --- KEYBOARD NAVIGATION ---
        var _max_index = array_length(shop_items) - 1;

        if (keyboard_check_pressed(vk_left)) { menu_index--; }
        if (keyboard_check_pressed(vk_right)) { menu_index++; }
        if (keyboard_check_pressed(vk_up)) { menu_index -= columns; }
        if (keyboard_check_pressed(vk_down)) { menu_index += columns; }

        // Clamp menu_index to stay within the bounds of the array
        menu_index = clamp(menu_index, 0, _max_index);

    } else { // Shop is closed
        // Un-pause the game
        instance_activate_all();

        // Check for a click on the "Open Shop" button
        if (_left_mouse_pressed) {
            if (mouse_gui_x >= button_x && mouse_gui_x <= button_x + button_w &&
                mouse_gui_y >= button_y && mouse_gui_y <= button_h) {
                shop_open = true;
            }
        }
    }
}

// --- END OF CODE ---