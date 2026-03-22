params ["_vehicle"];

private _radius = missionNamespace getVariable ["DMA_vls_markerRadius", 25];
private _resolvedData = [_vehicle] call DMA_fnc_resolveLoadoutAnchor;
_resolvedData params ["_resolved", "_anchorPos", "_modeText", "_matchInfo", "_matchCount", "_detailText"];

private _inside = false;
if (_resolved) then {
    _inside = (_vehicle distance2D _anchorPos) <= _radius;
};

hint format [
    "DMA Vic Loadout Debug\n\nVehicle: %1\nRadius: %2\nInside: %3\n\nSelected Source: %4\nSelected Match: %5\nMatch Count: %6\n\nMarker Variable Name: %7 | %8\nMarker Display Text: %9 | %10\nObject Class: %11 | %12\n\nDetails:\n%13\n\nAction item format:\nclassname,count;classname,count",
    typeOf _vehicle,
    _radius,
    _inside,
    _modeText,
    _matchInfo,
    _matchCount,
    ["OFF", "ON"] select (missionNamespace getVariable ["DMA_vls_useMarkerVarName", true]),
    missionNamespace getVariable ["DMA_vls_markerVarName", "VicLoadout"],
    ["OFF", "ON"] select (missionNamespace getVariable ["DMA_vls_useMarkerDisplayText", false]),
    missionNamespace getVariable ["DMA_vls_markerDisplayText", "Resupply"],
    ["OFF", "ON"] select (missionNamespace getVariable ["DMA_vls_useObjectClass", false]),
    missionNamespace getVariable ["DMA_vls_objectClass", ""],
    _detailText
];
