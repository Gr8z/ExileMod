diag_log format ["[OCCUPATION]:: Giving the server time to start before starting [OCCUPATION] (%1)",time];
uiSleep 30;
diag_log format ["[OCCUPATION]:: Initialised at %1",time];
// Shared Config for each occupation monitor

maxAIcount 		= 50;									// the maximum amount of AI, if the AI count is above this then additional AI won't spawn
minFPS 			= 8;									// any lower than minFPS on the server and additional AI won't spawn
scaleAI 		= 10; 									// any more than _scaleAI players on the server and _maxAIcount is reduced for each extra player
useWaypoints	= false;								// When spawning AI create waypoints to make them enter buildings (can affect performance when the AI is spawned and the waypoints are calculated)
debug 			= false;								// set to true for debug log information and map markers

_occupyPlaces 		= true;									// true if you want villages,towns,cities patrolled
_occupyMilitary 	= true;								// true if you want military buildings patrolled (specify which types of building in occupationMilitary.sqf)
_occupyStatic	 	= false;								// true if you want to garrison AI in specific locations (not working yet)

// Settings for roaming ground vehicle AI
_occupyVehicle	 	= false;									// true if you want to have roaming AI vehicles
VehicleClassToUse 	= "Exile_Car_LandRover_Green";			// class name of the ground vehicle to use
liveVehicles 		= 0;									// leave as zero
maxNumberofVehicles = 3;									// Number of roaming vehicles required
publicVariable "liveVehicles";

_occupySky		= false;									// true if you want to have roaming AI helis
HeliClassToUse 		= "Exile_Chopper_Huey_Armed_Green";		// class name of the air vehicle to use
liveHelis	 	= 0;									// leave as zero
maxNumberofHelis	= 1;									// Number of roaming vehicles required
publicVariable "liveHelis";

if (worldName == 'Namalsk') then 	{ maxAIcount = 80; };

// Add selected occupation scripts to Exile Threading System

if(_occupySky) then
{
	uiSleep 30; // delay the start
	fnc_occupationSkyMonitor 	= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\occupationSky.sqf";
	[300, fnc_occupationSkyMonitor, [], true] call ExileServer_system_thread_addTask;
};

if(_occupyVehicle) then
{
	uiSleep 30; // delay the start
	fnc_occupationVehicleMonitor 	= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\occupationVehicle.sqf";
	[300, fnc_occupationVehicleMonitor, [], true] call ExileServer_system_thread_addTask;
};

if(_occupyStatic) then
{
	uiSleep 30; // delay the start
	fnc_occupationStaticMonitor 	= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\occupationStatic.sqf";
	[300, fnc_occupationStaticMonitor, [], true] call ExileServer_system_thread_addTask;
};

if(_occupyPlaces) then
{
	uiSleep 30; // delay the start
	fnc_occupationMonitor 			= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\occupation.sqf";
	[300, fnc_occupationMonitor, [], true] call ExileServer_system_thread_addTask;
};

if(_occupyMilitary) then
{
	uiSleep 30; // delay the start
	fnc_occupationMilitaryMonitor 	= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\occupationMilitary.sqf";
	[300, fnc_occupationMilitaryMonitor, [], true] call ExileServer_system_thread_addTask;
};




diag_log format ["[OCCUPATION]:: threads added at %1",time];
