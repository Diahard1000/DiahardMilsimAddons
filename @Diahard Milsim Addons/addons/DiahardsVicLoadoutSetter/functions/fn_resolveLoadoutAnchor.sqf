params ["_target"];

private _radius = missionNamespace getVariable ["DMA_vls_markerRadius", 25];
private _candidates = [];
private _details = [];
private _enabledModes = [];

private _useMarkerVarName = missionNamespace getVariable ["DMA_vls_useMarkerVarName", true];
private _markerVarName = trim (missionNamespace getVariable ["DMA_vls_markerVarName", "VicLoadout"]);

private _useMarkerDisplayText = missionNamespace getVariable ["DMA_vls_useMarkerDisplayText", false];
private _markerDisplayText = trim (missionNamespace getVariable ["DMA_vls_markerDisplayText", "Resupply"]);

private _useObjectClass = missionNamespace getVariable ["DMA_vls_useObjectClass", false];
private _objectClass = trim (missionNamespace getVariable ["DMA_vls_objectClass", ""]);

if (_useMarkerVarName) then {
    _enabledModes pushBack "Marker Variable Name";

    if (_markerVarName isEqualTo "") then {
        _details pushBack "Marker Variable Name: enabled but value is empty";
    } else {
        if (_markerVarName in allMapMarkers) then {
            private _pos = getMarkerPos _markerVarName;
            private _dist = if (isNull _target) then {0} else {_target distance2D _pos};

            _candidates pushBack [
                "Marker Variable Name",
                _pos,
                format ["%1", _markerVarName],
                1,
                _dist
            ];

            _details pushBack format ["Marker Variable Name: matched %1", _markerVarName];
        } else {
            _details pushBack format ["Marker Variable Name: no match for %1", _markerVarName];
        };
    };
};

if (_useMarkerDisplayText) then {
    _enabledModes pushBack "Marker Display Text";

    if (_markerDisplayText isEqualTo "") then {
        _details pushBack "Marker Display Text: enabled but value is empty";
    } else {
        private _bestName = "";
        private _bestDist = 1e10;
        private _matchCount = 0;

        {
            if ((markerText _x) isEqualTo _markerDisplayText) then {
                _matchCount = _matchCount + 1;
                private _dist = if (isNull _target) then {0} else {_target distance2D (getMarkerPos _x)};

                if (_dist < _bestDist) then {
                    _bestDist = _dist;
                    _bestName = _x;
                };
            };
        } forEach allMapMarkers;

        if !(_bestName isEqualTo "") then {
            _candidates pushBack [
                "Marker Display Text",
                getMarkerPos _bestName,
                format ["%1 (marker id: %2)", _markerDisplayText, _bestName],
                _matchCount,
                _bestDist
            ];

            _details pushBack format ["Marker Display Text: matched %1 marker(s), using %2", _matchCount, _bestName];
        } else {
            _details pushBack format ["Marker Display Text: no match for %1", _markerDisplayText];
        };
    };
};

if (_useObjectClass) then {
    _enabledModes pushBack "Object Class";

    if (_objectClass isEqualTo "") then {
        _details pushBack "Object Class: enabled but value is empty";
    } else {
        if (isNull _target) then {
            _details pushBack "Object Class: target is null";
        } else {
            private _matches = nearestObjects [_target, [_objectClass], _radius, true];
            private _matchCount = count _matches;

            if (_matchCount > 0) then {
                private _anchorObj = _matches # 0;
                private _pos = getPosWorld _anchorObj;
                private _dist = _target distance2D _pos;

                _candidates pushBack [
                    "Object Class",
                    _pos,
                    format ["%1", typeOf _anchorObj],
                    _matchCount,
                    _dist
                ];

                _details pushBack format ["Object Class: matched %1 object(s), using %2", _matchCount, typeOf _anchorObj];
            } else {
                _details pushBack format ["Object Class: no nearby match for %1", _objectClass];
            };
        };
    };
};

if ((count _enabledModes) isEqualTo 0) exitWith {
    [false, [0,0,0], "None", "No lookup modes enabled", 0, "No lookup modes enabled"]
};

if ((count _candidates) isEqualTo 0) exitWith {
    [false, [0,0,0], "None", "No enabled anchor matched", 0, _details joinString "\n"]
};

private _bestCandidate = _candidates # 0;
{
    if ((_x # 4) < (_bestCandidate # 4)) then {
        _bestCandidate = _x;
    };
} forEach _candidates;

_bestCandidate params ["_modeText", "_anchorPos", "_matchInfo", "_matchCount", "_bestDist"];

[true, _anchorPos, _modeText, _matchInfo, _matchCount, _details joinString "\n"]
