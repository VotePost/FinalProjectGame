// In obj_controller's STEP EVENT

// Check for the pause key press
if (keyboard_check_pressed(vk_escape)) {
    // Toggle the paused state
    global.paused = !global.paused;

    // If we just paused, create the menu. If we just unpaused, destroy it.
    if (global.paused) {
        instance_create_layer(0, 0, "Instances", obj_pause_menu);
    } else {
        instance_destroy(obj_pause_menu);
    }
}
if (global.reset_room) {
    with (obj_furniture_parent) { instance_destroy(); }
	with (obj_carpet) {
		instance_destroy();}
	with (obj_window) {
		instance_destroy();}
    // Optionally restore coins, respawn defaults, etc.
    global.reset_room = false;
}