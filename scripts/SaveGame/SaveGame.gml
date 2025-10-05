function SaveGame() {
    ini_open("savedata.ini");

    // --- Save Player and Shop State ---
    ini_write_real("PlayerData", "coins", global.coins);
    ini_write_bool("PlayerData", "placementMode", global.shop.placement_mode);
    show_debug_message("Saving " + string(global.coins) + " coins.");
    
    // --- Save Placed Objects ---
    var _count = instance_number(obj_furniture_parent);
    ini_write_real("PlacedObjects", "count", _count);
    show_debug_message("Found " + string(_count) + " furniture items to save.");

    // Loop through every piece of furniture and save its data
    for (var i = 0; i < _count; i++) {
        var _inst = instance_find(obj_furniture_parent, i);
        
        ini_write_string("PlacedObjects", "object" + string(i), object_get_name(_inst.object_index));
        ini_write_real("PlacedObjects", "x" + string(i), _inst.x);
        ini_write_real("PlacedObjects", "y" + string(i), _inst.y);
        ini_write_real("PlacedObjects", "scale" + string(i), _inst.image_xscale);
    }

    ini_close();
    show_debug_message("--- Game Saved! ---");
}