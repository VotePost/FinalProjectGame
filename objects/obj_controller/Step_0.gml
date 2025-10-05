// Check for the pause key press
if (keyboard_check_pressed(vk_escape)) {
    // Check if the game is already paused
    if (global.paused) {
        // --- UNPAUSE THE GAME ---
        global.paused = false;
        instance_activate_all(); // Un-freeze everything
        instance_destroy(obj_pause_menu); // Destroy the menu
    } else {
        // --- PAUSE THE GAME ---
        global.paused = true;
        instance_deactivate_all(true); // Freeze everything except this object
        instance_create_layer(0, 0, "Instances", obj_pause_menu); // Create the menu
    }
}