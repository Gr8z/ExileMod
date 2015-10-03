/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_playerObject","_spawnRadius","_spawnChancePerPosition","_spawnChancePerBuilding","_maximumNumberOfLootSpotsPerBuilding","_maximumNumberOfItemsPerLootSpot","_visualThreshold","_spawnedLoot","_minimumDistanceToTraderZones","_minimumDistanceToTerritories","_playerPosition","_lastKnownPlayerPosition","_buildings","_building","_buildingType","_buildingPosition","_buildingConfig","_lootTableName","_localPositions","_spawnedItemClassNames","_lootWeaponHolderNetIDs","_spawnedLootInThisBuilding","_lootPosition","_numberOfItemsToSpawn","_lootHolder","_n","_itemClassName","_cargoType","_magazineClassNames","_magazineClassName","_numberOfMagazines"];
_playerObject = _this;
_spawnRadius = getNumber (configFile >> "CfgSettings" >> "LootSettings" >> "spawnRadius");
_spawnChancePerPosition = (getNumber (configFile >> "CfgSettings" >> "LootSettings" >> "spawnChancePerPosition") max 0) min 99; 
_spawnChancePerBuilding = (getNumber (configFile >> "CfgSettings" >> "LootSettings" >> "spawnChancePerBuilding") max 0) min 99; 
_maximumNumberOfLootSpotsPerBuilding = getNumber (configFile >> "CfgSettings" >> "LootSettings" >> "maximumNumberOfLootSpotsPerBuilding");
_maximumNumberOfItemsPerLootSpot = getNumber (configFile >> "CfgSettings" >> "LootSettings" >> "maximumNumberOfItemsPerLootSpot");
_visualThreshold = getNumber (configFile >> "CfgSettings" >> "LootSettings" >>  "visualThreshold");
_spawnedLoot = false;
_minimumDistanceToTraderZones = getNumber (configFile >> "CfgSettings" >> "LootSettings" >> "minimumDistanceToTraderZones");
_minimumDistanceToTerritories = getNumber (configFile >> "CfgSettings" >> "LootSettings" >> "minimumDistanceToTerritories");
try 
{
	if !(alive _playerObject) then 
	{
		throw false;
	};
	if !(vehicle _playerObject isEqualTo _playerObject) then
	{
		throw false;
	};
	_playerPosition = getPosATL _playerObject;
	_lastKnownPlayerPosition = _playerObject getVariable["ExilePositionAtLastLootSpawnCircle", [0,0,0]]; 
	if (_lastKnownPlayerPosition distance2D _playerPosition < 11) then
	{
		throw false;
	};
	_playerObject setVariable["ExilePositionAtLastLootSpawnCircle", _playerPosition];	
	_buildings = _playerPosition nearObjects ["House", _spawnRadius];
	{
		_building = _x;
		_buildingType = typeOf _building;
		if (isClass(configFile >> "CfgBuildings" >> _buildingType)) then
		{
			if !(_building getVariable ["ExileHasLoot", false]) then
			{
				if ((floor (random 100)) <= _spawnChancePerBuilding) then
				{
					_buildingPosition = getPosATL _building;
					if (_minimumDistanceToTraderZones > 0) then
					{
						if ([_buildingPosition, _minimumDistanceToTerritories] call ExileClient_util_world_isTraderZoneInRange) then
						{
							throw false;
						};
					};
					if (_minimumDistanceToTerritories > 0) then
					{
						if ([_buildingPosition, _minimumDistanceToTerritories] call ExileClient_util_world_isTerritoryInRange) then
						{
							throw false;
						};
					};
					if !([_buildingPosition, _visualThreshold] call ExileClient_util_world_isAlivePlayerInfantryInRange) then
					{
						_buildingConfig = configFile >> "CfgBuildings" >> _buildingType;
						_lootTableName = getText (_buildingConfig >> "table");
						_localPositions = getArray (_buildingConfig >> "positions");
						_spawnedItemClassNames = [];
						_lootWeaponHolderNetIDs = [];
						_spawnedLootInThisBuilding = false;
						_localPositions = _localPositions call ExileClient_util_array_shuffle;
						{	
							if (_forEachIndex isEqualTo (_maximumNumberOfLootSpotsPerBuilding - 1)) exitWith {};
							if ((floor (random 100)) <= _spawnChancePerPosition) then
							{
								_lootPosition = ASLToATL (AGLToASL (_building modelToWorld _x));
								if (_lootPosition select 2 < 0.05) then
								{
									_lootPosition set [2, 0.05];
								};
								_numberOfItemsToSpawn = (floor (random _maximumNumberOfItemsPerLootSpot)) + 1;
								_lootHolder = objNull;
								for "_n" from 1 to _numberOfItemsToSpawn do 
								{
									_itemClassName = _lootTableName call ExileServer_system_lootManager_dropItem;
									if !(_itemClassName in _spawnedItemClassNames) then
									{
										_cargoType = _itemClassName call ExileClient_util_cargo_getType;
										if (isNull _lootHolder) then 
										{
											_lootHolder = createVehicle ["LootWeaponHolder", _lootPosition, [], 0, "CAN_COLLIDE"];
											_lootHolder setDir (random 360);
											_lootHolder setPosATL _lootPosition;
											_lootHolder setVariable ["ExileSpawnedAt", time];
											_lootWeaponHolderNetIDs pushBack (netId _lootHolder);											
										};
										switch (_cargoType) do
										{
											case 1: 	
											{ 
												if (_itemClassName isEqualTo "Exile_Item_MountainDupe") then
												{
													_lootHolder addMagazineCargoGlobal [_itemClassName, 2]; 
												}
												else 
												{
													_lootHolder addMagazineCargoGlobal [_itemClassName, 1]; 
												};
											};
											case 3: 	
											{ 
												_lootHolder addBackpackCargoGlobal [_itemClassName, 1]; 
											};
											case 2: 	
											{ 
												_lootHolder addWeaponCargoGlobal [_itemClassName, 1]; 
												if (_itemClassName != "Exile_Melee_Axe") then
												{
													_magazineClassNames = getArray(configFile >> "CfgWeapons" >> _itemClassName >> "magazines");
													if (count(_magazineClassNames) > 0) then
													{
														_magazineClassName = _magazineClassNames select (floor(random (count _magazineClassNames)));
														_numberOfMagazines = 2 + floor(random 3); 
														_lootHolder addMagazineCargoGlobal [_magazineClassName, _numberOfMagazines];
													};
												};
											};
											default { _lootHolder addItemCargoGlobal [_itemClassName,1]; };
										};
										_spawnedItemClassNames pushBack _itemClassName;
										_spawnedLoot = true;
										_spawnedLootInThisBuilding = true;
									};
								};
							};
						}
						forEach _localPositions;
						if (_spawnedLootInThisBuilding) then
						{
							ExileServerBuildingNetIdsWithLoot pushBack (netId _building);
							_building setVariable ["ExileLootSpawnedAt", time];
							_building setVariable ["ExileHasLoot", true];
							_building setVariable ["ExileLootWeaponHolderNetIDs", _lootWeaponHolderNetIDs];
						};
					};
				};
			};
		};
	}
	forEach _buildings;
}
catch 
{
};
_spawnedLoot