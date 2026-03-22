params ["_medic", "_patient", "_bodyPart", "", "", "_usedItem"];

[_medic, _patient, _bodyPart, "Methadone", objNull, _usedItem] call ace_medical_treatment_fnc_medication;
["DMA_oxyClearLocal", [_patient], _patient] call CBA_fnc_targetEvent;
