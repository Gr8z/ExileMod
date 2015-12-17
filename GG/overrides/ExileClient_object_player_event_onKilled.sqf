/**
 * ExileClient_object_player_event_onKilled
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
closeDialog 0;
ExileClientLastDiedPlayerObject = player;
ExileClientIsAutoRunning = false;
if !((vehicle player) isEqualTo player) then
{
	unassignVehicle player; 
	player action ["GetOut", vehicle player]; 
	player action ["Eject", vehicle player];
};
setGroupIconsVisible [false, false];
false call ExileClient_gui_hud_toggle;
[] call ExileClient_object_player_event_unhook;
if !(ExileClientLastDeathMarker isEqualTo "") then 
{
	deleteMarkerLocal ExileClientLastDeathMarker;
};
ExileClientLastDeathMarker = createMarkerLocal [format ["Death%1", time], getPos player];
ExileClientLastDeathMarker setMarkerShapeLocal "ICON";
ExileClientLastDeathMarker setMarkerTypeLocal "KIA";
ExileClientLastDeathMarker setMarkerColorLocal "ColorRed";
ExileClientLastDeathMarker setMarkerAlphaLocal 0.5;
if (ExileClientIsInBush) then 
{
	call ExileClient_object_bush_detach;
};
if !(ExileClientBreakFreeActionHandle isEqualTo -1) then 
{
	player removeAction ExileClientBreakFreeActionHandle;
	ExileClientBreakFreeActionHandle = -1;
};
ExileClientIsHandcuffed = false;
ExileClientHostageTaker = objNull;


_code = {
	private['_unit','_nObject','_pos','_weaponCargo'];
	_unit = _this select 0;
	if(isNil'_unit')exitWith{};
	if(isNull _unit)exitWith{};
	_pos = getPosATL _unit;
	if(!isNull _nObject)then
	{
		_weaponsItemsCargo = weaponsItemsCargo _nObject;
		{
			_wep = primaryWeapon _unit;
			{
				if(_forEachIndex == 0)then
				{
					_wep = _x;
				};
				if(typeName _x isEqualTo 'STRING')then
				{
					_added = [_unit, _x] call ExileClient_util_playerEquipment_add;
				}
				else
				{
					{
						if(typeName _x isEqualTo 'STRING')then
						{
							_added = [_unit, _x] call ExileClient_util_playerEquipment_add;
						}
						else
						{
							_unit setAmmo [_wep, _x];
						};
					} forEach _x;
				};
			} forEach _x;
		} forEach _weaponsItemsCargo;
		
		clearBackpackCargoGlobal _nObject;
		clearItemCargoGlobal _nObject;
		clearMagazineCargoGlobal _nObject;
		clearWeaponCargoGlobal _nObject;
		deleteVehicle _nObject;
	};
};
[1.5, _code, [ExileClientLastDiedPlayerObject], false] call ExileClient_system_thread_addtask;