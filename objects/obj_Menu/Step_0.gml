// Navigate menu
if (keyboard_check_pressed(vk_up)) {
    menu_index--;
    if (menu_index < 0) menu_index = array_length(menu_options) - 1;
}

if (keyboard_check_pressed(vk_down)) {
    menu_index++;
    if (menu_index >= array_length(menu_options)) menu_index = 0;
}

// Select option
if (keyboard_check_pressed(vk_enter)) {
    switch (menu_index) {
        case 0:
            room_goto(Room1); // replace with your gameplay room
            break;
        case 1:
            // Options could be another room or popup
            room_goto(rm_options); // optional
            break;
        case 2:
            game_end(); // Quit the game
            break;
    }
}
