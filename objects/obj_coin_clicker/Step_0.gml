if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        global.coins += 1; // or any amount you want per click
        // Optional: play a sound or animation
    }
}