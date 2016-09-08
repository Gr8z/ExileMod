/**
 * ExileServer_system_network_event_onPlayerConnected
 */

private["_isKnownAccount"];
_uid = _this select 0;
_name = _this select 1;
if !(_uid in ["", "__SERVER__", "__HEADLESS__"]) then
{
	format["Player %1 (UID %2) connected!", _name, _uid] call ExileServer_util_log;
	_isKnownAccount = format["isKnownAccount:%1", _uid] call ExileServer_system_database_query_selectSingleField;
	if (_isKnownAccount) then
	{
		format["startAccountSession:%1:%2", _uid, _name] call ExileServer_system_database_query_fireAndForget;

        _isKnownBountyAccount = format["hasBountyAccount:%1",_uid] call ExileServer_system_database_query_selectSingleField;
        if !(_isKnownBountyAccount) then
        {
            format["createBountyAccount:%1:%2",_uid,_name] call ExileServer_system_database_query_fireAndForget;
        };
	}
	else
	{
		format["createAccount:%1:%2", _uid, _name] call ExileServer_system_database_query_fireAndForget;
        format["createBountyAccount:%1:%2",_uid,_name] call ExileServer_system_database_query_fireAndForget;
	};
};
true
