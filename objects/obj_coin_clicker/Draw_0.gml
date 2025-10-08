//var base_scale = 0.6;
//var scale = (clicked_timer > 0) ? base_scale * 1.2 : base_scale;
//draw_sprite_ext(sprite_index, 0, x, y, scale, scale, 0, c_white, 1);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_set_color(c_fuchsia);

//// Use draw_text_ext for wrapping (max width 120 pixels)
//var text_offset_x = -90; // How far left from the coin (adjust as needed)
//var text_x = x + text_offset_x;
//var text_y = y;
//draw_text_ext(text_x, text_y, "Click to earn coins!", -1, 120);
if (global.coins < 1000) {
    // Draw clicker and instructional text as before
    var base_scale = 0.7;
    var scale = (clicked_timer > 0) ? base_scale * 1.2 : base_scale;
    draw_sprite_ext(sprite_index, 0, x, y, scale, scale, 0, c_white, 1);

    var text_offset_x = -50;
    draw_set_halign(fa_right);
    draw_set_valign(fa_middle);
    draw_set_color(c_fuchsia);
    draw_text_ext(x + text_offset_x, y, "Click to earn coins!", -1, 120);
} else {
    // Draw the "Open the Shop!" message instead
	var text_offset_x = -90;
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_lime);
    draw_text(x + text_offset_x, y, "You have enough coins!\nOpen the shop!");
}