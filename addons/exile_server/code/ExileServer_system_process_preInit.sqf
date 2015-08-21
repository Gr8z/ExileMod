/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_MySql"];
"Server is loading..." call ExileServer_util_log;
finishMissionInit;
ExileSessions = []; 
ExileGraveyardGroup = createGroup independent;
_MySql_connection = [] call ExileServer_system_database_connect;
if!(_MySql_connection)exitWith
{
	false
};
addMissionEventHandler ["HandleDisconnect", { _this call ExileServer_system_network_event_onHandleDisconnect; }];
onPlayerConnected {[_uid, _name] call ExileServer_system_network_event_onPlayerConnected};
onPlayerDisconnected {[_uid, _name] call ExileServer_system_network_event_onPlayerDisconnected};
"PublicMessage" addPublicVariableEventHandler compileFinal " (_this select 1) call ExileServer_system_network_dispatchIncomingMessage; ";
PublicServerFPS = 0;
PublicHiveIsLoaded = false; 
PublicHiveVersion = getText(configFile >> "CfgMods" >> "Exile" >> "version");
publicVariable "PublicHiveVersion";