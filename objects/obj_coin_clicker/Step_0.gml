// Step Event
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    global.coins += 10;
    clicked_timer = 5;
    audio_play_sound(snd_coin, 1, false);
}
if (clicked_timer > 0) clicked_timer--;
// Only allow clicking if less than 1000 coins
if (global.coins < 1000) {
    if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
        global.coins += 1;
        clicked_timer = 5;
        audio_play_sound(snd_coin, 1, false);
    }
    if (clicked_timer > 0) clicked_timer--;
} else {
    // Optionally, destroy the clicker object so it disappears:
    //instance_destroy();
}