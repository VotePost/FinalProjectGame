// Make the ghost object follow the mouse
x = mouse_x;
y = mouse_y;

// --- Confirm Placement (Left-Click) ---
if (mouse_check_button_pressed(mb_left)) {
    instance_create_layer(x, y, "Instances", object_to_place);
    global.shop.placement_mode = false;
    instance_destroy();
}

// --- Cancel Placement (Right-Click) ---
if (mouse_check_button_pressed(mb_right)) {
    global.shop.placement_mode = false;
    instance_destroy();
}