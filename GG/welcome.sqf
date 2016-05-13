[] spawn {    
		waitUntil{player == player};
		playSound "intro";
		_worldName = switch(toLower worldName)do{
                case "altis"             :{"Altis"};
                case "bornholm"             :{"Bornholm"};
                case "chernarus"             :{"Chernarus"};
                case "panthera3"             :{"Panthera"};
                default{worldName};
        };
        /* GR8 */
        [[format["Welcome %2, to [GG] Ghostz Gamerz Exile %1", _worldName, profileNameSteam],"","","Open XM8 Apps for Info and Tools","","","","",""," ","","","",""], -.5, .85] call BIS_fnc_typeText;
        //sleep 2;
        [["Visit Us At:","www.GHOSTZGAMERZ.com","For Rules","Forums","and Donor Perks","",""], .5, .85] call BIS_fnc_typeText;
        /* GR8 */
};