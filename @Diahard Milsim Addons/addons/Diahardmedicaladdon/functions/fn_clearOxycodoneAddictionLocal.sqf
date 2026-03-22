params ["_patient"];

if (!local _patient) exitWith {};

private _token = (_patient getVariable ["DMA_oxyLoopToken", 0]) + 1;

_patient setVariable ["DMA_oxyAddicted", false, true];
_patient setVariable ["DMA_oxyWithdrawalDue", -1, true];
_patient setVariable ["DMA_oxyReminderStage", 0, false];
_patient setVariable ["DMA_oxyWithdrawalDownActive", false, true];
_patient setVariable ["DMA_oxyLoopToken", _token, false];
_patient setVariable ["DMA_oxyLoopRunning", false, false];
_patient setVariable ["DMA_oxyDebugLoopRunning", false, false];

[_patient, false] call ace_medical_fnc_setUnconscious;

if (hasInterface && {player isEqualTo _patient}) then {
    hintSilent "";
    systemChat "Methadone clears your oxycodone addiction.";
};
