/**
 * ExileClient_object_player_event_onInventoryOpened
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_cancelEvent","_container","_vehicleOwner","_ownerGroup","_unit"];
_cancelEvent = false;
_unit = _this select 0;
_container = _this select 1
_unit = _this select 0;
_container = _this select 1;
_vehicleOwner = _container getVariable ['GR8owner', objNull];
_ownerGroup = units group _vehicleOwner;
if (isNil '_vehicleOwner') then {_ownerGroup = player;};
try 
{
	if (ExileIsPlayingRussianRoulette) then 
	{
		throw true;
	};
	if (ExileClientIsHandcuffed) then 
	{
		throw true;
	};
	if (ExileClientActionDelayShown) then 
	
		throw true;
	};
	if (ExileClientIsInConstructionMode) then 
	
		throw true;
	};
	if ((locked _container) isEqualTo 2) the
	{
		throw true;
	};
	if (_container getVariable ["ExileIsLocked", 1] isEqualTo -1) then
	{
		throw true;
	};
	// GR8's Anti Steal
	if (!(_unit in _ownerGroup) && !(isNil  "_vehicleOwner") && (GG_gearSteal) && (ExilePlayerInSafezone) && ((cursortarget isKindOf "Air")||(cursortarget isKindOf "Car"))) then 
	{
		throw true;
		["InfoTitleAndText", ["STOP", "Cannot access the inventory! You do not own this vehicle."]] call ExileClient_gui_toaster_addTemplateToast;
	};
	ExileClientInventoryOpened = true;
	ExileClientCurrentInventoryContainer = _container;
}
catch 
{
	_cancelEvent = _exception;
};
_cancelEvent