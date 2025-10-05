// --- Draw Dimming Overlay ---
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1.0);

// --- Define Button Positions (centered) ---
var _cx = display_get_gui_width() / 2;
var _cy = display_get_gui_height() / 2;
var _button_w = 200;
var _button_h = 50;

// --- Draw Title ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(_cx, _cy - 100, "Paused");

// --- Draw Resume Button ---
var _resume_x = _cx;
var _resume_y = _cy - 40;
draw_set_color(c_dkgray);
draw_rectangle(_resume_x - (_button_w / 2), _resume_y, _resume_x + (_button_w / 2), _resume_y + _button_h, false);
draw_set_color(c_white);
draw_text(_resume_x, _resume_y + (_button_h / 2), "Resume");

// --- Draw Quit Button ---
var _quit_x = _cx;
var _quit_y = _cy + 40;
draw_set_color(c_dkgray);
draw_rectangle(_quit_x - (_button_w / 2), _quit_y, _quit_x + (_button_w / 2), _quit_y + _button_h, false);
draw_set_color(c_white);
draw_text(_quit_x, _quit_y + (_button_h / 2), "Quit");