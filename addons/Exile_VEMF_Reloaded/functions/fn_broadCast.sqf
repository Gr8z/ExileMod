/*
	Author: IT07

	Description:
	will alert players

	Params:
	_this select 0: FORMATTED STRING - thing to send
	_this select 1: STRING - mode to send to client

	Returns:
	nothing
*/

private ["_msg","_mode"];
_msg = [_this, 0, "", [[],format[""]]] call BIS_fnc_param;
if not(_msg isEqualTo "") then
{
	_mode = [_this, 1, "", [""]] call BIS_fnc_param;
	if (count allPlayers > 0) then
	{
		{
			if (isPlayer _x) then
			{
				VEMFrClientMsg = [_msg, _mode];
				(owner _x) publicVariableClient "VEMFrClientMsg";
			};
		} forEach allPlayers;
	};
};
