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

params [["_vehicle",objNull],["_player",objNull]];
if(_vehicle getVariable["SC_transport",false]) exitWith {};
_family = _player getVariable ["ExileClanID","No Family"];
_toAdd = [];
_group = str(group _player);
if(_group isEqualTo "R ") then
{
	_group = "No Group";
};
_toAdd pushBack _group;
if(_family isEqualTo -1) then
{
	_toAdd pushBack "No Family";
}
else
{
	_toAdd pushBack _family;
};
_toAdd pushBack (getPlayerUID _player);
_evhID = _vehicle addEventHandler ["GetIn",{_this call XG_AntiTheft_Getin}];
_toAdd pushBack _evhID;
_vehicle setVariable ["XG_AntiTheftInfo",_toAdd,true];