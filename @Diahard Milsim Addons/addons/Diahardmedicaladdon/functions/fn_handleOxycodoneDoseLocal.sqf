params ["_patient"];

if (!local _patient) exitWith {};
if !(missionNamespace getVariable ["DMA_oxyAddictionEnabledCached", true]) exitWith {};

private _isAddicted = _patient getVariable ["DMA_oxyAddicted", false];

if (!_isAddicted) then {
    private _chancePercent = missionNamespace getVariable ["DMA_oxyAddictionChanceCached", 10];
    private _chance = ((_chancePercent max 0) min 100) / 100;

    if ((random 1) < _chance) then {
        _patient setVariable ["DMA_oxyAddicted", true, true];

        if (hasInterface && {player isEqualTo _patient}) then {
            systemChat "Oxycodone makes the pain go away.";
        };
    }else{
		if (hasInterface && {player isEqualTo _patient}) then {
            systemChat "Oxycodone makes the pain go away.";
        };
	};
};

if !(_patient getVariable ["DMA_oxyAddicted", false]) exitWith {};

private _minTime = missionNamespace getVariable ["DMA_oxyWithdrawalMinTimeCached", 900];
private _maxTime = missionNamespace getVariable ["DMA_oxyWithdrawalMaxTimeCached", 1200];

if (_maxTime < _minTime) then {
    _maxTime = _minTime;
};

private _nextCycle = _minTime + floor (random ((_maxTime - _minTime) + 1));

_patient setVariable ["DMA_oxyWithdrawalDue", diag_tickTime + _nextCycle, true];
_patient setVariable ["DMA_oxyReminderStage", 0, false];

if !(_patient getVariable ["DMA_oxyLoopRunning", false]) then {
    private _token = (_patient getVariable ["DMA_oxyLoopToken", 0]) + 1;

    _patient setVariable ["DMA_oxyLoopToken", _token, false];
    _patient setVariable ["DMA_oxyLoopRunning", true, false];

    [_patient, _token] spawn DMA_fnc_oxyWithdrawalLoopLocal;
};

if (
    hasInterface
    && {player isEqualTo _patient}
    && {!(_patient getVariable ["DMA_oxyDebugLoopRunning", false])}
) then {
    _patient setVariable ["DMA_oxyDebugLoopRunning", true, false];
    [_patient] spawn DMA_fnc_oxyDebugDisplayLoopLocal;
};
