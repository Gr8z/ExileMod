/*

 	Name: ExileClient_banking_player_collectMoney.sqf
    
*/
private ["_worth","_playerMoney","_newMoney","_exception"];

_object = _this select 0;
_worth = _this select 1;
_objectNetId = netId _object;

try {
    if (_worth < 0) then {
        throw "Instructions unclear, received zero, expected millions.";
    };
    uiSleep 1;
    ["collectionRequest",[str(_worth),_objectNetId]] call ExileClient_system_network_send;
    if (ADVBANKING_CLIENT_DEBUG) then {[format["Collect some Money. Package: %1",_worth],"CollectMoney"] call ExileClient_banking_utils_diagLog;};
} catch {
    [_exception,"CollectMoney"] call ExileClient_banking_utils_diagLog;
    ["Whoops",["Houston, we done messed up. Please inform an admin"]] call ExileClient_gui_notification_event_addNotification;
};
