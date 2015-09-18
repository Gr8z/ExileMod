/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private['_cancelEvent','_container','_safes'];
_cancelEvent = false;
_container = _this select 1;
if (ExileClientIsInConstructionMode) then
{
	_cancelEvent = true;
}
else
{
	ExileClientInventoryOpened = true;
	if((typeOf _container) in ['GroundWeaponHolder','WeaponHolderSimulated'])exitWith
	{
		_closeInventory = false;
		ExileClientCurrentInventoryContainer = objNull;
		
		_inuseby = _container getVariable ['HOLDER_IN_USE',''];
		if(_inuseby isEqualTo '')then
		{
			_container setVariable ['HOLDER_IN_USE',netId player,true];
			ExileClientCurrentInventoryContainer = _container;
		}
		else
		{
			if(_inuseby isEqualTo (netId player))exitWith
			{
				ExileClientCurrentInventoryContainer = _container;
			};
			
			_objthatabuses = objectFromNetId _inuseby;
			if(isNull _objthatabuses)exitWith
			{
				_container setVariable ['HOLDER_IN_USE',netId player,true];
				ExileClientCurrentInventoryContainer = _container;
			};
			if((alive _objthatabuses)&&(_objthatabuses distance _container < 10))exitWith
			{
				_closeInventory = true;
				systemChat format['%1 is looting this item already.',name (objectFromNetId _inuseby)];
			};
		};
		_cancelEvent = _closeInventory;
	};
	/* -------------------------------------------------- */
	_safes = player nearObjects ['Exile_Container_Safe', 3];
	{
		if(_x getVariable ['ExileIsLocked',1] isEqualTo -1)exitWith
		{
			ExileClientCurrentInventoryContainer = _container;
			['SafeIsLockedWarning'] call ExileClient_gui_notification_event_addNotification;
			_cancelEvent = true;
		};
	} forEach _safes;
	if((locked _container) isEqualTo 2)then
	{
		_cancelEvent = true;
	}
	else
	{
		ExileClientCurrentInventoryContainer = _container;
	};
};
_cancelEvent