diag_log format ["[OCCUPATION]:: Giving the server time to start before starting [OCCUPATION] (%1)",time];
uiSleep 30;
diag_log format ["[OCCUPATION]:: Initialised at %1",time];
// Shared Config for each occupation monitor

maxAIcount 		= 100;		// the maximum amount of AI, if the AI count is above this then additional AI won't spawn
minFPS 			= 8;		// any lower than 15fps on the server and additional AI won't spawn
scaleAI 		= 10; 		// any more than _scaleAI players on the server and _maxAIcount is reduced for each extra player
useWaypoints		= false;	// When spawning AI create waypoints to make them enter buildings (can affect performance when the AI is spawned and the waypoints are calculated)
debug 			= false;	// set to true for debug log information and map markers
_occupyPlaces 		= true;		// true if you want villages,towns,cities patrolled
_occupyMilitary 	= true;	// true if you want military buildings patrolled (specify which types of building in occupationMilitary.sqf)

if (worldName == 'Namalsk') then 	{ maxAIcount = 80; };

// Add selected occupation scripts to Exile Threading System
if(_occupyPlaces) then
{
	fnc_occupationMonitor 			= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\occupation.sqf";
	[300, fnc_occupationMonitor, [], true] call ExileServer_system_thread_addTask;
};

if(_occupyMilitary) then
{
	uiSleep 60; // delay the start in case both options are active
	fnc_occupationMilitaryMonitor 	= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\occupationMilitary.sqf";
	[300, fnc_occupationMilitaryMonitor, [], true] call ExileServer_system_thread_addTask;
};

diag_log format ["[OCCUPATION]:: threads added at %1",time];
