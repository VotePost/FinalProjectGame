// Menu options
if (!variable_global_exists("menu_options")) {
    global.menu_options = ["Play", "Reset Save", "Quit"];
    global.menu_index = 0;
}

var btn_width = 240;
var btn_height = 48;
var btn_spacing = 24;
var menu_count = array_length(global.menu_options);

// Center X of room
var cx = room_width / 2;

// Y offset for menu (raise or lower menu on screen)
var menu_y_offset = 400; // Increase this to move menu lower (e.g., 300, 350)
var cy = menu_y_offset;

// Calculate total menu height
var total_height = menu_count * btn_height + (menu_count - 1) * btn_spacing;
var start_y = cy;

// Track mouse hover
hovered_index = -1;
for (var i = 0; i < menu_count; i++) {
    var btn_x = cx - btn_width / 2;
    var btn_y = start_y + i * (btn_height + btn_spacing);
    if (point_in_rectangle(mouse_x, mouse_y, btn_x, btn_y, btn_x + btn_width, btn_y + btn_height)) {
        hovered_index = i;
    }
}

// Keyboard navigation (Arrow keys and WASD)
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
    global.menu_index--;
    if (global.menu_index < 0) global.menu_index = menu_count - 1;
}
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
    global.menu_index++;
    if (global.menu_index >= menu_count) global.menu_index = 0;
}

// Mouse click or Enter/Space
var select = false;
if (mouse_check_button_pressed(mb_left)) {
    if (hovered_index != -1) {
        global.menu_index = hovered_index;
        select = true;
    }
}
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord(" "))) {
    select = true;
}

if (select) {
    switch (global.menu_index) {
        case 0:
            room_goto(Room1); // Your play room
            break;
        case 1:
    if (show_question("Are you sure you want to reset all save data?")) {
        if (file_exists("savedata.ini")) {
            file_delete("savedata.ini");
        }
        show_message("Save data has been reset!\nThe game will now restart.");
        game_restart();
    }
    break;
        case 2:
            game_end();
            break;
    }
}