// --- Shop State ---
shop_open = false;
menu_index = 0; // Tracks the currently selected item

// --- Shop Button GUI ---
button_x = 20;
button_y = 20;
button_w = 140;
button_h = 40;

// --- Shop Window GUI ---
// Center the window on the screen
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _window_w = 480;
var _window_h = 400;

window_x = (_gw / 2) - (_window_w / 2);
window_y = (_gh / 2) - (_window_h / 2);
window_w = _window_w;
window_h = _window_h;

// --- Shop Grid GUI ---
columns = 3;
item_size = 100; // The width and height of each item's box
grid_padding = 20; // Space between items

// Calculate where the grid starts inside the window
grid_start_x = window_x + 40;
grid_start_y = window_y + 80;

// --- Shop Items (Using Structs) ---
shop_items = [
    { name: "Cozy Couch", price: 150, sprite: spr_placeholder },
    { name: "Desk Lamp", price: 45, sprite: spr_placeholder },
    { name: "Wooden Table", price: 90, sprite: spr_placeholder },
    { name: "King Bed", price: 500, sprite: spr_placeholder },
    { name: "Small Rug", price: 25, sprite: spr_placeholder },
    { name: "Floor Lamp", price: 30, sprite: spr_placeholder },
    { name: "Coffee Table", price: 60, sprite: spr_placeholder },
    { name: "Bookshelf", price: 120, sprite: spr_placeholder }
];


placement_mode = false;