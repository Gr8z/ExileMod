/**
 * © 2015 Daniel "Rod Serling" Phelps
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
 */
	 
private ["_pos", "_dis", "_list"];

_OK = params
[
	["_pos", "", [objNull,[]], [2,3]],
	["_dis", 0, [0]]
];

if (!_OK) exitWith
{
	diag_log format ["ExileServer - Error: Calling ExileServer_util_position_getNearbyPlayers with invalid parameters: %1",_this];
};

_list = [];
{
	{
		if (isPlayer _x) then
		{
			_list pushBack _x;
		};
	} forEach (crew _x);
} forEach (_pos nearEntities [["Exile_Unit_Player","LandVehicle", "Air", "Ship"], _dis]);

_list;