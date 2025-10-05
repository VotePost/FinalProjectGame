// ## 1. Define the TRUE native resolution for your pixel art game
var view_width = 480;
var view_height = 270;

// ## 2. Set the camera to this native resolution
camera_set_view_size(view_get_camera(0), view_width, view_height);

// ## 3. Get the size of the player's monitor
var display_width = display_get_width();
var display_height = display_get_height();

// ## 4. Calculate the best INTEGER scale factor to fit the monitor
var scale = min(floor(display_width / view_width), floor(display_height / view_height));

// ## 5. Calculate the final window size based on the perfect scale
var window_width = view_width * scale;
var window_height = view_height * scale;

// ## 6. Apply the final size to the window and the drawing surface
window_set_size(window_width, window_height);
surface_resize(application_surface, window_width, window_height);

// ## 7. Center the window on the screen
window_center();
global.coins = 50;
global.paused = false;