function SaveGameData() {
    ini_open("savedata.ini");

    // --- Save Player and Shop State ---
    ini_write_real("PlayerData", "coins", global.coins);
    ini_write_real("PlayerData", "placementMode", 0);

    // --- Save Placed Objects (furniture, carpets, windows) ---
    var obj_types = [obj_furniture_parent, obj_carpet, obj_window];
    var total = 0;

    // Count total instances to save
    for (var t = 0; t < array_length(obj_types); t++) {
        total += instance_number(obj_types[t]);
    }
    ini_write_real("PlacedObjects", "count", total);

    // Save all instances
    var idx = 0;
    for (var t = 0; t < array_length(obj_types); t++) {
        var type = obj_types[t];
        var n = instance_number(type);
        for (var i = 0; i < n; i++) {
            var _inst = instance_find(type, i);
            if (instance_exists(_inst)) {
                ini_write_string("PlacedObjects", "object" + string(idx), object_get_name(_inst.object_index));
                ini_write_real("PlacedObjects", "x" + string(idx), _inst.x);
                ini_write_real("PlacedObjects", "y" + string(idx), _inst.y);
                ini_write_real("PlacedObjects", "scale" + string(idx), _inst.image_xscale);
                idx += 1;
            }
        }
    }

    ini_close();
    show_debug_message("--- Game Saved! ---");
}