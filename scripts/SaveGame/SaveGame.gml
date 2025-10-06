// The function now accepts the placement_mode state as an argument
function SaveGame() {
    ini_open("savedata.ini");
	var save_path = "save.ini";
	ini_open(save_path);

    // --- Save Player and Shop State ---
    ini_write_real("PlayerData", "coins", global.coins);
    // It now saves the value that was passed into it
    ini_write_bool("PlayerData", "placementMode", false);
    
    // --- Save Placed Objects ---
    var _count = instance_number(obj_furniture_parent);
    ini_write_real("PlacedObjects", "count", _count);

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