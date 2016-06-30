/*

 	Name: ExileClient_banking_network_updateATMResponse.sqf

*/
private ["_walletString","_bankString","_wallet","_bank"];
_walletString = _this select 0;
_bankString = _this select 1;
_wallet = parseNumber(_walletString);
_bank = parseNumber(_bankString);

if (ADVBANKING_CLIENT_DEBUG) then {[format["Server sent a update ATM message: Package: %1",_this],"UpdateATMResponse"] call ExileClient_banking_utils_diagLog;};

ExileClientPlayerMoney = _wallet;
ExileClientBank = _bank;

call ExileClient_banking_atm_updateATM;
