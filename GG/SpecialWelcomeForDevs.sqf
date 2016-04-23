ExileDevList =
[
	"76561197985241690", /* Stubborn Eichi */
	"76561198022879703", /* Ignorant Grim */
	"76561197968999666", /* Poor Mr.White^ex */
	"76561198075905447"  /* Crybaby Vishpala */
];

if (getPlayerUID in ExileDevList) then {
	waitUntil {!isNull findDisplay 46 && !isNil 'ExileClientLoadedIn' && getPlayerUID player != ''}; // wait till they are loaded in
	uiSleep 10; // Give em sometime to parachute in.
	[player] spawn {
		private["_player","_c4"];
		_player = _this select 0;
		_c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _player; // explosive charge
		_c4 attachTo [_player, [0.0, 0.1, -0.15], "Pelvis"]; // attach it down there
		detach _c4; 
		_c4 setDamage 1; // explode the peepee
		systemChat "Special Welcome initiating by GR8";
	    cutText [format["Welcome to Ghostz Gamerz Exile Devs! Your gender has been changed. Enjoy your stay"], "PLAIN DOWN"]; // welcome message
	};
};