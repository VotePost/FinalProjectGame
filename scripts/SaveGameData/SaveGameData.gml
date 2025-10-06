function SaveGame() {
    // 1. You MUST open the file before you can write to it.
    ini_open("savedata.ini");

    // 2. Now you can write data.
    ini_write_real("PlayerData", "coins", global.coins);
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

    // 3. Close the file to finalize the save.
    ini_close();
    show_debug_message("--- Game Saved! ---");
}