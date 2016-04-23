/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
	
	Copyright infiSTAR - 2011 - 2016. All rights reserved.
	Christian (Chris) L. (infiSTAR23@gmail.com) Developer of infiSTAR
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
	
	
	READ:
	type 0 = just execute
	type 1 = toggleable function
	type 2 = function targets the selected player (it will be _this)
	
	name = name shown in the admin menu (this is also what has to be put in the EXILE_AHAT_CONFIG.sqf as Admin Power!)
	
	code = code to execute - if you have a linebreak within the code, you need to put a \ at the end of each line!
*/
class CfgCustomFunctions {
	class custom1 {
		type = 0;	// just execute
		name = "Delete all player mapmarkers";
		code = "{private '_a';_a = toArray _x;_a resize 15;if (toString _a == '_USER_DEFINED #') then {deleteMarker _x;}} forEach allMapMarkers;";
	};
};