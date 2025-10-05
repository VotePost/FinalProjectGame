if (room != Room1) { return; }

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

    // --- LOGIC FOR WHEN SHOP IS OPEN ---
    if (shop_open) {
        instance_deactivate_all(true); // Pause the game
        
        // --- PURCHASE LOGIC ---
        // First, check if the mouse was clicked at all
        if (_left_mouse_pressed) {
            
            // Initialize a temporary variable to track the click
            var _item_clicked = -1;

            // Second, loop through all items to see if one was clicked
            for (var i = 0; i < array_length(shop_items); i++) {
                var _col = i mod columns;
                var _row = floor(i / columns);
                var _item_x1 = grid_start_x + (_col * (item_size + grid_padding));
                var _item_y1 = grid_start_y + (_row * (item_size + grid_padding));
                var _item_x2 = _item_x1 + item_size;
                var _item_y2 = _item_y1 + item_size;

                if (_mouse_gui_x > _item_x1 && _mouse_gui_x < _item_x2 &&
                    _mouse_gui_y > _item_y1 && _mouse_gui_y < _item_y2) {
                    _item_clicked = i; // We found the clicked item!
                    break;
                }
            }

            // Finally, if an item was successfully clicked, proceed with the purchase
            if (_item_clicked != -1) {
                var _item_data = shop_items[_item_clicked];
    
                // Check if player can afford it
                if (global.coins >= _item_data.price) {
                   
                    menu_index = _item_clicked;
                    placement_mode = true;
                    shop_open = false;
                    instance_activate_all();
                    
                    var _placer = instance_create_layer(mouse_x, mouse_y, "Instances", obj_item_placer);
                    _placer.object_to_place = _item_data.object;
                    _placer.sprite_to_draw = _item_data.sprite;
					_placer.item_price = _item_data.price;
                } else{ //can't afford
				}
            }
        }
    }
    // --- LOGIC FOR WHEN SHOP IS CLOSED ---
    else {
        instance_activate_all(); // Un-pause the game
        
        // Check for a click on the "Open Shop" button
        if (_left_mouse_pressed) {
            var _button_x = 20;
            var _button_y = 20;
            var _button_w = 140;
            var _button_h = 40;
            
            if (_mouse_gui_x >= _button_x && _mouse_gui_x <= _button_x + _button_w &&
                _mouse_gui_y >= _button_y && _mouse_gui_y <= _button_y + _button_h) {
                shop_open = true;
            }
        }
    }
}
// Check if a save has been requested by the pause menu
if (request_save) {
    SaveGame(); // Run the save script
    request_save = false; // Reset the flag so it doesn't save again
}