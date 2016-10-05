class CfgTerritories
{
	// Base Cost / Radius
	// Level 1 is allways for Pop Tabs, >= 2 for Respect
	prices[] = 
	{
		// Purchase Price 	Radius 		Number of Objects 	Respect	
		{5000,				10,			20, 				10000		}, // Level 1
		{10000,				20,			40, 				20000		}, // Level 2 
		{15000,				30,			60, 				30000		}, // Level 3
		{20000,				40,			80,					40000		}, // Level 4
		{25000,				50,			100,				50000		}, // Level 5
		{30000,				60,			120,				60000		}, // Level 6
		{35000,				70,			140,				70000		}, // Level 7
		{40000,				80,			160,				80000		}, // Level 8
		{45000,				90,			180,				90000		}, // Level 9
		{50000,				100,		200,				100000		}  // Level 10
	};

	// A shortcut of the above maximum radius
	maximumRadius = 100;

	// Max Height a base can be built up to
	maximumHeight = 30;
	
	// The above * 2 plus coverving the 20m you can move while placing things
	minimumDistanceToOtherTerritories = 325; 

	// Maximum number of territories a player can own
	maximumNumberOfTerritoriesPerPlayer = 1;

	/**
	 * Defines the minimum distance to safe zones / trader cities where players
	 * cannot build territories
	 */
	minimumDistanceToTraderZones = 1000;

	/**
	 * Defines the minimum distance to spawn zones where players
	 * cannot build territories
	 */
	minimumDistanceToSpawnZones = 1000;

	// Amount of pop tabs per object to pay
	popTabAmountPerObject = 10;
};