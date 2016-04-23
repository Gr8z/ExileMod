[player] spawn {
	private["_player","_c4"];
	_player = _this select 0;
	_c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _player; // explosive charge
	_c4 attachTo [_player, [0.0, 0.1, -0.15], "Pelvis"]; // attach it down there
	detach _c4; 
	_c4 setDamage 1; // explode the peepee
    cutText [format["Welcome to Ghostz Gamerz Exile Devs! Your gender has been changed. Enjoy your stay"], "PLAIN DOWN"];
};