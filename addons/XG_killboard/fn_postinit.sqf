XG_killboardServer = compileFinal preprocessFileLineNumbers "XG_killboard\XG_killboardServer.sqf";
[] spawn
{
	waitUntil { (time > 0) && PublicServerIsLoaded };
	call XG_killboardServer;
};