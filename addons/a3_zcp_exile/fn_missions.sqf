/**
*   Learn how to configure the missions
*   https://github.com/DevZupa/ZCP-A3-Exile/wiki/Configuration#mission-config
*/

[
	[
		"Battlezone", // name (0)
		[[10000,10000,0],[10000,10000,0]], // [[x,y,z],[x,y,z]] if using static location (1)
		["Reputation","random"], // Reward -> Random, Poptabs, Vehicle, Buildingbox, WeaponBox , BigWeaponBox, SniperWeaponBox (2)
		"alpha", // unique varname -> this gets checked and fixed automaticly on server start ( so don't really worry about it ).
		0, // unique index -> this gets checked and fixed automaticly on server start ( so don't really worry about it ).
		true, // spawnAI on start of the missions ( NEEDS AI system for this ) (5)
		false, // isStatic location ( if true it will take the location specified earlier) (6)
		["Random"], // baseFile -> Random OR the name of the sqf file OR array of basefiles to choose from ( eg: ["m3e_base1.sqf","m3e_village.sqf"], )
		-1, // capradius if you use a specific static basefile. -> put -1 if you want to use the corresponding one from the ZCP_Capbasses array).
		-1, // max terrainGradient -> when specific static basefile is used (9) -> put -1 if you want to use the corresponding one from the ZCP_Capbasses array).
		-1, // distancefromojects -> when specific static basefile is used (10) -> put -1 if you want to use the corresponding one from the ZCP_Capbasses array).
		600, // captime in seconds for this mission (11)
		4, // Minimum amount of AI at the start of mission (12)
        5, // Maximum amount of AI at start of mission ( If you want it to always be a number change MIN and MAX to the same number. )
        true, // deploy smoke on the circle border when mission is finished (14)
        0, // ammount of seconds to wait before deploying the smokescreen (15)
        0, // ammount of meters outside the circle to place the smoke sources ( 0 is ON the circle border, 50 would be 50 meter outside the border)
		true, // use Waves of AI to attack the base when a player is capping (17)
		[ // array of waves of AI () (18)
            [
                25, // procentage of the cap time to start attack (50 = 50% of the total captime)
                2, // Amount of AI units in a group
                1, // Amount of AI groups
                150, // distance in meter form ZCP for the ai to spawn
                true // false -> all groups from 1 random location, true -> all groups from their own random location
            ]
            ,
            [
                50, // procentage of the cap time to start attack (50 = 50% of the total captime)
                2, // Amount of AI units in a group
                1, // Amount of AI groups
                100, // distance in meter form ZCP for the ai to spawn
                true // false -> all groups from 1 random location, true -> all groups from their own random location
            ]
			,
			[
                75, // procentage of the cap time to start attack (50 = 50% of the total captime)
                2, // Amount of AI units in a group
                1, // Amount of AI groups
                100, // distance in meter form ZCP for the ai to spawn
                true // false -> all groups from 1 random location, true -> all groups from their own random location
            ]
        ],
		0, // Minimum amount of launchers for starting AI (19)
        0, // Maximum amount of launchers for starting AI (20)
        0, // Minimum amount of launchers for Wave AI (21)
        1,  // Maximum amount of launchers for Wave AI (22)
        ["moderate","random","AWARE", "YELLOW"], // Defender AI settings ['DMS difficulty','DMS gear', 'Behaviour', 'CombatMode'] (23)
        ["moderate","random","AWARE", "YELLOW"], // Wave AI difficulty (24)
        true, // spawn rewards in the air after the mission, false -> prespawn them on the ground empty and fill them on completion. ( Boxes and Vechicles only ).
        false, // City mode. -> Takes a city/village from the map as cappoint and places a flag in the center ( No base file needed ). This ignores the position configs. (26)
        true // Allow spawning of extra objects in the town if sqf file(s) is/are provided. (27)
    ],
    [
        "Battlepoint", // name (0)
        [[10000,10000,0],[10000,10000,0]], // [[x,y,z],[x,y,z]] if using static location (1)
        ["Reputation","random"], // Reward -> Random, Poptabs, Vehicle, Buildingbox, WeaponBox , BigWeaponBox, SniperWeaponBox (2)
        "bravo", // unique varname -> this gets checked and fixed automaticly on server start ( so don't really worry about it ).
        0, // unique index -> this gets checked and fixed automaticly on server start ( so don't really worry about it ).
        true, // spawnAI on start of the missions ( NEEDS AI system for this ) (5)
        false, // isStatic location ( if true it will take the location specified earlier) (6)
        ["random"], // baseFile -> Random OR the name of the sqf file OR array of basefiles to choose from ( eg: ["m3e_base1.sqf","m3e_village.sqf"], )
        -1, // capradius if you use a specific static basefile. -> put -1 if you want to use the corresponding one from the ZCP_Capbasses array).
        -1, // max terrainGradient -> when specific static basefile is used (9) -> put -1 if you want to use the corresponding one from the ZCP_Capbasses array).
        -1, // distancefromojects -> when specific static basefile is used (10) -> put -1 if you want to use the corresponding one from the ZCP_Capbasses array).
        600, // captime in seconds for this mission (11)
        4, // Minimum amount of AI at the start of mission (12)
        5, // Maximum amount of AI at start of mission ( If you want it to always be a number change MIN and MAX to the same number. )
        false, // deploy smoke on the circle border when mission is finished (14)
        0, // ammount of seconds to wait before deploying the smokescreen (15)
        0, // ammount of meters outside the circle to place the smoke sources ( 0 is ON the circle border, 50 would be 50 meter outside the border)
        true, // use Waves of AI to attack the base when a player is capping (17)
        [ // array of waves of AI () (18)
            [
                25, // procentage of the cap time to start attack (50 = 50% of the total captime)
                2, // Amount of AI units in a group
                1, // Amount of AI groups
                150, // distance in meter form ZCP for the ai to spawn
                true // false -> all groups from 1 random location, true -> all groups from their own random location
            ]
            ,
            [
                50, // procentage of the cap time to start attack (50 = 50% of the total captime)
                2, // Amount of AI units in a group
                1, // Amount of AI groups
                100, // distance in meter form ZCP for the ai to spawn
                true // false -> all groups from 1 random location, true -> all groups from their own random location
            ]
            ,
            [
                75, // procentage of the cap time to start attack (50 = 50% of the total captime)
                2, // Amount of AI units in a group
                1, // Amount of AI groups
                100, // distance in meter form ZCP for the ai to spawn
                true // false -> all groups from 1 random location, true -> all groups from their own random location
            ]
        ],
        0, // Minimum amount of launchers for starting AI (19)
        0, // Maximum amount of launchers for starting AI (20)
        0, // Minimum amount of launchers for Wave AI (21)
        1,  // Maximum amount of launchers for Wave AI (22)
        ["moderate","random","AWARE", "YELLOW"], // Defender AI settings ['DMS difficulty','DMS gear', 'Behaviour', 'CombatMode'] (23)
        ["moderate","random","AWARE", "YELLOW"], // Wave AI difficulty (24)
        true, // spawn rewards in the air after the mission, false -> prespawn them on the ground empty and fill them on completion. ( Boxes and Vechicles only ).
        true, // City mode. -> Takes a city/village from the map as cappoint and places a flag in the center ( No base file needed ). This ignores the position configs. (26)
        true // Allow spawning of extra objects in the town if sqf file(s) is/are provided. (27)
    ]
]