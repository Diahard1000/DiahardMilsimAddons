params ["_target", "_player", "_params"];

if !(missionNamespace getVariable ["DMA_vls_enabled", true]) exitWith {false};
if (isNull _target) exitWith {false};
if !(_target isKindOf "LandVehicle" || {_target isKindOf "Air"} || {_target isKindOf "Ship"}) exitWith {false};

private _radius = missionNamespace getVariable ["DMA_vls_markerRadius", 25];
private _resolvedData = [_target] call DMA_fnc_resolveLoadoutAnchor;
_resolvedData params ["_resolved", "_anchorPos", "_modeText", "_matchInfo", "_matchCount", "_detailText"];

if (!_resolved) exitWith {
    if (missionNamespace getVariable ["DMA_vls_debug", false]) then {
        systemChat format [
            "DMA VLS DEBUG | Vehicle: %1 | Match: %2 | Pass: false",
            typeOf _target,
            _matchInfo
        ];
    };

    false
};

private _inside = (_target distance2D _anchorPos) <= _radius;

if (missionNamespace getVariable ["DMA_vls_debug", false]) then {
    systemChat format [
        "DMA VLS DEBUG | Vehicle: %1 | Source: %2 | Match: %3 | Count: %4 | Radius: %5 | Pass: %6",
        typeOf _target,
        _modeText,
        _matchInfo,
        _matchCount,
        _radius,
        _inside
    ];
};

_inside
