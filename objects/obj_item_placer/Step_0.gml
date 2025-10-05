// Make the ghost object follow the mouse
x = mouse_x;
y = mouse_y;
// --- CHANGE SCALE WITH MOUSE WHEEL ---
// Scroll up to increase size
if (mouse_wheel_up()) {
    current_scale += 0.1;
}
// Scroll down to decrease size
if (mouse_wheel_down()) {
    current_scale -= 0.1;
}

// Prevent the scale from becoming zero or negative
if (current_scale < 0.1) {
    current_scale = 0.1;
}
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