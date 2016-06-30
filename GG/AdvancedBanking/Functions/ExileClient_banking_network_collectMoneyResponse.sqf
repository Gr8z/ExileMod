/*

 	Name: ExileClient_banking_network_collectMoneyResponse.sqf
 	
*/
private["_wallet","_worth"];

_wallet = parseNumber(_this select 0);
_worth = parseNumber(_this select 1);

ExileClientPlayerMoney = _wallet;
if (ADVBANKING_CLIENT_DEBUG) then {[format["Collection Response from server. Package: %1",_this],"CollectMoneyResponse"] call ExileClient_banking_utils_diagLog;};
["Success",[format["You collected %1 caps from the wallet!",_worth]]] call ExileClient_gui_notification_event_addNotification;
