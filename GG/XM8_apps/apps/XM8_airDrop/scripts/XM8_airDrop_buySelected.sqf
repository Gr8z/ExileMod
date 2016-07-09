/*	XM8 airDrop app by

-Script description-
*/

_ok = [] call XM8_airDrop_okDrop;
(findDisplay 24015) closeDisplay 0;
if (_ok) then {
	XM8_airDrop_DropInProgress = true;
	_namePlayer = name player;
	ExileClientPlayerMoney = ExileClientPlayerMoney - XM8_airDrop_boxCost;
	["buyRequest",["WALLET",str(XM8_airDrop_boxCost)]] call ExileClient_system_network_send;
	hint format["Thanks for your order! your Air Drop order number is '%2-%3%4%5'",name player, XM8_airDrop_orderIDcharacters, XM8_airDrop_a1, XM8_airDrop_a2, XM8_airDrop_a3];
	_playerPOS = getPOSATL player;
	_pos = position player;
	XM8_airDrop_a1a2a3  = createMarker [XM8_airDrop_a1a2a3,_playerPOS];
	XM8_airDrop_a1a2a3  setMarkerText format["%1's Air Drop - %2%3%4",_namePlayer, XM8_airDrop_a1, XM8_airDrop_a2, XM8_airDrop_a3];
	XM8_airDrop_a1a2a3  setMarkerType "mil_objective";
	XM8_airDrop_a1a2a3  setMarkerColor "ColorRed";

	//["systemChatRequest", [format ["%1 JUST CALLED IN AN AIRDROP - CHECK YOUR MAP FOR LOCATION", _namePlayer]]] call ExileServer_system_network_send_broadcast;
	playSound3D ["a3\sounds_f\sfx\radio\ambient_radio17.wss",player,false,getPosASL player,1,1,25];

	for "_x" from 1 to 100 do {
		if (_x >= 2) then {cutText [format ["AIR DROP ARRIVING IN %1s", 101-_x], "PLAIN DOWN"];};
		uiSleep 1;
	};

	XM8_airDrop_lastDrop = time;
	publicVariable "XM8_airDrop_lastDrop";

	/////// Let's spawn us  an AI helo to carry the cargo /////////////////////////////////////////////////

	_heliType = "B_Heli_Transport_03_unarmed_F"; //You could put a random selection thingy here.
	_center = createCenter civilian;
	_grp = createGroup civilian;
	if(isNil("_grp2"))then{_grp2 = createGroup civilian;}else{_grp2 = _grp2;};
	_flyHeight = 350;
	_dropSpot = [(_pos select 0),(_pos select 1),_flyHeight];
	_heliDirection = random 360;
	_flyHeight = 200;  //Distance from ground that heli will fly at
	_heliStartDistance = 500;
	_spos=[(_dropSpot select 0) - (sin _heliDirection) * _heliStartDistance, (_dropSpot select 1) - (cos _heliDirection) * _heliStartDistance, (_flyHeight+200)];

	_heli = createVehicle [_heliType, _spos, [], 0, "FLY"];
	_heli allowDamage false;

	//So, apppppparently the heli needs a pilot.  Let's grab one from the BIS ranks
	_crew = _grp createUnit ["O_recon_F", _spos, [], 0, "NONE"];
	_crew moveInDriver _heli;
	_crew allowDamage false;

	_heli setCaptive true;  //Let's not let everyone else go after this guy, make him invisible to other Ai

	_heliDistance = 500;
	_dir = ((_dropSpot select 0) - (_spos select 0)) atan2 ((_dropSpot select 1) - (_spos select 1));
	_flySpot = [(_dropSpot select 0) + (sin _dir) * _heliDistance, (_dropSpot select 1) + (cos _dir) * _heliDistance, _flyHeight];

	_grp setCombatMode "BLUE";
	_grp setBehaviour "CARELESS";  //Just out for a sunday stroll.

	{_x disableAI "AUTOTARGET"; _x disableAI "TARGET";} forEach units _grp;

	//Well ole chap, where are we going?
	_wp0 = _grp addWaypoint [_dropSpot, 0, 1];
	[_grp,1] setWaypointBehaviour "CARELESS";
	[_grp,1] setWaypointCombatMode "BLUE";
	[_grp,1] setWaypointCompletionRadius 20;
	_wp1 = _grp addWaypoint [_flySpot, 0, 2];
	[_grp,2] setWaypointBehaviour "CARELESS";
	[_grp,2] setWaypointCombatMode "BLUE";
	[_grp,2] setWaypointCompletionRadius 20;
	_heli flyInHeight _flyHeight;

	//////// Create Purchased Object //////////////////////////////////////////////
	_object = createVehicle ["Exile_Container_SupplyBox", [(_spos select 0), (_spos select 1), (_spos select 2) - 5], [], 0, "FLY"];

	_i=0;
	while {_i < XM8_airDrop_boxItemCount} do {
	_object addMagazineCargoGlobal [(XM8_airDrop_BoxConstruction call BIS_fnc_selectRandom), (floor((random 10) + 1))];
	_object addMagazineCargoGlobal [(XM8_airDrop_BoxTools call BIS_fnc_selectRandom), (floor((random 5) + 5))];
	_object addMagazineCargoGlobal [(XM8_airDrop_BoxFood call BIS_fnc_selectRandom), (floor((random 5) + 1))];
	_object addMagazineCargoGlobal [(XM8_airDrop_rareItem call BIS_fnc_selectRandom), (floor((random 1) + 1))];
	_i = _i + 1;
	};

	_object addMagazineCargoGlobal [XM8_airDrop_mag, XM8_airDrop_boxMagCount];
	_object addWeaponCargoGlobal [XM8_airDrop_BoxWeapon, XM8_airDrop_boxWepCount];

	_object attachTo [_heli, [0,0,-5]];
	_object allowDamage false; //Let's not let these things get destroyed on the way there, shall we?

	//Wait until the heli completes the drop waypoint, then move on to dropping the cargo and all of that jazz
	While {true} do {
	sleep 0.1;
	if (currentWaypoint _grp >= 2) exitWith {};  //Completed Drop Waypoint
	};

	//  Now on to the fun stuff:
	detach _object;  //WHEEEEEEEEEEEEE
	_objectPosDrop = position _object;
	_heli fire "CMFlareLauncher";
	_heli fire "CMFlareLauncher";

	///////  Yes, I realize we're creating multiple scheduled threads here.  Sometimes, you gotta bite the bullet.  Only way to get the waitUntils to not freeze stuff up that I know of. //////

	//Delete heli once it has proceeded to end point
	[_heli,_grp,_flySpot,_dropSpot,_heliDistance] spawn {
	private ["_heli","_grp","_flySpot","_dropSpot","_heliDistance"];
	_heli = _this select 0;
	_grp = _this select 1;
	_flySpot = _this select 2;
	_dropSpot = _this select 3;
	_heliDistance = _this select 4;
	while{([_heli, _flySpot] call BIS_fnc_distance2D)>200}do{
	if(!alive _heli || !canMove _heli)exitWith{};
	sleep 5;
	};
	waitUntil{([_heli, _dropSpot] call BIS_fnc_distance2D)>(_heliDistance * .5)};
	{ deleteVehicle _x; } forEach units _grp;
	deleteVehicle _heli;
	};

	//Time based deletion of the heli, in case it gets distracted
	[_heli,_grp] spawn {
	private ["_heli","_grp"];
	_heli = _this select 0;
	_grp = _this select 1;
	sleep 30;
	if (alive _heli) then
	{
	{ deleteVehicle _x; } forEach units _grp;
	deleteVehicle _heli;
	};
	};

	//Attach Parachute / Flares / Smokes
	WaitUntil {(((position _object) select 2) < (_flyHeight-20))};
	_heli fire "CMFlareLauncher";
	_objectPosDrop = position _object;
	_para = createVehicle ["B_Parachute_02_F", _objectPosDrop, [], 0, ""];
	_object attachTo [_para,[0,0,-1.5]];

	deleteMarker XM8_airDrop_a1a2a3;
	_posObject = getPos _object;
	XM8_airDrop_a1a2a3  = createMarker [XM8_airDrop_a1a2a3,_posObject];
	XM8_airDrop_a1a2a3  setMarkerText format["%1's Air Drop - %2%3%4",_namePlayer, XM8_airDrop_a1, XM8_airDrop_a2, XM8_airDrop_a3];
	XM8_airDrop_a1a2a3  setMarkerType "mil_objective";
	XM8_airDrop_a1a2a3  setMarkerColor "ColorRed";

	_smoke1= "SmokeShellGreen" createVehicle getPos _object;
	_smoke1 attachto [_object,[0,0,-0.5]];
	_flare1= "F_40mm_Green" createVehicle getPos _object;
	_flare1 attachto [_object,[0,0,-0.5]];

	//Drop some flares and smokes on the ground when the object lands
	WaitUntil {((((position _object) select 2) < 1) || (isNil "_para"))};
	detach _object;
	_smoke2= "SmokeShellGreen" createVehicle getPos _object;
	_flare2= "F_40mm_Green" createVehicle getPos _object;

	hint format["Your Air Drop Was Successfully Delivered %1!",name player];
	XM8_airDrop_DropInProgress = false;

	uiSleep 400;
	deleteMarker XM8_airDrop_a1a2a3;
	uiSleep 300;
	deleteVehicle _object;
};