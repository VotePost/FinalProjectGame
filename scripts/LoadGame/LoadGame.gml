function LoadGame() {
    var save_file = "savedata.ini"; // Define the exact same filename

    // Use the variable to check if the file exists
    if (!file_exists(save_file)) {
        show_debug_message("No save file found.");
        return; 
    }

    // Use the variable to open the file
    ini_open(save_file);

    // --- Load Player and Shop State ---
    global.coins = ini_read_real("PlayerData", "coins", 50);
    if (instance_exists(o_shop_controller)) {
        global.shop.placement_mode = ini_read_real("PlayerData", "placementMode", 0) == 1;
    }

    // --- Load Placed Objects ---
    with (obj_furniture_parent) {
        instance_destroy();
    }

    var _count = ini_read_real("PlacedObjects", "count", 0);
    for (var i = 0; i < _count; i++) {
        var _obj_name = ini_read_string("PlacedObjects", "object" + string(i), "");
        var _x = ini_read_real("PlacedObjects", "x" + string(i), 0);
        var _y = ini_read_real("PlacedObjects", "y" + string(i), 0);
        var _scale = ini_read_real("PlacedObjects", "scale" + string(i), 1);
        
        if (asset_get_type(_obj_name) == asset_object) {
            var _obj = asset_get_index(_obj_name);
            var _inst = instance_create_layer(_x, _y, "Instances", _obj);
            _inst.image_xscale = _scale;
            _inst.image_yscale = _scale;
        }
    }

    ini_close();
    show_debug_message("--- Game Loaded! ---");
}