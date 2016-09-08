/*
	Project:
		XG_Anti-Theft

	Authors:
		[XG] StokesMagee:
			www.xexgaming.com

	Credits:
		Diamond
			http://www.legiongaminghq.org/
		Kuplion
			https://www.facebook.com/FriendlyPlayerShooting/
		William Rogers
			http://www.arma3-dayzrp.com/
*/

params [["_player",objNull],["_vehicle",objNull],["_family","No Family"],["_vehicleInfo",[]]];
_vehicleInfo params [["_group",""],["_vifamily","No Family"],["_ownerUID",""]];
_ret = true;
try
{
	if!((getPlayerUID _player) isEqualTo _ownerUID) then
	{
		throw false;
	}
	else
	{
		if((getPlayerUID _player) isEqualTo _ownerUID) then
		{
			if!(str(group _player) isEqualTo _group) then
			{
				_group = str(group _player);
				if(_group isEqualTo "R ") then
				{
					_group = "No Group";
				};
			};
			if!(_family isEqualTo _vifamily) then
			{
				_vifamily = _family;
			};
		};
		_ret = [_group,_vifamily,_ownerUID];
	};
}
catch
{
	_ret = _exception;
};
_ret