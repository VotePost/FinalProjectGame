// Follow mouse
x = mouse_x;
y = mouse_y;

// --- SCALE WITH MOUSE WHEEL ---
if (mouse_wheel_up()) current_scale += 0.1;
if (mouse_wheel_down()) current_scale -= 0.1;
if (current_scale < 0.1) current_scale = 0.1;

// --- FLIP WITH F ---
if (keyboard_check_pressed(ord("F"))) {
    flip_x *= -1; // Toggle between 1 and -1
}

// --- UPDATE GHOST VISUALS ---
image_xscale = current_scale * flip_x;
image_yscale = current_scale;

// --- CONFIRM PLACEMENT (Left-Click) ---
if (mouse_check_button_pressed(mb_left)) {
    global.coins -= item_price;
    var _inst = instance_create_layer(x, y, "Instances", object_to_place);
    _inst.image_xscale = image_xscale; // Pass both scale and flip
    _inst.image_yscale = image_yscale;
    instance_create_layer(x, y, "Effects", obj_place_effect);
    global.shop.placement_mode = false;
    instance_destroy();
}

// --- CANCEL PLACEMENT (Right-Click) ---
if (mouse_check_button_pressed(mb_right)) {
    global.shop.placement_mode = false;
    instance_destroy();
}