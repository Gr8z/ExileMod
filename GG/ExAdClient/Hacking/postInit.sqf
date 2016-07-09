/*  
	postInit.sqf
*/

execVM "GG\ExAdClient\Hacking\customize.sqf";

if(isNil "ExAd_HACKING_MIN_PLAYERS_ONLINE")then{ExAd_HACKING_MIN_PLAYERS_ONLINE = 30;};
if(isNil "ExAd_HACKING_ALLOWED_HACKS")then{ExAd_HACKING_ALLOWED_HACKS = 1;};
if(isNil "ExAd_HACKING_MAX_TIME")then{ExAd_HACKING_MAX_TIME = 1200;};
if(isNil "ExAd_HACKING_MAX_DISTANCE")then{ExAd_HACKING_MAX_DISTANCE = 50;};
if(isNil "ExAd_HACKING_TERRITORY_MAX")then{ExAd_HACKING_TERRITORY_MAX = 3;};
if(isNil "ExAd_HACKING_MARKER_COLOR")then{ExAd_HACKING_MARKER_COLOR = "ColorOrange";};
if(isNil "ExAd_HACKING_MARKER_TITLE")then{ExAd_HACKING_MARKER_TITLE = "Hacker activity";};
if(isNil "ExAd_HACKING_FAILED_HACK")then{ExAd_HACKING_FAILED_HACK = 0.15;};

if(isNil "ExAd_HACKING_FAILED_HACK")then{ExAd_VG_ACCESS_LEVEL = 1;}; /*Needs to be here if peolpe don't use the VirtualGarage*/

STR_ExAd_HACKING_NOTI_MAX_TERRITORY_HACKS_REACHED = "Connection failed! Territory Wi-Fi is down!";
STR_ExAd_HACKING_NOTI_TERRITORY_ONE_HACK = "Wi-Fi occupied!!";
STR_ExAd_HACKING_NOTI_MAX_SIM_HACKS = "The laptop overloaded and got destroyed! Another hacker is already using the grid.";
STR_ExAd_HACKING_HINT_TITLE = "Base Raid";
STR_ExAd_HACKING_HINT_HACK_START = "A brute force hack on a territory is detected on the map!";
STR_ExAd_HACKING_NOTI_VG_SUCCESS = "Hack successful! The Virtual Garage unloaded a %1";
STR_ExAd_HACKING_NOTI_VG_NO_VEH = "Hack successful! No vehicles were stored in the Virtual Garage.";
STR_ExAd_HACKING_NOTI_SAFE_SUCCESS = "Hack successful! The safe is now unlocked.";
STR_ExAd_HACKING_NOTI_INTERUPTED = "Hack has been interupted";
STR_ExAd_HACKING_NOTI_FAILED = "Hack failed! Circuits overloaded!";
STR_ExAd_HACKING_HINT_SUCCESS = "The Hack on the territory has been successfully completed!";
STR_ExAd_HACKING_HINT_FAILED = "The Hack on the territory has failed!";