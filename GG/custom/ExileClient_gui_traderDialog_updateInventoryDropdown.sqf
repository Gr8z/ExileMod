/**
 * ExileClient_gui_traderDialog_updateInventoryDropdown
 */
 
private["_dialog","_inventoryDropdown","_index","_nearVehicles"];
disableSerialization;
_dialog = uiNameSpace getVariable ["RscExileTraderDialog", displayNull];
_inventoryDropdown = _dialog displayCtrl 4004;
lbClear _inventoryDropdown;
_index = _inventoryDropdown lbAdd "Equipment";
_inventoryDropdown lbSetValue [_index, 1];
_inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\face_ca.paa"];
_inventoryDropdown lbSetCurSel 0;
if !((uniform player) isEqualTo "") then
{
	_index = _inventoryDropdown lbAdd "Uniform";
	_inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa"];
	_inventoryDropdown lbSetValue [_index, 2];
};
if !((vest player) isEqualTo "") then
{
	_index = _inventoryDropdown lbAdd "Vest";
	_inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa"];
	_inventoryDropdown lbSetValue [_index, 3];
};
if !((backpack player) isEqualTo "") then
{
	_index = _inventoryDropdown lbAdd "Backpack";
	_inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"];
	_inventoryDropdown lbSetValue [_index, 4];
};
_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 80];
{
	if (local _x) then
	{
		if (alive _x) then
		{
			_vehicleInfo = _x getVariable ["XG_AntiTheftInfo",[]];
			if!(_vehicleInfo isEqualTo []) then
			{
				_vehicleInfo params [["_group",""],["_vifamily","No Family"],["_ownerUID",""]];
				_family = player getVariable ["ExileClanID",""];
				if(_family isEqualTo -1) then
				{
					_family = "No Family";
				};
				if(_group isEqualTo "No Group") then
				{
					if!(_family isEqualTo "No Family") then
					{
						if((_family isEqualTo _vifamily) || (getPlayerUID player) isEqualTo _ownerUID) then
						{
							_index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
							_inventoryDropdown lbSetData [_index, netId _x];
							_inventoryDropdown lbSetValue [_index, 5];
						};
					}
					else
					{
						if((getPlayerUID player) isEqualTo _ownerUID) then
						{
							_index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
							_inventoryDropdown lbSetData [_index, netId _x];
							_inventoryDropdown lbSetValue [_index, 5];
						};
					};
				}
				else
				{
					if!(_family isEqualTo "No Family") then
					{
						if((str(group player) isEqualTo _group) || (_family isEqualTo _vifamily) || (getPlayerUID player) isEqualTo _ownerUID) then
						{
							_index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
							_inventoryDropdown lbSetData [_index, netId _x];
							_inventoryDropdown lbSetValue [_index, 5];
						};
					}
					else
					{
						if((str(group player) isEqualTo _group) || (getPlayerUID player) isEqualTo _ownerUID) then
						{
							_index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
							_inventoryDropdown lbSetData [_index, netId _x];
							_inventoryDropdown lbSetValue [_index, 5];
						};
					};
				};
			}
			else
			{
				_index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
				_inventoryDropdown lbSetData [_index, netId _x];
				_inventoryDropdown lbSetValue [_index, 5];
			};
		};
	};
}
forEach _nearVehicles;
true