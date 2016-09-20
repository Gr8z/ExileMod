/*  
	customize.sqf
*/

ExAd_HACKING_MIN_PLAYERS_ONLINE = 25;			//SCALAR - Minimun allowed players online to initalize a hack.

ExAd_HACKING_ALLOWED_HACKS = 1;					//SCALAR - Simultaneous hacks allowed.

ExAd_HACKING_MAX_TIME = 1200;					//SCALAR - Time to complete a hack

ExAd_HACKING_MAX_DISTANCE = 50;					//SCALAR - Maximum distance away from the object being hack players for the hack to proceed. 

ExAd_HACKING_TERRITORY_MAX = 2;					//SCALAR - Maximun times a territory can get hacked before a new restart.

ExAd_HACKING_MARKER_COLOR = "ColorBlue";		//STRING - What color should the map marker have.

ExAd_HACKING_MARKER_TITLE = "Base Raid";	//STRING - What title should the map marker have.

ExAd_HACKING_FAILED_HACK = 0.15;				//SCALAR - 0-1 The possability for the hack to fail once finished.

ExAd_HACKING_PLAYER_ONLINE = false;				//BOLLEAN - True if a player with build permissions for a base needs to be online for a hack to be possible.