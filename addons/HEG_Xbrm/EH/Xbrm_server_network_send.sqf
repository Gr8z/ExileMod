/*
Xbrm_server_network_send.sqf
Written by: -oSoDirty- @Harsh Environment Gaming
www.hegexile.com
You are free to use and or modify
this script however you please.
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/

private["_player","_objectID","_object","_type","_state"];

_player = _this select 0;
_objectID = _this select 1;
_object = objectFromNetId _objectID;
_type = _this select 2;
_state = _this select 3;


switch (_type) do
{
	case "door":
	{
		switch (_state) do
		{
			case "attempt":
			{
				[_objectID, "Someone is decoding your door near - ", "attempt"] spawn Xbrm_notifyMembers;
				[_objectID, _player, _type, "attempt"] spawn Xbrm_dbLogRaid;
				diag_log format ["%1 attempting to lockpick %2 , %3", _player , _objectID , _type];
			};
			case "failed":
			{
				diag_log format ["%1 failed to lockpick %2 , %3", _player , _objectID , _type];
				[_objectID, _player, _type, "failed"] call Xbrm_dbLogRaid;
			};
			case "success":
			{
				_object setVariable ["ExileIsLocked", 0,true];
				[_objectID, "Raiders have opened the door" , "complete"] spawn Xbrm_notifyMembers;
				[_objectID, _player, _type, "success"] spawn Xbrm_dbLogRaid;
				[_objectID, _type] spawn Xbrm_lockToggle;
				diag_log format ["%1 lockpicked %2 , %3", _player , _objectID , _type];
			};
		};
		
	};
	case "safe":
	{
		switch (_state) do
		{
			case "attempt":
			{
				[_objectID, "Someone is decoding your safe near - ", "attempt"] spawn Xbrm_notifyMembers;
				[_objectID, _player, _type, "attempt"] spawn Xbrm_dbLogRaid;
				diag_log format ["%1 attempting to lockpick %2 , %3", _player , _objectID , _type];
			};
			case "failed":
			{
				diag_log format ["%1 failed to lockpick %2 , %3", _player , _objectID , _type];
				[_objectID, _player, _type, "failed"] call Xbrm_dbLogRaid;
			};
			case "success":
			{
				_object setVariable ["ExileIsLocked", 0 ,true];
				_object animate ['DoorRotation', 1];
				[_objectID, "Raiders have opened the safe", "complete"] spawn Xbrm_notifyMembers;
				[_objectID, _player, _type, "success"] spawn Xbrm_dbLogRaid;
				[_objectID, _type] spawn Xbrm_lockToggle;
				diag_log format ["%1 lockpicked %2 , %3", _player , _objectID , _type];				
			};
		};
		
	};
	case "trap":
	{
		diag_log format ["[Xbrm] - Trap set at %1", time];
		_objectID spawn Xbrm_updateTrap;
	};
};