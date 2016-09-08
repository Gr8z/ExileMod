/*
© 2015 Zenix Gaming Ops
Developed by Rod-Serling
Co-Developed by Vishpala

All rights reserved.

Function:
	AVS_system_database_connect hook - Redirects Exile function calls to perform AVS functions.
*/
_isConnected = false;
try
{
	_result = call compile ("extDB2" callExtension "9:ADD_DATABASE:exile");

	if (_result select 0 isEqualTo 0) then
	{
		throw format ["Could not add database: %1", _result];
	};
	diag_log "AVS - Connected to database!";
	ExileServerDatabaseSessionId = str(round(random(999999)));
	_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:exile:SQL_CUSTOM_V2:%1:exile", ExileServerDatabaseSessionId]);
	_result = call compile ("extDB2" callExtension "9:ADD_DATABASE_PROTOCOL:exile:SQL_CUSTOM_V2:AVSDB:avs");

	if ((_result select 0) isEqualTo 0) then
	{
		throw format ["Failed to initialize database protocol: %1", _result];
	};
	ExileServerStartTime = (call compile ("extDB2" callExtension "9:TIME")) select 1;
	"extDB2" callExtension "9:LOCK";
	_isConnected = true;
}
catch
{
	diag_log "AVS - Database connection error!";
	diag_log format ["AVS - Database Error: %1", _exception];
	"extDB2" callExtension "9:SHUTDOWN";
};
_isConnected