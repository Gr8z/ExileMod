/*
	a3 epoch killfeed server function
	By Halv
	
	Copyright (C) 2015  Halvhjearne > README.md
*/
#include "settings.sqf";
private "_weapon";
_player = _this select 0;
_killer = _this select 1;

_player setVariable ["bodyUID", getPlayerUID _player, true];

_message = "";
_dyntxt = "";
_loc_message = "";
_hint = "";

_killerName = name _killer;
_victimName = name _player;

_distance = _player distance _killer;

_weapon = currentWeapon _killer;

_infostudy = [_killerName,_victimName,serverTime];

if (!(_killer isEqualTo _player) && !((vehicle _killer) isEqualTo (vehicle _player)))then{
	//if killer is not vehicle
	_txt = (gettext (configFile >> 'cfgWeapons' >> _weapon >> 'displayName'));
	_pic = (gettext (configFile >> 'cfgWeapons' >> _weapon >> 'picture'));
	_vehicleKillerType = typeOf(vehicle _killer);

	//if killer is a vehicle type, then we get vehicle picture
	{
		if(_vehicleKillerType isKindOf _x)exitWith{
			_pic = (gettext (configFile >> 'CfgVehicles' >> _vehicleKillerType >> 'picture'));
			//and if he was in a driver position of the vehicle, we get vehicle displayName aswell
			if(_killer isEqualTo (driver(vehicle _killer)))then{
				_txt = (gettext (configFile >> 'CfgVehicles' >> _vehicleKillerType >> 'displayName'));
			};
		};
	}count ["LandVehicle","Air","Ship"];

	//if weapon is a horn classname, then the killer was also driver, so we get vehicle displayName instead of weapon displayName
	if(_weapon in ["Horn","MiniCarHorn","SportCarHorn","TruckHorn2","TruckHorn","BikeHorn","CarHorn","TruckHorn3"])then{
		_txt = (gettext (configFile >> 'CfgVehicles' >> _vehicleKillerType >> 'displayName'));
	};
	_infostudy pushBack _pic;
	_infostudy pushBack _txt;
	//if leader of killer group was a player, then we are almost certain killer was a player, so we create a message
	if(isPlayer leader(group _killer))then{
		_dyntxt = format["
		<t size='0.75'align='left'shadow='1'color='#5882FA'>%1</t>
		<t size='0.5'align='left'shadow='1'>  Killed  </t>
		<t size='0.75'align='left'shadow='1'color='#c70000'>%2</t><br/>
		<t size='0.45'align='left'shadow='1'> With: </t>
		<t size='0.5'align='left'shadow='1'color='#FFCC00'>%3</t>
		<t size='0.45'align='left'shadow='1'> - Distance: </t>
		<t size='0.5'align='left'shadow='1'color='#FFCC00'>%4m</t><br/>
		<img size='2.5'align='left'shadow='1'image='%5'/>
		",
		_killerName,
		_victimName,
		_txt,
		_distance,
		_pic
		];

		_hint = parseText format ["
			<t size='1.25'align='center'shadow='1'color='#5882FA'>%1</t><br/>
			<t size='1'align='Center'shadow='1'>Killed:</t><br/>
			<t size='1.25'align='Center'shadow='1'color='#c70000'>%2</t><br/>
			<t size='1'align='Center'shadow='1'>With Weapon:</t><br/>
			<img size='5'shadow='1'image='%3'/><br/>
			<t size='1.25'align='Center'shadow='1'>[</t><t size='1.25'align='Center'shadow='1'color='#FFCC00'>%4</t><t size='1.25'align='Center'shadow='1'>]</t><br/>
			<t size='1'align='Center'shadow='1'>Distance:</t><br/>
			<t size='1.25'align='Center'shadow='1'color='#FFCC00'>%5m</t><br/>",
			_killerName,
			_victimName,
			_pic,
			_txt,
			_distance
		];
		_message = format["%1 was killed by %2 with %3 from %4m",_victimName, _killerName, _txt, _distance];
		_loc_message = format["[KillFeed]: PKILL: %1 was killed by %2 with %3 from %4m", _victimName, _killerName, _weapon, _distance];
	}else{
		if(_HALV_KillFeed_AI)then{
			//killer is not a player
			_killerType = typeOf _killer;
			if !((gettext (configFile >> 'CfgVehicles' >> _killerType >> 'displayName')) isEqualTo "")then{
				_killerName = gettext (configFile >> 'CfgVehicles' >> _killerType >> 'displayName');
			};
			if(_killerName isEqualTo "Error: No vehicle")then{
				_nearkillerobjs = nearestObjects [_player,["Epoch_Sapper_F","Epoch_SapperB_F","test_EmptyObjectForFireBig"],10];
				if(count _nearkillerobjs > 0)exitWith{
					_nearestkillerobj = _nearkillerobjs select 0;
					_killerName = gettext (configFile >> 'CfgVehicles' >> (typeOf _nearestkillerobj) >> 'displayName');
					_distance = 0;
					_txt = switch(typeOf _nearestkillerobj)do{
						case "Epoch_Sapper_F":{"Explosion"};
						case "Epoch_SapperB_F":{"Explosion"};
						case "test_EmptyObjectForFireBig":{"Fire"};
						default{"Explosion or Fire"};
					};
				};

//				if(typeName _killer isEqualTo "OBJECT")exitWith{};

			};
			_message = format["%1 was killed by a %2 with %3 from %4m",_victimName,_killerName,_txt,_distance];
			_hint = _message;
			_hint = format["<t align='Center'shadow='2'>%1</t>",_message];
			_dyntxt = format["<t size='0.70'align='left'shadow='1'>%1</t>",_message];
			_loc_message = format["[KillFeed]: PKILL: %1 | %2",_message,_killerType];

		};
	};
}else{
	//if player is killer
	_message = format["%1 Committed Suicide ...",name _player];
	_hint = format["<t align='Center'shadow='2'>%1</t>",_message];
	_dyntxt = format["<t size='0.70'align='left'shadow='1'>%1</t>",_message];
	_loc_message = format["[KillFeed]: PKILL: %1 committed suicide | '%2' - '%3'", _victimName,_killer,_weapon];
};

_player setVariable ["HALV_STUDY",_infostudy, true];

if(_loc_message isEqualTo "")then{_loc_message = format["[KillFeed]: PKILL: %1 was killed by %2 with %3",_player,_killer,_weapon];};

diag_log _loc_message;

if !(_message isEqualTo "")then{
	{
		if(_x select 0) then {
			HalvPV_player_message = (_x select 1);
			publicVariable "HalvPV_player_message";
		};
	}forEach[
		[_HALV_KillFeedhint,["hint", _hint]],[_HALV_KillFeedhintSilent,["hintSilent", _hint]],[_HALV_KillFeedsystemChat,["systemChat", _message]],
		[_HALV_KillFeeddynamictext,["dynamictext", _dyntxt]],[_HALV_KillFeedsideChat,["sideChat", _message, _killer]],
		[_HALV_KillFeedglobalChat,["globalChat", _message, _killer]],[_HALV_KillFeedcutText,["cutText", [_message, "PLAIN DOWN"]]],
		[_HALV_KillFeedtitleText,["titleText", [_message, "PLAIN DOWN"]]]
	];
};

