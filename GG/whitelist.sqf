if ((_this select 0) == player) then {
	if (!isDedicated) then {
		waitUntil {player == player};
		waitUntil {!isNil "SlotDonor"};
		if !(getPlayerUID player in SlotDonor) then {
			titleCut ["", "BLACK FADED", 10];
			sleep 1;
			[parseText "<t size='1.5' font='OrbitronLight' color='#a81e13'>VIP SLOT</t><br/><t size='1' font='OrbitronLight' color='#FFFFFF'>You have joined a VIP slot, please wait in the lobby for a regular slot or donate.</t>",0,0,10,0] spawn bis_fnc_dynamictext;
			sleep 3;
			disableUserInput true;
			sleep 1;
			endMission 'loser';
		} else {
			systemChat "YOU HAVE JOINED A VIP SLOT! NEVER JOIN A VIP WHEN A REGULAR SLOT IS OPEN";
		};
	};
};