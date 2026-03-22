[
    "DMA_vls_enabled",
    "CHECKBOX",
    ["Enable vehicle loadout setter", "Master switch for the vehicle loadout system."],
    ["DMA Vic Loadout", "General"],
    true,
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_useMarkerVarName",
    "CHECKBOX",
    ["Use marker variable name", "Checks for a marker by marker variable name / marker id."],
    ["DMA Vic Loadout", "Anchor Lookup"],
    true,
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_markerVarName",
    "EDITBOX",
    ["Marker variable name", "Marker variable name / marker id to use as a loadout anchor."],
    ["DMA Vic Loadout", "Anchor Lookup"],
    "VicLoadout",
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_useMarkerDisplayText",
    "CHECKBOX",
    ["Use marker display text", "Checks for markers whose visible text matches this value. Useful for Zeus-created resupply markers."],
    ["DMA Vic Loadout", "Anchor Lookup"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_markerDisplayText",
    "EDITBOX",
    ["Marker display text", "Visible text shown on the map marker."],
    ["DMA Vic Loadout", "Anchor Lookup"],
    "Resupply",
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_useObjectClass",
    "CHECKBOX",
    ["Use object class", "Checks for a nearby object of the configured classname."],
    ["DMA Vic Loadout", "Anchor Lookup"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_objectClass",
    "EDITBOX",
    ["Object class", "Object classname to use as a loadout anchor."],
    ["DMA Vic Loadout", "Anchor Lookup"],
    "",
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_markerRadius",
    "SLIDER",
    ["Loadout anchor radius", "Distance from any enabled anchor required to use the loadout action."],
    ["DMA Vic Loadout", "General"],
    [1, 100, 25, 0, false],
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_debug",
    "CHECKBOX",
    ["Enable debug", "Shows debug output for marker/object and action checks."],
    ["DMA Vic Loadout", "General"],
    false,
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_menu1_name",
    "EDITBOX",
    ["Menu 1 name", "Display name for submenu 1."],
    ["DMA Vic Loadout", "Menus"],
    "1 Platoon",
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_menu2_name",
    "EDITBOX",
    ["Menu 2 name", "Display name for submenu 2."],
    ["DMA Vic Loadout", "Menus"],
    "2 Platoon",
    1
] call CBA_fnc_addSetting;

[
    "DMA_vls_menu3_name",
    "EDITBOX",
    ["Menu 3 name", "Display name for submenu 3."],
    ["DMA Vic Loadout", "Menus"],
    "Other",
    1
] call CBA_fnc_addSetting;

for "_i" from 1 to 12 do {
    [
        format ["DMA_vls_action_%1_name", _i],
        "EDITBOX",
        [format ["Action %1 name", _i], format ["Display name for action %1.", _i]],
        ["DMA Vic Loadout", "Actions"],
        format ["Loadout %1", _i],
        1
    ] call CBA_fnc_addSetting;

    [
        format ["DMA_vls_action_%1_items", _i],
        "EDITBOX",
        [
            format ["Action %1 items", _i],
            "Enter item cargo as classname,count;classname,count with no spaces. Example: ACE_fieldDressing,20;ACE_morphine,8"
        ],
        ["DMA Vic Loadout", "Items"],
        "",
        1
    ] call CBA_fnc_addSetting;
};
