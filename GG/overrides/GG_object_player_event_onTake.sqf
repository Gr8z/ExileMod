/*
	infiSTAR.de: putting back item on the ground if the weaponholder is in use by another player (not in all cases tho..)
*/
private['_unit','_container','_itemClassName','_itemType','_itemTypeMainCategory'];
_unit = _this select 0;
_container = _this select 1;
_itemClassName = _this select 2;

_itemTaken = true;
_inuseby = _container getVariable ['HOLDER_IN_USE',netId player];
if!(_inuseby isEqualTo (netId player))then
{
	_objthatabuses = objectFromNetId _inuseby;
	if(isNull _objthatabuses)exitWith
	{
		_itemTaken = true;
	};
	if((alive _objthatabuses)&&(_objthatabuses distance _container < 10))exitWith
	{
		_itemTaken = false;
		systemChat format['%1 is looting this item already.',name (objectFromNetId _inuseby)];
		
		_unit action ['CancelAction', _unit];
		if(_itemClassName in (backpack player))exitWith
		{
			if(!isNull _container)then
			{
				player action [
					'DropBag',
					_container,
					_itemClassName
				];
			}
			else
			{
				player action [
					'DropBag',
					'GroundWeaponHolder' createVehicle position player,
					_itemClassName
				];
			};
		};
		if(_itemClassName in (weapons player))exitWith
		{
			if(!isNull _container)then
			{
				player action [
					'DropWeapon',
					_container,
					_itemClassName
				];
			}
			else
			{
				player action [
					'DropWeapon',
					'GroundWeaponHolder' createVehicle position player,
					_itemClassName
				];
			};
		};
		if(_itemClassName in (magazines player))exitWith
		{
			if(!isNull _container)then
			{
				player action [
					'DropMagazine',
					_container,
					_itemClassName
				];
			}
			else
			{
				player action [
					'DropMagazine',
					'GroundWeaponHolder' createVehicle position player,
					_itemClassName
				];
			};
		};
	};
};
if(_itemTaken)exitWith{
	if(ExileClientPlayerIsBambi)then
	{
		_itemType = [_itemClassName] call BIS_fnc_itemType;
		_itemTypeMainCategory = _itemType select 0;
		if (_itemTypeMainCategory isEqualTo 'Weapon') then
		{
			call ExileClient_object_player_bambiStateEnd;
		};
	};
	if (_itemClassName isEqualTo 'Exile_Melee_Axe') then
	{
		player addSecondaryWeaponItem 'Exile_Magazine_Swing';
	};
	if ((_container getVariable ['ExileIsLocked',1]) isEqualTo -1)then
	{
		Exiled = format ['%1(%2) tried to open a locked storage (%3 - %4 at (%5)%6)',profileName,getPlayerUID player,typeOf _container,_itemClassName,mapGridPosition _container,getPosATL _container];
		publicVariableServer 'Exiled';
	};
	true
};
false