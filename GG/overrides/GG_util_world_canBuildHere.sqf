/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_constructionConfigName","_position","_playerUID","_result","_requiresTerritory","_canBePlacedOnRoad","_minimumDistanceToTraderZones","_minimumDistanceToSpawnZones","_minimumDistanceToOtherTerritories","_isInEnemyTerritory","_radius","_buildRights"];
_constructionConfigName = _this select 0;
_position = _this select 1;
_playerUID = _this select 2;
_result = 0;
_requiresTerritory = getNumber (configFile >> "CfgConstruction" >> _constructionConfigName >> "requiresTerritory") isEqualTo 1;
_canBePlacedOnRoad = getNumber (configFile >> "CfgConstruction" >> _constructionConfigName >> "canBePlacedOnRoad") isEqualTo 1;
_minimumDistanceToTraderZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToTraderZones");
_minimumDistanceToSpawnZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToSpawnZones");
_minimumDistanceToOtherTerritories = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToOtherTerritories");
try 
{
	if ([_position, _minimumDistanceToTraderZones] call ExileClient_util_world_isTraderZoneInRange) then
	{
		throw 4;
	};
	if ([_position, _minimumDistanceToSpawnZones] call ExileClient_util_world_isSpawnZoneInRange) then
	{
		throw 5;
	};
	if !(_canBePlacedOnRoad) then
	{
		if (isOnRoad [_position select 0, _position select 1, 0]) then
		{
			throw 3;
		};
	};
	if (_constructionConfigName isEqualTo "Flag") then 
	{
		if ([_position, _minimumDistanceToOtherTerritories] call ExileClient_util_world_isTerritoryInRange) then 
		{
			throw 2;
		};
	}
	else 
	{
		_isInEnemyTerritory = false;
		{
			_radius = _x getVariable ["ExileTerritorySize", -1];
			if ((_position distance2D _x) < _radius) then
			{
				_buildRights = _x getVariable ["ExileTerritoryBuildRights", []];
				_isInEnemyTerritory = true;
				if (_playerUID in _buildRights) exitWith
				{
					throw 0;
				};
			};
		}
		forEach (_position nearObjects ["Exile_Construction_Flag_Static", _minimumDistanceToOtherTerritories]); 
		if (_requiresTerritory) then
		{
			throw 1;	
		}
		else 
		{
			if (_isInEnemyTerritory) then
			{
				throw 2;
			};
		};
	};
}
catch 
{
	_result = _exception;
};
_result