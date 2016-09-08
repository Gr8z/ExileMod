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

(_this select 1) params[["_vehicle",objNull]];
_vehicleInfo = _vehicle getVariable ["XG_AntiTheftInfo",[]];
if!(_vehicleInfo isEqualTo []) then
{
	_vehicleInfo params [["_group",0],["_vifamily","No Family"],["_ownerUID",""],["_evhID",0]];
	_vehicle removeEventHandler ["GetIn",_evhID];
	_vehicle setVariable ["XG_AntiTheftInfo",[],true];
};