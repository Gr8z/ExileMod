/*

 	Name: ExileClient_banking_network_updateBankStats.sqf

*/
private["_bankString","_bankAmount"];
_bankString = _this select 0;
_bankAmount = parseNumber(_bankString);

if (ADVBANKING_CLIENT_DEBUG) then {[format["Server sent an bank update request. Package: %1",_this],"UpdateBankStats"] call ExileClient_banking_utils_diagLog;};

waitUntil {player == player};
ExileClientBank = _bankAmount;
call ExileClient_banking_atm_updateATM;
