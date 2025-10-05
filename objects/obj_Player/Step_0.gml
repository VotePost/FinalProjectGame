//if (keyboard_check(ord("A")))
//{
//    x = x - 2;
//}
//if (keyboard_check(ord("D")))
//{
//    x = x + 2;
//}
//if (keyboard_check(ord("W")))
//{
//    y = y - 2;
//}
//if (keyboard_check(ord("S")))
//{
//    y = y + 2;
//}
// ## 1. Get Player Input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));

// ## 2. Calculate Movement
if (key_up)
{
    y = y - move_speed;
    sprite_index = spr_walkup;
    image_xscale = 1; // <-- ADD THIS to reset flip
}
else if (key_down)
{
    y = y + move_speed;
    sprite_index = spr_walkdown;
    image_xscale = 1; // <-- ADD THIS to reset flip
}
else if (key_left)
{
    x = x - move_speed;
    sprite_index = spr_walklr;
    image_xscale = -1; // Flip sprite to the left
}
else if (key_right)
{
    x = x + move_speed;
    sprite_index = spr_walklr;
    image_xscale = 1; // Face sprite to the right
}
else
{
    // ## 3. Handle Idle State
    sprite_index = spr_idle;
    image_xscale = 1; // <-- ADD THIS to reset flip
}
if (y < 18)
{
    y = 18;
}
if (y > 190)
{
	y = 190
}
if (x > 470)
{
	x = 470
}
if (x < 10)
{
	x = 10
}