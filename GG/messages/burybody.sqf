/*
	a3 epoch killfeed burybody script
	By Halv
	
	Copyright (C) 2015  Halvhjearne > README.md
*/

_id = _this select 2;
_corpse = _this select 3;

player removeAction _id;

if !(_corpse iskindOf "CAManBase")exitwith {
	titletext[format["%1 is not a body ...",_corpse], "PLAIN DOWN"];
};

if (alive _corpse || isPlayer _corpse)exitwith {
	titletext[format["%1 is not dead yet ...",name _corpse], "PLAIN DOWN"];
};

_info = _corpse getVariable ["HALV_STUDY",[]];
if(_info isEqualTo [])exitWith{titletext["Cant bury ai ...", "PLAIN DOWN"];};
_victimName = _info select 1;

_position = getPosATL _corpse;
if(({isPlayer _x} count (_position nearEntities [["AllVehicles"], 5])) > 1)exitwith{
	titletext["ANTI-DUPE!\nCant bury body with another player within 5 meters","PLAIN DOWN"];
};

_direction = getDir _corpse;

player playMove "AinvPknlMstpSlayWrflDnon_medic";

_list = [];
{if !(_x isEqualTo "")then{_list pushBack _x;};}forEach (assignedItems _corpse)+(primaryWeaponItems _corpse)+(handgunItems _corpse)+(secondaryWeaponItems _corpse)+(uniformItems _corpse)+(vestItems _corpse)+(backpackItems _corpse)+[primaryWeapon _corpse,handgunWeapon _corpse,secondaryWeapon _corpse,uniform _corpse,vest _corpse,backpack _corpse,headgear _corpse,goggles _corpse];

removeFromRemainsCollector[_corpse];
deleteVehicle _corpse;

if(count _list > 0)then{
	_box = createVehicle ["groundWeaponHolder", (getPosATL player), [], 0, "CAN_COLLIDE"];
	_cluttercutter = createVehicle ["Land_ClutterCutter_medium_F", (getPosATL player), [], 0, "CAN_COLLIDE"];

	{
		switch (true) do
		{
			case (isClass (configFile >> "CfgWeapons" >> _x)): {
				_kindOf = [(configFile >> "CfgWeapons" >> _x),true] call BIS_fnc_returnParents;
				if ("ItemCore" in _kindOf) then {
					_box addItemCargoGlobal [_x,1];
				} else {
					_box addWeaponCargoGlobal [_x,1];
				};
			};
			case (isClass (configFile >> "cfgMagazines" >> _x)): {
				_box addMagazineCargoGlobal [_x,1];
			};
			case ((getText(configFile >> "cfgVehicles" >> _x >>  "vehicleClass")) isEqualTo "Backpacks"): {
				_box addBackpackCargoGlobal [_x,1];
			};
		};
	}forEach _list;

	[_box,_cluttercutter]spawn{
		_WH = _this select 0;
		_WH2 = _this select 1;
		waitUntil{sleep 1;(_WH distance player > 150 || isNull player || !alive player)};
		clearWeaponCargoGlobal _WH;
		clearMagazineCargoGlobal _WH;
		clearBackpackCargoGlobal  _WH;
		clearItemCargoGlobal _WH;
		deleteVehicle _WH;
		deleteVehicle _WH2;
	};
};

sleep 6;

_mound = createVehicle [(["Land_Grave_dirt_F","Land_Grave_forest_F","Land_Grave_rocks_F"] call BIS_fnc_selectRandom), _position, [], 0, "CAN_COLLIDE"];
_mound setDir _direction;
_mound setPosATL _position;

[_mound]spawn{
	_mound = _this select 0;
	waitUntil{sleep 1;(_mound distance player > 150 || isNull player || !alive player)};
	deleteVehicle _mound;
};

titletext [format["The name was %1, may he or she rest in peace ...",_victimName], "PLAIN DOWN"];

player playMoveNow "AmovPercMstpSlowWrflDnon_Salute";

if(count _list > 0)then{
	sleep 15;
	titletext ["The loot will disappear when you leave it ...", "PLAIN DOWN"];
};
