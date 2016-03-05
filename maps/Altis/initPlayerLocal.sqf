[] execVM "GG\StatusBar\statusBar.sqf";
[] execVM "GG\KillMessages.sqf";
[] execVM "GG\IgiLoad\IgiLoadInit.sqf";
[] execVM "GG\money\takegive_poptab_init.sqf";
[] execVM "GG\service\service_point.sqf";
[] execVM "GG\ExtraButtons.sqf";

#include "initServer.sqf"

if (!hasInterface || isServer) exitWith {};

_pic = "GG\images\logo.paa";
[
    '<img align=''left'' size=''1.0'' shadow=''1'' image='+(str(_pic))+' />',
    safeZoneX+0.027,
    safeZoneY+safeZoneH-0.1,
    99999,
    0,
    0,
    3090
] spawn bis_fnc_dynamicText;

// Custom Traders
waitUntil {!isNil 'ExileServerCustom_Traders'};
{
    _x call ExileClient_object_trader_create;
} forEach (call ExileServerCustom_Traders);
