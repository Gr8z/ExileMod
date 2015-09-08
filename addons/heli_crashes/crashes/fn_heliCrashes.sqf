/*
	File: fn_heliCrashes.sqf
	Author: [midgetgrimm]
	Purpose: Spawns random heli crash with random loot based on your config. Wipes it, checks it, deletes it, and respawns it.
	Notes: Global messages assist from eraser1, check config for notes on that
	TODO: better fill crate system; better messaging system;
*/
exsys_heliCrashSpawned = false;
exsys_safeToClean = true; 
heliSmoke = "test_EmptyObjectForFireBig" createVehicle [0,0,0];
heliCrash = objNull;
box = objNull;
box1 = objNull;
box2 = objNull;
exsys_cc_wreckRespawnTime = time;
exsys_cc_fnc_badPilot = {
			private["_randomCenter","_numOfCrashes","_minFromCenter","_maxFromCenter","_minFromNrstOb","_allowWaterMode","_allowShoreMode","_heliCrashSite","_wreckSelection","_prisonNameChoice","_numOfCrashesF","_itemW1","_itemW2","_itemW3"];
			if(!(exsys_heliCrashSpawned)) then {
				_randomCenter = exsys_cc_backUpCoords call BIS_fnc_selectRandom;
				_minFromCenter = 2500; 
				_maxFromCenter = 11000; 
				_minFromNrstOb = 25;
				_allowWaterMode = 0; 
				_allowShoreMode = 0;
				_heliCrashSite = [_randomCenter,_minFromCenter,_maxFromCenter,_minFromNrstOb,_allowWaterMode,20,_allowShoreMode] call BIS_fnc_findSafePos;
				_heliCrashSite pushBack 0;
				diag_log format["_heliCrashSite %1", _heliCrashSite];
				if (isNil '_heliCrashSite') then {
					_heliCrashSite = exsys_cc_backUpCoords call BIS_fnc_selectRandom;
					diag_log format["_heliCrashSite is nil %1",_heliCrashSite];
				};
				if ((str(_heliCrashSite) == "[10801.9,10589.6,100]")) then {
					_heliCrashSite = exsys_cc_backUpCoords call BIS_fnc_selectRandom;
					diag_log format["_heliCrashSite is bad %1",_heliCrashSite];
				};
				_wreckSelection = exsys_cc_wrecks call BIS_fnc_selectRandom;
				heliCrash = _wreckSelection createVehicle [0,0,0];
				heliCrash setPosATL [(_heliCrashSite) select 0,(_heliCrashSite) select 1,0];
				heliSmoke attachTo [heliCrash, [0,0,-2.1]];  

				_prisonNameChoice = exsys_cc_prisonNames call BIS_fnc_selectRandom;
				_numOfCrashesF = format ["%1 Prison supply chopper wreck",_prisonNameChoice];
				missionId = format ["%1 Prison Supply Crash",_prisonNameChoice];
				debugMarker = createMarker [
						_numOfCrashesF,
						//_heliCrashSite
						[((getPos heliCrash select 0) + (round(random 250) + 250)),((getPos heliCrash select 1) - (round(random 250) + 250)),(getPos heliCrash select 2)]
				];
				_numOfCrashesF setMarkerColor "ColorRed";
				_numOfCrashesF setMarkerText _numOfCrashesF;
				_numOfCrashesF setMarkerType "mil_destroy";

				boxCrate = exsys_cc_boxes call BIS_fnc_selectRandom;
				boxCrate1 = exsys_cc_boxes call BIS_fnc_selectRandom;
				boxCrate2 = exsys_cc_boxes call BIS_fnc_selectRandom;
				box = createVehicle [
					boxCrate, 
					[(getPos heliCrash select 0) - ((round(random 50)) + 40) *sin(round(random 359)),(getPos heliCrash select 1) + ((round(random 50)) + 40) * cos(round(random 359)),(getPos heliCrash select 2)], 
					[], 
					0, 
					"CAN_COLLIDE"
				];
				box allowDamage false;
				box1 = createVehicle [
					boxCrate1, 
					[(getPos heliCrash select 0) + ((round(random 50)) + 25) * sin(round(random 359)),(getPos heliCrash select 1) - ((round(random 50)) + 25) * cos(round(random 359)),(getPos heliCrash select 2)], 
					[], 
					0, 
					"CAN_COLLIDE"
				];
				box1 allowDamage false;
				box2 = createVehicle [
					boxCrate2, 
					[(getPos heliCrash select 0) - ((round(random 50)) + 30) * sin(round(random 359)),(getPos heliCrash select 1) + ((round(random 50)) + 30) * cos(round(random 359)),(getPos heliCrash select 2)], 
					[], 
					0,
					"CAN_COLLIDE"
				];
				box2 allowDamage false;
				clearWeaponCargoGlobal box;
				clearMagazineCargoGlobal box;
				clearItemCargoGlobal box;
				clearWeaponCargoGlobal box1;
				clearMagazineCargoGlobal box1;
				clearItemCargoGlobal box1;
				clearWeaponCargoGlobal box2;
				clearMagazineCargoGlobal box2;
				clearItemCargoGlobal box2;
				
				_itemW1 = exsys_cc_weapon call BIS_fnc_selectRandom;
				_itemW2 = exsys_cc_weapon call BIS_fnc_selectRandom;
				_itemW3 = exsys_cc_weapon call BIS_fnc_selectRandom;
				box addWeaponCargoGlobal [(_itemW1 select 0),(round(random 1))];
				box addMagazineCargoGlobal [(_itemW1 select 1),((round(random 3)) + 1)];
				box addWeaponCargoGlobal [(_itemW2 select 0),1];
				box addMagazineCargoGlobal [(_itemW2 select 1),((round(random 3)) + 1)];
				box addWeaponCargoGlobal [(_itemW3 select 0),1];
				box addMagazineCargoGlobal [(_itemW3 select 1),(round(random 3))];
				
				_itemUI = exsys_cc_usableItem call BIS_fnc_selectRandom;
				_itemUI2 = exsys_cc_usableItem call BIS_fnc_selectRandom;
				_itemUI3 = exsys_cc_usableItem call BIS_fnc_selectRandom;
				_itemRare = exsys_cc_rareItems call BIS_fnc_selectRandom;
				_itemRare2 = exsys_cc_rareItems call BIS_fnc_selectRandom;
				_itemAtt = exsys_cc_attachments call BIS_fnc_selectRandom;
				_itemAtt1 = exsys_cc_attachments call BIS_fnc_selectRandom;
				box1 addItemCargoGlobal [_itemUI,((round(random 1)) + 1)];
				box1 addItemCargoGlobal [_itemUI2,((round(random 2)) + 1)];
				box1 addItemCargoGlobal [_itemUI3,((round(random 1)) + 1)];
				box1 addItemCargoGlobal [_itemRare,(round(random 1))];
				box1 addItemCargoGlobal [_itemRare2,(round(random 1))];
				box1 addItemCargoGlobal [_itemAtt,((round(random 2)) + 1)];
				box1 addItemCargoGlobal [_itemAtt1,((round(random 2)) + 1)];
				
				_itemBP = exsys_cc_backPack call BIS_fnc_selectRandom;
				_itemBP1 = exsys_cc_backPack call BIS_fnc_selectRandom;
				_itemUni = exsys_cc_clothes call BIS_fnc_selectRandom;
				_itemUni2 = exsys_cc_clothes call BIS_fnc_selectRandom;
				box2 addBackpackCargoGlobal [_itemBP,1];
				box2 addBackpackCargoGlobal [_itemBP1,1];
				box2 addItemCargoGlobal [_itemUni,((round(random 1)) + 1)];
				box2 addItemCargoGlobal [_itemUni2,((round(random 1)) + 1)];
				diag_log "spawnCrashes finished";
				exsys_heliCrashSpawned = true;
				diag_log "================== Crash Loaded";
				_msgStart = format["  A %1 has been spotted! Clear the loot before others do!",missionId];
				_msgStart call exsys_cc_BroadcastMissionStatus;
		
			};
};
exsys_cc_fnc_wreckCheck =	{
				if(isNull heliCrash) exitWith {exsys_safeToClean = true;exsys_heliCrashSpawned = false;diag_log"Exiting Cleanup Call";};
				_nearPlayers = nearestObjects [heliCrash, ["Man"], 400];
				if(count _nearPlayers > 0) then {
						//this part in the foreach works, but the hints/messages will not.. so itslike an empty log variable atm
						diag_log "Players Nearby Give it another minute";
						_actualPlayer = [];
						{ 
							if((isPlayer _x) && (alive _x)) then {
							
								_actualPlayer pushBack (name _x);
								//systemChat "CLEAR THE AREA - CRASHSITE IS RIGGED - MOVE";
							};
								
						} foreach _nearPlayers;
						diag_log format["_actualPlayer %1",_actualPlayer];
						exsys_safeToClean = false;
						//todo: move this to a message that only local players see it, not all
						_msgStart3 = format["   The %1 has been rigged with explosives - CLEAR THE AREA",missionId];
						_msgStart3 call exsys_cc_BroadcastMissionStatus;
						sleep (((round(random 5)) + 1) * 60);		
						[] call exsys_cc_fnc_wreckCleanup;
						
						
				} else {
				
						[] call exsys_cc_fnc_wreckCleanup;
						
				};
};
exsys_cc_fnc_wreckCleanup = {
						
						diag_log "================== No Players nearby";						
						diag_log "================== Crash Cleaning started";
						detach heliSmoke;
						heliSmoke setPos [1,1,-99999];						
						_boom = "Bo_GBU12_LGB_MI10" createVehicle [(getPos heliCrash select 0),(getPos heliCrash select 1),-5];
						clearWeaponCargoGlobal box;
						clearMagazineCargoGlobal box;
						clearItemCargoGlobal box;
						clearWeaponCargoGlobal box1;
						clearMagazineCargoGlobal box1;
						clearItemCargoGlobal box1;
						clearWeaponCargoGlobal box2;
						clearMagazineCargoGlobal box2;
						clearItemCargoGlobal box2;
						deleteVehicle box;
						deleteVehicle box1;
						deleteVehicle box2;
						deleteVehicle heliCrash;
						deleteMarker debugMarker;
						_msgStart3 = format["  The %1 has been cleared out",missionId];
						_msgStart3 call exsys_cc_BroadcastMissionStatus;
						diag_log "================== Crash Cleaning ended";
						sleep (((round(random 10)) + 10) * 60);
						exsys_safeToClean = true;
						exsys_heliCrashSpawned = false;	
						diag_log "================== Cool Down Time Over For Another Crash";

};
sleep (10 * 60);
[] call exsys_cc_fnc_badPilot;
while {true} do {	
	if((time - exsys_cc_wreckRespawnTime) > (30 * 60)) then { //DEBUGTIMER
			diag_log "================== Lets see if safe to run cleanup";
			exsys_cc_wreckCheck = [] spawn exsys_cc_fnc_wreckCheck;
			waitUntil {scriptDone exsys_cc_wreckCheck};
			diag_log "================== Cleanup has run, time for another bad pilot";
			if(exsys_safeToClean && !(exsys_heliCrashSpawned)) then {
				diag_log "================= Bad Pilot Seen Flying Again";
				[] call exsys_cc_fnc_badPilot; 
				exsys_cc_wreckRespawnTime = time;
			};
			
			
	};
	
	uiSleep 1;
};