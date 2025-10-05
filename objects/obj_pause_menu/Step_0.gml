// Get mouse position on the GUI
var _mouse_gui_x = device_mouse_x_to_gui(0);
var _mouse_gui_y = device_mouse_y_to_gui(0);

// --- Define Button Positions (centered) ---
var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;
var _button_w = 200;
var _button_h = 50;

// Position for the "Resume" button
var _resume_x1 = _cx - (_button_w / 2);
var _resume_y1 = _cy - 40;

// Position for the "Quit" button
var _quit_x1 = _cx - (_button_w / 2);
var _quit_y1 = _cy + 40;

// --- Check for Mouse Clicks ---
if (mouse_check_button_pressed(mb_left)) {
    // Check for RESUME click
    if (_mouse_gui_x > _resume_x1 && _mouse_gui_x < _resume_x1 + _button_w &&
        _mouse_gui_y > _resume_y1 && _mouse_gui_y < _resume_y1 + _button_h) {

        // Un-pause the game
        global.paused = false;
        instance_activate_all();
        instance_destroy(); // Destroy the pause menu
    }

    // Check for QUIT click
    if (_mouse_gui_x > _quit_x1 && _mouse_gui_x < _quit_x1 + _button_w &&
        _mouse_gui_y > _quit_y1 && _mouse_gui_y < _quit_y1 + _button_h) {

        game_end(); // End the game
    }
}