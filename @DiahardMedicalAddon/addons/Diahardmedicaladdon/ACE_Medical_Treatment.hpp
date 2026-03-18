class ACE_Medical_Treatment
{
    class Bandaging
    {
        class FieldDressing;

        class EmergencyTraumaDressing: FieldDressing
        {
            effectiveness = 5;
            reopeningChance = 0.15;
            reopeningMinDelay = 400;
            reopeningMaxDelay = 1200;

            class Abrasion
            {
                effectiveness = 4;
                reopeningChance = 0.2;
            };
            class AbrasionMinor: Abrasion {};
            class AbrasionMedium: Abrasion
            {
                effectiveness = 3.5;
                reopeningChance = 0.35;
            };
            class AbrasionLarge: Abrasion
            {
                effectiveness = 3;
                reopeningChance = 0.45;
            };

            class Avulsion
            {
                effectiveness = 5;
                reopeningChance = 0.25;
            };
            class AvulsionMinor: Avulsion {
                effectiveness = 20;
                reopeningChance = 0.35;
            };
            class AvulsionMedium: Avulsion
            {
                effectiveness = 10;
                reopeningChance = 0.35;
            };
            class AvulsionLarge: Avulsion
            {
                effectiveness = 5;
                reopeningChance = 0.45;
            };

            class Contusion
            {
                effectiveness = 2;
                reopeningChance = 0;
                reopeningMinDelay = 0;
                reopeningMaxDelay = 0;
            };
            class ContusionMinor: Contusion {};
            class ContusionMedium: Contusion {};
            class ContusionLarge: Contusion {};

            class Crush
            {
                effectiveness = 2;
                reopeningChance = 0.25;
            };
            class CrushMinor: Crush {};
            class CrushMedium: Crush
            {
                effectiveness = 1.7;
                reopeningChance = 0.35;
            };
            class CrushLarge: Crush
            {
                effectiveness = 1.5;
                reopeningChance = 0.45;
            };

            class Cut
            {
                effectiveness = 5;
                reopeningChance = 0.15;
            };
            class CutMinor: Cut {};
            class CutMedium: Cut
            {
                effectiveness = 4;
                reopeningChance = 0.25;
            };
            class CutLarge: Cut
            {
                effectiveness = 2.5;
                reopeningChance = 0.35;
            };

            class Laceration
            {
                effectiveness = 2;
                reopeningChance = 0.35;
            };
            class LacerationMinor: Laceration {};
            class LacerationMedium: Laceration
            {
                effectiveness = 1.7;
                reopeningChance = 0.45;
            };
            class LacerationLarge: Laceration
            {
                effectiveness = 1.4;
                reopeningChance = 0.55;
            };

            class VelocityWound
            {
                effectiveness = 2.5;
                reopeningChance = 0.4;
            };
            class VelocityWoundMinor: VelocityWound {
				effectiveness = 5;
                reopeningChance = 0.5;
			};
            class VelocityWoundMedium: VelocityWound
            {
                effectiveness = 5;
                reopeningChance = 0.5;
            };
            class VelocityWoundLarge: VelocityWound
            {
                effectiveness = 5;
                reopeningChance = 0.6;
            };

            class PunctureWound
            {
                effectiveness = 5;
                reopeningChance = 0.3;
            };
            class PunctureWoundMinor: PunctureWound {};
            class PunctureWoundMedium: PunctureWound
            {
                effectiveness = 5;
                reopeningChance = 0.4;
            };
            class PunctureWoundLarge: PunctureWound
            {
                effectiveness = 5;
                reopeningChance = 0.5;
            };
        };

        class Chitosan: FieldDressing
        {
            effectiveness = 7;
            reopeningChance = 0.8;
            reopeningMinDelay = 30;
            reopeningMaxDelay = 60;
            class Abrasion{};
            class AbrasionMinor: Abrasion {};
            class AbrasionMedium: Abrasion{};
            class AbrasionLarge: Abrasion{};
            class Avulsion
            {
                effectiveness = 7;
                reopeningChance = 1;
            };
            class AvulsionMinor: Avulsion {
				effectiveness = 7;
                reopeningChance = 1;
			};
            class AvulsionMedium: Avulsion
            {
                effectiveness = 7;
                reopeningChance = 1;
            };
            class AvulsionLarge: Avulsion
            {
                effectiveness = 7;
                reopeningChance = 1;
            };

            class Contusion{};
            class ContusionMinor: Contusion {};
            class ContusionMedium: Contusion {};
            class ContusionLarge: Contusion {};
            class Crush{};
            class CrushMinor: Crush {};
            class CrushMedium: Crush{};
            class CrushLarge: Crush{};
            class Cut{};
            class CutMinor: Cut {};
            class CutMedium: Cut{};
            class CutLarge: Cut{};
            class Laceration{};
            class LacerationMinor: Laceration {};
            class LacerationMedium: Laceration{};
            class LacerationLarge: Laceration{};
            class VelocityWound{               
				effectiveness = 7;
                reopeningChance = 1;};
            class VelocityWoundMinor: VelocityWound {         
				effectiveness = 7;
                reopeningChance = 1;};
            class VelocityWoundMedium: VelocityWound{              
				effectiveness = 7;
                reopeningChance = 1;};
            class VelocityWoundLarge: VelocityWound{              
				effectiveness = 7;
                reopeningChance = 1;};
            class PunctureWound{};
            class PunctureWoundMinor: PunctureWound {};
            class PunctureWoundMedium: PunctureWound{};
            class PunctureWoundLarge: PunctureWound{};
        };
    };
};