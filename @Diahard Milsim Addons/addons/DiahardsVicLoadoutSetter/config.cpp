#include "CfgPatches.hpp"
#include "CfgFunctions.hpp"

class Extended_PreInit_EventHandlers
{
    class DMA_VicLoadoutSetter_Settings
    {
        init = "call compile preprocessFileLineNumbers '\DiahardsVicLoadoutSetter\functions\fn_registerSettings.sqf'";
    };
};

class Extended_PostInit_EventHandlers
{
    class DMA_VicLoadoutSetter_PostInit
    {
        init = "call compile preprocessFileLineNumbers '\DiahardsVicLoadoutSetter\functions\fn_postInit.sqf'";
    };
};
