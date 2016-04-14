if (!isServer) exitWith {};

_logDetail = format ["[OCCUPATION:LootCrates]:: Starting Occupation Loot Crates"];
[_logDetail] call SC_fnc_log;

_logDetail = format['[OCCUPATION:LootCrates]::  worldname: %1 crates to spawn: %2',worldName,SC_numberofLootCrates];
[_logDetail] call SC_fnc_log;

private['_position'];

for "_i" from 1 to SC_numberofLootCrates do
{
	_validspot 	= false;
	while{!_validspot} do 
	{
		sleep 0.2;
		_position = [ 0, 50, 1, 500, 500, 200, 200, 200, true, false ] call DMS_fnc_findSafePos;
		_validspot	= true;
		
		//Check if near another crate site
		_nearOtherCrate = (nearestObjects [_position,["CargoNet_01_box_F"],500]) select 0;	
		if (!isNil "_nearOtherCrate") then { _validspot = false; };		
	
	};	
	
	_mapMarkerName = format ["loot_marker_%1", _i];
	
	if (SC_occupyLootCratesMarkers) then 
	{
		
		_event_marker = createMarker [ format ["loot_marker_%1", _i], _position];
		_event_marker setMarkerColor "ColorGreen";
		_event_marker setMarkerAlpha 1;
		_event_marker setMarkerText "Gear Crate";
		_event_marker setMarkerType "loc_Tree";
		_event_marker setMarkerBrush "Vertical";
		_event_marker setMarkerSize [(3), (3)];
	};	

	//Infantry spawn using DMS
    _AICount = SC_LootCrateGuards;
    
    if(SC_LootCrateGuardsRandomize) then 
    {
        _AICount = 1 + (round (random (SC_LootCrateGuards-1)));    
    };
		
	_spawnPosition = [_position select 0, _position select 1, 0];
	_group = [_spawnPosition, _AICount, "random", "random", "bandit"] call DMS_fnc_SpawnAIGroup;
	
	// Get the AI to shut the fuck up :)
	enableSentences false;
	enableRadio false;

	[_group, _spawnPosition, 100] call bis_fnc_taskPatrol;
	_group setBehaviour "AWARE";
	_group setCombatMode "RED";

	_logDetail = format ["[OCCUPATION:LootCrates]::  Creating crate %3 at drop zone %1 with %2 guards",_position,_AICount,_i];
	[_logDetail] call SC_fnc_log;
    
    
	_box = "CargoNet_01_box_F" createvehicle _position;
	clearMagazineCargoGlobal _box;
	clearWeaponCargoGlobal _box;
	clearItemCargoGlobal _box;
	
	_box enableRopeAttach false; 			// Stop people airlifting the crate
	_box setVariable ["permaLoot",true]; 	// Crate stays until next server restart
	_box allowDamage false; 				// Stop crates taking damage

	_box addItemCargoGlobal ["Exile_Melee_Axe", 1];
	_box addItemCargoGlobal ["Exile_Item_GloriousKnakworst", 1 + (random 2)];
	_box addItemCargoGlobal ["Exile_Item_PlasticBottleFreshWater", 1 + (random 2)];
	_box addItemCargoGlobal ["Exile_Item_Beer", 5 + (random 1)];
	_box addItemCargoGlobal ["Exile_Item_Laptop", (random 1)];
	_box addItemCargoGlobal ["Exile_Item_BaseCameraKit", (random 2)];
	_box addItemCargoGlobal ["Exile_Item_InstaDoc", 1 + (random 1)];
	_box addItemCargoGlobal ["Exile_Item_Matches", 1];
	_box addItemCargoGlobal ["Exile_Item_CookingPot", 1];
	_box addItemCargoGlobal ["Exile_Item_CodeLock", (random 1)];
	_box addItemCargoGlobal ["Exile_Item_MetalPole", 1];
	_box addItemCargoGlobal ["Exile_Item_LightBulb", 1];
	_box addItemCargoGlobal ["Exile_Item_FuelCanisterEmpty", 1];
	_box addItemCargoGlobal ["Exile_Item_WoodPlank", 1 + (random 8)];
	_box addItemCargoGlobal ["Exile_Item_woodFloorKit", 1 + (random 2)];
	_box addItemCargoGlobal ["Exile_Item_WoodWindowKit", 1 + (random 1)];
	_box addItemCargoGlobal ["Exile_Item_WoodDoorwayKit", 1 + (random 1)];
	_box addItemCargoGlobal ["Exile_Item_WoodFloorPortKit", 1 + (random 2)];
};