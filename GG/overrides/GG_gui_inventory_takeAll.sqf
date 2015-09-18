/*
	infiSTAR: This is a bit more accurate checking if the player really has a weapon or if it is just an weapon item
*/
if !(isNull ExileClientCurrentInventoryContainer) then
{
	_container = ExileClientCurrentInventoryContainer;
	
	
	_closeInventory = false;
	if((typeOf _container) in ['GroundWeaponHolder','WeaponHolderSimulated'])then
	{
		_inuseby = _container getVariable ['HOLDER_IN_USE',netId player];
		if!(_inuseby isEqualTo (netId player))then
		{
			_objthatabuses = objectFromNetId _inuseby;
			if(isNull _objthatabuses)exitWith
			{
				_container setVariable ['HOLDER_IN_USE',netId player,true];
			};
			if((alive _objthatabuses)&&(_objthatabuses distance _container < 10))exitWith
			{
				_closeInventory = true;
				systemChat format['%1 is looting this item already.',name (objectFromNetId _inuseby)];
			};
		};
	};
	if(_closeInventory)exitWith{true};
	
	
	[_container, player] call ExileClient_util_playerCargo_takeAll;
	if (ExileClientPlayerIsBambi) then
	{
		if(!((currentWeapon player) isEqualTo '')||{!((primaryWeapon player) isEqualTo '')}||{!((secondaryWeapon player) isEqualTo '')})then
		{
			call ExileClient_object_player_bambiStateEnd;
		};
	};
};
true