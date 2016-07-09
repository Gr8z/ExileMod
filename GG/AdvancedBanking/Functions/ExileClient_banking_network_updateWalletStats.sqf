/*

 	Name: ExileClient_banking_network_updateWalletStats.sqf

*/
private["_bankString","_bankAmount"];
_walletString = _this select 0;
_walletAmount = parseNumber(_walletString);

if (ADVBANKING_CLIENT_DEBUG) then {[format["Server enacted update wallet stats. Package: %1",_this],"UpdateWalletStats"] call ExileClient_banking_utils_diagLog;};

ExileClientPlayerMoney = _walletAmount;
