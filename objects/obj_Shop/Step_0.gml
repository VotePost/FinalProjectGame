// --- INITIALIZATION CHECK (Fixes undefined button_x error) ---
if (is_undefined(button_x)) {
    // These values MUST match the drawing in the Draw GUI Event
    button_x = 20;
    button_y = 20;
    button_w = 120;
    button_h = 40;
    
    // Ensure state variables exist
    if (is_undefined(shop_open)) { shop_open = false; }
    if (is_undefined(menu_index)) { menu_index = 0; }
}

// Get the mouse coordinates relative to the GUI layer (Instance Variables)
mouse_gui_x = device_mouse_x_to_gui(0);
mouse_gui_y = device_mouse_y_to_gui(0);

// Check for a left mouse press ONCE per frame
var left_mouse_pressed = mouse_check_button_pressed(mb_left);


// --- Shop Open/Close Toggles ---

// 1. Keyboard Toggle (Press 'I' for Inventory/Shop)
if (keyboard_check_pressed(ord("I"))) {
    shop_open = !shop_open; // Toggle shop open/closed
}

// 2. Button Click to Open (Using the reliable 'pressed' check)
if (!shop_open && left_mouse_pressed) {
    // Check if the GUI-based mouse coordinates are within the button's GUI bounds
    if (mouse_gui_x >= button_x && mouse_gui_x <= button_x + button_w &&
        mouse_gui_y >= button_y && mouse_gui_y <= button_h) {
        
        shop_open = true; // Open the shop!
        // IMPORTANT: Exit the event so the same click doesn't immediately select an item
        // or trigger game logic.
        exit; 
    }
}

// 3. ESC Key to Close
if (shop_open && keyboard_check_pressed(vk_escape)) {
    shop_open = false;
}


// --- Control Game State & Shop Logic ---
if (shop_open) {
    instance_deactivate_all(true); 

    // --- GRID Click and Selection Logic ---
    
    // Define the shop_items array locally
    var shop_items = ["Cozy Couch ($150)", "Desk Lamp ($45)", "Wooden Table ($90)", "King Bed ($500)", "Small Rug ($25)", "Floor Lamp ($30)", "Coffee Table ($60)", "Bookshelf ($120)", "Wall Mirror ($80)"];
    
    // UI Layout Constants (Must match Draw GUI Event)
    var columns = 3;
    var item_size = 120; // DECREASED: Made individual items smaller
    var grid_padding_x = 15; // DECREASED: Reduced space between items
    var window_w = 380; // DECREASED: Smaller overall window width
    var window_h = 350; // DECREASED: Smaller overall window height
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    var cx = gw / 2;
    var cy = gh / 2;
    var x1 = cx - (window_w / 2);
    var y1 = cy - (window_h / 2);
    var grid_start_x = x1 + 40;
    var grid_start_y = y1 + 80;
    
    var max_index = array_length(shop_items) - 1;

    // --- A. Keyboard Navigation ---
    if (keyboard_check_pressed(vk_left)) { 
        menu_index = (menu_index > 0) ? menu_index - 1 : max_index; 
    }
    if (keyboard_check_pressed(vk_right)) { 
        menu_index = (menu_index < max_index) ? menu_index + 1 : 0; 
    }
    if (keyboard_check_pressed(vk_up)) { 
        var new_index = menu_index - columns;
        menu_index = (new_index >= 0) ? new_index : menu_index - ((floor(menu_index / columns)) * columns) + max_index - ((floor(max_index / columns)) * columns);
    }
    if (keyboard_check_pressed(vk_down)) { 
        var new_index = menu_index + columns;
        menu_index = (new_index <= max_index) ? new_index : menu_index - ((floor(menu_index / columns)) * columns);
    }

    // --- B. Mouse Selection ---
    var item_clicked = -1;

    // Use the single mouse press check for reliable item selection
    if (left_mouse_pressed) {
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
                break; // Found the clicked item, stop the loop
            }
        }
    }
    
    // --- C. Final Selection and Purchase ---
    if (item_clicked != -1) {
        menu_index = item_clicked; // Select the item that was clicked
    }

    // NOTE: Placement logic (room_goto, instance_create) would go here when ready.

} else {
    // If the shop is closed, make sure the game is running
    instance_activate_all();
}
