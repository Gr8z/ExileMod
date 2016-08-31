/*
	Project:
		XG_Anti-Theft

	Authors:
		[XG] StokesMagee:
			www.xexgaming.com

	Credits:
		Diamond
			http://www.legiongaminghq.org/
		Kuplion
			https://www.facebook.com/FriendlyPlayerShooting/
		William Rogers
			http://www.arma3-dayzrp.com/
*/

(_this select 1) params [["_player",objNull]];
_playerEvhid = _player addEventHandler ["GetInMan",
{
	params[["_player",objNull],["_pos",""],["_vehicle",objNull]];
	_vehicleInfo = _vehicle getVariable ["XG_AntiTheftInfo",[]];
	if(_vehicleInfo isEqualTo []) then 
	{
		[_vehicle,_player] call XG_AntiTheft_Check_setVariable;
	};
}];
_player setVariable ["XG_PlayerEVHId",[_playerEvhid],true];