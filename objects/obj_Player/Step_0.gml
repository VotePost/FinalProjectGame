if (global.paused) { return; }

move_speed = 2;
image_xscale = 4;
image_yscale = 4;

// 1. Gather input for movement
var key_left  = keyboard_check(ord("A")) || keyboard_check(vk_left);
var key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
var key_up    = keyboard_check(ord("W")) || keyboard_check(vk_up);
var key_down  = keyboard_check(ord("S")) || keyboard_check(vk_down);

// 2. Calculate intended movement
var hsp = (key_right - key_left) * move_speed;
var vsp = (key_down - key_up) * move_speed;

// 3. Calculate a custom collision box for the player
var collision_scale = 0.6; // Change this value to make the box bigger (1) or smaller (<1)
var spr_w = sprite_get_width(sprite_index) * collision_scale;
var spr_h = sprite_get_height(sprite_index) * collision_scale;

// If your sprite's origin is not centered, adjust the following math to compensate
var bb_left   = x - spr_w / 2;
var bb_right  = x + spr_w / 2;
var bb_top    = y - spr_h / 2;
var bb_bottom = y + spr_h / 2;

// 4. Sprite logic and flipping
if (vsp < 0) {
    sprite_index = spr_walkup;
    image_xscale = 4;
} else if (vsp > 0) {
    sprite_index = spr_walkdown;
    image_xscale = 4;
} else if (hsp != 0) {
    sprite_index = spr_walklr;
    image_xscale = hsp > 0 ? 4 : -4;
} else {
    sprite_index = spr_idle;
    image_xscale = 4;
}

// 5. Move horizontally with bounding box collision
if (hsp != 0) {
    if (!collision_rectangle(
        bb_left + hsp, bb_top,
        bb_right + hsp, bb_bottom,
        obj_furniture_parent, false, false))
    {
        x += hsp;
    }
}

// 6. Move vertically with bounding box collision
if (vsp != 0) {
    if (!collision_rectangle(
        bb_left, bb_top + vsp,
        bb_right, bb_bottom + vsp,
        obj_furniture_parent, false, false))
    {
        y += vsp;
    }
}

// 7. Room boundaries
if (y < 50)   y = 50;
if (y > 230)  y = 230;
if (x > 470)  x = 470;
if (x < 10)   x = 10;