params ["_patient"];

if (!local _patient) exitWith {
    _patient setVariable ["DMA_oxyDebugLoopRunning", false, false];
};

while {
    alive _patient
    && {local _patient}
    && {hasInterface}
    && {player isEqualTo _patient}
    && {
        (_patient getVariable ["DMA_oxyAddicted", false])
        || {(_patient getVariable ["DMA_oxyWithdrawalDue", -1]) > 0}
        || {(_patient getVariable ["DMA_oxyWithdrawalDownActive", false])}
    }
} do {
    if !(missionNamespace getVariable ["DMA_oxyDebugEnabledCached", false]) then {
        hintSilent "";
        sleep 1;
        continue;
    };

    private _dueTime = _patient getVariable ["DMA_oxyWithdrawalDue", -1];
    private _timeLeft = (_dueTime - diag_tickTime) max 0;
    private _mins = floor (_timeLeft / 60);
    private _secs = floor (_timeLeft mod 60);
    private _secsText = if (_secs < 10) then {format ["0%1", _secs]} else {str _secs};

    private _state = "STABLE";
    if (_patient getVariable ["DMA_oxyWithdrawalDownActive", false]) then {
        _state = "UNCONSCIOUS";
    };

    private _nextText = format ["%1:%2", _mins, _secsText];
    if (_dueTime < 0) then {
        _nextText = "N/A";
    };

    hintSilent format [
        "OXY ADDICTION DEBUG\n\nEnabled: %1\nAddicted: %2\nState: %3\nNext Withdrawal: %4",
        ["NO", "YES"] select (missionNamespace getVariable ["DMA_oxyAddictionEnabledCached", true]),
        ["NO", "YES"] select (_patient getVariable ["DMA_oxyAddicted", false]),
        _state,
        _nextText
    ];

    sleep 1;
};

if (hasInterface && {player isEqualTo _patient}) then {
    hintSilent "";
};

_patient setVariable ["DMA_oxyDebugLoopRunning", false, false];
