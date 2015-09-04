private["_dir"];
//Display response message
systemChat(_this select 0);

//Default Val
_p2vehdir = 0;

//If vehicle was spawned (vehicle only passed back as input if it spawns)
if ((count _this) > 1) then {
	//Get direction of vehicle from player position
	_p2vehdir = [(player),(_this select 1)] call BIS_fnc_dirTo;
	//Point player to face that direction
	(player) setDir _p2vehdir;
	//Reveal Object to Player
	player reveal (_this select 1);
};

//byPlayer2