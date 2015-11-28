[] spawn {    
		waitUntil{player == player};
		playSound "intro";
		_worldName = switch(toLower worldName)do{
                case "altis"             :{"Altis"};
                case "bornholm"             :{"Bornholm"};
                case "chernarus"             :{"Chernarus"};
                default{worldName};
        };
        /* This is the advertisement. */
        [[format["Welcome to [GG] Ghostz Gamerz Exile %1", _worldName],"", format["Do Your best to survive %1", name player],"Double Click On Radio To Deploy Bike","Click 7 to Open View Distance Menu","7 Days To Pay Base Protection","","","",""," ","","","",""], -.5, .85] call BIS_fnc_typeText;
        //sleep 2;
        [["Visit Us At:","www.GHOSTZGAMERZ.com","For Rules","Forums","and Donor Perks","",""], .5, .85] call BIS_fnc_typeText;
        /* End of advertisement */
};