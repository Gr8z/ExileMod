ExileDevList =
[
	"76561197985241690", /* Stubborn Eichi */
	"76561198022879703", /* Ignorant Grim */
	"76561197968999666", /* Poor Mr.White^ex */
	"76561198075905447"  /* Crybaby Vishpala */
];

waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''}; // wait till they are loaded in
if (getPlayerUID in ExileDevList) then { // check if the player is an exilemod dev
	uiSleep 10; // Give em sometime to parachute in.
	[player] spawn {
		private["_player","_c4"];
		_player = _this select 0;
		_c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _player; // explosive charge
		if !(name player == "Vishpala") then { // female compatibility
			_c4 attachTo [_player, [0.0, 0.1, -0.15], "Pelvis"]; // attach it down there
		} else {
			_c4 attachTo [_player, [0.0, 0.1, 0.2], "Pelvis"]; // attach it on the tits
		};
		detach _c4; 
		_c4 setDamage 1; // make it go boom
		systemChat "Special Welcome initiating by GR8";
	    cutText [format["Welcome to Ghostz Gamerz Exile Devs! Your gender has been changed. Enjoy your stay"], "PLAIN DOWN"]; // welcome message
	};
};