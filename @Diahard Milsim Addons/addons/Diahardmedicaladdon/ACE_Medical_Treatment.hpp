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
                reopeningChance = 1;
            };
            class VelocityWoundMinor: VelocityWound {
                effectiveness = 7;
                reopeningChance = 1;
            };
            class VelocityWoundMedium: VelocityWound{
                effectiveness = 7;
                reopeningChance = 1;
            };
            class VelocityWoundLarge: VelocityWound{
                effectiveness = 7;
                reopeningChance = 1;
            };
            class PunctureWound{};
            class PunctureWoundMinor: PunctureWound {};
            class PunctureWoundMedium: PunctureWound{};
            class PunctureWoundLarge: PunctureWound{};
        };
    };

    class Medication
    {
        /*
         // How much does the pain get reduced?
         painReduce = 0;
         // How much will the heart rate be increased when the HR is low (below 55)? {minIncrease, maxIncrease}
         hrIncreaseLow[] = {0, 0};    // _heartRate < 55
         hrIncreaseNormal[] = {0, 0}; // 55 <= _heartRate <= 110
         hrIncreaseHigh[] = {0, 0};   // 110 < _heartRate

         // How long until this medication has disappeared
         timeInSystem = 120;
         // How long until the maximum effect is reached
         timeTillMaxEffect = 30;
         // How many doses of this medication can be in the system before the patient can possibly overdose?
         maxDose = 4;
         // The number of doses over maxDose where there is a chance to overdose.
         // Example with maxDose = 4 and maxDoseDeviation = 2: Dose 4: Safe | Dose 5 and 6: Possible overdose | Dose 7: Guaranteed overdose
         maxDoseDeviation = 2;
         // The dose of the medication, to allow for different dose amounts of the same medication
         dose = 1;
         // Function to execute upon overdose. Arguments passed to call back are 0: Patient <OBJECT>, 1: Medication classname <STRING>, 2: Medication dosage <NUMBER>, 3: Overdose threshold <NUMBER>, 4: Incompatible medication that caused overdose (can be the medication itself) <STRING> (default: "")
         onOverDose = "";
         // The viscosity of a fluid is a measure of its resistance to gradual deformation by shear stress or tensile stress.
         viscosityChange = 0;
        */

        class Oxycodone
        {
            painReduce = 0.5;
            hrIncreaseLow[] = {-5, -10};
            hrIncreaseNormal[] = {-5, -10};
            hrIncreaseHigh[] = {-5, -10};
            timeInSystem = 600;
            timeTillMaxEffect = 60;
            maxDose = 6;
            maxDoseDeviation = 2;
            dose = 1;
            viscosityChange = -5;
        };

        class Methadone
        {
            painReduce = 0;
            hrIncreaseLow[] = {0, 0};
            hrIncreaseNormal[] = {0, 0};
            hrIncreaseHigh[] = {0, 0};
            timeInSystem = 300;
            timeTillMaxEffect = 15;
            maxDose = 99;
            maxDoseDeviation = 0;
            dose = 1;
            viscosityChange = 0;
        };
    };
};
