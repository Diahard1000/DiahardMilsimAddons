params ["_patient"];

if (!local _patient) exitWith {
    _patient setVariable ["DMA_oxyDebugLoopRunning", false, false];
};

while {
    alive _patient
    && {local _patient}
    && {hasInterface}
    && {player isEqualTo _patient}
} do {
    if !(missionNamespace getVariable ["DMA_oxyDebugEnabledCached", false]) then {
        hintSilent "";
        sleep 1;
        continue;
    };

    private _enabled = missionNamespace getVariable ["DMA_oxyAddictionEnabledCached", true];
    private _addicted = _patient getVariable ["DMA_oxyAddicted", false];
    private _arrestActive = _patient getVariable ["DMA_oxyWithdrawalArrestActive", false];
    private _dueTime = _patient getVariable ["DMA_oxyWithdrawalDue", -1];
    private _timeLeft = if (_dueTime < 0) then {0} else {(_dueTime - diag_tickTime) max 0};
    private _mins = floor (_timeLeft / 60);
    private _secs = floor (_timeLeft mod 60);
    private _secsText = if (_secs < 10) then {format ["0%1", _secs]} else {str _secs};
    private _state = "STABLE";

    if (_arrestActive) then {
        _state = "WITHDRAWAL DOWN";
    };

    if (!_addicted) then {
        _state = "NOT ADDICTED";
    };

    hintSilent format [
        "OXY ADDICTION DEBUG\n\nSystem Enabled: %1\nAddicted: %2\nState: %3\nNext Withdrawal: %4:%5",
        ["NO", "YES"] select _enabled,
        ["NO", "YES"] select _addicted,
        _state,
        _mins,
        _secsText
    ];

    sleep 1;
};

if (hasInterface && {player isEqualTo _patient}) then {
    hintSilent "";
};

_patient setVariable ["DMA_oxyDebugLoopRunning", false, false];
