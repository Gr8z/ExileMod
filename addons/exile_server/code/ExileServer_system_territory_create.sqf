/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_flagObject","_territoryName","_flagTexture","_territorySize","_location","_owner","_level"];
_flagObject = _this select 0;
_territoryName = _this select 1;
_flagTexture = _this select 2;
_territorySize = ((getArray(missionConfigFile >> "CfgTerritories" >> "prices")) select 1) select 1;
_location = createLocation ["ExileTerritory",_flagObject,_territorySize,_territorySize];
_location setName _territoryName;
_flagObject setFlagTexture _flagTexture;
ExileLocations pushBack _flagObject;
_owner = _flagObject getVariable ["ExileOwnerUID",""];
_flagObject setVariable ["ExileTerritorySize",_territorySize];
_flagObject setVariable ["ExileTerritoryBuildRights",[_owner]];
_flagObject setVariable ["ExileTerritoryModerator",[_owner]];
_flagObject setVariable ["ExileTerritoryLocation",_location];
_flagObject setVariable ["ExileTerritoryLevel",_level];
_location