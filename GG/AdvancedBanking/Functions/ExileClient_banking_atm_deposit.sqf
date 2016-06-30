/*

 	Name: ExileClient_banking_atm_deposit.sqf

*/

disableSerialization;
_display = uiNameSpace getVariable ["AdvBankingATM", displayNull];
_editBox = (_display displayCtrl 1400);
_amount = parseNumber(ctrlText _editBox);
_fromAccount = "PersonalBank";

try {
    if (_fromAccount isEqualTo "PersonalBank") then {
        if (_amount == 0) then {
            throw "Requested amount equals 0";
        };
        if (_amount > ExileClientPlayerMoney) then {
            throw "You cannot deposit more than what you have in your wallet";
        };
        if (ADVBANKING_CLIENT_DEBUG) then {[format["Deposit request sent to sever. Package: %1",_amount],"ATMDeposit"] call ExileClient_banking_utils_diagLog;};
        ["depositRequest",[str(_amount)]] call ExileClient_system_network_send;
    };
} catch {
    ["Error",_exception] call ExileClient_banking_network_handleATMMessage;
    [_exception,"DepositMoney"] call ExileClient_banking_utils_diagLog;
};
