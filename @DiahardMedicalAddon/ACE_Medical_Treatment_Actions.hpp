class ACE_Medical_Treatment_Actions
{
    class BasicBandage;
    class Morphine;

    class EmergencyTraumaDressing: BasicBandage
    {
        displayName = "Apply Emergency Trauma Dressing";
        displayNameProgress = "Applying Emergency Trauma Dressing";
        items[] = {"DMA_EmergencyTraumaDressing"};
        treatmentTime = 4;
        allowSelfTreatment = 0;
    };

    class Chitosan: BasicBandage
    {
        displayName = "Apply Chitosan powder on wound";
        displayNameProgress = "Pouring Chitosan powder";
        items[] = {"DMA_Chitosan"};
        treatmentTime = 2;
        allowSelfTreatment = 0;
    };

    class Oxycodone: Morphine
    {
        displayName = "Take Oxycodone";
        displayNameProgress = "Popping Pills";
        allowedSelections[] = {"Head"};
        medicRequired = 0;
        items[] = {"DMA_Oxycodone"};
        treatmentTime = 2;
        callbackSuccess = "DMA_fnc_medicationOxycodone";
    };

    class Methadone: Morphine
    {
        displayName = "Inject Methadone";
        displayNameProgress = "Injecting Methadone";
        allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg", "Body"};
        medicRequired = 0;
        items[] = {"DMA_Methadone"};
        treatmentTime = 2;
        callbackSuccess = "DMA_fnc_medicationMethadone";
    };
};