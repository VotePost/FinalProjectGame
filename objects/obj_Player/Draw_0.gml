// Draw the player sprite (your usual code)
draw_sprite_ext(sprite_index, image_index, round(x), round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Draw red collision box (for debugging; matches Step math)
var collision_scale = 0.6;
var spr_w = sprite_get_width(sprite_index) * collision_scale;
var spr_h = sprite_get_height(sprite_index) * collision_scale;
var bb_left   = x - spr_w / 2;
var bb_right  = x + spr_w / 2;
var bb_top    = y - spr_h / 2;
var bb_bottom = y + spr_h / 2;

draw_set_color(c_red);
draw_rectangle(bb_left, bb_top, bb_right, bb_bottom, true);