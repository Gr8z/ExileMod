
_logDetail = "=======================================================================================================";
[_logDetail,'A3_EXILE_PROCESSREPORTER'] call SC_fnc_log;
 _logDetail = format['[processReporter] Started @ %4 : [FPS: %1|PLAYERS: %2|THREADS: %3]',diag_fps,count allplayers,count diag_activeSQFScripts,time];
[_logDetail,'A3_EXILE_PROCESSREPORTER'] call SC_fnc_log;
_logDetail = "=======================================================================================================";
[_logDetail,'A3_EXILE_PROCESSREPORTER'] call SC_fnc_log;

{
	_logDetail = format ["[processReporter] %1 @ %2",_x,time];
	[_logDetail,'A3_EXILE_PROCESSREPORTER'] call SC_fnc_log;
} forEach diag_activeSQFScripts;

{
	_logDetail = format ["[processReporter] %1 @ %2",_x,time];
	[_logDetail,'A3_EXILE_PROCESSREPORTER'] call SC_fnc_log;
} forEach diag_activeSQSScripts;


_logDetail =  format ["[processReporter] Ended @ %1",time];
[_logDetail,'A3_EXILE_PROCESSREPORTER'] call SC_fnc_log;