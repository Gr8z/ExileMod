if (!isServer) exitWith {};

_displayMarkers 	= SC_debug; // only use for debug, no need for actual gameplay

private['_position'];

_logDetail = format ["[OCCUPATION:HeliCrashes]:: Initialised at %1",time];
[_logDetail] call SC_fnc_log;

_logDetail = format['[OCCUPATION:HeliCrashes]::  worldname: %1 crashes to spawn: %2',worldName,SC_numberofHeliCrashes];
[_logDetail] call SC_fnc_log;

for "_i" from 1 to SC_numberofHeliCrashes do
{
	_validspot 	= false;
	while{!_validspot} do 
	{
		sleep 0.2;
		_position = [ 0, 50, 1, 500, 500, 200, 200, 200, true, false ] call DMS_fnc_findSafePos;
		_validspot	= true;
	
		// Check for nearby spawn points and traders
		_nearestMarker = [allMapMarkers, _position] call BIS_fnc_nearestPosition;
		_posNearestMarker = getMarkerPos _nearestMarker;
		if(_position distance _posNearestMarker < 750) then { _validspot = false; };

		//Check if near another heli crash site
		_nearOtherCrash = (nearestObjects [_position,["Land_UWreck_MV22_F"],750]) select 0;	
		if (!isNil "_nearOtherCrash") then { _validspot = false; };

		//Check if near another loot crate site
		_nearOtherCrate = (nearestObjects [_position,["CargoNet_01_box_F"],500]) select 0;	
		if (!isNil "_nearOtherCrate") then { _validspot = false; };
		
		//Check if near player base
        _nearBase = (nearestObjects [_position,["Exile_Construction_Flag_Static"],500]) select 0;
        if (!isNil "_nearBase") then { _validspot = false;  };	
		
	};	
	
	_logDetail = format['[OCCUPATION:HeliCrashes] Crash %1 : Location %2',_i,_position];
    [_logDetail] call SC_fnc_log;
    
	_helicopter = "Land_UWreck_MV22_F";
	_vehHeli = _helicopter createVehicle [0,0,0];
	_heliFire = "test_EmptyObjectForFireBig" createVehicle (position _vehHeli);  
	_heliFire attachto [_vehHeli, [0,0,-1]];
	_vehHeli setPos _position;
		
	_positionOfBox = [_position,3,10,1,0,10,0] call BIS_fnc_findSafePos;
	_box = "Box_NATO_Ammo_F" createvehicle _positionOfBox;
	
	clearMagazineCargoGlobal _box;
	clearWeaponCargoGlobal _box;
	clearItemCargoGlobal _box;
	_box enableRopeAttach false;
	_box setVariable ["permaLoot",true];
	_box allowDamage false;
	_box addMagazineCargoGlobal ["HandGrenade", (random 2)];
	_box addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", (random 2)];
	_box addBackpackCargoGlobal   ["B_Parachute", 1 + (random 1)];
	_box addItemCargoGlobal  ["H_CrewHelmetHeli_B", 1 + (random 1)];
	_box addItemCargoGlobal  ["U_B_HeliPilotCoveralls", 1 + (random 1)];
	_box addItemCargoGlobal  ["ItemGPS", (random 1)];
	_box addItemCargoGlobal  ["Exile_Item_InstaDoc", (random 1)];
	_box addItemCargoGlobal ["Exile_Item_PlasticBottleFreshWater", 2 + (random 2)];
	_box addItemCargoGlobal ["Exile_Item_EMRE", 2 + (random 2)];
    
	// Add weapons with ammo to the Box
	_possibleWeapons = ["srifle_DMR_02_camo_F","srifle_DMR_03_woodland_F","srifle_DMR_04_F","srifle_DMR_05_hex_F"];
	_amountOfWeapons = 1 + (random 3);
	
    for "_i" from 1 to _amountOfWeapons do
    {
        _weaponToAdd = _possibleWeapons call BIS_fnc_selectRandom;
        _box addWeaponCargoGlobal [_weaponToAdd,1];
       
        _magazinesToAdd = getArray (configFile >> "CfgWeapons" >> _weaponToAdd >> "magazines");
        _box addMagazineCargoGlobal [(_magazinesToAdd select 0),round random 5];
    };
	
	if(_displayMarkers) then
	{
		_event_marker = createMarker [ format ["helicrash_marker_%1", _i], _position];
		_event_marker setMarkerColor "ColorRed";
		_event_marker setMarkerAlpha 1;
		_event_marker setMarkerText "Heli Crash";
		_event_marker setMarkerType "loc_Tree";
		_event_marker setMarkerBrush "Vertical";
		_event_marker setMarkerSize [(3), (3)];	
	};
};