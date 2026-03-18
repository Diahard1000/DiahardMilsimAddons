class CfgWeapons
{
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class DMA_EmergencyTraumaDressing: ACE_ItemCore
    {
        scope = 2;
        scopeArsenal = 2;
        author = "Diahard1000";
        displayName = "Emergency Trauma Dressing";
        model = "\z\ace\addons\medical_treatment\data\bandage.p3d";
        picture = "\Diahardmedicaladdon\ui\icons\EmergencyTraumaDressing_ca.paa";
        descriptionShort = "Heavy trauma bandage for severe wounds.";
        descriptionUse = "Used to stabilize severe wounds and control major bleeding.";
        ACE_isMedicalItem = 1;

        class ItemInfo: CBA_MiscItem_ItemInfo
        {
            mass = 1;
        };
    };


    class DMA_Chitosan: ACE_ItemCore
    {
        scope = 2;
        scopeArsenal = 2;
        author = "Diahard1000";
        displayName = "Chitosan";
        model = "\z\ace\addons\medical_treatment\data\packingbandage.p3d";
        picture = "\Diahardmedicaladdon\ui\icons\chitosan_ca.paa";
        descriptionShort = "An applyable powder will only work on open wounds.";
        descriptionUse = "High emergency bleed control, but not very stable.";
        ACE_isMedicalItem = 1;

        class ItemInfo: CBA_MiscItem_ItemInfo
        {
            mass = 0.1;
        };
    };
};