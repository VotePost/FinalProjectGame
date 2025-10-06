// Get mouse position and button positions
var _mouse_gui_x = device_mouse_x_to_gui(0);
var _mouse_gui_y = device_mouse_y_to_gui(0);
var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;
var _button_w = 200;
var _button_h = 50;
var _resume_x1 = _cx - (_button_w / 2);
var _resume_y1 = _cy - 40;
var _quit_x1 = _cx - (_button_w / 2);
var _quit_y1 = _cy + 40;
var _save_x1 = _cx - (_button_w / 2);
var _save_y1 = _cy + 120;
var _reset_x1 = _cx - (_button_w / 2);
var _reset_y1 = _cy + 200;

// Check for Mouse Clicks
if (mouse_check_button_pressed(mb_left)) {
    // RESUME button
    if (_mouse_gui_x > _resume_x1 && _mouse_gui_x < _resume_x1 + _button_w &&
        _mouse_gui_y > _resume_y1 && _mouse_gui_y < _resume_y1 + _button_h) {
        global.paused = false;
        instance_destroy();
    }

    // QUIT button
    if (_mouse_gui_x > _quit_x1 && _mouse_gui_x < _quit_x1 + _button_w &&
        _mouse_gui_y > _quit_y1 && _mouse_gui_y < _quit_y1 + _button_h) {
        game_end();
    }

    // SAVE button
    if (_mouse_gui_x > _save_x1 && _mouse_gui_x < _save_x1 + _button_w &&
        _mouse_gui_y > _save_y1 && _mouse_gui_y < _save_y1 + _button_h) {
        if (instance_exists(o_shop_controller)) {
            o_shop_controller.request_save = true;
        }
        show_save_message = true;
        alarm[0] = game_get_speed(gamespeed_fps);
    }

    // RESET ROOM button
    if (_mouse_gui_x > _reset_x1 && _mouse_gui_x < _reset_x1 + _button_w &&
        _mouse_gui_y > _reset_y1 && _mouse_gui_y < _reset_y1 + _button_h) {
        global.reset_room = true;   // Just set the flag!
        global.paused = false;
        instance_destroy();
    }
}