/*
	Sample mission (duplicate for testing purposes)
*/

private ["_num", "_side", "_pos", "_difficulty", "_AICount", "_group", "_crate", "_crate_loot_values", "_msgStart", "_msgWIN", "_msgLOSE", "_missionName", "_missionAIUnits", "_missionObjs", "_markers", "_time", "_added","_vehicle"];

// For logging purposes
_num = DMS_MissionCount;


// Set mission side (only "bandit" is supported for now)
_side = "bandit";


// find position
_pos = call DMS_fnc_findSafePos;


// Set general mission difficulty
_difficulty = "moderate";


// Create AI
// TODO: Spawn AI only when players are nearby
_AICount = 4 + (round (random 2));

_group =
[
	_pos,					// Position of AI
	_AICount,				// Number of AI
	"random",				// "random","hardcore","difficult","moderate", or "easy"
	"random", 				// "random","assault","MG","sniper" or "unarmed" OR [_type,_launcher]
	_side 					// "bandit","hero", etc.
] call DMS_fnc_SpawnAIGroup;

_dir = random 180;
_staticGuns =
[
	[
		[_pos,5+random 5,_dir] call DMS_fnc_SelectOffsetPos,
		[_pos,5+random 5,_dir+180] call DMS_fnc_SelectOffsetPos
	],
	_group,
	"assault",
	"static",
	"bandit"
] call DMS_fnc_SpawnAIStatic;


// Create Crate
_crate = ["Box_NATO_Wps_F",_pos] call DMS_fnc_SpawnCrate;

// Spawn vehicle
_vehicle = ["Exile_Car_Offroad_Armed_Guerilla01",[_pos,3+random 10,_dir+90] call DMS_fnc_SelectOffsetPos] call DMS_fnc_SpawnNonPersistentVehicle;

//trololol
_crate setObjectTextureGlobal [0,"#(rgb,8,8,3)color(1,0,0.1,1)"];
_crate setObjectTextureGlobal [1,"#(rgb,8,8,3)color(1,0,0.1,1)"];

// Set crate loot values
_crate_loot_values =
[
	5,		// Weapons
	10,		// Items
	3 		// Backpacks
];

[
	[
		[_pos,100,random 360] call DMS_fnc_SelectOffsetPos,
		_pos
	],
	_group,
	"assault",
	_difficulty,
	_side
] call DMS_fnc_SpawnAIVehicle;


// Define mission-spawned AI Units
_missionAIUnits =
[
	_group 		// We only spawned the single group for this mission
];

// Define mission-spawned objects and loot values
_missionObjs =
[
	_staticGuns,			// We only spawn the static guns
	[_vehicle],
	[[_crate,"Sniper"]]
];

// Define Mission Start message
_msgStart = format["<t color='#FFFF00' size='1.25'>Armed Bandits! </t><br/> A heavily armed bandit group has been spotted, take them out and claim their vehicle!"];

// Define Mission Win message
_msgWIN = format["<t color='#0080ff' size='1.25'>Armed Bandits! </t><br/> Convicts have successfully taken care of the bandit group!"];

// Define Mission Lose message
_msgLOSE = format["<t color='#FF0000' size='1.25'>Armed Bandits! </t><br/> The bandits have taken their vehicle and drove off, no loot today!"];

// Define mission name (for map marker and logging)
_missionName = "Armed Bandits";

// Create Markers
_markers =
[
	_pos,
	_missionName,
	_difficulty
] call DMS_fnc_CreateMarker;

// Record time here (for logging purposes, otherwise you could just put "diag_tickTime" into the "DMS_AddMissionToMonitor" parameters directly)
_time = diag_tickTime;

// Parse and add mission info to missions monitor
_added =
[
	_pos,
	[
		[
			"kill",
			_group
		],
		[
			"playerNear",
			[_pos,DMS_playerNearRadius]
		]
	],
	[
		_time,
		(DMS_MissionTimeOut select 0) + random((DMS_MissionTimeOut select 1) - (DMS_MissionTimeOut select 0))
	],
	_missionAIUnits,
	_missionObjs,
	[_msgWIN,_msgLOSE],
	_markers,
	_side
] call DMS_fnc_AddMissionToMonitor;

// Check to see if it was added correctly, otherwise delete the stuff
if !(_added) exitWith
{
	diag_log format ["DMS ERROR :: Attempt to set up mission %1 with invalid parameters for DMS_AddMissionToMonitor! Deleting mission objects and resetting DMS_MissionCount.",_missionName];

	// Delete AI units and the crate. I could do it in one line but I just made a little function that should work for every mission (provided you defined everything correctly)
	_cleanup = [];
	{
		_cleanup pushBack _x;
	} forEach _missionAIUnits;

	_cleanup pushBack ((_missionObjs select 0)+(_missionObjs select 1));
	
	{
		_cleanup pushBack (_x select 0);
	} foreach (_missionObjs select 2);

	_cleanup call DMS_fnc_CleanUp;


	// Delete the markers directly
	{deleteMarker _x;} forEach _markers;


	// Reset the mission count
	DMS_MissionCount = DMS_MissionCount - 1;
};


// Notify players
_msgStart call DMS_fnc_BroadcastMissionStatus;



if (DMS_DEBUG) then
{
	diag_log format ["DMS_DEBUG MISSION: (%1) :: Mission #%2 started at %3 with %4 AI units and %5 difficulty at time %6",_missionName,_num,_pos,_AICount,_difficulty,_time];
};