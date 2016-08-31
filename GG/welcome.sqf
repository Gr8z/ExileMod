[] spawn {    
		waitUntil{player == player};
		playSound "intro";
		_worldName = switch(toLower worldName)do{
                case "tanoa"             :{"Tanoa"};
                default{worldName};
        };
        /* GR8 */
        [[format["Welcome %2, to [GG] Ghostz Gamerz %1 Alpha", _worldName, profileNameSteam],"","","Join our teamspeak for 10k free pop tabs","","","","",""," ","","","",""], -.5, .85] call BIS_fnc_typeText;
        //sleep 2;
        [["Visit Us At:","www.GHOSTZGAMERZ.com","For Rules","Forums","and Donor Perks","",""], .5, .85] call BIS_fnc_typeText;
        /* GR8 */
};