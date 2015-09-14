/*
	infiSTAR: for some reason this variable wasn't defined for me, sometimes.
*/
if(isNil'ExileServerIsLocked')then{ExileServerIsLocked=true;};
if(ExileServerIsLocked)then
{
	call ExileServer_system_rcon_setupEvents;
	"Rcon events initialized!" call ExileServer_util_log;
	"#unlock" call ExileServer_system_rcon_event_sendCommand;
	ExileServerIsLocked = false;
	"Server unlocked and acception players. Have fun! :)" call ExileServer_util_log;
};
true