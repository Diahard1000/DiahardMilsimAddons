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
        displayName = "Chitosan Powder";
        model = "\z\ace\addons\medical_treatment\data\packingbandage.p3d";
        picture = "\Diahardmedicaladdon\ui\icons\chitosan_ca.paa";
        descriptionShort = "An applyable powder that only works on open wounds.";
        descriptionUse = "High emergency bleed control, but not very stable.";
        ACE_isMedicalItem = 1;

        class ItemInfo: CBA_MiscItem_ItemInfo
        {
            mass = 0.1;
        };
    };

	class DMA_Oxycodone: ACE_ItemCore
	{
		scope = 2;
        scopeArsenal = 2;
        author = "Diahard1000";
        displayName = "Oxycodone Pill";
        model = "\z\ace\addons\medical_treatment\data\bandage.p3d";
        picture = "\Diahardmedicaladdon\ui\icons\Oxycodone_ca.paa";
        descriptionShort = "A single pill of Oxycodone Used to treat mild pain";
        descriptionUse = "A single pill of Oxycodone can cause addiction.";
        ACE_isMedicalItem = 1;

        class ItemInfo: CBA_MiscItem_ItemInfo
        {
            mass = 0.1;
        };
	};
	
	class DMA_Methadone: ACE_ItemCore
	{
		scope = 2;
        scopeArsenal = 2;
        author = "Diahard1000";
        displayName = "Methadone Auto Injector";
        model = "\z\ace\addons\medical_treatment\data\bandage.p3d";
        picture = "\Diahardmedicaladdon\ui\icons\AutoInjector_ca.paa";
        descriptionShort = "Used to treat addiction from opiods and wake someone up, Increases Heart Rate";
        descriptionUse = "Used to treat addictions and increased Heart Rate";
        ACE_isMedicalItem = 1;

        class ItemInfo: CBA_MiscItem_ItemInfo
        {
            mass = 0.5;
        };
	};
};
