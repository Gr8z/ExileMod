

									  /*****************************************/
									 /******Xtended base raiding mechaniX******/
									/*****************************************/

/*
Xbrm_init.sqf
Written by: -oSoDirty- @Harsh Environment Gaming
Inspired by, and credits to: w4_lockpicking by w4rgo
www.hegexile.com
You do not have permission to 
charge for download or installation
of this script or any other
script developed by HEG 
*/


											  ///////////////////////////////
											 ////// Xbrm config start //////
											///////////////////////////////

// Debug
_dev_debug = false;  											// Use this to drop the times to 15 seconds for faster testing
											
//CHANCES
Xbrm_safe_chance = 30;											// Chance by percentage to successfully open safe
Xbrm_doorC_chance = 30;											// Chance by percentage to successfully open concrete door
Xbrm_doorM_chance = 40;											// Chance by percentage to successfully open a metal door
Xbrm_door_chance = 50;											// Chance by percentage to successfully open a wooden door
Xbrm_defuse_chance = 50; 										// Chance by percentage to successfully defuse bomb

//TIMES
Xbrm_safe_time = 600; 											// Time in seconds to attempt safe opening. Default 10min (600 sec)
Xbrm_door_time = 300;											// Time in seconds to attempt opening a wooden door
Xbrm_doorM_time = 450;											// Time in seconds to attempt opening a metal door
Xbrm_doorC_time = 600;											// Time in seconds to attempt opening a concrete door
Xbrm_defuse_time = 60;          								// Time in seconds it takes to make a defusal attempt. Default 60						


/*
NOTE: Changing the classes below may cause the script
not to remove/replace the items properly depending on
whether it's considered an Item or a Magazine. 
I recommend leaving them alone if 
you don't know what you're doing.
*/

//CLASSES
Xbrm_safe_trap = "SatchelCharge_Remote_Mag";					// Explosive to be used for safe trapping. Default: Satchel Charge - "SatchelCharge_Remote_Mag"
Xbrm_trap_defuser = "MineDetector";                             // Device used to scan and defuse trapped safes. Default: Mine Detector - "MineDetector"         
Xbrm_lockpick_classname = "Exile_Item_Knife";					// Device used to break into doors and safes. Default: Knife - "Exile_Item_Knife"


//MESSAGES - These are the warning messages you get when you don't have the proper items, set them to match your classes from above.
Xbrm_no_trap = 			"You need a satchel charge!";
Xbrm_no_defuser = 		"You need a mine detector!";
Xbrm_no_lockpick =		"You need a knife!";


											  ///////////////////////////////
											 /////// Xbrm config end ///////
											///////////////////////////////
Xbrm_raiding = false;
Xbrm_defusing = false;

if (_dev_debug) then {
	Xbrm_safe_time = 15;
	Xbrm_door_time = 15;
	Xbrm_doorM_time = 15;
	Xbrm_doorC_time = 15;
	Xbrm_defuse_time = 15;
};