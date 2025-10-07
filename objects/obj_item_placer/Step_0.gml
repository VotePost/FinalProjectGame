// --- Window vertical placement bounds ---
var min_y = 17;
var max_y = 60;

// Follow mouse
x = mouse_x;
y = mouse_y;

// --- SCALE WITH MOUSE WHEEL OR [ and ] KEYS ---
if (mouse_wheel_up() || keyboard_check_pressed(vk_rbracket)) current_scale += 0.1;
if (mouse_wheel_down() || keyboard_check_pressed(vk_lbracket)) current_scale -= 0.1;
if (current_scale < 0.1) current_scale = 0.1;

// --- FLIP WITH F ---
if (keyboard_check_pressed(ord("F"))) {
    flip_x *= -1;
}

// --- COLLISION CHECK FOR PLACEMENT (Bounding box method) ---
var spr_w = sprite_get_width(sprite_to_draw);
var spr_h = sprite_get_height(sprite_to_draw);
var box_left   = x - (spr_w * current_scale * abs(flip_x)) / 2;
var box_right  = x + (spr_w * current_scale * abs(flip_x)) / 2;
var box_top    = y - (spr_h * current_scale) / 2;
var box_bottom = y + (spr_h * current_scale) / 2;

// --- Placement permission ---
if (object_to_place == obj_window) {
    can_place = (mouse_y >= min_y) && (mouse_y <= max_y);
} else {
    can_place = !collision_rectangle(box_left, box_top, box_right, box_bottom, obj_furniture_parent, false, false);
}
ghost_color = can_place ? c_white : c_red;

// --- UPDATE GHOST VISUALS ---
image_xscale = current_scale * flip_x;
image_yscale = current_scale;

// --- CONFIRM PLACEMENT (Left-Click) ---
if (mouse_check_button_pressed(mb_left) && can_place) {
    global.coins -= item_price;
    var _inst = instance_create_layer(x, y, "Instances", object_to_place);
    _inst.image_xscale = image_xscale;
    _inst.image_yscale = image_yscale;
    instance_create_layer(x, y, "Effects", obj_place_effect);
    global.shop.placement_mode = false;
    instance_destroy();
}

// --- CANCEL PLACEMENT (Right-Click) ---
if (mouse_check_button_pressed(mb_right)) {
    global.shop.placement_mode = false;
    instance_destroy();
}

// --- Draw semi-transparent ghost preview with color feedback ---
draw_set_alpha(0.5);
draw_sprite_ext(sprite_to_draw, 0, x, y, current_scale * flip_x, current_scale, 0, ghost_color, 1);
draw_set_alpha(1.0);

// --- Draw Instructions (unchanged) ---
var _text = "Left-click to place | Right-click to cancel\nScroll wheel or [ and ] to resize | F to flip";
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_set_font(Font3);

// Draw a black box behind the text to make it readable
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(x - 120, y - 55, x + 120, y - 10, false);
draw_set_alpha(1.0);

// Draw the instructional text
draw_set_color(c_white);
draw_text(x, y - 0, _text);