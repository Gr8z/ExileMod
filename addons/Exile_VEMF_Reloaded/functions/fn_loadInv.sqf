/*
	Author: VAMPIRE, rebooted by IT07

	Description:
	loads AI inventory

	Param:
	_this: ARRAY
	_this select 0: ARRAY - units to load inventory for
	_this select 1: STRING - what type of mission the loadout should be for
	_this select 2: SCALAR - inventory mode

	Returns:
	BOOLEAN - true if nothing failed
*/

private ["_ok","_params","_units","_mode","_settings","_useLaunchers","_aiGear","_uniforms","_headGear","_vests","_backpacks","_launchers","_rifles","_pistols","_policeMode"];
_ok = false;
_params = _this;
if (typeName _this isEqualTo "ARRAY") then
{
	_units = [_this, 0, [], [[]]] call BIS_fnc_param;
	if (count _units > 0) then
	{
		_mode = [_this, 1, "", [""]] call BIS_fnc_param;
		if not(_mode isEqualTo "") then
		{
			_policeMode = [_this, 2, 0, [0]] call BIS_fnc_param;
			if (_policeMode < 1) then
			{
				// Define settings
				_aiGear = [["aiGear"],["aiUniforms","aiHeadGear","aiVests","aiBackpacks","aiLaunchers","aiRifles","aiPistols"]] call VEMFr_fnc_getSetting;
				_uniforms = _aiGear select 0;
				_headGear = _aiGear select 1;
				_vests = _aiGear select 2;
				_backpacks = _aiGear select 3;
				_rifles = _aiGear select 5;
				_pistols = _aiGear select 6;
				_useLaunchers = ([["DynamicLocationInvasion"],["useLaunchers"]] call VEMFr_fnc_getSetting) select 0;
				if (_useLaunchers isEqualTo 1) then
				{
					_launchers = _aiGear select 4;
				};
				{
					private ["_unit","_gear","_ammo"];
					_unit = _x;
					// Strip it
					removeAllWeapons _unit;
					removeAllItems _unit;
					removeUniform _unit;
					removeVest _unit;
					removeBackpack _unit;
					removeGoggles _unit;
					removeHeadGear _unit;

					_gear = _uniforms call VEMFr_fnc_random;
					_unit forceAddUniform _gear; // Give the poor naked guy some clothing :)

					_gear = _headGear call VEMFr_fnc_random;
					_unit addHeadGear _gear;

					_gear = _vests call VEMFr_fnc_random;
					_unit addVest _gear;

					if ((floor random 2) isEqualTo 0) then
					{
						_gear = _backpacks call VEMFr_fnc_random;
						_unit addBackpack _gear;
						if (_useLaunchers isEqualTo 1) then
						{
							if ((floor random 4) isEqualTo 0) then
							{
								private ["_ammo"];
								_gear = _launchers call VEMFr_fnc_random;
								_unit addWeapon _gear;
								_ammo = getArray (configFile >> "cfgWeapons" >> _gear >> "magazines");
								if (count _ammo > 2) then
								{
									_ammo resize 2;
								};
								for "_i" from 0 to (2 + (round random 1)) do
								{
									_unit addMagazine (_ammo select floor random count _ammo);
								};
							};
						};
					};

					// Add Weapons & Ammo
					_gear = _rifles call VEMFr_fnc_random;
					_unit addWeapon _gear;
					_unit selectWeapon _gear;

					_ammo = getArray (configFile >> "cfgWeapons" >> _gear >> "magazines");
					if (count _ammo > 2) then
					{
						_ammo resize 2;
					};
					for "_i" from 0 to (3 + (round random 2)) do
					{
						_unit addMagazine (_ammo select floor random count _ammo);
					};

					_gear = _pistols call VEMFr_fnc_random;
					_unit addWeapon _gear;
					_ammo = getArray (configFile >> "cfgWeapons" >> _gear >> "magazines");
					for "_i" from 0 to (2 + (round random 2)) do
					{
						_unit addMagazine (_ammo select floor random count _ammo);
					};
				} forEach _units;
				_ok = true;
			};

			if (_policeMode isEqualTo 1) then
			{
				private ["_policeGear","_headGear","_vests"];
				_policeGear = [["policeConfig"],["headGear","vests","uniforms","rifles","pistols","backpacks"]] call VEMFr_fnc_getSetting;
				_headGear = _policeGear select 0;
				_vests = _policeGear select 1;
				_uniforms = _policeGear select 2;
				_rifles = _policeGear select 3;
				_pistols = _policeGear select 4;
				_backpacks = _policeGear select 5;
				{
					_unit = _x;
					// Strip it
					removeAllWeapons _unit;
					removeAllItems _unit;
					removeUniform _unit;
					removeVest _unit;
					removeBackpack _unit;
					removeGoggles _unit;
					removeHeadGear _unit;

					_hat = _headGear call VEMFr_fnc_random;
						_unit addHeadGear _hat;
					_vest = _vests call VEMFr_fnc_random;
						_unit addVest _vest;
					_uniform = _uniforms call VEMFr_fnc_random;
						_unit forceAddUniform _uniform;
					_rifle = _rifles call VEMFr_fnc_random;
						_unit addWeapon _rifle;
						_unit selectWeapon _rifle;
						_rifleAmmo = getArray (configFile >> "cfgWeapons" >> _rifle >> "magazines");
						_rifleAmmo = _rifleAmmo call BIS_fnc_arrayShuffle;
						if (count _rifleAmmo > 2) then { _rifleAmmo resize 2 };
						for "_ra" from 1 to 5 do { _unit addMagazine (_rifleAmmo select floor random count _rifleAmmo) };
					_pistol = _pistols select floor random count _pistols;
						_unit addWeapon _pistol;
						_pistolAmmo = getArray (configFile >> "cfgWeapons" >> _pistol >> "magazines");
						_pistolAmmo = _pistolAmmo call BIS_fnc_arrayShuffle;
						if (count _pistolAmmo > 2) then { _pistolAmmo resize 2 };
						for "_pa" from 1 to 3 do { _unit addMagazine (_pistolAmmo select floor random count _pistolAmmo) };
					_backpack = _backpacks call VEMFr_fnc_random;
					_unit addBackPack _backpack;
				} forEach _units;
			};

			if (_policeMode isEqualTo 2) then
			{
				private ["_policeGear","_headGear","_vests"];
				_policeGear = [["policeConfig"],["rifles","pistols"]] call VEMFr_fnc_getSetting;
				_rifles = _policeGear select 0;
				_pistols = _policeGear select 1;
				{
					_unit = _x;
					// Strip it
					removeAllWeapons _unit;
					removeAllItems _unit;
					removeUniform _unit;
					removeVest _unit;
					removeBackpack _unit;
					removeGoggles _unit;
					removeHeadGear _unit;
					_unit addHeadGear "H_HelmetB_light_black";
					_unit addGoggles "G_Balaclava_blk";
					_unit addVest "V_PlateCarrier2_blk";
					_unit forceAddUniform "Exile_Uniform_ExileCustoms";
					_rifle = _rifles call VEMFr_fnc_random;
					_unit addWeapon _rifle;
					_unit selectWeapon _rifle;
					_rifleAmmo = getArray (configFile >> "cfgWeapons" >> _rifle >> "magazines");
					_rifleAmmo = _rifleAmmo call BIS_fnc_arrayShuffle;
					if (count _rifleAmmo > 2) then { _rifleAmmo resize 2 };
					for "_ra" from 1 to 5 do { _unit addMagazine (_rifleAmmo select floor random count _rifleAmmo) };
					_pistol = _pistols select floor random count _pistols;
					_unit addWeapon _pistol;
					_pistolAmmo = getArray (configFile >> "cfgWeapons" >> _pistol >> "magazines");
					_pistolAmmo = _pistolAmmo call BIS_fnc_arrayShuffle;
					if (count _pistolAmmo > 2) then { _pistolAmmo resize 2 };
					for "_pa" from 1 to 3 do { _unit addMagazine (_pistolAmmo select floor random count _pistolAmmo) };
				} forEach _units;
			};
		};
	};
};

_ok
