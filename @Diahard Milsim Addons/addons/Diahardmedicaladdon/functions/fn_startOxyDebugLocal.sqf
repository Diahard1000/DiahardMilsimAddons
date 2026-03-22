params ["_patient"];

if (!local _patient) exitWith {};
if !(hasInterface && {player isEqualTo _patient}) exitWith {};
if (_patient getVariable ["DMA_oxyDebugLoopRunning", false]) exitWith {};

_patient setVariable ["DMA_oxyDebugLoopRunning", true, false];
[_patient] spawn DMA_fnc_oxyDebugLoopLocal;
