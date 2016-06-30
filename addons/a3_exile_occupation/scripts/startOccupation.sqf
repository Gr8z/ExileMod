if (!isServer) exitWith {};

if(SC_processReporter) then
{
	_logDetail = format ["[processReporter]:: Initialised at %1",time];
	[_logDetail] call SC_fnc_log;
	fnc_processReporter = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\extras\processReporter.sqf";
	[60, fnc_processReporter, [], true] call ExileServer_system_thread_addTask;	
};

_logDetail = format ["[OCCUPATION]:: Detected DMS version %1",DMS_Version];
[_logDetail] call SC_fnc_log;

_logDetail = format ["[OCCUPATION]:: Occupation %2 Adding modules to Exile system thread manager at %1",time,SC_occupationVersion];
[_logDetail] call SC_fnc_log;


if(SC_occupyLootCratesMarkers) then
{
	uiSleep 15; // delay the start
	fnc_occupationDeleteMapMarker 	= compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\deleteMapMarkers.sqf";
	[10, fnc_occupationDeleteMapMarker, [], true] call ExileServer_system_thread_addTask;	
};

if(SC_debug) then { SC_refreshTime = 60; }else{ SC_refreshTime = 300; };

// Add selected occupation scripts to Exile Threading System

if (SC_fastNights) then
{
	fnc_checkMultiplier = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationFastNights.sqf";
	[60, fnc_checkMultiplier, [], true] call ExileServer_system_thread_addTask;
};

if(SC_occupyRandomSpawn) then
{
	uiSleep 15; // delay the start
    call compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationRandomSpawn.sqf";
};


if(SC_occupyTraders) then
{
	uiSleep 15; // delay the start
    call compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationTraders.sqf";
};

if(SC_occupyLootCrates) then
{
	uiSleep 15; // delay the start
	call compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationLootCrates.sqf";
};

if(SC_occupyHeliCrashes) then
{
	uiSleep 15; // delay the start
    call compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationHeliCrashes.sqf";
};

if(SC_occupyVehicle) then
{
	uiSleep 15; // delay the start
	fnc_occupationVehicle = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationVehicle.sqf";
	[SC_refreshTime, fnc_occupationVehicle, [], true] call ExileServer_system_thread_addTask;
};

if(SC_occupyStatic) then
{
	uiSleep 15; // delay the start
	fnc_occupationStatic = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationStatic.sqf";
	[SC_refreshTime, fnc_occupationStatic, [], true] call ExileServer_system_thread_addTask;
};

if(SC_occupySky) then
{
	uiSleep 15; // delay the start
	fnc_occupationSky = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationSky.sqf";
	[SC_refreshTime, fnc_occupationSky, [], true] call ExileServer_system_thread_addTask;
};

if(SC_occupySea) then
{
	uiSleep 15; // delay the start
	fnc_occupationSea = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationSea.sqf";
	[SC_refreshTime, fnc_occupationSea, [], true] call ExileServer_system_thread_addTask;
};

if(SC_occupyPlaces) then
{
	uiSleep 15; // delay the start
	fnc_occupationPlaces = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationPlaces.sqf";
	[SC_refreshTime, fnc_occupationPlaces, [], true] call ExileServer_system_thread_addTask;
};

if(SC_occupyMilitary) then
{
	uiSleep 15; // delay the start
	fnc_occupationMilitary = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationMilitary.sqf";
	[SC_refreshTime, fnc_occupationMilitary, [], true] call ExileServer_system_thread_addTask;
};

if(SC_occupyTransport) then
{
	[] execVM  "\x\addons\a3_exile_occupation\scripts\occupationTransport.sqf";
};

uiSleep 15; // delay the start
fnc_occupationMonitor = compile preprocessFileLineNumbers "\x\addons\a3_exile_occupation\scripts\occupationMonitor.sqf";
[SC_refreshTime, fnc_occupationMonitor, [], true] call ExileServer_system_thread_addTask;

_logDetail = format ["[OCCUPATION]:: threads added at %1",time];
[_logDetail] call SC_fnc_log;