[] spawn {  
	private["_eligible","_reward"];
	waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};
	sleep 10;
	["buyRequest",["RESPECT","1000"]] call ExileClient_system_network_send;
};