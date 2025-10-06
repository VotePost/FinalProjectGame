// --- 1. Draw the Dimming Overlay FIRST ---
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1.0);

// --- 2. Draw the Buttons and Title SECOND ---
var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;
var _button_w = 200;
var _button_h = 50; 

var _reset_x1 = _cx - (_button_w / 2);
var _reset_y1 = _cy + 200;

// Now you can safely draw the button:
draw_set_color(c_white);
draw_rectangle(_reset_x1, _reset_y1, _reset_x1 + _button_w, _reset_y1 + _button_h, false);
draw_text(_reset_x1 + _button_w/2, _reset_y1 + _button_h/2, "Reset Room");
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(_cx, _cy - 100, "Paused");

// Draw Resume Button
var _resume_y = _cy - 40;
draw_set_color(c_dkgray);
draw_rectangle(_cx - (_button_w / 2), _resume_y, _cx + (_button_w / 2), _resume_y + _button_h, false);
draw_set_color(c_white);
draw_text(_cx, _resume_y + (_button_h / 2), "Resume");
    
// Draw Quit Button
var _quit_y = _cy + 40;
draw_set_color(c_dkgray);
draw_rectangle(_cx - (_button_w / 2), _quit_y, _cx + (_button_w / 2), _quit_y + _button_h, false);
draw_set_color(c_white);
draw_text(_cx, _quit_y + (_button_h / 2), "Quit");

// Draw Save Button
var _save_y = _cy + 120;
draw_set_color(c_dkgray);
draw_rectangle(_cx - (_button_w / 2), _save_y, _cx + (_button_w / 2), _save_y + _button_h, false);
draw_set_color(c_white);
draw_text(_cx, _save_y + (_button_h / 2), "Save Game");

// --- 3. Draw the "Saving..." Message LAST ---
if (show_save_message) {
    var _box_w = 200;
    var _box_h = 50;
    var _y = display_get_gui_height() - 70;
    
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(_cx - (_box_w / 2), _y, _cx + (_box_w / 2), _y + _box_h, false);
    draw_set_alpha(1.0);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(_cx, _y + (_box_h / 2), "Saving...");
}
draw_set_color(c_dkgray);
draw_rectangle(_reset_x1, _reset_y1, _reset_x1 + _button_w, _reset_y1 + _button_h, false);
draw_set_color(c_white);
draw_text(_reset_x1 + _button_w/2, _reset_y1 + _button_h/2, "Reset Room");