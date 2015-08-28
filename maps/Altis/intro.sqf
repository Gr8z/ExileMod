private ["_objectStorage", "_staticObjectTemplates"];

endLoadingScreen;

waitUntil{sleep 1; ExileClientPlayerIsSpawned}; 

[] spawn {     
		waitUntil{player == player};
        /* This is the advertisement. */
        [["Welcome to [GG] Ghostz Gamerz ExileMod Altis","", format["Do Your best to survive %1", name player],"","","","","","",""," ","Temp Server Rules in XM8 press 6 to open.","","",""], -.5, .85] call BIS_fnc_typeText;
        //sleep 2;
        [["Visit Us At:","www.GHOSTZGAMERZ.com","","","","",""], .5, .85] call BIS_fnc_typeText;
        /* End of advertisement */
};

ExileClientIntroIsPlaying = false;

true