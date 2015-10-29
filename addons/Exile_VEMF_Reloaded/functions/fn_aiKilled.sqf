/*
	VEMF AI Killed by Vampire, rewritten by IT07

	Description:
	removes launchers if desired and announces the kill if enabled in config.cpp

	Params:
	_this select 0: OBJECT - the killed AI
	_this select 1: OBJECT - killer

	Returns:
	nothing
*/

_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
if not isNull _target then
{
	_target removeAllEventHandlers "MPKilled";
	_settings = [["keepLaunchers","keepAIbodies"]] call VEMFr_fnc_getSetting;
	_keepLaunchers = _settings select 0;
	if (_keepLaunchers isEqualTo -1) then
	{
		_secWeapon = secondaryWeapon _target;
		if not(_secWeapon isEqualTo "") then
		{
			_target removeWeaponGlobal _secWeapon;
			_missiles = getArray (configFile >> "cfgWeapons" >> _secWeapon >> "magazines");
			{
				if (_x in _missiles) then
				{
					_target removeMagazineGlobal _x;
				};
			} forEach (magazines _target);
		};
	};

	if ((_settings select 1) isEqualTo -1) then // If killEffect enabled
	{
		playSound3D ["A3\Missions_F_Bootcamp\data\sounds\vr_shutdown.wss", _target, false, getPosASL _target, 2, 1, 60];
		for "_u" from 1 to 8 do
		{
			if not(isObjectHidden _target) then
			{
				_target hideObjectGlobal true;
			} else
			{
				_target hideObjectGlobal false;
			};
			uiSleep 0.15;
		};
		_target hideObjectGlobal true;
		removeAllWeapons _target;
		// Automatic cleanup yaaay
		deleteVehicle _target;
	};

	_killer = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
	if isPlayer _killer then
	{
		if (vehicle _killer isEqualTo _killer) then // No roadkills please
		{
			_respectReward = "respectReward" call VEMFr_fnc_getSetting;
			if (_respectReward > 1) then
			{
				_message = [[]];
				_killMsg = ["AI KILLED","AI ELIMINATED","AI DISABLED"] call VEMFr_fnc_random;
				(_message select 0) pushBack [_killMsg,_respectReward];
				_dist = _target distance _killer;
				switch true do
				{
					case (_dist < 11):
					{
						if (_dist > 6) then
						{
							(_message select 0) pushBack ["close call",15]
						};
						if (_dist < 6) then
						{
							(_message select 0) pushBack ["CQB Master",25]
						};
					};
					case (_dist < 100):
					{
						if (_dist > 50) then
						{
							(_message select 0) pushBack ["+50m",10]
						};
						if (_dist < 50) then
						{
							(_message select 0) pushBack ["below 50m",15]
						};
					};
					case (_dist < 200):
					{
						if (_dist > 100) then
						{
							(_message select 0) pushBack ["above 100m",20]
						};
						if (_dist < 100) then
						{
							(_message select 0) pushBack ["below 100m",25]
						};
					};
					case (_dist < 500):
					{
						if (_dist > 250) then
						{
							(_message select 0) pushBack ["above 250m",35]
						};
						if (_dist < 250) then
						{
							(_message select 0) pushBack ["under 250m",30]
						};
					};
					case (_dist < 1000):
					{
						if (_dist > 500) then
						{
							(_message select 0) pushBack ["above 500m",50]
						};
						if (_dist < 500) then
						{
							(_message select 0) pushBack ["below 500m",40]
						};
					};
					case (_dist < 2000):
					{
						if (_dist > 1000) then
						{
							(_message select 0) pushBack ["sick range",100]
						};
						if (_dist < 1000) then
						{
							(_message select 0) pushBack ["range skill",85]
						};
					};
					case (_dist > 2000):
					{
						(_message select 0) pushBack [format["hax? %1m!!!", round _dist],250]
					};
				};
				[_killer, "showFragRequest", _message] call ExileServer_system_network_send_to;
				_curRespect = _killer getVariable ["ExileScore", 0];
				_respectToGive = 0;
				{
					_respectToGive = _respectToGive + (_x select 1)
				} forEach (_message select 0);
				_newRespect = _curRespect + _respectToGive;
				_killer setVariable ["ExileScore", _newRespect];
				ExileClientPlayerScore = _newRespect;
				(owner _killer) publicVariableClient "ExileClientPlayerScore";
				ExileClientPlayerScore = nil;
				format["setAccountMoneyAndRespect:%1:%2:%3", _killer getVariable ["ExileMoney", 0], _newRespect, (getPlayerUID _killer)] call ExileServer_system_database_query_fireAndForget;
			};

			_sayKilled = "sayKilled" call VEMFr_fnc_getSetting;
			if (_sayKilled > 0) then // Send kill message if enabled
			{
				_dist = _target distance _killer;
				if (_dist > -1) then
				{
					_curWeapon = currentWeapon _killer;
					if (_sayKilled isEqualTo 1) then
					{
						_kMsg = format["%1 killed an AI from %2m with %3", name _killer, round _dist, getText(configFile >> "CfgWeapons" >> _curWeapon >> "DisplayName")];
						[_kMsg, "sys"] spawn VEMFr_fnc_broadCast;
					};
					if (_sayKilled isEqualTo 2) then
					{
						VEMFrClientMsg = [format["You killed an AI from %1m with %2", round _dist, getText(configFile >> "CfgWeapons" >> _curWeapon >> "DisplayName")], "sys"];
						(owner _killer) publicVariableClient "VEMFrClientMsg";
						VEMFrClientMsg = nil;
					};
				};
			};
		};

		if not (vehicle _killer isEqualTo _killer) then
		{ // Send kill message if enabled
			if (("sayKilled" call VEMFr_fnc_getSetting) isEqualTo 1) then
			{
				_dist = _target distance _killer;
				if (_dist < 5) then
				{
					if (isPlayer _killer) then // Should prevent Error:NoUnit
					{
						_kMsg = format["%1 road-killed an AI", name _killer];
						[_kMsg, "sys"] spawn VEMFr_fnc_broadCast;
					};
				};
			};
		};
	};
};
