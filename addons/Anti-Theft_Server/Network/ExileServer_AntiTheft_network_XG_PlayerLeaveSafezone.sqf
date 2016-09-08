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

(_this select 1) params[["_player",objNull]];
_var = _player getVariable ["XG_PlayerEVHId",[]];
if!(_var isEqualTo []) then
{
	_var params [["_evhID",-1]];
	_player removeEventHandler ["GetInMan",_evhID];
	_player setVariable ["XG_PlayerEVHId",[],true];
};