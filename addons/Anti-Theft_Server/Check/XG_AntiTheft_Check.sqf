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

params [["_player",objNull],["_vehicle",objNull],["_family","No Family"],["_vehicleInfo",[]],"_ret"];
_vehicleInfo params [["_group",""],["_vifamily","No Family"],["_ownerUID",""]];
if!([_player,200] call ExileClient_util_world_isTraderZoneInRange) exitWith
{
	if!(_vehicleInfo isEqualTo []) then
	{
		_vehicleInfo params [["_group",0],["_vifamily","No Family"],["_ownerUID",""],["_evhID",0]];
		_vehicle removeEventHandler ["GetIn",_evhID];
		_vehicle setVariable ["XG_AntiTheftInfo",[],true];
	};
};
if(_group isEqualTo "No Group") then
{
	if!(_family isEqualTo "No Family") then
	{
		_ret = [_player,_vehicle,_family,_vehicleInfo] call XG_AntiTheft_Check_Family;
	}
	else
	{
		_ret = [_player,_vehicle,_family,_vehicleInfo] call XG_AntiTheft_Check_NoFamily;
	};
}
else
{
	if!(_family isEqualTo "No Family") then
	{
		_ret = [_player,_vehicle,_family,_vehicleInfo] call XG_AntiTheft_Check_GroupFamily;
	}
	else
	{
		_ret = [_player,_vehicle,_family,_vehicleInfo] call XG_AntiTheft_Check_Group;
	};
};
_ret