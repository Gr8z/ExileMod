private ["_objectStorage", "_staticObjectTemplates"];

endLoadingScreen;
 
[] spawn {     
		waitUntil{player == player};
        /* This is the advertisement. */
        [["Welcome to [GG] Ghostz Gamerz ExileMod Altis","", format["Do Your best to survive %1", name player],"","","","","","",""," ","","","",""], -.5, .85] call BIS_fnc_typeText;
        //sleep 2;
        [["Visit Us At:","www.GHOSTZGAMERZ.com","For Rules","Forums","and Donor Perks (SOON)","",""], .5, .85] call BIS_fnc_typeText;
        /* End of advertisement */
};

ExileClientIntroIsPlaying = false;

true