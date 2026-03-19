[
    "DMA_oxyAddictionEnabled",
    "CHECKBOX",
    [
        "Enable oxycodone addiction",
        "Turns the oxycodone addiction system on or off."
    ],
    [
        "DMA Medical",
        "Medication"
    ],
    true,
    1,
    {
        params ["_value"];
        missionNamespace setVariable ["DMA_oxyAddictionEnabledCached", _value];

        if (!_value) then {
            ["DMA_oxyDisableSystemGlobal", []] call CBA_fnc_globalEvent;
        };
    }
] call CBA_fnc_addSetting;

[
    "DMA_oxyAddictionChance",
    "SLIDER",
    [
        "Oxycodone addiction chance",
        "Flat chance per oxycodone dose to create addiction."
    ],
    [
        "DMA Medical",
        "Medication"
    ],
    [0, 100, 10, 0, false],
    1,
    {
        params ["_value"];
        missionNamespace setVariable ["DMA_oxyAddictionChanceCached", _value];
    }
] call CBA_fnc_addSetting;

[
    "DMA_oxyWithdrawalMinTime",
    "SLIDER",
    [
        "Withdrawal minimum time (seconds)",
        "Minimum time before addiction causes unconsciousness."
    ],
    [
        "DMA Medical",
        "Medication"
    ],
    [0, 7200, 900, 0, false],
    1,
    {
        params ["_value"];
        missionNamespace setVariable ["DMA_oxyWithdrawalMinTimeCached", _value];
    }
] call CBA_fnc_addSetting;

[
    "DMA_oxyWithdrawalMaxTime",
    "SLIDER",
    [
        "Withdrawal maximum time (seconds)",
        "Maximum time before addiction causes unconsciousness."
    ],
    [
        "DMA Medical",
        "Medication"
    ],
    [0, 7200, 1200, 0, false],
    1,
    {
        params ["_value"];
        missionNamespace setVariable ["DMA_oxyWithdrawalMaxTimeCached", _value];
    }
] call CBA_fnc_addSetting;

[
    "DMA_oxyDebugEnabled",
    "CHECKBOX",
    [
        "Oxycodone addiction debug",
        "Shows the addiction timer and state on the local player."
    ],
    [
        "DMA Medical",
        "Debug"
    ],
    false,
    1,
    {
        params ["_value"];
        missionNamespace setVariable ["DMA_oxyDebugEnabledCached", _value];

        if (hasInterface && {!_value}) then {
            hintSilent "";
        };
    }
] call CBA_fnc_addSetting;

missionNamespace setVariable ["DMA_oxyAddictionEnabledCached", missionNamespace getVariable ["DMA_oxyAddictionEnabled", true]];
missionNamespace setVariable ["DMA_oxyAddictionChanceCached", missionNamespace getVariable ["DMA_oxyAddictionChance", 10]];
missionNamespace setVariable ["DMA_oxyWithdrawalMinTimeCached", missionNamespace getVariable ["DMA_oxyWithdrawalMinTime", 900]];
missionNamespace setVariable ["DMA_oxyWithdrawalMaxTimeCached", missionNamespace getVariable ["DMA_oxyWithdrawalMaxTime", 1200]];
missionNamespace setVariable ["DMA_oxyDebugEnabledCached", missionNamespace getVariable ["DMA_oxyDebugEnabled", false]];
