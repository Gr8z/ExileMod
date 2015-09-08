/**
 * © 2015 eraser1
 * All rights reserved. Redistributed with permission.
 */
 
private ["_pos", "_dis", "_isNear"];

_OK = params
[
	["_pos", "", [objNull,[]], [2,3]],
	["_dis", 0, [0]]
];

if (!_OK) exitWith
{
	diag_log format ["ExileServer - Error: Calling ExileServer_util_position_isPlayerNearby with invalid parameters: %1",_this];
};

_isNear = false;

try
{
	{
		{
			if (isPlayer _x) then
			{
				throw _x;
			};
		} forEach (crew _x);
	} forEach (_pos nearEntities [["Exile_Unit_Player","LandVehicle", "Air", "Ship"], _dis]);
}
catch
{
	_isNear = true;
};


_isNear;