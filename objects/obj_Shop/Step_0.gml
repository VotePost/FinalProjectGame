// --- INITIALIZATION CHECK ---
// Ensures button variables exist if the Create Event was missed.
if (is_undefined(button_x)) {
    button_x = 20;
    button_y = 20;
    button_w = 120;
    button_h = 40;
}

// Get the mouse coordinates relative to the GUI layer
// We will use the explicit functions to ensure we get GUI coordinates correctly.
//var mouse_gui_x = display_mouse_get_gui_x();
//var mouse_gui_y = display_mouse_get_gui_y();

// --- Shop Opening Logic (Mouse OR Key Press) ---

// 1. Check for Key Press (Toggle Shop)
if (keyboard_check_pressed(ord("I"))) { // Uses the 'I' key to open/close
    shop_open = !shop_open;
    exit;
}

// 2. Check for Mouse Click (Only works if shop is closed)
if (!shop_open && mouse_check_button_pressed(mb_left)) {
    // Check if the GUI-based mouse coordinates are within the button's GUI bounds
    if (mouse_gui_x >= button_x && mouse_gui_x <= button_x + button_w &&
        mouse_gui_y >= button_y && mouse_gui_y <= button_h) {
        
        shop_open = true; // Open the shop!
        exit; // Prevents the click from selecting an item in the shop on the same frame it opens
    }
}

// --- Shop Closing Logic (Using ESC key for convenience) ---
if (shop_open && keyboard_check_pressed(vk_escape)) {
    shop_open = false;
}


// --- Control Game State ---
if (shop_open) {
    // Deactivate instances when shop is open (pauses the game world)
    instance_deactivate_all(true); 

    // --- GRID Click and Selection Setup ---
    
    // Define the shop_items array here so array_length works in this event.
    var shop_items = ["Cozy Couch ($150)", "Desk Lamp ($45)", "Wooden Table ($90)", "King Bed ($500)", "Small Rug ($25)", "Floor Lamp ($30)", "Coffee Table ($60)", "Bookshelf ($120)", "Wall Mirror ($80)"];
    
    // UI Layout Constants (Must match Draw GUI Event)
    var columns = 3;
    var item_size = 180;
    var grid_padding_x = 25;
    var window_w = 650;
    var window_h = 550;
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    var cx = gw / 2;
    var cy = gh / 2;
    var x1 = cx - (window_w / 2);
    var y1 = cy - (window_h / 2);
    var grid_start_x = x1 + 40;
    var grid_start_y = y1 + 80;
    
    var max_index = array_length(shop_items) - 1;

    // --- A. Keyboard Navigation (With Grid Wrapping) ---
    if (keyboard_check_pressed(vk_left)) { 
        menu_index = (menu_index > 0) ? menu_index - 1 : max_index; 
    }
    if (keyboard_check_pressed(vk_right)) { 
        menu_index = (menu_index < max_index) ? menu_index + 1 : 0; 
    }
    if (keyboard_check_pressed(vk_up)) { 
        var new_index = menu_index - columns;
        // If we move up past the top row (new_index < 0), wrap to the bottom row
        menu_index = (new_index >= 0) ? new_index : menu_index - ((floor(menu_index / columns)) * columns) + max_index - ((floor(max_index / columns)) * columns);
    }
    if (keyboard_check_pressed(vk_down)) { 
        var new_index = menu_index + columns;
        // If we move down past the bottom row (new_index > max_index), wrap to the top row
        menu_index = (new_index <= max_index) ? new_index : menu_index - ((floor(menu_index / columns)) * columns);
    }

    // --- B. Mouse Selection ---
    var item_clicked = -1;

    if (mouse_check_button_pressed(mb_left)) {
        for (var i = 0; i < array_length(shop_items); i++) {
            var col_index = i mod columns;
            var row_index = floor(i / columns);
            
            var item_x1 = grid_start_x + (col_index * (item_size + grid_padding_x));
            var item_y1 = grid_start_y + (row_index * (item_size + grid_padding_x));
            var item_x2 = item_x1 + item_size;
            var item_y2 = item_y1 + item_size;
            
            // Check if mouse is within the bounds of the current item box
            if (mouse_gui_x >= item_x1 && mouse_gui_x <= item_x2 &&
                mouse_gui_y >= item_y1 && mouse_gui_y <= item_y2) {
                
                item_clicked = i;
                break; // Found the clicked item
            }
        }
    }
    
    // --- C. Final Selection ---
    if (item_clicked != -1) {
        menu_index = item_clicked; // Select the item that was clicked
    }

    if (item_clicked != -1 || keyboard_check_pressed(vk_enter)) {
        show_debug_message("Item selected: " + shop_items[menu_index]);
        // Placement logic would go here
    }
    
} else {
    // If the shop is closed, make sure the game is running
    instance_activate_all();
}
