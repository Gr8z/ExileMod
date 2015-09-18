/*
	infiSTAR.de: we don"t like spam selling on full servers to get a lot of money, do we?
*/
params["_messageName",["_messageParameters",[],[[]]]];
_whiteList = ["chopTreeRequest","vehicleSaveRequest"];
_exit = false;
if!(_messageName in _whiteList)then
{
	_stringcode = str _this;
	if(isNil"fnc_check_packets_QUEARRAY")then{fnc_check_packets_QUEARRAY = [];};
	if(_stringcode in fnc_check_packets_QUEARRAY)then
	{
		_inputID = fnc_check_packets_QUEARRAY find _stringcode;
		_lastCall = fnc_check_packets_QUEARRAY select (_inputID+1);
		_timedif = diag_tickTime - _lastCall;
		if(_timedif < 1)then
		{
			_exit = true;
			if(_messageName in ["purchaseItemRequest","sellItemRequest"])exitWith
			{
				for "_i" from 0 to 3 do{closeDialog 0;};
			};
			network_send=format["TO_MANY_CALLS! - PID:%1 :: TIMEDIF:%2 :: INPUT:%3",getPlayerUID player,_timedif,_stringcode];publicVariableServer"network_send";
		}
		else
		{
			fnc_check_packets_QUEARRAY deleteRange [_inputID,(_inputID+1)];
		};
	};
	fnc_check_packets_QUEARRAY pushBack _stringcode;
	fnc_check_packets_QUEARRAY pushBack diag_tickTime;
};
if(_exit)exitWith{
	_log = format["ANTI-SPAM blocked [%1]",_messageName];
	systemChat _log;
};
_publicMessage = [ExileClientSessionId, _messageName, _messageParameters];
_publicMessage remoteExecCall ["ExileServer_system_network_dispatchIncomingMessage", 2];
_publicMessage = nil;