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

can_place = !collision_rectangle(box_left, box_top, box_right, box_bottom, obj_furniture_parent, false, false);
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