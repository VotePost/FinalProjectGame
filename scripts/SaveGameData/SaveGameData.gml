function SaveGameData() {
    // Make sure this is spelled "ini_open"
    ini_open("savedata.ini");

    // --- Save Player and Shop State ---
    ini_write_real("PlayerData", "coins", global.coins);
    ini_write_real("PlayerData", "placementMode", 0); // or use 1 for true
    
    // --- Save Placed Objects ---
    var _count = instance_number(obj_furniture_parent);
    ini_write_real("PlacedObjects", "count", _count);

    for (var i = 0; i < _count; i++) {
        var _inst = instance_find(obj_furniture_parent, i);
        
        if (instance_exists(_inst)) {
            ini_write_string("PlacedObjects", "object" + string(i), object_get_name(_inst.object_index));
            ini_write_real("PlacedObjects", "x" + string(i), _inst.x);
            ini_write_real("PlacedObjects", "y" + string(i), _inst.y);
            ini_write_real("PlacedObjects", "scale" + string(i), _inst.image_xscale);
        }
    }

    ini_close();
    show_debug_message("--- Game Saved! ---");
}
