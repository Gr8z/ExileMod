////////////////////////////////////////////////////////////////////////////////////////////
//
//		Server Occupation script by second_coming
//
SC_occupationVersion = "v11 (12-04-2016)";
//
//		http://www.exilemod.com/profile/60-second_coming/
//
//		This script uses the fantastic DMS by Defent and eraser1
//
//		http://www.exilemod.com/topic/61-dms-defents-mission-system/
//		special thanks to eichi for pointers on this script :)
//
////////////////////////////////////////////////////////////////////////////////////////////
//
//		I do not give permission for anyone to sell (or charge for the installation of)
//		any part of this set of scripts.
//
//		second_coming 2016
//
////////////////////////////////////////////////////////////////////////////////////////////

[] spawn 
{
    diag_log format ["[OCCUPATION]:: Occupation %2 Giving the server time to start before starting [OCCUPATION] (%1)",time,SC_occupationVersion];
    waitUntil { !(isNil "DMS_MinMax_Y_Coords") };
    sleep 1;
    diag_log format ["[OCCUPATION MOD]:: Occupation %2 Loading Config at %1",time,SC_occupationVersion];

    // Get the config for Occupation
    call compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\config.sqf";

    // Select the log style depending on config settings
    SC_fnc_log			        = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationLog.sqf";

    // EventHandlers for AI reactions
    SC_fnc_repairVehicle 		= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\reactions\repairVehicle.sqf";
    SC_fnc_vehicleDestroyed     = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\reactions\vehicleDestroyed.sqf"; 
    SC_fnc_reactUnit 			= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\reactions\reactUnit.sqf";
    SC_fnc_driverKilled 		= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\reactions\driverKilled.sqf";
    SC_fnc_airHit 			    = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\reactions\airHit.sqf";
    SC_fnc_boatHit 			    = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\reactions\boatHit.sqf";
    SC_fnc_getIn			    = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\reactions\getIn.sqf";
    SC_fnc_refuel               = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\reactions\refuel.sqf";
    SC_fnc_comeUnstuck          = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\reactions\comeUnstuck.sqf";

    _logDetail = "=============================================================================================================";
    [_logDetail] call SC_fnc_log;
    _logDetail = format ["[OCCUPATION MOD]:: Occupation %2 Initialised at %1",time,SC_occupationVersion];
    [_logDetail] call SC_fnc_log;
    _logDetail = "=============================================================================================================";
    [_logDetail] call SC_fnc_log;

    // Start Occupation
    [] execVM "\x\addons\a3_exile_occupation\scripts\startOccupation.sqf";
};