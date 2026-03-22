private _mainAction = [
    "DMA_VLS_Main",
    "Vehicle Loadout",
    "",
    {},
    {[_target, _player, _params] call DMA_fnc_canUseLoadoutStation}
] call ace_interact_menu_fnc_createAction;

["AllVehicles", 0, ["ACE_MainActions"], _mainAction, true] call ace_interact_menu_fnc_addActionToClass;

for "_menuIndex" from 1 to 3 do {
    private _menuAction = [
        format ["DMA_VLS_Menu_%1", _menuIndex],
        missionNamespace getVariable [format ["DMA_vls_menu%1_name", _menuIndex], format ["Menu %1", _menuIndex]],
        "",
        {},
        {[_target, _player, _params] call DMA_fnc_canUseLoadoutStation}
    ] call ace_interact_menu_fnc_createAction;

    ["AllVehicles", 0, ["ACE_MainActions", "DMA_VLS_Main"], _menuAction, true] call ace_interact_menu_fnc_addActionToClass;
};

for "_actionIndex" from 1 to 12 do {
    private _menuIndex = ceil (_actionIndex / 4);

    private _action = [
        format ["DMA_VLS_Action_%1", _actionIndex],
        missionNamespace getVariable [format ["DMA_vls_action_%1_name", _actionIndex], format ["Loadout %1", _actionIndex]],
        "",
        {
            params ["_target", "_player", "_params"];
            _params params ["_actionIndex"];
            [_target, _actionIndex] call DMA_fnc_applyLoadout;
        },
        {[_target, _player, _params] call DMA_fnc_canUseLoadoutStation},
        {},
        [_actionIndex]
    ] call ace_interact_menu_fnc_createAction;

    ["AllVehicles", 0, ["ACE_MainActions", "DMA_VLS_Main", format ["DMA_VLS_Menu_%1", _menuIndex]], _action, true] call ace_interact_menu_fnc_addActionToClass;
};

private _debugAction = [
    "DMA_VLS_Debug",
    "Debug Info",
    "",
    {
        [_target] call DMA_fnc_openDebugInfo;
    },
    {missionNamespace getVariable ["DMA_vls_debug", false]}
] call ace_interact_menu_fnc_createAction;

["AllVehicles", 0, ["ACE_MainActions", "DMA_VLS_Main"], _debugAction, true] call ace_interact_menu_fnc_addActionToClass;
