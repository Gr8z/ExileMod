/*

 	Name: ExileClient_banking_network_collectMoneyResponse.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

    This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.

 	Description:
    Collection Money response

*/
private["_wallet","_worth"];

_wallet = parseNumber(_this select 0);
_worth = parseNumber(_this select 1);

ExileClientPlayerMoney = _wallet;
["Success",[format["You collected %1 caps from the wallet!",_worth]]] call ExileClient_gui_notification_event_addNotification;
