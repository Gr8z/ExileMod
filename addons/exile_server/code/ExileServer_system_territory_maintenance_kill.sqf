/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flag","_maxRange","_constructionObjects","_owner","_flagID","_object","_databaseID","_isContainer"];
_flag = _this;
_maxRange = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumRadius");
_constructionObjects = _flag nearObjects _maxRange;
_owner = _flag getVariable ["ExileOwnerUID",""];
_flagID = _flag getVariable ["ExileDatabaseID",-1];
{
	_object = _x;
	_databaseID = _object getVariable ["ExileDatabaseID",-1];
	if!(_databaseID isEqualTo -1)then
	{
		_isContainer = if((getnumber (configFile >> "CfgVehicles" >> typeOf _object >> "exileContainer")) isEqualTo 1)then{true}else{false};
		if(_isContainer)then
		{
			format ["deleteContainer:%1", _databaseID] call ExileServer_system_database_query_fireAndForget;
		}
		else
		{
			format ["deleteConstruction:%1", _databaseID] call ExileServer_system_database_query_fireAndForget;
		};	
		deleteVehicle _object;
	};
} 
forEach _constructionObjects;
format ["deleteTerritory:%1", _flagID] call ExileServer_system_database_query_fireAndForget;
deleteVehicle _flag;
format 
[
	"Teritory at: %1 with previous owner(UID): %2 was deleted due to protection money not being payed.",
	getPosATL _flag,
	_owner
]
call ExileServer_util_log;
true