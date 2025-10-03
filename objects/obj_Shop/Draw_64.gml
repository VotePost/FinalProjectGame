// --- Draw GUI Event ---
// This event draws the UI on top of the game world.

// --- UI Constants (Match Step Event) ---
var button_x = 20;
var button_y = 20;
var button_w = 120;
var button_h = 40;

// Assume shop_open exists (defined in Create Event)
if (shop_open) {
    // UI Layout Constants
    var columns = 3;
    var item_size = 100;
    var grid_padding_x = 25;
    var window_w = 480;
    var window_h = 450;

    // --- Setup Variables for Positioning ---
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    // Center point of the screen
    var cx = gw / 2;
    var cy = gh / 2;

    var x1 = cx - (window_w / 2); // Left edge
    var y1 = cy - (window_h / 2); // Top edge
    var x2 = cx + (window_w / 2); // Right edge
    var y2 = cy + (window_h / 2); // Bottom edge

    var grid_start_x = x1 + 40;
    var grid_start_y = y1 + 80;

    // Array of your shop item names (Used for text and length)
    var shop_items = ["Cozy Couch ($150)", "Desk Lamp ($45)", "Wooden Table ($90)", "King Bed ($500)", "Small Rug ($25)", "Floor Lamp ($30)", "Coffee Table ($60)", "Bookshelf ($120)", "Wall Mirror ($80)"];
    
    // --- 1. Draw Dimming Overlay ---
    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1.0); // Reset alpha

    // --- 2. Draw the Shop Panel ---
    draw_set_color(c_dkgray);
    draw_rectangle(x1, y1, x2, y2, false); // Filled rectangle
    draw_set_color(c_white);
    draw_rectangle(x1, y1, x2, y2, true);  // Outline
    
    // --- 3. Draw Title ---
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(cx, y1 + 30, "FURNITURE & DECOR");

    // --- 4. Draw Grid Items ---
    draw_set_halign(fa_center);
    
    // Assume menu_index exists (defined in Create Event)
    for (var i = 0; i < array_length(shop_items); i++) {
        var col_index = i mod columns;
        var row_index = floor(i / columns);
        
        var item_x = grid_start_x + (col_index * (item_size + grid_padding_x));
        var item_y = grid_start_y + (row_index * (item_size + grid_padding_x));
        var item_center_x = item_x + (item_size / 2);

        var col = (i == menu_index) ? c_lime : c_white;
        
        // A) Draw Highlight/Background for Selected Item
        if (i == menu_index) {
            draw_set_color(c_green); // Highlight color
            draw_rectangle(item_x, item_y, item_x + item_size, item_y + item_size, false);
        } else {
            draw_set_color(c_gray); // Regular background color
            draw_rectangle(item_x, item_y, item_x + item_size, item_y + item_size, false);
        }

        // B) Draw Placeholder Sprite (e.g., red square)
        draw_set_color(c_red);
        draw_rectangle(item_x + 15, item_y + 15, item_x + 60, item_y + 60, false);
        
        // C) Draw Item Name/Price Text
        draw_set_color(col);
        draw_text(item_center_x, item_y + item_size - 30, shop_items[i]);
        
        // D) Draw Border
        draw_set_color(c_white);
        draw_rectangle(item_x, item_y, item_x + item_size, item_y + item_size, true);
    }
    
    // --- 5. Draw Instructions ---
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(cx, y2 - 25, "Press ESC or click outside the shop to close.");

} else { // Shop is closed, draw the OPEN button only
    
    // --- DRAW DEBUG COLLISION RECTANGLE (Only when closed) ---
    // This uses the button coordinates defined at the top of the event.
    draw_set_alpha(0.3);
    draw_set_color(c_yellow);
    draw_rectangle(button_x, button_y, button_x + button_w, button_y + button_h, false); // Filled rectangle
    draw_set_alpha(1.0); // Reset alpha
    
    // --- 1. Draw the Button Background ---
    draw_set_color(c_white);
    draw_rectangle(button_x, button_y, button_x + button_w, button_y + button_h, false);
    
    // --- 2. Draw Button Text ---
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text(button_x + button_w/2, button_y + button_h/2, "OPEN SHOP");

    // --- 3. DRAW MOUSE COORDINATE DEBUG ---
    // ONLY works if you removed 'var' from mouse_gui_x/y in the Step Event!
    var mouse_debug_text = "Mouse: (" + string(mouse_gui_x) + ", " + string(mouse_gui_y) + ")";
    
    // Check if mouse is inside the button bounds
    var inside_button = (mouse_gui_x >= button_x && mouse_gui_x <= button_x + button_w &&
                         mouse_gui_y >= button_y && mouse_gui_y <= button_h);

    if (inside_button) {
        draw_set_color(c_lime);
        mouse_debug_text += " [INSIDE]";
    } else {
        draw_set_color(c_red);
        mouse_debug_text += " [OUTSIDE]";
    }
    
    // Draw the debug text near the button
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(button_x, button_y + button_h + 10, mouse_debug_text);
    draw_set_color(c_white); // Reset color
}
