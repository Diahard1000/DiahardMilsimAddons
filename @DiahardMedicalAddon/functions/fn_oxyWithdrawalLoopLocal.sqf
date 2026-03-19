params ["_patient", "_token"];

if (!local _patient) exitWith {
    _patient setVariable ["DMA_oxyLoopRunning", false, false];
};

private _getNextCycle = {
    private _minTime = missionNamespace getVariable ["DMA_oxyWithdrawalMinTimeCached", 900];
    private _maxTime = missionNamespace getVariable ["DMA_oxyWithdrawalMaxTimeCached", 1200];

    if (_maxTime < _minTime) then {
        _maxTime = _minTime;
    };

    _minTime + floor (random ((_maxTime - _minTime) + 1))
};

while {
    alive _patient
    && {local _patient}
    && {_patient getVariable ["DMA_oxyAddicted", false]}
    && {_token isEqualTo (_patient getVariable ["DMA_oxyLoopToken", -1])}
} do {
    private _dueTime = _patient getVariable ["DMA_oxyWithdrawalDue", -1];
    private _stage = _patient getVariable ["DMA_oxyReminderStage", 0];
    private _downActive = _patient getVariable ["DMA_oxyWithdrawalDownActive", false];
    private _isUnconscious = (lifeState _patient) isEqualTo "INCAPACITATED";

    // If the player has recovered by any means while still addicted, allow the next cycle.
    if (_downActive && {!_isUnconscious}) then {
        _patient setVariable ["DMA_oxyWithdrawalDownActive", false, true];
        _downActive = false;
    };

    // If no timer is armed and the player is not currently down from withdrawal, start a fresh cycle.
    if (_dueTime < 0 && {!_downActive}) then {
        _patient setVariable ["DMA_oxyWithdrawalDue", diag_tickTime + (call _getNextCycle), true];
        _patient setVariable ["DMA_oxyReminderStage", 0, false];
        sleep 1;
        continue;
    };

    if (_dueTime < 0) then {
        sleep 1;
        continue;
    };

    private _timeLeft = _dueTime - diag_tickTime;

    if (!_downActive && {hasInterface} && {player isEqualTo _patient}) then {
        if (_timeLeft <= 300 && {_stage < 1}) then {
            systemChat "You start to shake slightly, I could use another oxycodone.";
            _patient setVariable ["DMA_oxyReminderStage", 1, false];
            _stage = 1;
        };

        if (_timeLeft <= 120 && {_stage < 2}) then {
            systemChat "Another Oxycodone would go well right now..";
            _patient setVariable ["DMA_oxyReminderStage", 2, false];
            _stage = 2;
        };

        if (_timeLeft <= 30 && {_stage < 3}) then {
            systemChat "If I dont get another oxy ill die where is the oxy!.";
            _patient setVariable ["DMA_oxyReminderStage", 3, false];
            _stage = 3;
        };
    };

    if (_timeLeft <= 0 && {!_downActive}) then {
        [_patient, true] call ace_medical_fnc_setUnconscious;
        _patient setVariable ["DMA_oxyWithdrawalDownActive", true, true];
        _patient setVariable ["DMA_oxyWithdrawalDue", diag_tickTime + (call _getNextCycle), true];
        _patient setVariable ["DMA_oxyReminderStage", 0, false];

        if (hasInterface && {player isEqualTo _patient}) then {
            systemChat "You pass out from oxycodone withdrawal.";
        };
    };

    sleep 1;
};

if (_token isEqualTo (_patient getVariable ["DMA_oxyLoopToken", -1])) then {
    _patient setVariable ["DMA_oxyLoopRunning", false, false];
};
