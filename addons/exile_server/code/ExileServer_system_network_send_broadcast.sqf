/*
	infiSTAR: Stop annoying double, tripple, octa killed messages
*/
params ["_messageName", "_messageParameters", ["_exludeSessionID", "-1"]];
_publicMessage = [_messageName, _messageParameters];
if(_exludeSessionID isEqualTo "-1")then
{
	_publicMessage remoteExecCall ["ExileClient_system_network_dispatchIncomingMessage",-2];
}
else
{
	_tmp = ExileSessions;
	_ownerIdsSentTo = [];
	{
		if !((_x select 0) isEqualTo _exludeSessionID) then
		{
			_ownerID = owner (_x select 1);
			if!(_ownerID in _ownerIdsSentTo)then
			{
				_ownerIdsSentTo pushBack _ownerID;
				_publicMessage remoteExecCall ["ExileClient_system_network_dispatchIncomingMessage",_ownerID];
			};
		};
	} forEach _tmp;
};