// Make the ghost object follow the mouse
x = mouse_x;
y = mouse_y;

// --- CHANGE SCALE WITH MOUSE WHEEL ---
if (mouse_wheel_up()) {
    current_scale += 0.1;
}
if (mouse_wheel_down()) {
    current_scale -= 0.1;
}
if (current_scale < 0.1) {
    current_scale = 0.1;
}

// --- CONFIRM PLACEMENT (Left-Click) ---
if (mouse_check_button_pressed(mb_left)) {
	global.coins -= item_price;
    // Create the final object and store its ID
    var _inst = instance_create_layer(x, y, "Instances", object_to_place);

    // Pass the final scale to the new instance
    _inst.image_xscale = current_scale;
    _inst.image_yscale = current_scale;
	instance_create_layer(x, y, "Effects", obj_place_effect);
    // Tell the shop we are done placing
    global.shop.placement_mode = false;
    
    // Destroy this temporary ghost object
    instance_destroy();
}

// --- CANCEL PLACEMENT (Right-Click) ---
if (mouse_check_button_pressed(mb_right)) {
    // Tell the shop we are done placing
    global.shop.placement_mode = false;

    // Destroy this ghost object without placing anything
    instance_destroy();
}