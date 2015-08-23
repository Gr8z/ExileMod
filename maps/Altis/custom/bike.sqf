if ("Exile_Item_JunkMetal" in magazines player) then{
	player removeMagazine "Exile_Item_JunkMetal";
	_spawn = "Exile_Bike_MountainBike";
	_posplr = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0];
	_dirplr = getDir player;
	_spwnveh = _spawn createVehicle (_posplr);  
sleep 3;
	cutText [format["Deployed Bikes Dont Save Over Restart"], "PLAIN DOWN"];
} else {
	SystemChat "You need one Junk Metal to Deploy a Mountain Bike"; 
};