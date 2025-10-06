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

// --- UPDATE GHOST VISUALS ---
image_xscale = current_scale * flip_x;
image_yscale = current_scale;

// (rest of your code...)