params ["_medic", "_patient", "_bodyPart", "", "", "_usedItem"];

[_medic, _patient, _bodyPart, "Oxycodone", objNull, _usedItem] call ace_medical_treatment_fnc_medication;
["DMA_oxyDoseLocal", [_patient], _patient] call CBA_fnc_targetEvent;
