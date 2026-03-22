params ["_vehicle", "_actionIndex"];

if (isNull _vehicle) exitWith {};

clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

private _itemsText = missionNamespace getVariable [format ["DMA_vls_action_%1_items", _actionIndex], ""];
private _added = [];

if !(_itemsText isEqualTo "") then {
    {
        private _entry = _x;
        if !(_entry isEqualTo "") then {
            private _parts = _entry splitString ",";
            if ((count _parts) >= 2) then {
                private _className = _parts # 0;
                private _count = parseNumber (_parts # 1);

                if !(_className isEqualTo "") then {
                    if (_count > 0) then {
                        _vehicle addItemCargoGlobal [_className, _count];
                        _added pushBack format ["%1 x%2", _className, _count];
                    } else {
                        if (missionNamespace getVariable ["DMA_vls_debug", false]) then {
                            systemChat format ["DMA VLS DEBUG | Skipped invalid count for action %1 entry %2", _actionIndex, _entry];
                        };
                    };
                };
            } else {
                if (missionNamespace getVariable ["DMA_vls_debug", false]) then {
                    systemChat format ["DMA VLS DEBUG | Bad item entry for action %1: %2", _actionIndex, _entry];
                };
            };
        };
    } forEach (_itemsText splitString ";");
};

if (missionNamespace getVariable ["DMA_vls_debug", false]) then {
    systemChat format [
        "DMA VLS DEBUG | Applied action %1 to %2 | Added items: %3",
        _actionIndex,
        typeOf _vehicle,
        if ((count _added) > 0) then {_added joinString " | "} else {"None"}
    ];
};
