////////////////////////////////////////////////////////////////////////
//
//		Server Occupation script by second_coming
//
//		http://www.exilemod.com/profile/60-second_coming/
//
//		This script uses the fantastic DMS by Defent and eraser1
//
//		http://www.exilemod.com/topic/61-dms-defents-mission-system/
//
////////////////////////////////////////////////////////////////////////

// Shared Config for each occupation monitor

SC_debug 				    = false;				// set to true to turn on debug features (not for live servers) 
SC_extendedLogging          = false;                // set to true for additional logging
SC_infiSTAR_log			    = true;			        // true Use infiSTAR logging, false logs to server rpt
SC_maxAIcount 			    = 50;					// the maximum amount of AI, if the AI count is above this then additional AI won't spawn

SC_mapMarkers			    = false;			    // Place map markers at the occupied areas (occupyPlaces and occupyMilitary only) true/false
SC_minFPS 				    = 5;					// any lower than minFPS on the server and additional AI won't spawn

SC_scaleAI 				    = 10; 					// any more than _scaleAI players on the server and _maxAIcount is reduced for each extra player

SC_useWaypoints			    = false;					// When spawning AI create waypoints to make them enter buildings 
												    // (can affect performance when the AI is spawned and the waypoints are calculated)

                                                    // Occupation Places (towns, villages & cities roaming AI)
SC_occupyPlaces 			= true;				    // true if you want villages,towns,cities patrolled by bandits
SC_occupyPlacesSurvivors	= true;	                // true if you want a chance to spawn survivor AI as well as bandits (SC_occupyPlaces must be true to use this option)

                                                    // Occupation Military (roaming AI near military buildings)
SC_occupyMilitary 		    = true;			    // true if you want military buildings patrolled (specify which types of building below)

SC_buildings                = [	"Land_Cargo_Patrol_V1_F","Land_i_Barracks_V1_F","Land_i_Barracks_V1_dam_F",	"Land_i_Barracks_V2_F",
                                "Land_Cargo_House_V1_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V2_F",
                                "Land_Cargo_Patrol_V3_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F",
                                "Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F",
                                "Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_MilOffices_V1_F",
                                "Land_Radar_F","Land_Radar_Small_F","Land_Dome_Big_F","Land_Dome_Small_F","Land_Army_hut3_long_int",
                                "Land_Army_hut_int","Land_Army_hut2_int"
                                ]; 

SC_occupyStatic	 		    = false;		    	    // true if you want to garrison AI in specific locations (not working yet)

SC_occupyVehicle			= false;					// true if you want to have roaming AI vehicles
SC_occupyVehiclesLocked		= true;					// true if AI vehicles to stay locked until all the linked AI are dead

SC_occupySky				= false;					// true if you want to have roaming AI helis
SC_occupySea				= false;		        // true if you want to have roaming AI boats

SC_occupyPublicBus			= false;					// true if you want a roaming bus service
SC_occupyPublicBusClass 	= "Exile_Car_Ikarus_Party"; // class name for the vehicle to use as the public bus

SC_occupyLootCrates		    = false;					// true if you want to have random loot crates with guards
SC_numberofLootCrates       = 6;                    // if SC_occupyLootCrates = true spawn this many loot crates (overrided below for Namalsk)
SC_LootCrateGuards          = 4;                    // number of AI to spawn at each crate
SC_LootCrateGuardsRandomize = true;                 // Use a random number of guards up to a maximum = SC_numberofGuards (so between 1 and SC_numberofGuards)
SC_occupyLootCratesMarkers	= true;					// true if you want to have markers on the loot crate spawns


SC_occupyHeliCrashes		= true;					// true if you want to have Dayz style helicrashes
SC_numberofHeliCrashes      = 5;                    // if SC_occupyHeliCrashes = true spawn this many loot crates (overrided below for Namalsk)

SC_statics                  = [	[[1178,2524,0],8,250,true]	];      //[[pos],ai count,radius,search buildings]



// Settings for roaming ground vehicle AI
SC_maxNumberofVehicles 	    = 4;						
SC_VehicleClassToUse 		= [	"Exile_Car_LandRover_Green","Exile_Bike_QuadBike_Black","Exile_Car_Octavius_White"];

// Settings for roaming airborne AI (non armed helis will just fly around)
SC_maxNumberofHelis		    = 1;
SC_HeliClassToUse 		    = [	"Exile_Chopper_Huey_Armed_Green"];

// Settings for roaming seaborne AI (non armed boats will just sail around)
SC_maxNumberofBoats		    = 1;
SC_BoatClassToUse 		    = [	"B_Boat_Armed_01_minigun_F","I_Boat_Armed_01_minigun_F","O_Boat_Transport_01_F","Exile_Boat_MotorBoat_Police" ];
		
// AI Custom Loadouts        				

 // namalsk specific settings 
if (worldName == 'Namalsk') then 
{ 
	SC_maxAIcount 			= 80; 
	SC_occupySky			= false;
    SC_maxNumberofVehicles 	= 2;
    SC_numberofLootCrates 	= 3;
    SC_numberofHeliCrashes  = 2;
    SC_maxNumberofBoats		= 1;
    SC_occupyPublicBusClass = "Exile_Car_LandRover_Urban"; // the ikarus bus gets stuck on Namalsk
};



// Don't alter anything below this point
SC_liveVehicles 		= 0;
SC_liveVehiclesArray    = [];
SC_liveHelis	 		= 0;
SC_liveHelisArray       = [];
SC_liveBoats	 		= 0;
SC_liveBoatsArray       = [];
SC_publicBusArray         = [];

publicVariable "SC_liveVehicles";
publicVariable "SC_liveVehiclesArray";
publicVariable "SC_liveHelis";
publicVariable "SC_liveHelisArray";
publicVariable "SC_liveBoats";
publicVariable "SC_liveBoatsArray";
publicVariable "SC_numberofLootCrates";
publicVariable "SC_publicBusArray";