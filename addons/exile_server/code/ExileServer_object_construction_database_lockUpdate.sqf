/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_door","_databaseID"];
_door = _this;
_databaseID = _door getVariable ["ExileDatabaseID",0];
if(_door getvariable ['ExileIsLocked',1] isEqualTo -1)then
{
	format ["updateLock:0:%1",_databaseID] call ExileServer_system_database_query_fireAndForget;
}
else
{
	format ["updateLock:-1:%1",_databaseID] call ExileServer_system_database_query_fireAndForget;
};
true
