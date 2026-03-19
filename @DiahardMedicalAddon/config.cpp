#include "CfgPatches.hpp"
#include "CfgFunctions.hpp"
#include "CfgWeapons.hpp"
#include "ACE_Medical_Treatment.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"

class Extended_PreInit_EventHandlers
{
    class DMAMedical_Settings
    {
        init = "call compile preprocessFileLineNumbers '\Diahardmedicaladdon\functions\fn_registerSettings.sqf'";
    };
};

class Extended_PostInit_EventHandlers
{
    class DMAMedical_PostInit
    {
        init = "call compile preprocessFileLineNumbers '\Diahardmedicaladdon\functions\fn_postInit.sqf'";
    };
};
