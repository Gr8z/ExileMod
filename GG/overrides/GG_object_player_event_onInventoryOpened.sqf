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
_container = _this select 1;
_vehicleOwner = _container getVariable ['GR8owner', objNull];
_ownerGroup = units group _vehicleOwner;
if (isNil '_vehicleOwner') then {_ownerGroup = player;};


_inventory = [] spawn {
	disableSerialization;

	waitUntil { !(isNull (findDisplay 602)) };

	_button1 = (findDisplay 602) ctrlCreate ["RscButtonMenu",44927];
	_button1 ctrlSetPosition  [20.5*(((safezoneW/safezoneH)min 1.2)/40)+(safezoneX+(safezoneW-((safezoneW/safezoneH)min 1.2))/2),
	25.1*((((safezoneW/safezoneH)min 1.2)/1.2)/25)+(safezoneY+(safezoneH-(((safezoneW/safezoneH)min 1.2)/1.2))/2),
	8.5*(((safezoneW/safezoneH)min 1.2)/40),
	1*((((safezoneW/safezoneH)min 1.2)/1.2)/25)];
		
	_button1 ctrlCommit 0;
	_button1 ctrlSetText "DEPLOY BIKE";
	_button1 buttonSetAction "[] execVM 'GG\xm8Apps\apps\spawn_bike.sqf'";
		
	_button2 = (findDisplay 602) ctrlCreate ["RscButtonMenu",44928];
	_button2 ctrlSetPosition  [30*(((safezoneW/safezoneH)min 1.2)/40)+(safezoneX+(safezoneW-((safezoneW/safezoneH)min 1.2))/2),
	25.1*((((safezoneW/safezoneH)min 1.2)/1.2)/25)+(safezoneY+(safezoneH-(((safezoneW/safezoneH)min 1.2)/1.2))/2),
	8.5*(((safezoneW/safezoneH)min 1.2)/40),
	1*((((safezoneW/safezoneH)min 1.2)/1.2)/25)];
		
	_button2 ctrlCommit 0;
	_button2 ctrlSetText "VIEW DISTANCE";
	_button2 buttonSetAction "[] call CHVD_fnc_openDialog;";

};


if (ExileClientIsHandcuffed) then 
{
	_cancelEvent = true;
}
else 
{
	if (ExileClientActionDelayShown) then 
	{
		_cancelEvent = true;
	}
	else 
	{
		if (ExileClientIsInConstructionMode) then
		{
			_cancelEvent = true;	
		}
		else 
		{	
			if ((locked _container) isEqualTo 2) then
			{
				_cancelEvent = true;
			}
			else
			{
				if (_container getVariable ["ExileIsLocked", 1] isEqualTo -1) then
				{
					_cancelEvent = true;
				}
				else 
				{
					// GR8's Anti Steal
					if (!(_unit in _ownerGroup) && !(isNil  "_vehicleOwner") && (GG_gearSteal) && (ExilePlayerInSafezone) && ((cursortarget isKindOf "Air")||(cursortarget isKindOf "Car"))) then {
						_cancelEvent = true;
						["Whoops", ["Cannot access gear! You do not own this vehicle."]] call ExileClient_gui_notification_event_addNotification;
					} else {
						ExileClientInventoryOpened = true;
						ExileClientCurrentInventoryContainer = _container;
					};
					// GR8's Anti Steal
				};
			};
		};
	};
};
_cancelEvent