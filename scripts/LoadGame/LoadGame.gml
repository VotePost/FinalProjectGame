function LoadGame() {
    if (!file_exists("savedata.ini")) {
        show_debug_message("No save file found.");
        return; 
    }

    ini_open("savedata.ini");

    // --- Load Player and Shop State ---
    global.coins = ini_read_real("PlayerData", "coins", 50);
    // Make sure the shop exists before trying to set its variable
    if (instance_exists(obj_shop)) {
        global.shop.placement_mode = ini_read_bool("PlayerData", "placementMode", false);
    }
    show_debug_message("Loading " + string(global.coins) + " coins.");

    // --- Load Placed Objects ---
    with (obj_furniture_parent) {
        instance_destroy();
    }

    var _count = ini_read_real("PlacedObjects", "count", 0);
    show_debug_message("Found " + string(_count) + " furniture items to load.");
    
    for (var i = 0; i < _count; i++) {
        var _obj_name = ini_read_string("PlacedObjects", "object" + string(i), "");
        var _obj = asset_get_index(_obj_name);
        var _x = ini_read_real("PlacedObjects", "x" + string(i), 0);
        var _y = ini_read_real("PlacedObjects", "y" + string(i), 0);
        var _scale = ini_read_real("PlacedObjects", "scale" + string(i), 1);
        
        if (object_exists(_obj)) {
            var _inst = instance_create_layer(_x, _y, "Instances", _obj);
            _inst.image_xscale = _scale;
            _inst.image_yscale = _scale;
        }
    }

    ini_close();
    show_debug_message("--- Game Loaded! ---");
}