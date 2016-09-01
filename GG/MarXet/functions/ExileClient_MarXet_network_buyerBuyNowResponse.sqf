/*
*
*  ExileClient_MarXet_network_buyerBuyNowResponse.sqf
*  Author: WolfkillArcadia
*  © 2016 Arcas Industries
*  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
*  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
private["_stockArray","_location","_vehicleNetID","_price","_itemClassName","_sellersUID","_vehicleObject","_name","_containersBefore","_containersAfter","_dialog"];
_stockArray = _this select 0;
_location = parseNumber(_this select 1);
_vehicleNetID = _this select 2;
_price = parseNumber(_this select 3);
_itemClassName = (_stockArray select 2) select 0;
_sellersUID = _stockArray select 4;
if !(_vehicleNetID isEqualTo "") then
{
    _vehicleObject = objectFromNetId _vehicleNetID;
    player moveInDriver _vehicleObject;
    closeDialog 21000;
    _name = getText(configFile >> "CfgVehicles" >> ((_stockArray select 2) select 0) >> "displayName");
    if (_sellersUID isEqualTo (getplayerUID player)) then
    {
        ["SuccessTitleAndText", [
            "Vehicle Bought!",
            format ["Congratulations on your purchase of your old <t color='#ff0000'>%1</t>. Couldn't let go of it huh?<br/>Thank you for choosing Mar<t color='#531517'>X</t>et: Exile's leading marketplace!", _name]
        ]] call ExileClient_gui_toaster_addTemplateToast;
    }
    else
    {
        ["SuccessTitleAndText", [
            "Vehicle Bought!",
            format ["Congratulations on your purchase of your new <t color='#ff0000'>%1</t><br/>Your total cost was <t color='#ff0000'>%2</t><img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/>.<br/>Thank you for choosing Mar<t color='#531517'>X</t>et: Exile's leading marketplace!", _name, _price]
        ]] call ExileClient_gui_toaster_addTemplateToast;
    };
}
else
{
    switch (_location) do
	{
		case 0:
		{
			_containersBefore = [uniform player, vest player, backpack player];
			[player, _itemClassName] call ExileClient_util_playerCargo_add;
			_containersAfter = [uniform player, vest player, backpack player];
			if !(_containersAfter isEqualTo _containersBefore) then
			{
				["LoadDropdown","Left"] call ExileClient_MarXet_gui_load;
			};
		};
		case 1:
		{
			[(uniformContainer player), _itemClassName] call ExileClient_util_containerCargo_add;
		};
		case 2:
		{
			[(vestContainer player), _itemClassName] call ExileClient_util_containerCargo_add;
		};
		case 3:
		{
			[(backpackContainer player), _itemClassName] call ExileClient_util_containerCargo_add;
		};
	};
    if (_sellersUID isEqualTo (getplayerUID player)) then
    {
        ["SuccessTitleAndText", ["Bought Back", "Couldn't let go of it, huh? I understand :)"]] call ExileClient_gui_toaster_addTemplateToast;
    }
    else
    {
        ["SuccessTitleAndText", ["Successful Purchase", format["%1",_price]]] call ExileClient_gui_toaster_addTemplateToast;
    };
    _dialog = uiNameSpace getVariable ["RscMarXetDialog", displayNull];
    if !(_dialog isEqualTo displayNull) then
    {
        ["Sort",MarXet_Sorting] call ExileClient_MarXet_gui_load;
        ["LoadLeft"] call ExileClient_MarXet_gui_load;
        ["LoadRight"] call ExileClient_MarXet_gui_load;
    };
};
