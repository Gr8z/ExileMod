// First person in the Cap zone is the capper (If he leaves, the closest on of the group is the new capper but time is reset!).
// When multiple people are in the zone and not in the same group, the zone is contested.
// Being first in the zone starts the timer.
// Holding a zone  gives you a reward after x Min.

ZCP_dev = false;

ZCP_CapTime = 600; // Seconds to cap an area uncontested
ZCP_CapRadius = 70; // Meter radius of the capture circle around the first object.
ZCP_MinWaitTime = 100; // seconds to wait to spawn a new capturepoint when 1 was capped.
ZCP_BaseCleanupDelay = 100; // seconds to wait to delete a captured base.

ZCP_MaxMissions = 1; // Ammount of cap points at the same time.
ZCP_Minimum_Online_Players = 5; // Ammount of players to be online before it allows to spawn capture points. !!! O = always

if(ZCP_dev) then {
	ZCP_CapTime = 30; // Seconds to cap an area uncontested
	ZCP_MinWaitTime = 20; // seconds to wait to spawn a new capturepoint when 1 was capped.
	ZCP_BaseCleanupDelay = 20; // seconds to wait to delete a captured base.

	ZCP_MaxMissions = 2; // Ammount of cap points at the same time.
	ZCP_Minimum_Online_Players = 0; // Ammount of players to be online before it allows to spawn capture points. !!! O = always
};

ZCP_RewardRelativeToPlayersOnline = true; // This will recalculate the crypto reward according the amount of online players.
ZCP_PoptabReward = 500; // Poptab reward for capping per player online.
ZCP_ServerMaxPlayers = 75; // Only needed to recalcuate the reward.
ZCP_MinPoptabReward = 2800; // The Poptab reward can never be recalculated lower then this.

ZCP_ReputationReward = 250; // Respect reward for capping per  player online.
ZCP_MinReputationReward = 1800; // The Respect reward can never be recalculated lower then this.

ZCP_VehicleReward = ["Exile_Car_SUVXL_Black","Exile_Car_Hunter","Exile_Car_Ifrit"]; // Vehicle classes for vehicle reward

ZCP_WeaponReward = [["LMG_Zafir_F",1],["Machinegun_arifle_MX_SW_F",1],["arifle_MX_SW_Black_F",1],["arifle_TRG21_F",1]]; // Classname + amount in an array in the reward array for weapons

ZCP_BuildingReward = [["Exile_Item_MetalPole",5],["Exile_Item_WoodFloorKit",5],["Exile_Item_WoodWallKit",25]]; // Classname + amount in an array in the reward array for buildings

ZCP_StaticPoints = false; // If true, the missions will use the provided location as spawnpoint.

// Server will keep as many missions up as ZCP_MaxMissions, And they will be randomly choosen from the following list
// Location is ignored if not using static points. just put [0,0,0] then.
// valid rewards -> Poptabs , Reputation
ZCP_CapPoints = [ // [name,[x,y,z],reward, varname,index]
	["Battle Zone",[12538.84,0,8522.3262],"Poptabs","alpha",0] ,
	["Battle Zone",[17229.852,0,14200.47],"Reputation","beta",1],
	["Battle Zone",[8158.2949,0,16988.289],"Reputation","charlie",2],
	["Battle Zone",[8158.2949,0,16988.289],"Poptabs","delta",3]
];

// For every spawned mission,
ZCP_CapBases = [ // located in capbases folder
	"base1.sqf",
	"base2.sqf",
	"base3.sqf"
];

/* These are arma 3 colors, look up the color naming if you are going to change this */
ZCP_FreeColor = "ColorIndependent"; // uncontested marker color
ZCP_CappedColor = "ColorCivilian"; // uncontested + capping color
ZCP_ContestColor = "ColorOPFOR"; // contested + capping color

ZCP_DisableVehicleReward = false; // Because it doesnt save without changing epoch code.

/* Do not change this*/
ZCP_Version = "2.0";
ZCP_Data = [];
ZCP_Bases = [];
ZCP_MissionCounter = 0;
