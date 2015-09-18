/*
	infiSTAR.de: default onInventoryClosed uses not defined variables which causes a lot erroring...
*/
private["_unit","_container"];
_unit = _this select 0;
_container = _this select 1;

_isWeaponHolder = (typeOf _container) in ["GroundWeaponHolder","WeaponHolderSimulated"];
if(_isWeaponHolder)then
{
	_inuseby = _container getVariable ['HOLDER_IN_USE',''];
	if(netId player isEqualTo _inuseby)then
	{
		_container setVariable ['HOLDER_IN_USE','2:2',true];
	};
};

ExileClientInventoryOpened = false;
ExileClientCurrentInventoryContainer = objNull;
try
{
	if(_isWeaponHolder)then
	{
		throw "";
	};
	if((vehicle _unit) isKindOf "Man")then
	{
		throw "";
	};
	["vehicleSaveRequest",[netId _container]] call ExileClient_system_network_send;
}
catch
{
	true
};
true