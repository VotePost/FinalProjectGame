global.shop = id; // Store this specific instance's ID in a global variable

// --- Shop State ---
shop_open = false;
placement_mode = false;
menu_index = 0;
request_save = false;
// --- Shop Window GUI ---
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
item_size = 100;
grid_padding = 20;
grid_start_x = window_x + 40;
grid_start_y = window_y + 80;

// --- Define All Your Shop Items Here ---
shop_items = [
    { name: "Couch",   price: 100, sprite: spr_couch,   object: obj_couch },
    { name: "Chair",   price: 25,  sprite: spr_chair,   object: obj_chair },
    { name: "Piano",   price: 250, sprite: spr_piano,   object: obj_piano },
    { name: "Cabinet", price: 100, sprite: spr_cabinet, object: obj_cabinet },
    { name: "Clock",   price: 75,  sprite: spr_clock,   object: obj_clock },
    { name: "Window",  price: 200, sprite: spr_window,  object: obj_window },
	{ name: "Carpet", price: 10, sprite: spr_carpet, object: obj_carpet},
	{ name: "Bed", price: 200, sprite: spr_bed, object: obj_bed}
];