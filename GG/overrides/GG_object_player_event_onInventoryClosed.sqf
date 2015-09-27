/*
	infiSTAR.de: fixed grimbug
*/ 
private["_container"];
_container = _this select 1;
ExileClientInventoryOpened = false;
ExileClientCurrentInventoryContainer = objNull;
try
{
	if((typeOf _container) in ["GroundWeaponHolder","WeaponHolderSimulated"])then
	{
		throw "";
	};
	if(_container isKindOf "Man")then
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