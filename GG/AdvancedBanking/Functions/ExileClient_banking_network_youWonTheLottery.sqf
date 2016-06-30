/*

 	Name: ExileClient_banking_network_youWonTheLottery.sqf

*/

private["_newMoney","_sender","_amount"];
_newMoney = parseNumber (_this select 0);
_sender = _this select 1;

_amount = _newMoney - ExileClientBank;
ExileClientBank = _newMoney;

if (ADVBANKING_CLIENT_DEBUG) then {[format["Server says someone sent you money. Package: %1",_this],"YouWonTheLottery"] call ExileClient_banking_utils_diagLog;};

["Success",[format["%1 has been added to your bank. Courtesy of %2",_amount,_sender]]] call ExileClient_gui_notification_event_addNotification;
