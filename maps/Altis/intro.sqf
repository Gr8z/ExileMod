private ["_objectStorage", "_staticObjectTemplates"];

endLoadingScreen;
 
[] spawn {     
		waitUntil{player == player};
        /* This is the advertisement. */
        [["Welcome to [GG] Ghostz Gamerz ExileMod Altis","", format["Do Your best to survive %1", name player],"","","","","","",""," ","Good luck...","","",""], -.5, .85] call BIS_fnc_typeText;
        //sleep 2;
        [["Visit Us At:","www.GHOSTZGAMERZ.com","","","","",""], .5, .85] call BIS_fnc_typeText;
        /* End of advertisement */
};

ExileClientIntroIsPlaying = false;

true