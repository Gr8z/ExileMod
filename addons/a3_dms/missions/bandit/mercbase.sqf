/*
	Sample mission (duplicate for testing purposes)
*/

private ["_num", "_side", "_OK", "_group", "_pos", "_difficulty", "_AICount", "_veh", "_staticGuns","_staticGuns2", "_baseObjs", "_crate", "_missionAIUnits", "_missionObjs", "_msgStart", "_msgWIN", "_msgLOSE", "_missionName", "_markers", "_time", "_added", "_cleanup"];

// For logging purposes
_num = DMS_MissionCount;


// Set mission side
_side = "bandit";


// This part is unnecessary, but exists just as an example to format the parameters for "DMS_fnc_MissionParams" if you want to explicitly define the calling parameters for DMS_fnc_FindSafePos.
// It also allows anybody to modify the default calling parameters easily.
if ((isNil "_this") || {_this isEqualTo [] || {!(_this isEqualType [])}}) then
{
	_this =
	[
		[50,DMS_WaterNearBlacklist,DMS_MinSurfaceNormal,DMS_SpawnZoneNearBlacklist,DMS_TraderZoneNearBlacklist,DMS_MissionNearBlacklist,DMS_PlayerNearBlacklist,DMS_TerritoryNearBlacklist,DMS_ThrottleBlacklists],
		[
			[]
		],
		_this
	];
};

// Check calling parameters for manually defined mission position.
// This mission doesn't use "_extraParams" in any way currently.
_OK = (_this call DMS_fnc_MissionParams) params
[
	["_pos",[],[[]],[3]],
	["_extraParams",[]]
];

if !(_OK) exitWith
{
	diag_log format ["DMS ERROR :: Called MISSION mercbase.sqf with invalid parameters: %1",_this];
};


// Set general mission difficulty
_difficulty = "hardcore";


// Create AI
_AICount = 25 + (round (random 5));

_group =
[
	[_pos,[-9.48486,-12.4834,0]] call DMS_fnc_CalcPos,
	_AICount,
	"hardcore",
	"random",
	_side
] call DMS_fnc_SpawnAIGroup;

_veh =
[
	[
		[_pos,100,random 360] call DMS_fnc_SelectOffsetPos,
		_pos
	],
	_group,
	"assault",
	_difficulty,
	_side,
	"I_MRAP_03_hmg_f"
] call DMS_fnc_SpawnAIVehicle;


[
	_group,
	[_pos,[-9.48486,-12.4834,0]] call DMS_fnc_CalcPos,
	"base"
] call DMS_fnc_SetGroupBehavior;


_staticGuns =
[
	[
		[_pos,[-34.128,9.027,0]] call DMS_fnc_CalcPos
		[_pos,[-33.935,-9.433,0]] call DMS_fnc_CalcPos
		[_pos,[-14.432,-8.813,3.628]] call DMS_fnc_CalcPos
		[_pos,[-14.174,9.815,3.642]] call DMS_fnc_CalcPos
		[_pos,[-10.710,-13.930,3.628]] call DMS_fnc_CalcPos
		[_pos,[-0.005,-14.284,3.628]] call DMS_fnc_CalcPos
		[_pos,[9.932,-14.283,3.628]] call DMS_fnc_CalcPos
		[_pos,[13.525,-9.536,3.628]] call DMS_fnc_CalcPos
		[_pos,[13.542,8.644,3.642]] call DMS_fnc_CalcPos
		[_pos,[10.640,13.330,3.642]] call DMS_fnc_CalcPos
		[_pos,[0.176,13.279,3.642]] call DMS_fnc_CalcPos
		[_pos,[-10.568,13.343,3.642]] call DMS_fnc_CalcPos
	],
	_group,
	"assault",
	"hardcore",
	"bandit",
	"O_HMG_01_high_F"
] call DMS_fnc_SpawnAIStaticMG;

_staticGuns2 =
[
	[
		[_pos,[-22.049,6.181,0]] call DMS_fnc_CalcPos
		[_pos,[-22.41,-7.782,0]] call DMS_fnc_CalcPos
		[_pos,[-32.597,0.391,0]] call DMS_fnc_CalcPos
	],
	_group,
	"assault",
	"hardcore",
	"bandit",
	"O_static_AA_F"
] call DMS_fnc_SpawnAIStaticMG;

(_staticGuns2 select 0) setDir 0;
(_staticGuns2 select 1) setDir 180;
(_staticGuns2 select 2) setDir 90;

_baseObjs =
[
	"base2",
	_pos
] call DMS_fnc_ImportFromM3E;

// Create Crate
_crate = ["Exile_Container_SupplyBox",_pos] call DMS_fnc_SpawnCrate;

// Pink Crate ;)
_crate setObjectTextureGlobal [0,"#(rgb,8,8,3)color(1,0.08,0.57,1)"];
_crate setObjectTextureGlobal [1,"#(rgb,8,8,3)color(1,0.08,0.57,1)"];


// Define mission-spawned AI Units
_missionAIUnits =
[
	_group 		// We only spawned the single group for this mission
];

// Define mission-spawned objects and loot values

_missionObjs =
[
	_staticGuns+_staticGuns2+_baseObjs+[_veh],			// armed AI vehicle, base objects, and static gun
	[],
	[[_crate,"Custom1"]]
];

// Define Mission Start message
_msgStart = ['#FFFF00',format ["Reports from survivors mention a mercenary base with stolen military equipment located at %1! ",mapGridPosition _pos]];

// Define Mission Win message
_msgWIN = ['#0080ff',"Convicts have successfully assaulted the mercenary base and obtained the crate!"];

// Define Mission Lose message
_msgLOSE = ['#FF0000',"Seems like the mercenaries burned down the base and covered their tracks..."];

// Define mission name (for map marker and logging)
_missionName = "Mercenary Base";

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
	[_missionName,_msgWIN,_msgLOSE],
	_markers,
	_side,
	_difficulty,
	[]
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
[_missionName,_msgStart] call DMS_fnc_BroadcastMissionStatus;



if (DMS_DEBUG) then
{
	(format ["MISSION: (%1) :: Mission #%2 started at %3 with %4 AI units and %5 difficulty at time %6",_missionName,_num,_pos,_AICount,_difficulty,_time]) call DMS_fnc_DebugLog;
};
