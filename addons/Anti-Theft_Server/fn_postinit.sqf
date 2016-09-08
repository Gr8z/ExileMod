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

{
	_x params [["_function",""],["_file",""]];
	_code = compileFinal (preprocessFileLineNumbers _file);
	missionNamespace setVariable [_function,_code];
} forEach
[
	//Network
	["ExileServer_AntiTheft_network_XG_EnterSafeZone","XG_AntiTheft\Network\ExileServer_AntiTheft_network_XG_EnterSafeZone.sqf"],
	["ExileServer_AntiTheft_network_XG_LeftSafeZone","XG_AntiTheft\Network\ExileServer_AntiTheft_network_XG_LeftSafeZone.sqf"],
	["ExileServer_AntiTheft_network_XG_PlayerEnterSafezone","XG_AntiTheft\Network\ExileServer_AntiTheft_network_XG_PlayerEnterSafezone.sqf"],
	["ExileServer_AntiTheft_network_XG_PlayerLeaveSafezone","XG_AntiTheft\Network\ExileServer_AntiTheft_network_XG_PlayerLeaveSafezone.sqf"],
	["ExileServer_AntiTheft_network_XG_CheckVariable","XG_AntiTheft\Network\ExileServer_AntiTheft_network_XG_CheckVariable.sqf"],

	//Checks
	["XG_AntiTheft_Check_Family","XG_AntiTheft\Check\XG_AntiTheft_Check_Family.sqf"],
	["XG_AntiTheft_Check_Group","XG_AntiTheft\Check\XG_AntiTheft_Check_Group.sqf"],
	["XG_AntiTheft_Check","XG_AntiTheft\Check\XG_AntiTheft_Check.sqf"],
	["XG_AntiTheft_Check_NoFamily","XG_AntiTheft\Check\XG_AntiTheft_Check_NoFamily.sqf"],
	["XG_AntiTheft_Check_GroupFamily","XG_AntiTheft\Check\XG_AntiTheft_Check_GroupFamily.sqf"],

	//EventHandlers
	["XG_AntiTheft_Getin","XG_AntiTheft\EventHandlers\XG_AntiTheft_Getin.sqf"],

	//Set Vars
	["XG_AntiTheft_Check_SetVariable","XG_AntiTheft\Check\XG_AntiTheft_Check_SetVariable.sqf"]
];
[] spawn
{
	waitUntil { (time > 0) && PublicServerIsLoaded };
	_code =
	{
		{
			_clanID = _x getVariable ["ExileClanID", -1];
			_x setVariable ["ExileClanID",_clanID,true]; 
		} forEach AllPlayers;
	};
	[60,_code,[],true] call ExileServer_system_thread_addTask;
};