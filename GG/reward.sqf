[] spawn {  
	private["_eligible","_reward"];
	waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''};
	waitUntil {!isNil "ExileReward"};
	sleep 10;
	_eligible = ExileReward;
	_reward = 1000;
	if (!(isNil "_eligible") && (_eligible)) then {
		[parseText format["
		<img size='2' shadow='0' image='GG\images\logo.paa'/><br/>
		<t size='0.7'font='OrbitronLight'>Daily Rewards</t><br/>
		<t size='0.7'font='OrbitronLight'>Congratulations, You just recieved <img size='0.6' image='GG\images\icons\exile.paa'/> %1 for logging in today! See you tomorrow</t>
		",_reward],0,0,10,0] spawn bis_fnc_dynamictext;
	};
};