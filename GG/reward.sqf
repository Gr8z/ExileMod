[] spawn {  
	private["_eligible","_reward"];
	waitUntil{player == player};
	sleep 10;
	_eligible = player getVariable ["ExileReward", false];
	_reward = 1000;
	if (_eligible) then {
		[parseText format["
		<img size='2' shadow='0' image='GG\images\logo.paa'/><br/>
		<t size='0.7'font='OrbitronLight'>Daily Rewards</t><br/>
		<t size='0.7'font='OrbitronLight'>Congratulations, You just recieved <img size='0.6' image='GG\images\icons\exile.paa'/> %1 for logging in today!</t>",_reward],0,0,10,0] spawn bis_fnc_dynamictext;
	};
};