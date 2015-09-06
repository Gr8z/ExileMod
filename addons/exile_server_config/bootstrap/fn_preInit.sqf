/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private ['_code', '_function', '_file'];

Exile_Debug = false;

Exile_DebugLog = 
{
	private ["_msg"];

	if (Exile_Debug) then
	{
		diag_log format ["Exile Debug - %1", _msg];
	};
};



hotfix_getNearbyPlayers =
{
	private ["_pos", "_dis", "_OK", "_players"];

	_OK = params
	[
		["_pos",[0,0,0],[objNull,[]],[2,3]],
		["_dis",0,[0]]
	];
	if (!_OK) exitWith
	{
		diag_log format ["ERROR Invalid parameters for hotfix_getNearbyPlayers: %1",_this];
	};
 
	_players = _pos nearEntities ["Exile_Unit_Player",_dis];
 
	// Check for Players in Vehicles
	{
		{
			if (isPlayer _x) then
			{
				_players pushBack _x;
			};
			false;
		} count (crew _x);
		false;
	} count (_pos nearEntities [["LandVehicle", "Air", "Ship"], _dis]);
	_players
};

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    if (isText (missionConfigFile >> 'CfgExileCustomCode' >> _function)) then
    {
        _file = getText (missionConfigFile >> 'CfgExileCustomCode' >> _function);
    };

    _code = compileFinal (preprocessFileLineNumbers _file);                    

    missionNamespace setVariable [_function, _code];
}
forEach 
[

];

true