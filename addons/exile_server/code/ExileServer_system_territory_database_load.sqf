/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_territoryID","_data","_id","_owner","_position","_radius","_level","_flagTexture","_flagStolen","_flagStolenBy","_flagStealMessage","_lastPayed","_buildRights","_moderators","_flagObject","_location"];
_territoryID = _this;
_data = format ["loadTerritory:%1", _territoryID] call ExileServer_system_database_query_selectSingle;
_id = _data select 0;
_owner = _data select 1;
_name = _data select 2;
_position = 
[
	_data select 3,
	_data select 4,
	_data select 5
];
_radius = _data select 6;
_level = _data select 7;
_flagTexture = _data select 8;
_flagStolen = _data select 9;
_flagStolenBy = _data select 10;
_flagStealMessage = _data select 11;
_lastPayed = _data select 12;
_buildRights = _data select 13;
_moderators = _data select 14;
_flagObject = createVehicle ["Exile_Construction_Flag_Static",_position, [], 0, "CAN_COLLIDE"];
_flagObject setFlagTexture _flagTexture;
ExileLocations pushBack _flagObject;
_location = createLocation ["ExileTerritory",_flagObject,_radius,_radius];
_location setName _name;
_flagObject setVariable ["ExileDatabaseID",_id];
_flagObject setVariable ["ExileOwnerUID",_owner];
_flagObject setVariable ["ExileTerritorySize",_radius];
_flagObject setVariable ["ExileTerritoryBuildRights",_buildRights];
_flagObject setVariable ["ExileTerritoryModerator",_moderators];
_flagObject setVariable ["ExileTerritoryLevel",_level];
_flagObject setVariable ["ExileTerritoryLocation",_location];
true