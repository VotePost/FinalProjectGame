// 1. Draw the Clickable 'OPEN SHOP' Button
if (!shop_open) {
    draw_set_color(c_lime); // A nice, noticeable color
    draw_rectangle(button_x, button_y, button_x + button_w, button_y + button_h, false); // Filled background
    
    // Draw text centered on the button
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(button_x + button_w/2, button_y + button_h/2, "OPEN SHOP");
}

// 2. Draw the Shop Pop-up (The main window)
if (shop_open) {
    // UI Layout Setup
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    var cx = gw / 2;
    var cy = gh / 2;
    var window_w = 650; // Increased width for the grid
    var window_h = 550; // Increased height for more space
    
    var x1 = cx - (window_w / 2); // Left edge of the window
    var y1 = cy - (window_h / 2); // Top edge of the window
    var x2 = cx + (window_w / 2); // Right edge
    var y2 = cy + (window_h / 2); // Bottom edge
    
    // --- Draw Dimming Overlay ---
    draw_set_alpha(0.6);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1.0); 

    // --- Draw Shop Panel (The main box) ---
    draw_set_color(c_dkgray);
    draw_rectangle(x1, y1, x2, y2, false); 
    
    draw_set_color(c_white); 
    
    draw_rectangle(x1, y1, x2, y2, true);  // Outline
    
    // --- Draw Title ---
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text(cx, y1 + 20, "FURNITURE & DECOR");

    // --- Grid Layout Setup ---
    
    // Item configuration
    var columns = 3;
    var item_size = 180; // Size of the item box (including padding)
    var grid_padding_x = 25; // Space between item boxes
    var grid_start_x = x1 + 40; // Where the grid starts relative to the window
    var grid_start_y = y1 + 80;

    // Iterate through the furniture items (defined in Create Event)
    var shop_items = ["Cozy Couch ($150)", "Desk Lamp ($45)", "Wooden Table ($90)", "King Bed ($500)", "Small Rug ($25)", "Floor Lamp ($30)", "Coffee Table ($60)", "Bookshelf ($120)", "Wall Mirror ($80)"]; // 9 items for 3x3 grid

    for (var i = 0; i < array_length(shop_items); i++) {
        // Calculate Row (R) and Column (C) for the current item
        var col_index = i mod columns;
        var row_index = floor(i / columns);
        
        // Calculate drawing positions
        var draw_x = grid_start_x + (col_index * (item_size + grid_padding_x));
        var draw_y = grid_start_y + (row_index * (item_size + grid_padding_x));
        
        // --- Draw Item Box ---
        var col = (i == menu_index) ? c_lime : c_ltgray; // Highlight selected item
        draw_set_color(col);
        draw_rectangle(draw_x, draw_y, draw_x + item_size, draw_y + item_size, true); // Outline

        // Draw background for the item box
        draw_set_alpha((i == menu_index) ? 0.2 : 0.1);
        draw_rectangle(draw_x, draw_y, draw_x + item_size, draw_y + item_size, false);
        draw_set_alpha(1.0);

        // --- Draw Placeholder Sprite ---
        draw_set_color(c_red);
        draw_rectangle(draw_x + 10, draw_y + 10, draw_x + 10 + 60, draw_y + 10 + 60, false); 
        
        // --- Draw Item Text ---
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(draw_x + item_size / 2, draw_y + item_size - 30, shop_items[i]);
    }

    // Add closing instruction
    draw_set_color(c_gray);
    draw_set_halign(fa_center);
    draw_text(cx, y2 - 25, "Press ESC to Close");
}
