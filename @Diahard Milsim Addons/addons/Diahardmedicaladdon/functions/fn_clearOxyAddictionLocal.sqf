params ["_patient", ["_restorePlayer", true]];

if (!local _patient) exitWith {};

_patient setVariable ["DMA_oxyAddicted", false, true];
_patient setVariable ["DMA_oxyWithdrawalDue", -1, true];
_patient setVariable ["DMA_oxyReminderStage", 0, false];
_patient setVariable ["DMA_oxyLoopRunning", false, false];
_patient setVariable ["DMA_oxyLoopId", (_patient getVariable ["DMA_oxyLoopId", 0]) + 1, false];
_patient setVariable ["DMA_oxyDebugLoopRunning", false, false];

if (_patient getVariable ["DMA_oxyWithdrawalArrestActive", false]) then {
    [_patient, false] call ace_medical_status_fnc_setCardiacArrestState;
    if (_restorePlayer) then {
        [_patient, false] call ace_medical_fnc_setUnconscious;
    };
};

_patient setVariable ["DMA_oxyWithdrawalArrestActive", false, true];

if (hasInterface && {player isEqualTo _patient}) then {
    hintSilent "";
    systemChat "Your oxycodone addiction has been treated.";
};
