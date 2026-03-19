["DMA_oxyDoseLocal", {
    _this call DMA_fnc_handleOxycodoneDoseLocal;
}] call CBA_fnc_addEventHandler;

["DMA_oxyClearLocal", {
    _this call DMA_fnc_clearOxycodoneAddictionLocal;
}] call CBA_fnc_addEventHandler;

["DMA_oxyDisableSystemGlobal", {
    {
        if (local _x) then {
            private _token = (_x getVariable ["DMA_oxyLoopToken", 0]) + 1;

            _x setVariable ["DMA_oxyAddicted", false, true];
            _x setVariable ["DMA_oxyWithdrawalDue", -1, true];
            _x setVariable ["DMA_oxyReminderStage", 0, false];
            _x setVariable ["DMA_oxyWithdrawalDownActive", false, true];
            _x setVariable ["DMA_oxyLoopToken", _token, false];
            _x setVariable ["DMA_oxyLoopRunning", false, false];
            _x setVariable ["DMA_oxyDebugLoopRunning", false, false];

            [_x, false] call ace_medical_fnc_setUnconscious;

            if (hasInterface && {player isEqualTo _x}) then {
                hintSilent "";
            };
        };
    } forEach allUnits;
}] call CBA_fnc_addEventHandler;
