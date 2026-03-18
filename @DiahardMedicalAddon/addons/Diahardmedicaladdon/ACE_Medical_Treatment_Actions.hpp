class ACE_Medical_Treatment_Actions
{
    class BasicBandage;

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
};