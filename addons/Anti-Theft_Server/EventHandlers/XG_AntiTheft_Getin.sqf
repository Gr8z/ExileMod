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

params[["_vehicle",objNull],["_pos",""],["_player",objNull],"_vehicleInfo"];
_vehicleInfo = _vehicle getVariable ["XG_AntiTheftInfo",[]];
_family = _player getVariable ["ExileClanID","No Family"];
if(_family isEqualTo -1) then
{
	_family = "No Family";
};
_ret = [_player,_vehicle,_family,_vehicleInfo] call XG_AntiTheft_Check;
if((typeName _ret) isEqualTo "ARRAY") then
{
	_evhID = _vehicleInfo select 3;
	_ret pushBack _evhID;
	_vehicle setVariable ["XG_AntiTheftInfo",_ret,true];
}
else
{
	[_player,"ToastRequest",["ErrorTitleAndText",["Anti-Theft","This is not your vehicle!"]]] call ExileServer_system_network_send_to;
	moveout _player;
};