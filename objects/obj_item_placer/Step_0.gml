// Make the ghost object follow the mouse
x = mouse_x;
y = mouse_y;

// --- PLACE ITEM ---
// On left-click, create the permanent item and exit placement mode.
if (mouse_check_button_pressed(mb_left)) {
    // Create the final object at the current position
    instance_create_layer(x, y, "Instances", object_to_place);

    // Tell the shop controller that placement is finished
    obj_Shop.placement_mode = false;
    
    // Destroy this temporary ghost object
    instance_destroy();
}

// --- CANCEL PLACEMENT ---
// On right-click, cancel the placement.
if (mouse_check_button_pressed(mb_right)) {
    // Tell the shop controller that placement is finished
    obj_Shop.placement_mode = false;

    // Destroy this temporary ghost object without placing anything
    instance_destroy();
}