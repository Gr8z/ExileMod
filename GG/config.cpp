#include "MostWanted_Client\CfgMostWanted.cpp"
#include "MarXet\CfgMarXet.cpp"

class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;
		class fnc_AdminReq { allowedTargets=2; };
		class ExileServer_system_network_dispatchIncomingMessage { allowedTargets=2; };
		class ExAdServer_fnc_clientRequest { allowedTargets=2; };
		class AVS_fnc_rearmVehicle									{ allowedTargets=2; };
        class AVS_fnc_refuelPayment                                 { allowedTargets=2; };
        class AVS_fnc_refuelVehicle									{ allowedTargets=2; };
		class AVS_fnc_fillCanister									{ allowedTargets=2; };
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};	

class CfgNotifications
{
  class Success
  {
      description = "%1";
      title = "Success";
      iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
      iconText = "";
      color[] = {0.01,0.61,0.94,1};
      duration = 5;
      priority = 0;
      difficulty[] = {};
  };
  class Whoops
  {
      description = "%1";
      title = "Error";
      iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
      iconText = "";
      color[] = {0.01,0.61,0.94,1};
      duration = 5;
      priority = 0;
      difficulty[] = {};
  };
	class ZCP_Init
	{
		description = "%1";
		title = "Battle Zone Spawned";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		iconText = "";
		color[] = {0.01,0.61,0.94,1};
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};
	class ZCP_Capped
	{
		description = "%1";
		title = "Battle Zone Capped";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		iconText = "";
		color[] = {0.01,0.61,0.94,1};
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};
	class ZCP_Capping
	{
		description = "%1";
		title = "Battle Zone alert";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		iconText = "";
		color[] = {0.01,0.61,0.94,1};
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};
};

class CfgClans
{
	/*
		Defines the amount of pop tabs needed to register a new clan

		Default: 20,000
	*/
	registrationFee = 20000;

	/*
		A list of all characters allowed in a clan *name*

		NOTE: 
	*/
	clanNameAlphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ._-!:\\/";

	/*

		Maximum markers per clan

	*/
	maximumIcons = 20;

	/*
		Maximum number of characters on a Marker in a presistent system

		Note: MAX 255!
		
	*/
	maximumIconText = 50;

	/*

		Maximum poly markers per clan

	*/
	maximumPolys = 10;


	/* 

		Maximum points in poly
	*/
	maximumPolyNode = 10;
};
class Exile_AbstractCraftingRecipe
{
	name = "";
	pictureItem = ""; 
	returnedItems[] = {};
	components[] = {}; // Required components
	tools[] = {}; // Required tools (matches, gas cooker etc.)
	requiredInteractionModelGroup = ""; // See CfgInteractionModels
	requiresOcean = 0; // isSurfaceWater test
	requiresFire = 0; // inflamed object nearby
	requiresConcreteMixer = 0; // Check if concrete mixer is nearby
};
class CfgCraftingRecipes
{
	
	class BreachingChargeBigMomma: Exile_AbstractCraftingRecipe
	{
		name = "Breaching Charge (Big Momma)";
		pictureItem = "Exile_Item_BreachingCharge_BigMomma";
		returnedItems[] =
		{
			{1, "Exile_Item_BreachingCharge_BigMomma"}
		};
		tools[] =
		{
			"Exile_Item_Foolbox"
		};
		components[] = 
		{
			{3, "Exile_Item_BreachingCharge_Metal"},
			{1, "Exile_Item_MobilePhone"},
			{1, "Exile_Item_DuctTape"},
			{1, "Exile_Item_ZipTie"}
		};
		category = "Tools & Items";
	};

	class BreachingChargeMetal: Exile_AbstractCraftingRecipe
	{
		name = "Breaching Charge (Metal)";
		pictureItem = "Exile_Item_BreachingCharge_Metal";
		returnedItems[] =
		{
			{1, "Exile_Item_BreachingCharge_Metal"}
		};
		tools[] =
		{
			"Exile_Item_Foolbox"
		};
		components[] = 
		{
			{1, "Exile_Item_DuctTape"},
			{1, "SatchelCharge_Remote_Mag"}
		};
		category = "Tools & Items";
	};

	class BreachingChargeWood: Exile_AbstractCraftingRecipe
	{
		name = "Breaching Charge (Wood)";
		pictureItem = "Exile_Item_BreachingCharge_Wood";
		returnedItems[] =
		{
			{1, "Exile_Item_BreachingCharge_Wood"}
		};
		tools[] =
		{
			"Exile_Item_Foolbox"
		};
		components[] = 
		{
			{1, "Exile_Item_DuctTape"},
			{1, "DemoCharge_Remote_Mag"}
		};
		category = "Tools & Items";
	};

	class CookBBQSandwich: Exile_AbstractCraftingRecipe
	{
		name = "Cook BBQ Sandwich";
		pictureItem = "Exile_Item_BBQSandwich_Cooked";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_BBQSandwich_Cooked"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_BBQSandwich"}
		};
		category = "Food & Drinks";
	};

	class CookCatFood: Exile_AbstractCraftingRecipe
	{
		name = "Cook Cat Food";
		pictureItem = "Exile_Item_CatFood_Cooked";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_CatFood_Cooked"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_CatFood"}
		};
		category = "Food & Drinks";
	};

	class CookChristmasTinner: Exile_AbstractCraftingRecipe
	{
		name = "Cook Christmas Tinner";
		pictureItem = "Exile_Item_ChristmasTinner_Cooked";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_ChristmasTinner_Cooked"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_ChristmasTinner"}
		};
		category = "Food & Drinks";
	};
	class CookCoffee: Exile_AbstractCraftingRecipe
	{
		name = "Brew Coffee";
		pictureItem = "Exile_Item_PlasticBottleCoffee";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_PlasticBottleCoffee"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_PlasticBottleFreshWater"},
			{1, "Exile_Item_InstantCoffee"}
		};
		category = "Food & Drinks";
	};
	class CookDogFood: Exile_AbstractCraftingRecipe
	{
		name = "Cook Dog Food";
		pictureItem = "Exile_Item_DogFood_Cooked";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_DogFood_Cooked"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_DogFood"}
		};
		category = "Food & Drinks";
	};

	class CookGloriousKnakworst: Exile_AbstractCraftingRecipe
	{
		name = "Cook Glorious Knakworst";
		pictureItem = "Exile_Item_GloriousKnakworst_Cooked";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_GloriousKnakworst_Cooked"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_GloriousKnakworst"}
		};
		category = "Food & Drinks";
	};

	class CookMacasCheese: Exile_AbstractCraftingRecipe
	{
		name = "Cook Macas Cheese";
		pictureItem = "Exile_Item_MacasCheese_Cooked";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_MacasCheese_Cooked"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_MacasCheese"}
		};
		category = "Food & Drinks";
	};

	class CookPlasticBottleDirtyWater: Exile_AbstractCraftingRecipe
	{
		name = "Cook Dirty Water";
		pictureItem = "Exile_Item_PlasticBottleFreshWater";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_PlasticBottleFreshWater"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_PlasticBottleDirtyWater"}
		};
		category = "Food & Drinks";
	};
	class CookPlasticBottleSaltWater: Exile_AbstractCraftingRecipe
	{
		name = "Cook Salt Water";
		pictureItem = "Exile_Item_PlasticBottleFreshWater";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_PlasticBottleFreshWater"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_PlasticBottleSaltWater"}
		};
		category = "Food & Drinks";
	};

	class CookSausageGravy: Exile_AbstractCraftingRecipe
	{
		name = "Cook Sausage Gravy";
		pictureItem = "Exile_Item_SausageGravy_Cooked";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_SausageGravy_Cooked"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_SausageGravy"}
		};
		category = "Food & Drinks";
	};

	class CookSurstromming: Exile_AbstractCraftingRecipe
	{
		name = "Cook Surströmming";
		pictureItem = "Exile_Item_Surstromming_Cooked";
		requiresFire = 1;
		returnedItems[] =
		{
			{1, "Exile_Item_Surstromming_Cooked"}
		};
		tools[] =
		{
			"Exile_Item_CookingPot"
		};
		components[] = 
		{
			{1, "Exile_Item_Surstromming"}
		};
		category = "Food & Drinks";
	};

	class CraftBandage: Exile_AbstractCraftingRecipe
	{
		name = "Craft Bandage";
		pictureItem = "Exile_Item_Bandage";
		returnedItems[] =
		{
			{1, "Exile_Item_Bandage"}
		};
		components[] = 
		{
			{4, "Exile_Item_ToiletPaper"}
		};
		category = "Tools & Items";
	};

	class CraftConcreteDoorway: Exile_AbstractCraftingRecipe
	{
		name = "Craft Concrete Doorway";
		pictureItem = "Exile_Item_ConcreteDoorwayKit";
		requiresConcreteMixer = true;
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteDoorwayKit"},
			{3, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
		components[] = 
		{
			{3, "Exile_Item_Cement"},
			{3, "Exile_Item_Sand"},
			{3, "Exile_Item_MetalPole"},
			{3, "Exile_Item_WaterCanisterDirtyWater"},
			{1, "Exile_Item_FuelCanisterFull"}
		};
		category = "Concrete Contructions";
	};
	class CraftConcreteFloor: Exile_AbstractCraftingRecipe
	{
		name = "Craft Concrete Floor";
		pictureItem = "Exile_Item_ConcreteFloorKit";
		requiresConcreteMixer = true;
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteFloorKit"},
			{2, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
		components[] = 
		{
			{2, "Exile_Item_Cement"},
			{2, "Exile_Item_Sand"},
			{2, "Exile_Item_MetalPole"},
			{2, "Exile_Item_WaterCanisterDirtyWater"},
			{1, "Exile_Item_FuelCanisterFull"}
		};
		category = "Concrete Contructions";
	};
	class CraftConcreteFloorPort: Exile_AbstractCraftingRecipe
	{
		name = "Craft Concrete Floor Port";
		pictureItem = "Exile_Item_ConcreteFloorPortKit";
		requiresConcreteMixer = true;
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteFloorPortKit"},
			{3, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
		components[] = 
		{
			{3, "Exile_Item_Cement"},
			{3, "Exile_Item_Sand"},
			{3, "Exile_Item_MetalPole"},
			{3, "Exile_Item_WaterCanisterDirtyWater"},
			{1, "Exile_Item_FuelCanisterFull"}
		};
		category = "Concrete Contructions";
	};
	class CraftConcreteGate: Exile_AbstractCraftingRecipe
	{
		name = "Craft Concrete Gate";
		pictureItem = "Exile_Item_ConcreteGateKit";
		requiresConcreteMixer = true;
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteGateKit"},
			{4, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
		components[] = 
		{
			{4, "Exile_Item_Cement"},
			{4, "Exile_Item_Sand"},
			{4, "Exile_Item_MetalPole"},
			{4, "Exile_Item_WaterCanisterDirtyWater"},
			{1, "Exile_Item_FuelCanisterFull"}
		};
		category = "Concrete Contructions";
	};
	class CraftConcretStairs: Exile_AbstractCraftingRecipe
	{
		name = "Craft Concrete Stairs";
		pictureItem = "Exile_Item_ConcreteStairsKit";
		requiresConcreteMixer = true;
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteStairsKit"},
			{1, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
		components[] = 
		{
			{1, "Exile_Item_Cement"},
			{1, "Exile_Item_Sand"},
			{1, "Exile_Item_MetalPole"},
			{1, "Exile_Item_WaterCanisterDirtyWater"},
			{1, "Exile_Item_FuelCanisterFull"}
		};
		category = "Concrete Contructions";
	};
	class CraftConcretSupport: Exile_AbstractCraftingRecipe
	{
		name = "Craft Concrete Support";
		pictureItem = "Exile_Item_ConcreteSupportKit";
		requiresConcreteMixer = true;
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteSupportKit"},
			{1, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
		components[] = 
		{
			{1, "Exile_Item_Cement"},
			{1, "Exile_Item_Sand"},
			{1, "Exile_Item_MetalPole"},
			{1, "Exile_Item_WaterCanisterDirtyWater"},
			{1, "Exile_Item_FuelCanisterFull"}
		};
		category = "Concrete Contructions";
	};
	class CraftConcreteWall: Exile_AbstractCraftingRecipe
	{
		name = "Craft Concrete Wall";
		pictureItem = "Exile_Item_ConcreteWallKit";
		requiresConcreteMixer = true;
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteWallKit"},
			{2, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
		components[] = 
		{
			{2, "Exile_Item_Cement"},
			{2, "Exile_Item_Sand"},
			{2, "Exile_Item_MetalPole"},
			{2, "Exile_Item_WaterCanisterDirtyWater"},
			{1, "Exile_Item_FuelCanisterFull"}
		};
		category = "Concrete Contructions";
	};
	class CraftFirePlace: Exile_AbstractCraftingRecipe
	{
		name = "Craft Fire Place";
		pictureItem = "Exile_Item_CampFireKit";
		returnedItems[] = 
		{
			{1, "Exile_Item_CampFireKit"}
		};
		components[] = 
		{
			{2, "Exile_Item_WoodLog"}
		};
		category = "Tools & Items";
	};
	class CraftFloodLight: Exile_AbstractCraftingRecipe
	{
		name = "Craft Flood Light";
		pictureItem = "Exile_Item_FloodLightKit";
		requiresFire = 1;
		returnedItems[] = 
		{
			{1, "Exile_Item_FloodLightKit"}
		};
		components[] = 
		{
			{1, "Exile_Item_MetalPole"},
			{1, "Exile_Item_LightBulb"},
			{1, "Exile_Item_ExtensionCord"}
		};
		category = "Tools & Items";
	};
	class CraftFortificationUpgrade: Exile_AbstractCraftingRecipe
	{
		name = "Craft Fortification Upgrade";
		pictureItem = "Exile_Item_MetalBoard"; //<< CHANGE IT
		requiresFire = 1;
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_FortificationUpgrade"}
		};
		components[] = 
		{
			{2, "Exile_Item_MetalPole"},
			{4, "Exile_Item_MetalBoard"}
		};
		tools[] = {"Exile_Item_Grinder"};
		category = "Upgrades";
	};
	class CraftHBarrier5Kit: Exile_AbstractCraftingRecipe
	{
		name = "Craft H-barrier (5 Blocks)";
		pictureItem = "Exile_Item_HBarrier5Kit";
		requiredInteractionModelGroup = "WorkBench";
		tools[] = 
		{
			"Exile_Item_Pliers"
		};
		returnedItems[] = 
		{
			{1, "Exile_Item_HBarrier5Kit"}
		};
		components[] = 
		{
			{3, "Exile_Item_SandBagsKit_Long"},
			{2, "Exile_Item_MetalWire"}
		};
		category = "Tools & Items";
	};
	class CraftMetalBoard: Exile_AbstractCraftingRecipe
	{
		name = "Craft Metal Board";
		pictureItem = "Exile_Item_MetalBoard";
		requiresFire = 1;
		returnedItems[] = 
		{
			{1, "Exile_Item_MetalBoard"}
		};
		components[] = 
		{
			{2, "Exile_Item_JunkMetal"}
		};
		tools[] = {"Exile_Item_Grinder"};
		category = "Tools & Items";
	};
	class CraftMetalHedgehog: Exile_AbstractCraftingRecipe
	{
		name = "Craft Metal Hedgehog";
		pictureItem = "Exile_Item_MetalHedgehogKit";
		requiresFire = 1;
		returnedItems[] = 
		{
			{1, "Exile_Item_MetalHedgehogKit"}
		};
		components[] = 
		{
			{4, "Exile_Item_MetalPole"}
		};
		tools[] = {"Exile_Item_Grinder"};
		category = "Tools & Items";
	};
	class CraftMetalPole: Exile_AbstractCraftingRecipe
	{
		name = "Craft Metal Pole";
		pictureItem = "Exile_Item_MetalPole";
		requiresFire = 1;
		returnedItems[] = 
		{
			{1, "Exile_Item_MetalPole"}
		};
		components[] = 
		{
			{4, "Exile_Item_JunkMetal"}
		};
		tools[] = {"Exile_Item_Grinder"};
		category = "Tools & Items";
	};
	class CraftPortableGenerator: Exile_AbstractCraftingRecipe
	{
		name = "Craft Portable Generator";
		pictureItem = "Exile_Item_PortableGeneratorKit";
		requiresFire = 1;
		returnedItems[] = 
		{
			{1, "Exile_Item_PortableGeneratorKit"}
		};
		components[] = 
		{
			{4, "Exile_Item_MetalBoard"},
			{1, "Exile_Item_FuelCanisterFull"},
			{1, "Exile_Item_ExtensionCord"}
		};
		category = "Tools & Items";
	};
	class CraftRepairKitConcrete: Exile_AbstractCraftingRecipe
	{
		name = "Craft Concrete Repair Kit";
		pictureItem = "Exile_Item_Cement";
		requiresConcreteMixer = true;
		returnedItems[] = 
		{
			{1, "Exile_Item_RepairKitConcrete"},
			{1, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
		components[] = 
		{
			{4, "Exile_Item_Cement"},
			{2, "Exile_Item_Sand"},
			{1, "Exile_Item_WaterCanisterDirtyWater"},
			{1, "Exile_Item_FuelCanisterFull"}
		};
		category = "Tools & Items";
	};
	class CraftRepairKitMetal: Exile_AbstractCraftingRecipe
	{
		name = "Craft Metal Repair Kit";
		pictureItem = "Exile_Item_MetalBoard";
		requiresFire = 0;
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_RepairKitWood"}
		};
		components[] = 
		{
			{4, "Exile_Item_MetalBoard"}
		};
		tools[] = 
		{
			"Exile_Item_Foolbox",
			"Exile_Item_Grinder"
		};
		category = "Tools & Items";
	};
	class CraftRepairKitWood: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Repair Kit";
		pictureItem = "Exile_Item_WoodPlank";
		requiresFire = 0;
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_RepairKitWood"}
		};
		components[] = 
		{
			{4, "Exile_Item_WoodPlank"}
		};
		tools[] = 
		{
			"Exile_Item_Foolbox"
		};
		category = "Tools & Items";
	};
	class CraftSandBagsKitCorner: Exile_AbstractCraftingRecipe
	{
		name = "Craft Sandbags Kit (Corner)";
		pictureItem = "Exile_Item_SandBagsKit_Corner";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_SandBagsKit_Corner"}
		};
		components[] = 
		{
			{3, "Exile_Item_Sand"}
		};
		category = "Tools & Items";
	};
	class CraftSandBagsKitLong: Exile_AbstractCraftingRecipe
	{
		name = "Craft Sand Bags Kit (Long)";
		pictureItem = "Exile_Item_SandBagsKit_Long";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_SandBagsKit_Long"}
		};
		components[] = 
		{
			{6, "Exile_Item_Sand"}
		};
		category = "Tools & Items";
	};
	class CraftStorageCrate: Exile_AbstractCraftingRecipe
	{
		name = "Craft Storage Crate";
		pictureItem = "Exile_Item_StorageCrateKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_StorageCrateKit"}
		};
		components[] = 
		{
			{5, "Exile_Item_WoodPlank"}
		};
		category = "Tools & Items";
	};
	class CraftWaterBarrel: Exile_AbstractCraftingRecipe
	{
		name = "Craft Water Barrel";
		pictureItem = "Exile_Item_WaterBarrelKit";
		requiredInteractionModelGroup = "WorkBench";
		requiresFire = 1;
		returnedItems[] = 
		{
			{1, "Exile_Item_WaterBarrelKit"}
		};
		components[] = 
		{
			{20, "Exile_Item_PlasticBottleEmpty"}
		};
		category = "Tools & Items";
	};
	class CraftWireFenceKit: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wire Fence Kit";
		pictureItem = "Exile_Item_WireFenceKit_Long";
		requiredInteractionModelGroup = "WorkBench";
		tools[] = 
		{
			"Exile_Item_Grinder", 
			"Exile_Item_Pliers",
			"Exile_Item_Screwdriver"
		};
		returnedItems[] = 
		{
			{1, "Exile_Item_RazorWireKit_Long"}
		};
		components[] = 
		{
			{4, "Exile_Item_MetalPole"},
			{6, "Exile_Item_MetalWire"},
			{1, "Exile_Item_MetalScrews"}
		};
		category = "Tools & Items";
	};
	class CraftWoodDoorWay: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Doorway";
		pictureItem = "Exile_Item_WoodDoorwayKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodDoorwayKit"}
		};
		components[] = 
		{
			{6, "Exile_Item_WoodPlank"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodFloor: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Floor";
		pictureItem = "Exile_Item_WoodFloorKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodFloorKit"}
		};
		components[] = 
		{
			{4, "Exile_Item_WoodPlank"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodFloorPort: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Floor Port";
		pictureItem = "Exile_Item_WoodFloorPortKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodFloorPortKit"}
		};
		components[] = 
		{
			{6, "Exile_Item_WoodPlank"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodGate: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Gate";
		pictureItem = "Exile_Item_WoodGateKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodGateKit"}
		};
		components[] = 
		{
			{8, "Exile_Item_WoodPlank"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodPlank: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Plank";
		pictureItem = "Exile_Item_WoodPlank";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodPlank"}
		};
		components[] = 
		{
			{2, "Exile_Item_WoodLog"}
		};
		tools[] = {"Exile_Item_Handsaw"};
		category = "Wood Contructions";
	};
	class CraftWoodStairs: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Stairs";
		pictureItem = "Exile_Item_WoodStairsKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodStairsKit"}
		};
		components[] = 
		{
			{6, "Exile_Item_WoodPlank"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodSupport: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Support";
		pictureItem = "Exile_Item_WoodSupportKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodSupportKit"}
		};
		components[] = 
		{
			{6, "Exile_Item_WoodPlank"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodWall: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Wall";
		pictureItem = "Exile_Item_WoodWallKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodWallKit"}
		};
		components[] = 
		{
			{4, "Exile_Item_WoodPlank"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodWallHalf: Exile_AbstractCraftingRecipe
	{
		name = "Craft 1/2 Wood Wall";
		pictureItem = "Exile_Item_WoodWallHalfKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodWallHalfKit"}
		};
		components[] = 
		{
			{2, "Exile_Item_WoodPlank"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodWindow: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Window";
		pictureItem = "Exile_Item_WoodWindowKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodWindowKit"}
		};
		components[] = 
		{
			{6, "Exile_Item_WoodPlank"}
		};
		category = "Wood Contructions";
	};
	class CraftWorkBench: Exile_AbstractCraftingRecipe
	{
		name = "Craft Work Bench";
		pictureItem = "Exile_Item_WorkBenchKit";
		returnedItems[] = 
		{
			{1, "Exile_Item_WorkBenchKit"}
		};
		components[] = 
		{
			{4, "Exile_Item_WoodLog"}
		};
		category = "Tools & Items";
	};
	class EmptyFuelCanister: Exile_AbstractCraftingRecipe
	{
		name = "Empty Fuel Canister";
		pictureItem = "Exile_Item_FuelCanisterEmpty";
		returnedItems[] = 
		{
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
		components[] = 
		{
			{1, "Exile_Item_FuelCanisterFull"}
		};
		category = "Tools & Items";
	};
	class EmptyPlasticBottleDirtyWater: Exile_AbstractCraftingRecipe
	{
		name = "Empty Dirty Water";
		pictureItem = "Exile_Item_PlasticBottleEmpty";
		returnedItems[] =
		{
			{1, "Exile_Item_PlasticBottleEmpty"}
		};
		components[] =
		{
			{1, "Exile_Item_PlasticBottleDirtyWater"}
		};
		category = "Food & Drinks";
	};
	class EmptyPlasticBottleSaltWater: Exile_AbstractCraftingRecipe
	{
		name = "Empty Salt Water";
		pictureItem = "Exile_Item_PlasticBottleEmpty";
		returnedItems[] =
		{
			{1, "Exile_Item_PlasticBottleEmpty"}
		};
		components[] =
		{
			{1, "Exile_Item_PlasticBottleSaltWater"}
		};
		category = "Food & Drinks";
	};
	class FillEmptyPlasticBottleWithDirtyWater: Exile_AbstractCraftingRecipe
	{
		name = "Fill Dirty Water";
		pictureItem = "Exile_Item_PlasticBottleDirtyWater";
		requiredInteractionModelGroup = "WaterSource";
		returnedItems[] =
		{
			{1, "Exile_Item_PlasticBottleDirtyWater"}
		};
		components[] = 
		{
			{1, "Exile_Item_PlasticBottleEmpty"}
		};
		category = "Food & Drinks";
	};
	class FillEmptyPlasticBottleWithFreshWater: Exile_AbstractCraftingRecipe
	{
		name = "Fill Fresh Water";
		pictureItem = "Exile_Item_PlasticBottleFreshWater";
		requiredInteractionModelGroup = "CleanWaterSource";
		returnedItems[] =
		{
			{1, "Exile_Item_PlasticBottleFreshWater"}
		};
		components[] = 
		{
			{1, "Exile_Item_PlasticBottleEmpty"}
		};
		category = "Food & Drinks";
	};
	class FillEmptyPlasticBottleWithSaltWater: Exile_AbstractCraftingRecipe
	{
		name = "Fill Salt Water";
		pictureItem = "Exile_Item_PlasticBottleSaltWater";
		requiresOcean = 1;
		returnedItems[] = 
		{
			{1, "Exile_Item_PlasticBottleSaltWater"}
		};
		components[] = 
		{
			{1, "Exile_Item_PlasticBottleEmpty"}
		};
		category = "Food & Drinks";
	};
	class FillEmptyWaterCanisterWithDirtyWater: Exile_AbstractCraftingRecipe
	{
		name = "Fill Dirty Water";
		pictureItem = "Exile_Item_WaterCanisterDirtyWater";
		requiredInteractionModelGroup = "WaterSource";
		returnedItems[] =
		{
			{1, "Exile_Item_WaterCanisterDirtyWater"}
		};
		components[] = 
		{
			{1, "Exile_Item_WaterCanisterEmpty"}
		};
		category = "Food & Drinks";
	};
	class FillFuelCanister: Exile_AbstractCraftingRecipe
	{
		name = "Fill Fuel Canister";
		pictureItem = "Exile_Item_FuelCanisterFull";
		requiredInteractionModelGroup = "FuelSource";
		returnedItems[] = 
		{
			{1, "Exile_Item_FuelCanisterFull"}
		};
		components[] = 
		{
			{1, "Exile_Item_FuelCanisterEmpty"}
		};
		category = "Tools & Items";
	};
	class UpgradeToConcreteDoor: Exile_AbstractCraftingRecipe
	{
		name = "Upgrade to Concrete Door";
		pictureItem = "Exile_Item_ConcreteDoorKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteDoorKit"}
		};
		components[] = 
		{
			{1, "Exile_Item_ConcreteDoorwayKit"},
			{2, "Exile_Item_MetalPole"},
			{4, "Exile_Item_MetalBoard"}
		};
		category = "Upgrades";
	};
	class UpgradeToConcreteFloorPort: Exile_AbstractCraftingRecipe
	{
		name = "Upgrade to Concrete Floor Port";
		pictureItem = "Exile_Item_ConcreteFloorPortKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteFloorPortKit"}
		};
		components[] = 
		{
			{1, "Exile_Item_ConcreteFloorKit"},
			{2, "Exile_Item_MetalPole"},
			{4, "Exile_Item_MetalBoard"}
		};
		category = "Upgrades";
	};
	class UpgradeToConcreteGate: Exile_AbstractCraftingRecipe
	{
		name = "Upgrade to Concrete Gate";
		pictureItem = "Exile_Item_ConcreteGateKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteGateKit"}
		};
		components[] = 
		{
			{1, "Exile_Item_ConcreteWallKit"},
			{2, "Exile_Item_MetalPole"},
			{4, "Exile_Item_MetalBoard"}
		};
		category = "Upgrades";
	};
	class UpgradeToConcreteWindow: Exile_AbstractCraftingRecipe
	{
		name = "Upgrade to Concrete Window";
		pictureItem = "Exile_Item_ConcreteWindowKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_ConcreteWindowKit"}
		};
		components[] = 
		{
			{1, "Exile_Item_ConcreteWallKit"},
			{2, "Exile_Item_MetalPole"},
			{4, "Exile_Item_MetalBoard"}
		};
		category = "Upgrades";
	};
	class UpgradeToWoodDoor: Exile_AbstractCraftingRecipe
	{
		name = "Upgrade to Wood Door";
		pictureItem = "Exile_Item_WoodDoorKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodDoorKit"}
		};
		components[] = 
		{
			{1, "Exile_Item_WoodDoorwayKit"},
			{2, "Exile_Item_WoodPlank"}
		};
		category = "Upgrades";
	};
	class UpgradeToWoodFloorPort: Exile_AbstractCraftingRecipe
	{
		name = "Upgrade to Wood Floor Port";
		pictureItem = "Exile_Item_WoodFloorPortKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodFloorPortKit"}
		};
		components[] = 
		{
			{1, "Exile_Item_WoodFloorKit"},
			{2, "Exile_Item_WoodPlank"}
		};
		category = "Upgrades";
	};
	class UpgradeToWoodGate: Exile_AbstractCraftingRecipe
	{
		name = "Upgrade to Wood Gate";
		pictureItem = "Exile_Item_WoodGateKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodGateKit"}
		};
		components[] = 
		{
			{1, "Exile_Item_WoodWallKit"},
			{4, "Exile_Item_WoodPlank"}
		};
		category = "Upgrades";
	};
	class UpgradeToWoodWall: Exile_AbstractCraftingRecipe
	{
		name = "Upgrade to Wood Wall";
		pictureItem = "Exile_Item_WoodWallHalfKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodWallKit"}
		};
		components[] = 
		{
			{2, "Exile_Item_WoodWallHalfKit"}
		};
		category = "Upgrades";
	};
	class UpgradeToWoodWindow: Exile_AbstractCraftingRecipe
	{
		name = "Upgrade to Wood Window";
		pictureItem = "Exile_Item_WoodWindowKit";
		requiredInteractionModelGroup = "WorkBench";
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodWindowKit"}
		};
		components[] = 
		{
			{1, "Exile_Item_WoodWallKit"},
			{2, "Exile_Item_WoodPlank"}
		};
		category = "Upgrades";
	};
	class Laserdesignator: Exile_AbstractCraftingRecipe
	{
	    name = "Craft Laserdesignator";
	    pictureItem = "Laserdesignator";
	    requiresFire = 1;
	    returnedItems[] =
	    {
	        {1, "Laserdesignator"}
	    };
	    components[] =
	    {
	        {2, "Exile_Item_LightBulb"},
	        {1, "Exile_Item_JunkMetal"},
	        {1, "Exile_Item_ThermalScannerPro"}
	    };
	    category = "Tools & Items";
	};
};
class CfgExileArsenal
{
	///////// Exile Uniforms /////////
	class Exile_Uniform_BambiOverall									{ quality = 1; price = 1; sellPrice = 1; };
	class Exile_Uniform_Woodland 										{ quality = 1; price = 300; };
	
	///////// Civilian Uniforms /////////	
	class U_C_Journalist 												{ quality = 1; price = 100; };
	class U_C_Poloshirt_blue 											{ quality = 1; price = 100; };
	class U_C_Poloshirt_burgundy 										{ quality = 1; price = 100; };
	class U_C_Poloshirt_salmon 											{ quality = 1; price = 100; };
	class U_C_Poloshirt_stripped 										{ quality = 1; price = 100; };
	class U_C_Poloshirt_tricolour 										{ quality = 1; price = 100; };
	class U_C_Poor_1 													{ quality = 1; price = 100; };
	class U_C_Poor_2 													{ quality = 1; price = 100; };
	class U_C_Poor_shorts_1 											{ quality = 1; price = 100; };
	class U_C_Scientist 												{ quality = 1; price = 125; };
	class U_OrestesBody 												{ quality = 1; price = 125; };
	class U_Rangemaster 												{ quality = 1; price = 125; };
	class U_NikosAgedBody 												{ quality = 1; price = 125; };
	class U_NikosBody 													{ quality = 1; price = 125; };
	class U_Competitor 													{ quality = 1; price = 75; };
	class U_C_Man_casual_1_F											{ quality = 1; price = 75; };
	class U_C_Man_casual_2_F											{ quality = 1; price = 75; };
	class U_C_Man_casual_3_F											{ quality = 1; price = 75; };
	class U_C_man_sport_1_F												{ quality = 1; price = 75; };
	class U_C_man_sport_2_F												{ quality = 1; price = 75; };
	class U_C_man_sport_3_F												{ quality = 1; price = 75; };
	class U_C_Man_casual_4_F											{ quality = 1; price = 75; };
	class U_C_Man_casual_5_F											{ quality = 1; price = 75; };
	class U_C_Man_casual_6_F											{ quality = 1; price = 75; };
	
	///////// Gendarmerie /////////
	class U_B_GEN_Commander_F											{ quality = 1; price = 125; };
	class U_B_GEN_Soldier_F												{ quality = 1; price = 125; };
	
	///////// Guerilla Uniforms /////////
	class U_IG_Guerilla1_1												{ quality = 1; price = 150; };
	class U_IG_Guerilla2_1												{ quality = 1; price = 150; };
	class U_IG_Guerilla2_2												{ quality = 1; price = 150; };
	class U_IG_Guerilla2_3												{ quality = 1; price = 150; };
	class U_IG_Guerilla3_1												{ quality = 1; price = 150; };
	class U_BG_Guerilla2_1												{ quality = 1; price = 150; };
	class U_IG_Guerilla3_2												{ quality = 1; price = 150; };
	class U_BG_Guerrilla_6_1											{ quality = 1; price = 150; };
	class U_BG_Guerilla1_1												{ quality = 1; price = 150; };
	class U_BG_Guerilla2_2												{ quality = 1; price = 150; };
	class U_BG_Guerilla2_3												{ quality = 1; price = 150; };
	class U_BG_Guerilla3_1												{ quality = 1; price = 150; };
	class U_BG_leader													{ quality = 1; price = 150; };
	class U_IG_leader													{ quality = 1; price = 150; };
	class U_I_G_resistanceLeader_F										{ quality = 1; price = 150; };
	class U_I_C_Soldier_Bandit_1_F										{ quality = 1; price = 150; };
	class U_I_C_Soldier_Bandit_2_F										{ quality = 1; price = 150; };
	class U_I_C_Soldier_Bandit_3_F										{ quality = 1; price = 150; };
	class U_I_C_Soldier_Bandit_4_F										{ quality = 1; price = 150; };
	class U_I_C_Soldier_Bandit_5_F										{ quality = 1; price = 150; };
	class U_I_C_Soldier_Para_1_F										{ quality = 1; price = 175; };					
	class U_I_C_Soldier_Para_2_F										{ quality = 1; price = 175; };
	class U_I_C_Soldier_Para_3_F										{ quality = 1; price = 175; };
	class U_I_C_Soldier_Para_4_F										{ quality = 1; price = 175; };
	class U_I_C_Soldier_Para_5_F										{ quality = 1; price = 175; };
	class U_I_C_Soldier_Camo_F											{ quality = 1; price = 175; };

	///////// Combat Uniforms /////////
	class U_B_survival_uniform											{ quality = 1; price = 200; };
	class U_B_CombatUniform_mcam 										{ quality = 1; price = 150; };
	class U_B_CombatUniform_mcam_tshirt 								{ quality = 1; price = 150; };
	class U_B_CombatUniform_mcam_vest 									{ quality = 1; price = 150; };
	class U_B_CombatUniform_mcam_worn 									{ quality = 1; price = 150; };
	class U_O_CombatUniform_ocamo 										{ quality = 1; price = 150; };
	class U_O_CombatUniform_oucamo 										{ quality = 1; price = 150; };
	class U_B_CTRG_1 													{ quality = 1; price = 150; };
	class U_B_CTRG_2 													{ quality = 1; price = 150; };
	class U_B_CTRG_3													{ quality = 1; price = 150; };
	class U_B_CTRG_Soldier_urb_1_F										{ quality = 1; price = 150; };
	class U_B_CTRG_Soldier_urb_3_F										{ quality = 1; price = 150; };
	class U_B_CTRG_Soldier_urb_2_F										{ quality = 1; price = 150; };
	class U_I_CombatUniform 											{ quality = 1; price = 150; };
	class U_I_CombatUniform_shortsleeve									{ quality = 1; price = 150; };
	class U_I_CombatUniform_tshirt										{ quality = 1; price = 150; };
	class U_I_OfficerUniform											{ quality = 1; price = 150; };
	class U_O_OfficerUniform_ocamo 										{ quality = 1; price = 200; };
	class U_B_SpecopsUniform_sgg 										{ quality = 1; price = 200; };
	class U_O_SpecopsUniform_blk 										{ quality = 1; price = 200; };
	class U_O_SpecopsUniform_ocamo 										{ quality = 1; price = 200; };
	class U_I_G_Story_Protagonist_F 									{ quality = 1; price = 250; };
	class U_C_HunterBody_grn											{ quality = 1; price = 150; };
	class U_B_HeliPilotCoveralls										{ quality = 1; price = 150; };
	class U_B_PilotCoveralls											{ quality = 1; price = 150; };
	class U_I_HeliPilotCoveralls										{ quality = 1; price = 150; };
	class U_I_pilotCoveralls											{ quality = 1; price = 150; };
	class U_O_PilotCoveralls											{ quality = 1; price = 150; };
	class U_B_T_Soldier_F												{ quality = 1; price = 150; };
	class U_B_T_Soldier_AR_F											{ quality = 1; price = 150; };
	class U_O_T_Soldier_F												{ quality = 1; price = 150; };
	class U_O_T_Officer_F												{ quality = 1; price = 150; };
	class U_B_T_Soldier_SL_F											{ quality = 1; price = 150; };
	
	///////// Stealth Uniforms /////////
	class U_B_CTRG_Soldier_F											{ quality = 2; price = 500; };
	class U_B_CTRG_Soldier_3_F											{ quality = 2; price = 500; };
	class U_B_CTRG_Soldier_2_F											{ quality = 2; price = 500; };

	///////// Ghillie Uniforms /////////
	class U_B_FullGhillie_ard											{ quality = 3; price = 750; };
	class U_B_FullGhillie_lsh											{ quality = 3; price = 750; };
	class U_B_FullGhillie_sard											{ quality = 3; price = 750; };
	class U_I_FullGhillie_ard											{ quality = 3; price = 750; };
	class U_I_FullGhillie_lsh											{ quality = 3; price = 750; };
	class U_I_FullGhillie_sard											{ quality = 3; price = 750; };
	class U_O_FullGhillie_ard											{ quality = 3; price = 750; };
	class U_O_FullGhillie_lsh											{ quality = 3; price = 750; };
	class U_O_FullGhillie_sard											{ quality = 3; price = 750; };
	class U_O_T_FullGhillie_tna_F										{ quality = 3; price = 750; };
	class U_B_T_FullGhillie_tna_F										{ quality = 3; price = 750; };
	class U_O_GhillieSuit												{ quality = 2; price = 500; };
	class U_B_GhillieSuit												{ quality = 2; price = 500; };
	class U_I_GhillieSuit												{ quality = 2; price = 500; };
	class U_O_T_Sniper_F												{ quality = 2; price = 500; };
	class U_B_T_Sniper_F												{ quality = 2; price = 500; };

	///////// Wetsuits /////////
	class U_I_Wetsuit													{ quality = 1; price = 200; };
	class U_O_Wetsuit													{ quality = 1; price = 200; };
	class U_B_Wetsuit													{ quality = 1; price = 200; };
	
	///////// Special Purpose Suits /////////
	class U_O_V_Soldier_Viper_F											{ quality = 3; price = 2000; };
	class U_O_V_Soldier_Viper_hex_F										{ quality = 3; price = 2500; };
	
		///////// Parachute /////////
	class B_Parachute													{ quality = 1; price = 250; };
	
	///////// Backpacks /////////
	class B_HuntingBackpack												{ quality = 1; price = 150; };
	class B_OutdoorPack_blk												{ quality = 1; price = 150; };
	class B_OutdoorPack_blu												{ quality = 1; price = 150; };
	class B_OutdoorPack_tan												{ quality = 1; price = 150; };
	class B_AssaultPack_blk												{ quality = 1; price = 200; };
	class B_AssaultPack_cbr												{ quality = 1; price = 200; };
	class B_AssaultPack_dgtl											{ quality = 1; price = 200; };
	class B_AssaultPack_khk												{ quality = 1; price = 200; };
	class B_AssaultPack_mcamo											{ quality = 1; price = 200; };
	class B_AssaultPack_rgr												{ quality = 1; price = 200; };
	class B_AssaultPack_sgg												{ quality = 1; price = 200; };
	class B_AssaultPack_tna_F											{ quality = 1; price = 200; };
	class B_FieldPack_blk												{ quality = 1; price = 250; };
	class B_FieldPack_cbr												{ quality = 1; price = 250; };
	class B_FieldPack_ocamo												{ quality = 1; price = 250; };
	class B_FieldPack_oucamo											{ quality = 1; price = 250; };
	class B_FieldPack_ghex_F											{ quality = 1; price = 250; };
	class B_TacticalPack_blk											{ quality = 1; price = 300; };
	class B_TacticalPack_rgr											{ quality = 1; price = 300; };
	class B_TacticalPack_ocamo											{ quality = 1; price = 300; };
	class B_TacticalPack_mcamo											{ quality = 1; price = 300; };
	class B_TacticalPack_oli											{ quality = 1; price = 300; };
	class B_Kitbag_cbr													{ quality = 1; price = 400; };
	class B_Kitbag_mcamo												{ quality = 1; price = 400; };
	class B_Kitbag_rgr													{ quality = 1; price = 400; };
	class B_Kitbag_sgg													{ quality = 1; price = 400; };
	class B_Bergen_blk													{ quality = 1; price = 400; };
	class B_Bergen_mcamo												{ quality = 1; price = 400; };
	class B_Bergen_rgr													{ quality = 1; price = 400; };
	class B_Bergen_sgg													{ quality = 1; price = 400; };
	class B_Carryall_cbr												{ quality = 1; price = 500; };
	class B_Carryall_khk												{ quality = 1; price = 500; };
	class B_Carryall_mcamo												{ quality = 1; price = 500; };
	class B_Carryall_ocamo												{ quality = 1; price = 500; };
	class B_Carryall_oli												{ quality = 1; price = 500; };
	class B_Carryall_oucamo												{ quality = 1; price = 500; };
	class B_Carryall_ghex_F												{ quality = 1; price = 500; };
	class B_Bergen_dgtl_F												{ quality = 1; price = 600; };
	class B_Bergen_hex_F												{ quality = 1; price = 600; };
	class B_Bergen_mcamo_F												{ quality = 1; price = 600; };
	class B_Bergen_tna_F												{ quality = 1; price = 600; };
	
	///////// Viper Harnesses /////////
	class B_ViperLightHarness_blk_F										{ quality = 2; price = 800; };
	class B_ViperLightHarness_ghex_F									{ quality = 2; price = 800; };
	class B_ViperLightHarness_hex_F										{ quality = 2; price = 800; };
	class B_ViperLightHarness_khk_F										{ quality = 2; price = 800; };
	class B_ViperLightHarness_oli_F										{ quality = 2; price = 800; };
	class B_ViperHarness_blk_F											{ quality = 2; price = 1200; };							
	class B_ViperHarness_ghex_F											{ quality = 2; price = 1200; };
	class B_ViperHarness_hex_F											{ quality = 2; price = 1200; };
	class B_ViperHarness_khk_F											{ quality = 2; price = 1200; };
	class B_ViperHarness_oli_F											{ quality = 2; price = 1200; };
	
		///////// Caps /////////	
	class H_Cap_blk 													{ quality = 1; price = 75; };
	class H_Cap_blk_Raven 												{ quality = 1; price = 75; };
	class H_Cap_blu 													{ quality = 1; price = 75; };
	class H_Cap_brn_SPECOPS 											{ quality = 1; price = 75; };
	class H_Cap_grn 													{ quality = 1; price = 75; };
	class H_Cap_headphones 												{ quality = 1; price = 75; };
	class H_Cap_khaki_specops_UK 										{ quality = 1; price = 75; };
	class H_Cap_oli 													{ quality = 1; price = 75; };
	class H_Cap_press 													{ quality = 1; price = 75; };
	class H_Cap_red 													{ quality = 1; price = 75; };
	class H_Cap_tan 													{ quality = 1; price = 75; };
	class H_Cap_tan_specops_US 											{ quality = 1; price = 75; };
	class H_Cap_oli_Syndikat_F 											{ quality = 1; price = 75; };
	class H_Cap_tan_Syndikat_F 											{ quality = 1; price = 75; };
	class H_Cap_blk_Syndikat_F 											{ quality = 1; price = 75; };
	class H_Cap_grn_Syndikat_F 											{ quality = 1; price = 75; };
	
	///////// Military Caps /////////	
	class H_MilCap_blue 												{ quality = 1; price = 100; };
	class H_MilCap_dgtl 												{ quality = 1; price = 100; };
	class H_MilCap_mcamo 												{ quality = 1; price = 100; };
	class H_MilCap_ocamo 												{ quality = 1; price = 100; };
	class H_MilCap_oucamo 												{ quality = 1; price = 100; };
	class H_MilCap_rucamo 												{ quality = 1; price = 100; };
	class H_MilCap_gen_F												{ quality = 1; price = 100; };
	class H_MilCap_ghex_F												{ quality = 1; price = 100; };
	class H_MilCap_tna_F												{ quality = 1; price = 100; };

	///////// Watch Caps /////////
	class H_Watchcap_blk 												{ quality = 1; price = 75; };
	class H_Watchcap_camo 												{ quality = 1; price = 75; };
	class H_Watchcap_khk 												{ quality = 1; price = 75; };
	class H_Watchcap_sgg 												{ quality = 1; price = 75; };

	///////// Bandannas /////////
	class H_Bandanna_camo												{ quality = 1; price = 75; };
	class H_Bandanna_cbr												{ quality = 1; price = 75; };
	class H_Bandanna_gry												{ quality = 1; price = 75; };
	class H_Bandanna_khk												{ quality = 1; price = 75; };
	class H_Bandanna_khk_hs												{ quality = 1; price = 75; };
	class H_Bandanna_mcamo												{ quality = 1; price = 75; };
	class H_Bandanna_sgg												{ quality = 1; price = 75; };
	class H_Bandanna_surfer												{ quality = 1; price = 75; };

	///////// Boonie Hats /////////
	class H_Booniehat_dgtl												{ quality = 1; price = 75; };
	class H_Booniehat_dirty												{ quality = 1; price = 75; };
	class H_Booniehat_grn												{ quality = 1; price = 75; };
	class H_Booniehat_indp												{ quality = 1; price = 75; };
	class H_Booniehat_khk												{ quality = 1; price = 75; };
	class H_Booniehat_khk_hs											{ quality = 1; price = 75; };
	class H_Booniehat_mcamo												{ quality = 1; price = 75; };
	class H_Booniehat_tan												{ quality = 1; price = 75; };
	class H_Booniehat_tna_F												{ quality = 1; price = 75; };

	///////// Hats /////////
	class H_Hat_blue													{ quality = 1; price = 75; };
	class H_Hat_brown													{ quality = 1; price = 75; };
	class H_Hat_camo													{ quality = 1; price = 75; };
	class H_Hat_checker													{ quality = 1; price = 75; };
	class H_Hat_grey													{ quality = 1; price = 75; };
	class H_Hat_tan														{ quality = 1; price = 75; };
	class H_StrawHat													{ quality = 1; price = 75; };
	class H_StrawHat_dark												{ quality = 1; price = 75; };

	///////// Berets /////////
	class H_Beret_02													{ quality = 1; price = 75; };
	class H_Beret_blk													{ quality = 1; price = 75; };
	class H_Beret_blk_POLICE											{ quality = 1; price = 75; };
	class H_Beret_brn_SF												{ quality = 1; price = 75; };
	class H_Beret_Colonel												{ quality = 1; price = 75; };
	class H_Beret_grn													{ quality = 1; price = 75; };
	class H_Beret_grn_SF												{ quality = 1; price = 75; };
	class H_Beret_ocamo													{ quality = 1; price = 75; };
	class H_Beret_red													{ quality = 1; price = 75; };
	class H_Beret_gen_F													{ quality = 1; price = 75; };
	
	///////// Shemags /////////
	class H_Shemag_khk													{ quality = 1; price = 100; };
	class H_Shemag_olive												{ quality = 1; price = 100; };
	class H_Shemag_olive_hs												{ quality = 1; price = 100; };
	class H_Shemag_tan													{ quality = 1; price = 100; };
	class H_ShemagOpen_khk												{ quality = 1; price = 100; };
	class H_ShemagOpen_tan												{ quality = 1; price = 100; };
	
	///////// Turbans /////////
	class H_TurbanO_blk													{ quality = 1; price = 100; };

	///////// Helmets /////////	
	class H_Helmet_Skate												{ quality = 1; price = 100; };
	class H_HelmetB_light												{ quality = 1; price = 150; };
	class H_HelmetB_light_black											{ quality = 1; price = 150; };
	class H_HelmetB_light_desert										{ quality = 1; price = 150; };
	class H_HelmetB_light_grass											{ quality = 1; price = 150; };
	class H_HelmetB_light_sand											{ quality = 1; price = 150; };
	class H_HelmetB_light_snakeskin										{ quality = 1; price = 150; };
	class H_HelmetB_Light_tna_F											{ quality = 1; price = 150; };
	class H_HelmetIA													{ quality = 1; price = 175; };
	class H_HelmetIA_camo												{ quality = 1; price = 175; };
	class H_HelmetIA_net												{ quality = 1; price = 175; };
	class H_HelmetB														{ quality = 1; price = 175; };
	class H_HelmetB_black												{ quality = 1; price = 175; };
	class H_HelmetB_camo												{ quality = 1; price = 175; }; 
	class H_HelmetB_desert												{ quality = 1; price = 175; };
	class H_HelmetB_grass												{ quality = 1; price = 175; };
	class H_HelmetB_paint												{ quality = 1; price = 175; };
	class H_HelmetB_plain_blk											{ quality = 1; price = 175; };
	class H_HelmetB_sand												{ quality = 1; price = 175; };
	class H_HelmetB_snakeskin											{ quality = 1; price = 175; };
	class H_HelmetB_tna_F												{ quality = 1; price = 175; };
	class H_HelmetB_Enh_tna_F											{ quality = 1; price = 175; };
	class H_HelmetSpecB													{ quality = 1; price = 200; };
	class H_HelmetSpecB_blk												{ quality = 1; price = 200; };
	class H_HelmetSpecB_paint1											{ quality = 1; price = 200; };
	class H_HelmetSpecB_paint2											{ quality = 1; price = 200; };
	class H_HelmetO_ocamo												{ quality = 1; price = 200; };
	class H_HelmetO_oucamo												{ quality = 1; price = 200; };
	class H_HelmetO_ghex_F												{ quality = 1; price = 200; };
	class H_HelmetSpecO_blk												{ quality = 1; price = 200; };
	class H_HelmetSpecO_ocamo											{ quality = 1; price = 200; };
	class H_HelmetSpecO_ghex_F											{ quality = 1; price = 200; };
	class H_HelmetLeaderO_ocamo											{ quality = 1; price = 250; };
	class H_HelmetLeaderO_oucamo										{ quality = 1; price = 250; };
	class H_HelmetLeaderO_ghex_F										{ quality = 1; price = 250; };
	class H_CrewHelmetHeli_B											{ quality = 1; price = 200; };
	class H_CrewHelmetHeli_I											{ quality = 1; price = 200; };
	class H_CrewHelmetHeli_O											{ quality = 1; price = 200; };
	class H_HelmetCrew_I												{ quality = 1; price = 200; };
	class H_HelmetCrew_B												{ quality = 1; price = 200; };
	class H_HelmetCrew_O												{ quality = 1; price = 200; };
	class H_HelmetCrew_O_ghex_F											{ quality = 1; price = 200; };
	class H_PilotHelmetHeli_B											{ quality = 1; price = 150; };
	class H_PilotHelmetHeli_I											{ quality = 1; price = 150; };
	class H_PilotHelmetHeli_O											{ quality = 1; price = 150; };
	class H_PilotHelmetFighter_B										{ quality = 1; price = 150; };
	class H_PilotHelmetFighter_I										{ quality = 1; price = 150; };
	class H_PilotHelmetFighter_O										{ quality = 1; price = 150; };
	
	///////// Stealth Helmets /////////
	class H_HelmetB_TI_tna_F											{ quality = 2; price = 500; };
	
	///////// Special Purpose Helmets 	/////////
	class H_HelmetO_ViperSP_ghex_F										{ quality = 4; price = 7500; };
	class H_HelmetO_ViperSP_hex_F										{ quality = 4; price = 7500; };
		
	///////// Night Vision Goggles /////////
	class NVGoggles														{ quality = 1; price = 250; };
	class NVGoggles_INDEP												{ quality = 1; price = 250; };
	class NVGoggles_OPFOR												{ quality = 1; price = 250; };
	class NVGoggles_tna_F												{ quality = 1; price = 250; };
	class O_NVGoggles_ghex_F											{ quality = 1; price = 250; };
	class O_NVGoggles_hex_F												{ quality = 1; price = 250; };
	class O_NVGoggles_urb_F												{ quality = 1; price = 250; };

	///////// Exile Headgear /////////	
	class Exile_Headgear_SantaHat										{ quality = 1; price = 75; };
	class Exile_Headgear_SafetyHelmet									{ quality = 1; price = 75; };	
	class Exile_Headgear_GasMask										{ quality = 2; price = 1500; sellPrice = 500; };

	///////// Exile FaceWear /////////
	class G_Diving														{ quality = 1; price = 50; sellPrice = 1; };
	class G_B_Diving													{ quality = 1; price = 50; sellPrice = 1; };
	class G_O_Diving													{ quality = 1; price = 50; sellPrice = 1; };
	class G_I_Diving													{ quality = 1; price = 50; sellPrice = 1; };	
	class G_Spectacles													{ quality = 1; price = 50; sellPrice = 1; };
	class G_Spectacles_Tinted											{ quality = 1; price = 50; sellPrice = 1; };
	class G_Combat														{ quality = 1; price = 50; sellPrice = 1; };
	class G_Lowprofile													{ quality = 1; price = 50; sellPrice = 1; };
	class G_Shades_Black												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Shades_Green												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Shades_Red													{ quality = 1; price = 50; sellPrice = 1; };
	class G_Squares														{ quality = 1; price = 50; sellPrice = 1; };
	class G_Squares_Tinted												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Sport_BlackWhite											{ quality = 1; price = 50; sellPrice = 1; };
	class G_Sport_Blackyellow											{ quality = 1; price = 50; sellPrice = 1; };
	class G_Sport_Greenblack											{ quality = 1; price = 50; sellPrice = 1; };
	class G_Sport_Checkered												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Sport_Red													{ quality = 1; price = 50; sellPrice = 1; };
	class G_Tactical_Black												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Aviator														{ quality = 1; price = 50; sellPrice = 1; };
	class G_Lady_Mirror													{ quality = 1; price = 50; sellPrice = 1; };
	class G_Lady_Dark													{ quality = 1; price = 50; sellPrice = 1; };
	class G_Lady_Red													{ quality = 1; price = 50; sellPrice = 1; };
	class G_Lady_Blue													{ quality = 1; price = 50; sellPrice = 1; };
	class G_Goggles_VR													{ quality = 1; price = 50; sellPrice = 1; };
	class G_Balaclava_blk												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Balaclava_oli												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Balaclava_combat											{ quality = 1; price = 50; sellPrice = 1; };
	class G_Balaclava_lowprofile										{ quality = 1; price = 50; sellPrice = 1; };
	class G_Bandanna_blk												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Bandanna_oli												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Bandanna_khk												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Bandanna_tan												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Bandanna_beast												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Bandanna_shades												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Bandanna_sport												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Bandanna_aviator											{ quality = 1; price = 50; sellPrice = 1; };
	class G_Shades_Blue													{ quality = 1; price = 50; sellPrice = 1; };
	class G_Sport_Blackred												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Tactical_Clear												{ quality = 1; price = 50; sellPrice = 1; };
	class G_Balaclava_TI_blk_F											{ quality = 1; price = 50; sellPrice = 1; };
	class G_Balaclava_TI_tna_F											{ quality = 1; price = 50; sellPrice = 1; };
	class G_Balaclava_TI_G_blk_F										{ quality = 1; price = 50; sellPrice = 1; };
	class G_Balaclava_TI_G_tna_F										{ quality = 1; price = 50; sellPrice = 1; };
	class G_Combat_Goggles_tna_F										{ quality = 1; price = 50; sellPrice = 1; };
	
		///////// Exile Vests /////////
	class Exile_Vest_Snow												{ quality = 1; price = 400; };	
	
	///////// Bandoliers /////////
	class V_BandollierB_blk												{ quality = 1; price = 150; };
	class V_BandollierB_cbr												{ quality = 1; price = 150; };
	class V_BandollierB_khk												{ quality = 1; price = 150; };
	class V_BandollierB_oli												{ quality = 1; price = 150; };
	class V_BandollierB_rgr												{ quality = 1; price = 150; };
	class V_BandollierB_ghex_F											{ quality = 1; price = 150; };		
			
	///////// Chestrigs /////////
	class V_Chestrig_blk 												{ quality = 1; price = 250; };
	class V_Chestrig_khk 												{ quality = 1; price = 250; };
	class V_Chestrig_oli 												{ quality = 1; price = 250; };
	class V_Chestrig_rgr 												{ quality = 1; price = 250; };

	///////// Tactical Vests /////////
	class V_Press_F														{ quality = 1; price = 150; };
	class V_TacVest_gen_F												{ quality = 1; price = 250; };
	class V_TacVest_blk_POLICE											{ quality = 1; price = 250; };
	class V_Rangemaster_belt											{ quality = 1; price = 100; };
	class V_TacVest_blk													{ quality = 1; price = 300; };
	class V_TacVest_brn													{ quality = 1; price = 300; };
	class V_TacVest_camo												{ quality = 1; price = 300; };
	class V_TacVest_khk													{ quality = 1; price = 300; };
	class V_TacVest_oli													{ quality = 1; price = 300; };
	class V_TacVestCamo_khk												{ quality = 1; price = 300; };
	class V_TacVestIR_blk												{ quality = 1; price = 300; };
	class V_I_G_resistanceLeader_F										{ quality = 1; price = 300; };
	
	///////// Tactical Chest Rig /////////
	class V_TacChestrig_cbr_F											{ quality = 1; price = 200; };								
	class V_TacChestrig_grn_F											{ quality = 1; price = 200; };
	class V_TacChestrig_oli_F											{ quality = 1; price = 200; };

	///////// Grenade Harnesses /////////
	class V_HarnessO_brn												{ quality = 1; price = 250; };
	class V_HarnessO_gry												{ quality = 1; price = 250; };
	class V_HarnessOGL_brn												{ quality = 1; price = 225; };
	class V_HarnessOGL_gry												{ quality = 1; price = 225; };
	class V_HarnessOSpec_brn											{ quality = 1; price = 250; };
	class V_HarnessOSpec_gry											{ quality = 1; price = 250; };
	class V_HarnessOGL_ghex_F											{ quality = 1; price = 250; };
	class V_HarnessO_ghex_F												{ quality = 1; price = 250; };

	///////// Plate Carriers /////////
	class V_PlateCarrier1_blk 											{ quality = 1; price = 300; };
	class V_PlateCarrier1_rgr 											{ quality = 1; price = 300; };
	class V_PlateCarrier1_tna_F											{ quality = 1; price = 300; };
	class V_PlateCarrier1_rgr_noflag_F									{ quality = 1; price = 300; };
	class V_PlateCarrier2_rgr 											{ quality = 2; price = 400; };
	class V_PlateCarrier2_tna_F											{ quality = 2; price = 400; };
	class V_PlateCarrier2_rgr_noflag_F									{ quality = 2; price = 400; };
	class V_PlateCarrier3_rgr 											{ quality = 2; price = 400; };
	class V_PlateCarrierGL_blk 											{ quality = 3; price = 850; };
	class V_PlateCarrierGL_mtp 											{ quality = 3; price = 850; };
	class V_PlateCarrierGL_rgr 											{ quality = 3; price = 850; };
	class V_PlateCarrierGL_tna_F										{ quality = 3; price = 850; };
	class V_PlateCarrierH_CTRG 											{ quality = 2; price = 300; };
	class V_PlateCarrierIA1_dgtl 										{ quality = 1; price = 275; };
	class V_PlateCarrierIA2_dgtl 										{ quality = 1; price = 350; };
	class V_PlateCarrierIAGL_dgtl 										{ quality = 3; price = 750; };
	class V_PlateCarrierIAGL_oli 										{ quality = 3; price = 750; };
	class V_PlateCarrierL_CTRG 											{ quality = 1; price = 300; };
	class V_PlateCarrierSpec_blk 										{ quality = 3; price = 650; };
	class V_PlateCarrierSpec_mtp 										{ quality = 3; price = 650; };
	class V_PlateCarrierSpec_rgr 										{ quality = 3; price = 650; };
	class V_PlateCarrierSpec_tna_F										{ quality = 3; price = 650; };

	///////// Rebreathers /////////
	class V_RebreatherB													{ quality = 1; price = 500; };
	class V_RebreatherIA												{ quality = 1; price = 500; };
	class V_RebreatherIR												{ quality = 1; price = 500; };
	
	//////// Ammo ///////////
	class 6Rnd_GreenSignal_F 											{ quality = 1; price = 10; };
	class 6Rnd_RedSignal_F 												{ quality = 1; price = 10; };
	class 6Rnd_45ACP_Cylinder 											{ quality = 1; price = 10; };
	class 9Rnd_45ACP_Mag 												{ quality = 1; price = 15; };
	class 11Rnd_45ACP_Mag 												{ quality = 1; price = 15; };
	class 30Rnd_45ACP_Mag_SMG_01 										{ quality = 1; price = 20; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green 							{ quality = 1; price = 20; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow							{ quality = 1; price = 20; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Red								{ quality = 1; price = 20; };
	class 10Rnd_9x21_Mag												{ quality = 1; price = 10; };
	class 16Rnd_9x21_Mag 												{ quality = 1; price = 20; };
	class 30Rnd_9x21_Mag_SMG_02											{ quality = 1; price = 25; };
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Red								{ quality = 1; price = 25; };
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Yellow							{ quality = 1; price = 25; };
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Green							{ quality = 1; price = 25; };
	class 30Rnd_9x21_Mag 												{ quality = 1; price = 25; };
	class 20Rnd_556x45_UW_mag 											{ quality = 1; price = 30; };
	class 30Rnd_556x45_Stanag 											{ quality = 1; price = 40; };	
	class 30Rnd_556x45_Stanag_green 									{ quality = 1; price = 40; };
	class 30Rnd_556x45_Stanag_red 										{ quality = 1; price = 40; };
	class 30Rnd_556x45_Stanag_Tracer_Red 								{ quality = 1; price = 40; };
	class 30Rnd_556x45_Stanag_Tracer_Yellow 							{ quality = 1; price = 40; };
	class 30Rnd_556x45_Stanag_Tracer_Green 								{ quality = 1; price = 40; };
	class 150Rnd_556x45_Drum_Mag_F										{ quality = 1; price = 50; };
	class 150Rnd_556x45_Drum_Mag_Tracer_F								{ quality = 1; price = 50; };
	class 200Rnd_556x45_Box_F 											{ quality = 1; price = 60; };
	class 200Rnd_556x45_Box_Red_F 										{ quality = 1; price = 60; };
	class 200Rnd_556x45_Box_Tracer_F 									{ quality = 1; price = 60; };
	class 200Rnd_556x45_Box_Tracer_Red_F 								{ quality = 1; price = 60; };
	class 30Rnd_580x42_Mag_F											{ quality = 1; price = 45; };
	class 30Rnd_580x42_Mag_Tracer_F										{ quality = 1; price = 45; };
	class 100Rnd_580x42_Mag_F											{ quality = 1; price = 60; };
	class 100Rnd_580x42_Mag_Tracer_F									{ quality = 1; price = 60; };			
	class 30Rnd_65x39_caseless_green 									{ quality = 1; price = 30; };
	class 30Rnd_65x39_caseless_green_mag_Tracer 						{ quality = 1; price = 30; };
	class 30Rnd_65x39_caseless_mag 										{ quality = 1; price = 30; };
	class 30Rnd_65x39_caseless_mag_Tracer 								{ quality = 1; price = 30; };
	class 20Rnd_650x39_Cased_Mag_F										{ quality = 1; price = 30; };
	class 100Rnd_65x39_caseless_mag 									{ quality = 1; price = 45; };
	class 100Rnd_65x39_caseless_mag_Tracer 								{ quality = 1; price = 45; };
	class 200Rnd_65x39_cased_Box 										{ quality = 1; price = 50; };
	class 200Rnd_65x39_cased_Box_Tracer 								{ quality = 1; price = 50; };
	class 30Rnd_762x39_Mag_F 											{ quality = 2; price = 30; };
	class 30Rnd_762x39_Mag_Green_F 										{ quality = 2; price = 30; };
	class 30Rnd_762x39_Mag_Tracer_F 									{ quality = 2; price = 30; };
	class 30Rnd_762x39_Mag_Tracer_Green_F 								{ quality = 2; price = 30; };
	class 20Rnd_762x51_Mag 												{ quality = 2; price = 35; };
	class 10Rnd_762x54_Mag 												{ quality = 2; price = 30; };
	class 150Rnd_762x54_Box 											{ quality = 2; price = 75; };
	class 150Rnd_762x54_Box_Tracer 										{ quality = 2; price = 75; };
	class 10Rnd_93x64_DMR_05_Mag 										{ quality = 3; price = 45; };
	class 150Rnd_93x64_Mag 												{ quality = 3; price = 90; };
	class 10Rnd_338_Mag 												{ quality = 3; price = 45; };
	class 130Rnd_338_Mag 												{ quality = 3; price = 90; };
	class 7Rnd_408_Mag 													{ quality = 3; price = 40; };
	class 10Rnd_127x54_Mag 												{ quality = 3; price = 30; };
	class 5Rnd_127x108_Mag 												{ quality = 3; price = 100; };
	class 5Rnd_127x108_APDS_Mag 										{ quality = 3; price = 1000; };
	class 10Rnd_50BW_Mag_F												{ quality = 3; price = 100; };
	
	///////// Rockets /////////
	class RPG32_F														{ quality = 4; price = 1500; };
	class RPG32_HE_F													{ quality = 4; price = 1500; };
		
	///////// Chemlights & Flares /////////
	class Chemlight_blue												{ quality = 1; price = 15; };
	class Chemlight_green												{ quality = 1; price = 15; };
	class Chemlight_red													{ quality = 1; price = 15; };
	class FlareGreen_F													{ quality = 1; price = 25; };
	class FlareRed_F													{ quality = 1; price = 25; };
	class FlareWhite_F													{ quality = 1; price = 25; };
	class FlareYellow_F													{ quality = 1; price = 25; };
	class UGL_FlareGreen_F												{ quality = 1; price = 25; };
	class UGL_FlareRed_F												{ quality = 1; price = 25; };
	class UGL_FlareWhite_F												{ quality = 1; price = 25; };
	class UGL_FlareYellow_F												{ quality = 1; price = 25; };
	class 3Rnd_UGL_FlareGreen_F											{ quality = 1; price = 50; };
	class 3Rnd_UGL_FlareRed_F											{ quality = 1; price = 50; };
	class 3Rnd_UGL_FlareWhite_F											{ quality = 1; price = 50; };
	class 3Rnd_UGL_FlareYellow_F										{ quality = 1; price = 50; };

	///////// Smokes /////////
	class SmokeShell													{ quality = 1; price = 25; };
	class SmokeShellBlue												{ quality = 1; price = 25; };
	class SmokeShellGreen												{ quality = 1; price = 25; };
	class SmokeShellOrange												{ quality = 1; price = 25; };
	class SmokeShellPurple												{ quality = 1; price = 25; };
	class SmokeShellRed													{ quality = 1; price = 25; };
	class SmokeShellYellow												{ quality = 1; price = 25; };
	class 1Rnd_Smoke_Grenade_shell										{ quality = 1; price = 25; };
	class 1Rnd_SmokeBlue_Grenade_shell									{ quality = 1; price = 25; };
	class 1Rnd_SmokeGreen_Grenade_shell									{ quality = 1; price = 25; };
	class 1Rnd_SmokeOrange_Grenade_shell								{ quality = 1; price = 25; };
	class 1Rnd_SmokePurple_Grenade_shell								{ quality = 1; price = 25; };
	class 1Rnd_SmokeRed_Grenade_shell									{ quality = 1; price = 25; };
	class 1Rnd_SmokeYellow_Grenade_shell								{ quality = 1; price = 25; };
	class 3Rnd_Smoke_Grenade_shell										{ quality = 1; price = 50; };
	class 3Rnd_SmokeBlue_Grenade_shell									{ quality = 1; price = 50; };
	class 3Rnd_SmokeGreen_Grenade_shell									{ quality = 1; price = 50; };
	class 3Rnd_SmokeOrange_Grenade_shell								{ quality = 1; price = 50; };
	class 3Rnd_SmokePurple_Grenade_shell								{ quality = 1; price = 50; };
	class 3Rnd_SmokeRed_Grenade_shell									{ quality = 1; price = 50; };
	class 3Rnd_SmokeYellow_Grenade_shell								{ quality = 1; price = 50; };
	
	///////// Exile Ammo /////////
	class Exile_Magazine_30Rnd_762x39_AK								{ quality = 2; price = 20; };
	class Exile_Magazine_30Rnd_545x39_AK								{ quality = 1; price = 20; };
	class Exile_Magazine_30Rnd_545x39_AK_Green							{ quality = 1; price = 20; };
	class Exile_Magazine_30Rnd_545x39_AK_Red							{ quality = 1; price = 20; };
	class Exile_Magazine_30Rnd_545x39_AK_White							{ quality = 1; price = 20; };
	class Exile_Magazine_30Rnd_545x39_AK_Yellow							{ quality = 1; price = 20; };
	class Exile_Magazine_45Rnd_545x39_RPK_Green							{ quality = 1; price = 20; };
	class Exile_Magazine_75Rnd_545x39_RPK_Green							{ quality = 1; price = 20; };
	class Exile_Magazine_20Rnd_762x51_DMR								{ quality = 2; price = 20; };
	class Exile_Magazine_20Rnd_762x51_DMR_Yellow						{ quality = 2; price = 20; };
	class Exile_Magazine_20Rnd_762x51_DMR_Red							{ quality = 2; price = 20; };
	class Exile_Magazine_20Rnd_762x51_DMR_Green							{ quality = 2; price = 20; };
	class Exile_Magazine_10Rnd_303										{ quality = 1; price = 20; };
	class Exile_Magazine_100Rnd_762x54_PK_Green							{ quality = 2; price = 20; };
	class Exile_Magazine_7Rnd_45ACP										{ quality = 1; price = 20; };
	class Exile_Magazine_8Rnd_9x18										{ quality = 1; price = 20; };
	class Exile_Magazine_6Rnd_45ACP										{ quality = 1; price = 20; };
	class Exile_Magazine_5Rnd_22LR										{ quality = 1; price = 20; };
	class Exile_Magazine_10Rnd_762x54									{ quality = 1; price = 20; };
	class Exile_Magazine_10Rnd_9x39										{ quality = 1; price = 20; };
	class Exile_Magazine_20Rnd_9x39										{ quality = 1; price = 20; };
	class Exile_Magazine_8Rnd_74Slug									{ quality = 1; price = 20; };
	class Exile_Magazine_8Rnd_74Pellets									{ quality = 1; price = 20; };
	
	///////// NIArms Ammo /////////
	class hlc_12Rnd_45ACP_B_mk23										{ quality = 1; price = 15; };
	class hlc_12Rnd_45ACP_S_mk23										{ quality = 1; price = 15; };
	class hlc_12Rnd_45ACP_T_mk23										{ quality = 1; price = 15; };
	//class hlc_8Rnd_44mag_B_deagle										{ quality = 1; price = 20; };
	//class hlc_8Rnd_44mag_JHP_deagle									{ quality = 1; price = 20; };
	//class hlc_50Rnd_44mag_B_deagle									{ quality = 1; price = 20; };
	//class hlc_50Rnd_44mag_FUN											{ quality = 1; price = 20; };
	class hlc_10rnd_12g_buck_S12										{ quality = 1; price = 20; };
	class hlc_10rnd_12g_slug_S12										{ quality = 1; price = 20; };
	class hlc_25Rnd_9x19mm_M882_AUG										{ quality = 1; price = 20; };
	class hlc_25Rnd_9x19mm_JHP_AUG										{ quality = 1; price = 20; };
	class hlc_25Rnd_9x19mm_subsonic_AUG									{ quality = 1; price = 25; };
	class hlc_30Rnd_9x19_B_MP5											{ quality = 1; price = 25; };
	class hlc_30Rnd_9x19_GD_MP5											{ quality = 1; price = 25; };
	class hlc_30Rnd_9x19_SD_MP5											{ quality = 1; price = 30; };
	class hlc_32rnd_9x19_B_sten											{ quality = 1; price = 25; };
	class hlc_30Rnd_10mm_B_MP5											{ quality = 1; price = 25; };
	class hlc_30Rnd_10mm_JHP_MP5										{ quality = 1; price = 25; };
	class hlc_30Rnd_545x39_B_AK											{ quality = 1; price = 30; };
	class hlc_30Rnd_545x39_T_AK											{ quality = 1; price = 30; };
	class hlc_30Rnd_545x39_EP_AK										{ quality = 1; price = 30; };
	class hlc_30Rnd_545x39_S_AK											{ quality = 1; price = 30; };
	class hlc_45Rnd_545x39_t_rpk										{ quality = 1; price = 40; };
	class hlc_60Rnd_545x39_t_rpk										{ quality = 1; price = 50; };
	class hlc_30rnd_556x45_EPR											{ quality = 1; price = 30; };
	class hlc_30rnd_556x45_SOST											{ quality = 1; price = 30; };
	class hlc_30rnd_556x45_SPR											{ quality = 1; price = 30; };
	class hlc_30rnd_556x45_EPR_G36										{ quality = 1; price = 30; };
	class hlc_30rnd_556x45_SOST_G36										{ quality = 1; price = 30; };
	class hlc_30rnd_556x45_SPR_G36										{ quality = 1; price = 30; };
	class hlc_30rnd_556x45_Tracers_G36									{ quality = 1; price = 30; };
	class hlc_100rnd_556x45_EPR_G36										{ quality = 1; price = 70; };
	class hlc_30Rnd_556x45_B_AUG										{ quality = 1; price = 30; };
	class hlc_30Rnd_556x45_SOST_AUG										{ quality = 1; price = 30; };
	class hlc_30Rnd_556x45_SPR_AUG										{ quality = 1; price = 30; };
	class hlc_30Rnd_556x45_T_AUG										{ quality = 1; price = 30; };
	class hlc_40Rnd_556x45_B_AUG										{ quality = 1; price = 35; };
	class hlc_40Rnd_556x45_SOST_AUG										{ quality = 1; price = 35; };
	class hlc_40Rnd_556x45_SPR_AUG										{ quality = 1; price = 35; };
	class hlc_30rnd_556x45_EPR_HK33										{ quality = 1; price = 30; };
	class hlc_30rnd_556x45_SOST_HK33									{ quality = 1; price = 30; };
	class hlc_30rnd_556x45_t_HK33										{ quality = 1; price = 30; };
	class hlc_30rnd_556x45_b_HK33										{ quality = 1; price = 30; };
	class hlc_30rnd_556x45_S											{ quality = 1; price = 30; };
	class hlc_50rnd_556x45_EPR											{ quality = 1; price = 40; };
	class hlc_200rnd_556x45_M_SAW										{ quality = 1; price = 100; };
	class hlc_200rnd_556x45_T_SAW										{ quality = 1; price = 100; };
	class hlc_200rnd_556x45_B_SAW										{ quality = 1; price = 100; };
	class hlc_24Rnd_75x55_B_stgw										{ quality = 2; price = 35; };
	class hlc_24Rnd_75x55_ap_stgw										{ quality = 2; price = 35; };
	class hlc_24Rnd_75x55_T_stgw										{ quality = 2; price = 35; };
	class hlc_30Rnd_762x39_b_ak											{ quality = 2; price = 30; };
	class hlc_30Rnd_762x39_t_ak											{ quality = 2; price = 30; };
	class hlc_30rnd_762x39_s_ak											{ quality = 2; price = 30; };
	class hlc_45Rnd_762x39_t_rpk										{ quality = 2; price = 40; };
	class hlc_45Rnd_762x39_m_rpk										{ quality = 2; price = 40; };
	class hlc_75rnd_762x39_m_rpk										{ quality = 2; price = 50; };
	class hlc_20Rnd_762x51_B_fal										{ quality = 2; price = 30; };
	class hlc_20Rnd_762x51_t_fal										{ quality = 2; price = 30; };
	class hlc_20Rnd_762x51_S_fal										{ quality = 2; price = 30; };
	class hlc_20Rnd_762x51_barrier_fal									{ quality = 2; price = 30; };
	class hlc_20Rnd_762x51_mk316_fal									{ quality = 2; price = 30; };
	class hlc_50rnd_762x51_M_FAL										{ quality = 3; price = 50; };
	class hlc_20Rnd_762x51_B_G3											{ quality = 2; price = 30; };
	class hlc_20rnd_762x51_T_G3											{ quality = 2; price = 30; };
	class hlc_20rnd_762x51_Mk316_G3										{ quality = 2; price = 30; };
	class hlc_20rnd_762x51_barrier_G3									{ quality = 2; price = 30; };
	class hlc_20rnd_762x51_S_G3											{ quality = 2; price = 30; };
	class hlc_50rnd_762x51_M_G3											{ quality = 3; price = 50; };
	class hlc_20Rnd_762x51_B_M14										{ quality = 2; price = 30; };
	class hlc_20rnd_762x51_T_M14										{ quality = 2; price = 30; };
	class hlc_20Rnd_762x51_S_M14										{ quality = 2; price = 30; };
	class hlc_20Rnd_762x51_barrier_M14									{ quality = 2; price = 30; };
	class hlc_20rnd_762x51_mk316_M14									{ quality = 2; price = 30; };
	class hlc_50Rnd_762x51_B_M14										{ quality = 3; price = 50; };
	class hlc_20Rnd_762x51_b_amt										{ quality = 2; price = 30; };
	class hlc_20Rnd_762x51_mk316_amt									{ quality = 2; price = 30; };
	class hlc_20Rnd_762x51_bball_amt									{ quality = 2; price = 30; };
	class hlc_20Rnd_762x51_T_amt										{ quality = 2; price = 30; };
	class hlc_100Rnd_762x51_B_M60E4										{ quality = 2; price = 70; };
	class hlc_100Rnd_762x51_T_M60E4										{ quality = 2; price = 70; };
	class hlc_100Rnd_762x51_M_M60E4										{ quality = 2; price = 70; };
	class hlc_100Rnd_762x51_Barrier_M60E4								{ quality = 2; price = 70; };
	class 29rnd_300BLK_STANAG											{ quality = 2; price = 35; };
	class 29rnd_300BLK_STANAG_T											{ quality = 2; price = 35; };
	class 29rnd_300BLK_STANAG_S											{ quality = 2; price = 35; };
	class hlc_5rnd_300WM_FMJ_AWM										{ quality = 3; price = 20; };
	class hlc_5rnd_300WM_AP_AWM											{ quality = 3; price = 20; };
	class hlc_5rnd_300WM_BTSP_AWM										{ quality = 3; price = 20; };
	class hlc_5rnd_300WM_mk248_AWM										{ quality = 3; price = 20; };
	class hlc_5rnd_300WM_SBT_AWM										{ quality = 2; price = 20; };
	class hlc_5rnd_3006_1903											{ quality = 1; price = 20; };
		
	///////// NIArms Smokes /////////
	class hlc_GRD_White													{ quality = 1; price = 25; };
	class hlc_GRD_red													{ quality = 1; price = 25; };
	class hlc_GRD_green													{ quality = 1; price = 25; };
	class hlc_GRD_blue													{ quality = 1; price = 25; };
	class hlc_GRD_orange												{ quality = 1; price = 25; };
	class hlc_GRD_purple												{ quality = 1; price = 25; };
	class hlc_GRD_yellow												{ quality = 1; price = 25; };
	
		///////// Static MG /////////
	class O_HMG_01_weapon_F 											{ quality = 3; price = 3000; };
	class O_HMG_01_support_F 											{ quality = 3; price = 750; };

	///////// Pistols /////////
	class hgun_Pistol_01_F												{ quality = 1; price = 150; };
	class hgun_ACPC2_F 													{ quality = 1; price = 150; };
	class hgun_P07_F 													{ quality = 1; price = 150; };
	class hgun_P07_khk_F												{ quality = 1; price = 150; };
	class hgun_Rook40_F 												{ quality = 1; price = 150; };
	class hgun_Pistol_heavy_01_F 										{ quality = 1; price = 200; };
	class hgun_Pistol_heavy_02_F 										{ quality = 1; price = 200; };
		
	///////// Sub Machine Guns /////////
	class hgun_PDW2000_F 												{ quality = 1; price = 300; };
	class SMG_01_F 														{ quality = 1; price = 300; };
	class SMG_02_F 														{ quality = 1; price = 300; };
	class SMG_05_F														{ quality = 1; price = 300; };
	
	///////// Assault Rifles /////////
	class arifle_Katiba_C_F												{ quality = 1; price = 500; };
	class arifle_Katiba_F												{ quality = 1; price = 500; };
	class arifle_Katiba_GL_F											{ quality = 1; price = 500; };
	class arifle_Mk20_F													{ quality = 1; price = 400; };
	class arifle_Mk20_GL_F												{ quality = 1; price = 450; };
	class arifle_Mk20_GL_plain_F										{ quality = 1; price = 450; };
	class arifle_Mk20_plain_F											{ quality = 1; price = 400; };
	class arifle_Mk20C_F												{ quality = 1; price = 400; };
	class arifle_Mk20C_plain_F											{ quality = 1; price = 400; };
	class arifle_MX_Black_F												{ quality = 1; price = 500; };
	class arifle_MX_F													{ quality = 1; price = 500; };
	class arifle_MX_khk_F												{ quality = 1; price = 500; };
	class arifle_MX_GL_Black_F											{ quality = 1; price = 550; };
	class arifle_MX_GL_F												{ quality = 1; price = 550; };
	class arifle_MX_GL_khk_F											{ quality = 1; price = 550; };
	class arifle_MXC_Black_F											{ quality = 1; price = 500; };
	class arifle_MXC_F													{ quality = 1; price = 500; };
	class arifle_MXC_khk_F												{ quality = 1; price = 500; };					
	class arifle_SDAR_F													{ quality = 1; price = 350; };
	class arifle_TRG20_F												{ quality = 1; price = 400; };
	class arifle_TRG21_F												{ quality = 1; price = 400; };
	class arifle_TRG21_GL_F												{ quality = 1; price = 450; };
	class arifle_AK12_F													{ quality = 2; price = 400; };												
	class arifle_AK12_GL_F												{ quality = 2; price = 450; };
	class arifle_AKM_F													{ quality = 2; price = 400; };
	class arifle_AKS_F													{ quality = 1; price = 350; };
	class arifle_CTAR_blk_F												{ quality = 1; price = 350; };
	class arifle_CTAR_ghex_F											{ quality = 1; price = 350; };
	class arifle_CTAR_hex_F												{ quality = 1; price = 350; };
	class arifle_CTAR_GL_blk_F											{ quality = 1; price = 400; };
	class arifle_CTAR_GL_ghex_F											{ quality = 1; price = 400; };
	class arifle_CTAR_GL_hex_F											{ quality = 1; price = 400; };
	class arifle_CTARS_blk_F											{ quality = 1; price = 450; };
	class arifle_CTARS_ghex_F											{ quality = 1; price = 450; };
	class arifle_CTARS_hex_F											{ quality = 1; price = 450; };
	class arifle_SPAR_01_blk_F											{ quality = 1; price = 400; };
	class arifle_SPAR_01_khk_F											{ quality = 1; price = 400; };
	class arifle_SPAR_01_snd_F											{ quality = 1; price = 400; };
	class arifle_SPAR_01_GL_blk_F										{ quality = 1; price = 450; };
	class arifle_SPAR_01_GL_khk_F										{ quality = 1; price = 450; };
	class arifle_SPAR_01_GL_snd_F										{ quality = 1; price = 450; };
	class arifle_SPAR_02_blk_F											{ quality = 2; price = 450; };
	class arifle_SPAR_02_khk_F											{ quality = 2; price = 450; };
	class arifle_SPAR_02_snd_F											{ quality = 2; price = 450; };
	class arifle_SPAR_03_blk_F											{ quality = 2; price = 600; };
	class arifle_SPAR_03_khk_F											{ quality = 2; price = 600; };
	class arifle_SPAR_03_snd_F											{ quality = 2; price = 600; };
	class arifle_ARX_blk_F												{ quality = 3; price = 1250; };
	class arifle_ARX_ghex_F												{ quality = 3; price = 1250; };
	class arifle_ARX_hex_F												{ quality = 3; price = 1250; };

	///////// Light Machine Guns /////////
	class arifle_MX_SW_Black_F											{ quality = 1; price = 700; };
	class arifle_MX_SW_F												{ quality = 1; price = 700; };
	class LMG_03_F														{ quality = 1; price = 700; };
	class LMG_Mk200_F													{ quality = 1; price = 750; };
	class LMG_Zafir_F													{ quality = 2; price = 850; };
	class MMG_01_hex_F													{ quality = 3; price = 2000; };
	class MMG_01_tan_F													{ quality = 3; price = 2000; };
	class MMG_02_black_F												{ quality = 3; price = 2000; };
	class MMG_02_camo_F													{ quality = 3; price = 2000; };
	class MMG_02_sand_F													{ quality = 3; price = 2000; };

	///////// Sniper Rifles /////////
	class arifle_MXM_Black_F 											{ quality = 1; price = 700; };
	class arifle_MXM_F 													{ quality = 1; price = 700; };
	class arifle_MXM_khk_F												{ quality = 1; price = 700; };
	class srifle_DMR_01_F 												{ quality = 2; price = 700; };
	class srifle_DMR_02_camo_F 											{ quality = 3; price = 1500; };
	class srifle_DMR_02_F 												{ quality = 3; price = 1500; };
	class srifle_DMR_02_sniper_F 										{ quality = 3; price = 1500; };
	class srifle_DMR_03_F 												{ quality = 2; price = 900; };
	class srifle_DMR_03_khaki_F 										{ quality = 2; price = 900; };
	class srifle_DMR_03_multicam_F 										{ quality = 2; price = 900; };
	class srifle_DMR_03_tan_F 											{ quality = 2; price = 900; };
	class srifle_DMR_03_woodland_F 										{ quality = 2; price = 900; };
	class srifle_DMR_04_F 												{ quality = 3; price = 1000; };
	class srifle_DMR_04_Tan_F 											{ quality = 3; price = 1000; };
	class srifle_DMR_05_blk_F 											{ quality = 3; price = 1500; };
	class srifle_DMR_05_hex_F 											{ quality = 3; price = 1500; };
	class srifle_DMR_05_tan_f 											{ quality = 3; price = 1500; };
	class srifle_DMR_06_camo_F 											{ quality = 2; price = 900; };
	class srifle_DMR_06_olive_F 										{ quality = 2; price = 900; };
	class srifle_DMR_07_blk_F											{ quality = 2; price = 750; };
	class srifle_DMR_07_ghex_F											{ quality = 2; price = 750; };
	class srifle_DMR_07_hex_F											{ quality = 2; price = 750; };
	class srifle_EBR_F 													{ quality = 2; price = 900; };
	class srifle_GM6_camo_F 											{ quality = 3; price = 2500; };
	class srifle_GM6_F 													{ quality = 3; price = 2500; };
	class srifle_GM6_ghex_F 											{ quality = 3; price = 2500; };
	class srifle_LRR_camo_F 											{ quality = 3; price = 1750; };
	class srifle_LRR_F 													{ quality = 3; price = 1750; };
	class srifle_LRR_tna_F 												{ quality = 3; price = 1750; };
	
	///////// Launchers /////////
	class launch_RPG7_F													{ quality = 4; price = 3000; };
	class launch_RPG32_F												{ quality = 4; price = 3000; };
	class launch_RPG32_ghex_F											{ quality = 4; price = 3000; };
	
	///////// Exile Weapons /////////
	class Exile_Weapon_AK107											{ quality = 1; price = 300; };
	class Exile_Weapon_AK107_GL											{ quality = 2; price = 400; };
	class Exile_Weapon_AK74												{ quality = 2; price = 350; };
	class Exile_Weapon_AK74_GL											{ quality = 2; price = 400; };
	class Exile_Weapon_AK47												{ quality = 2; price = 500; };
	class Exile_Weapon_AKM												{ quality = 2; price = 500; };
	class Exile_Weapon_AKS												{ quality = 2; price = 500; };
	class Exile_Weapon_AKS_Gold											{ quality = 2; price = 550; };
	class Exile_Weapon_DMR												{ quality = 3; price = 650; };
	class Exile_Weapon_LeeEnfield										{ quality = 1; price = 250; };
	class Exile_Weapon_CZ550											{ quality = 2; price = 400; };
	class Exile_Weapon_SVD												{ quality = 2; price = 800; };
	class Exile_Weapon_SVDCamo											{ quality = 2; price = 850; };
	class Exile_Weapon_VSSVintorez										{ quality = 3; price = 600; };
	class Exile_Weapon_RPK												{ quality = 2; price = 250; };
	class Exile_Weapon_PK												{ quality = 2; price = 300; };
	class Exile_Weapon_PKP												{ quality = 2; price = 350; };
	class Exile_Weapon_Colt1911											{ quality = 1; price = 100; };
	class Exile_Weapon_Makarov											{ quality = 1; price = 100; };
	class Exile_Weapon_Taurus											{ quality = 1; price = 100; };
	class Exile_Weapon_TaurusGold										{ quality = 1; price = 150; };
	class Exile_Weapon_M1014											{ quality = 1; price = 200; };
	
	///////// NIArms Handguns /////////	
	class hlc_smg_mp5k 													{ quality = 1; price = 350; };
	
	///////// NIArms AK Rifles /////////
	class hlc_rifle_slr107u 											{ quality = 2; price = 500; };
	class hlc_rifle_slr107u_MTK 										{ quality = 2; price = 500; };
	class hlc_rifle_ak12 												{ quality = 1; price = 425; };
	class hlc_rifle_ak12GL 												{ quality = 1; price = 475; };
	class hlc_rifle_aku12 												{ quality = 1; price = 425; };
	class hlc_rifle_ak47 												{ quality = 2; price = 425; };
	class hlc_rifle_ak74 												{ quality = 1; price = 425; };
	class hlc_rifle_ak74_MTK 											{ quality = 1; price = 425; };
	class hlc_rifle_ak74_dirty 											{ quality = 1; price = 425; };
	class hlc_rifle_ak74_dirty2 										{ quality = 1; price = 425; };
	class hlc_rifle_ak74m 												{ quality = 1; price = 425; };
	class hlc_rifle_ak74m_gl 											{ quality = 1; price = 475; };
	class hlc_rifle_ak74m_MTK 											{ quality = 1; price = 425; };
	class hlc_rifle_akm 												{ quality = 1; price = 425; };
	class hlc_rifle_akmgl 												{ quality = 1; price = 425; };
	class hlc_rifle_akm_MTK 											{ quality = 1; price = 425; };
	class hlc_rifle_aks74 												{ quality = 1; price = 425; };
	class hlc_rifle_aks74_GL 											{ quality = 1; price = 475; };
	class hlc_rifle_aks74_MTK 											{ quality = 1; price = 425; };
	class hlc_rifle_aks74u 												{ quality = 1; price = 425; };
	class hlc_rifle_aks74u_MTK 											{ quality = 1; price = 425; };
	class hlc_rifle_rpk 												{ quality = 1; price = 525; };
	class hlc_rifle_RPK12 												{ quality = 1; price = 525; };
	class hlc_rifle_rpk74n 												{ quality = 1; price = 525; };
	class hlc_rifle_saiga12k 											{ quality = 1; price = 500; };
	class hlc_rifle_RK62 												{ quality = 2; price = 410; };
	class hlc_rifle_aek971 												{ quality = 1; price = 425; };
	class hlc_rifle_aek971_mtk 											{ quality = 1; price = 425; };
	class hlc_rifle_aek971worn 											{ quality = 1; price = 425; };

	///////// NIArms AR15 Rifles /////////
	class hlc_rifle_honeybadger 										{ quality = 2; price = 525; };
	class hlc_rifle_vendimus 											{ quality = 2; price = 425; };
	class hlc_rifle_RU5562 												{ quality = 1; price = 425; };
	class hlc_rifle_RU556 												{ quality = 1; price = 425; };
	class hlc_rifle_bcmjack 											{ quality = 1; price = 350; };
	class hlc_rifle_Bushmaster300 										{ quality = 2; price = 550; };
	class hlc_rifle_Colt727 											{ quality = 1; price = 500; };
	class hlc_rifle_Colt727_GL 											{ quality = 1; price = 550; };
	class hlc_rifle_M4 													{ quality = 1; price = 450; };
	class hlc_rifle_m4m203 												{ quality = 1; price = 475; };
	class hlc_rifle_CQBR 												{ quality = 1; price = 435; };
	class hlc_rifle_samr2 												{ quality = 1; price = 435; };
	class hlc_rifle_SAMR 												{ quality = 1; price = 435; };

	///////// NIArms AUG Rifles /////////
	class hlc_rifle_augsrcarb_b 										{ quality = 1; price = 455; };
	class hlc_rifle_augsrcarb 											{ quality = 1; price = 455; };
	class hlc_rifle_augsrhbar_b 										{ quality = 1; price = 485; };
	class hlc_rifle_augsrhbar 											{ quality = 1; price = 485; };
	class hlc_rifle_augsrhbar_t 										{ quality = 1; price = 485; };
	class hlc_rifle_augsr_b 											{ quality = 1; price = 455; };
	class hlc_rifle_augsr 												{ quality = 1; price = 455; };
	class hlc_rifle_augsr_t												{ quality = 1; price = 455; };
	class hlc_rifle_augsrcarb_t											{ quality = 1; price = 455; };
	class hlc_rifle_augpara_b 											{ quality = 1; price = 455; };
	class hlc_rifle_augpara 											{ quality = 1; price = 455; };
	class hlc_rifle_augpara_t 											{ quality = 1; price = 455; };
	class hlc_rifle_auga1carb_B 										{ quality = 1; price = 455; };
	class hlc_rifle_auga1carb 											{ quality = 1; price = 458; };
	class hlc_rifle_auga1carb_t 										{ quality = 1; price = 458; };
	class hlc_rifle_aughbar_B 											{ quality = 1; price = 500; };
	class hlc_rifle_aughbar 											{ quality = 1; price = 500; };
	class hlc_rifle_aughbar_t 											{ quality = 1; price = 500; };
	class hlc_rifle_auga1_b 											{ quality = 1; price = 450; };
	class hlc_rifle_aug 												{ quality = 1; price = 450; };
	class hlc_rifle_auga1_t 											{ quality = 1; price = 450; };
	class hlc_rifle_auga2para_b 										{ quality = 1; price = 350; };
	class hlc_rifle_auga2para 											{ quality = 1; price = 350; };
	class hlc_rifle_auga2para_t 										{ quality = 1; price = 350; };
	class hlc_rifle_auga2carb_b 										{ quality = 1; price = 385; };
	class hlc_rifle_auga2carb 											{ quality = 1; price = 385; };
	class hlc_rifle_auga2carb_t 										{ quality = 1; price = 385; };
	class hlc_rifle_auga2lsw_b 											{ quality = 1; price = 435; };
	class hlc_rifle_auga2lsw 											{ quality = 1; price = 435; };
	class hlc_rifle_auga2lsw_t 											{ quality = 1; price = 435; };
	class hlc_rifle_auga2_b 											{ quality = 1; price = 385; };
	class hlc_rifle_auga2 												{ quality = 1; price = 385; };
	class hlc_rifle_auga2_t 											{ quality = 1; price = 385; };
	class hlc_rifle_auga3_GL_B 											{ quality = 1; price = 475; };
	class hlc_rifle_auga3_GL_BL 										{ quality = 1; price = 475; };
	class hlc_rifle_auga3_GL 											{ quality = 1; price = 475; };
	class hlc_rifle_auga3_b 											{ quality = 1; price = 435; };
	class hlc_rifle_auga3_bl 											{ quality = 1; price = 435; };
	class hlc_rifle_auga3 												{ quality = 1; price = 435; };

	///////// NIArms AWM Rifles /////////
	class hlc_rifle_awcovert_BL 										{ quality = 3; price = 1300; };
	class hlc_rifle_awcovert_FDE 										{ quality = 3; price = 1300; };
	class hlc_rifle_awcovert 											{ quality = 3; price = 1250; };
	class hlc_rifle_awmagnum_BL 										{ quality = 3; price = 1250; };
	class hlc_rifle_awMagnum_BL_ghillie 								{ quality = 3; price = 1350; };
	class hlc_rifle_awmagnum_FDE 										{ quality = 3; price = 1250; };
	class hlc_rifle_awMagnum_FDE_ghillie 								{ quality = 3; price = 1350; };
	class hlc_rifle_awmagnum 											{ quality = 3; price = 1250; };
	class hlc_rifle_awMagnum_OD_ghillie 								{ quality = 3; price = 1350; };

	///////// NIArms FAL Rifles /////////
	class hlc_rifle_c1A1 												{ quality = 2; price = 750; };
	class hlc_rifle_falosw 												{ quality = 2; price = 825; };
	class hlc_rifle_osw_GL 												{ quality = 2; price = 875; };
	class hlc_rifle_L1A1SLR 											{ quality = 2; price = 825; };
	class hlc_rifle_FAL5000 											{ quality = 2; price = 825; };
	class hlc_rifle_FAL5000Rail 										{ quality = 2; price = 865; };
	class hlc_rifle_FAL5061 											{ quality = 2; price = 825; };
	class hlc_rifle_FAL5061Rail 										{ quality = 2; price = 865; };
	class hlc_rifle_LAR 												{ quality = 2; price = 825; };
	class hlc_rifle_SLR 												{ quality = 2; price = 825; };
	class hlc_rifle_SLRchopmod 											{ quality = 2; price = 825; };
	class hlc_rifle_STG58F 												{ quality = 2; price = 825; };

	///////// NIArms G3 Rifles /////////
	class hlc_rifle_g3sg1 												{ quality = 2; price = 900; };
	class hlc_rifle_g3a3 												{ quality = 2; price = 900; };
	class hlc_rifle_g3a3v 												{ quality = 2; price = 900; };
	class hlc_rifle_g3a3ris 											{ quality = 2; price = 900; };
	class hlc_rifle_g3ka4 												{ quality = 2; price = 950; }; 
	class hLC_Rifle_g3ka4_GL 											{ quality = 2; price = 1000; }; 
	class hlc_rifle_hk33a2 												{ quality = 1; price = 700; };
	class hlc_rifle_hk33a2RIS 											{ quality = 1; price = 725; };	
	class hlc_rifle_hk53 												{ quality = 1; price = 450; };	
	class hlc_rifle_hk53RAS 											{ quality = 1; price = 450; };
	class hlc_rifle_psg1 												{ quality = 2; price = 1000; };
	class hlc_rifle_psg1A1 												{ quality = 2; price = 1050; };
	class hlc_rifle_PSG1A1_RIS 											{ quality = 2; price = 1100; };

	///////// NIArms G36 Rifles /////////
	class hlc_rifle_G36MLIC 											{ quality = 1; price = 500; };
	class hlc_rifle_G36A1 												{ quality = 1; price = 450; };
	class hlc_rifle_G36A1AG36 											{ quality = 1; price = 500; };
	class hlc_rifle_G36C 												{ quality = 1; price = 450; };
	class hlc_rifle_G36CMLIC 											{ quality = 1; price = 500; };
	class hlc_rifle_G36CV 												{ quality = 1; price = 450; };
	class hlc_rifle_G36CTac 											{ quality = 1; price = 450; };
	class hlc_rifle_G36E1 												{ quality = 1; price = 450; };
	class hlc_rifle_G36E1AG36 											{ quality = 1; price = 500; };
	class hlc_rifle_G36KMLIC 											{ quality = 1; price = 500; };
	class hlc_rifle_G36KA1 												{ quality = 1; price = 450; };
	class hlc_rifle_G36KE1 												{ quality = 1; price = 450; };
	class hlc_rifle_G36KV 												{ quality = 1; price = 450; };
	class hlc_rifle_g36KTac 											{ quality = 1; price = 450; };
	class hlc_rifle_G36MLIAG36 											{ quality = 1; price = 500; };
	class hlc_rifle_G36V 												{ quality = 1; price = 450; };
	class hlc_rifle_G36VAG36 											{ quality = 1; price = 500; };
	class hlc_rifle_G36TAC 												{ quality = 1; price = 450; };
	class hlc_rifle_MG36 												{ quality = 1; price = 550; };

	///////// NIArms M14 Rifles /////////
	class hlc_rifle_M14 												{ quality = 2; price = 900; };
	class hlc_rifle_M14_Bipod 											{ quality = 2; price = 950; };
	class hlc_rifle_M14_Rail 											{ quality = 2; price = 950; };
	class hlc_rifle_m14dmr 												{ quality = 2; price = 950; };
	class hlc_rifle_M21 												{ quality = 2; price = 950; };
	class hlc_rifle_m14sopmod 											{ quality = 2; price = 925; };

	///////// NIArms M1903 Springfield Rifles /////////
	class hlc_rifle_M1903A1 											{ quality = 1; price = 400; };
	class hlc_rifle_M1903A1OMR 											{ quality = 1; price = 400; };
	class hlc_rifle_M1903A1_unertl 										{ quality = 2; price = 600; };

	///////// NIArms M60 GPMGs /////////
	class hlc_lmg_m60 													{ quality = 2; price = 850; };
	class hlc_lmg_M60E4 												{ quality = 2; price = 900; };

	///////// NIArms Minimi LMGs /////////
	class hlc_lmg_minimi 												{ quality = 1; price = 650; };
	class hlc_lmg_minimi_railed 										{ quality = 1; price = 700; };
	class hlc_lmg_minimipara 											{ quality = 1; price = 700; };
	class hlc_m249_SQuantoon 											{ quality = 1; price = 700; };
	class hlc_m249_pip1 												{ quality = 1; price = 700; };
	class hlc_m249_pip3 												{ quality = 1; price = 700; };
	class hlc_m249_pip4 												{ quality = 1; price = 700; };
	class hlc_lmg_M249E2 												{ quality = 1; price = 700; };
	class hlc_m249_pip2 												{ quality = 1; price = 700; };
	class hlc_lmg_m249para 												{ quality = 1; price = 700; };
	class hlc_lmg_mk48 													{ quality = 2; price = 750; };

	///////// NIArms MP5 SMGs /////////
	class hlc_smg_mp510 												{ quality = 1; price = 400; };
	class hlc_smg_mp5a2 												{ quality = 1; price = 400; };
	class hlc_smg_mp5a3 												{ quality = 1; price = 400; };
	class hlc_smg_mp5a4 												{ quality = 1; price = 400; };
	class hlc_smg_mp5k_PDW 												{ quality = 1; price = 425; };
	class hlc_smg_MP5N 													{ quality = 1; price = 400; };
	class hlc_smg_9mmar 												{ quality = 1; price = 450; };
	class hlc_smg_mp5sd5 												{ quality = 1; price = 425; };
	class hlc_smg_mp5sd6 												{ quality = 1; price = 425; };

	///////// NIArms SG510 Rifles /////////
	class hlc_rifle_amt 												{ quality = 2; price = 900; };
	class hlc_rifle_sig5104 											{ quality = 1; price = 950; };
	class hlc_rifle_STGW57 												{ quality = 1; price = 800; };
	class hlc_rifle_stgw57_commando 									{ quality = 1; price = 850; };
	class hlc_rifle_stgw57_RIS 											{ quality = 2; price = 900; };
	
		///////// Pointer Attachments /////////
	class acc_flashlight 												{ quality = 1; price = 50; };
	class acc_pointer_IR 												{ quality = 1; price = 75; };

	///////// Bipod Attachments /////////
	class bipod_01_F_blk	 											{ quality = 1; price = 75; };
	class bipod_01_F_mtp	 											{ quality = 1; price = 75; };
	class bipod_01_F_snd	 											{ quality = 1; price = 75; };
	class bipod_02_F_blk	 											{ quality = 1; price = 75; };
	class bipod_02_F_hex	 											{ quality = 1; price = 75; };
	class bipod_02_F_tan	 											{ quality = 1; price = 75; };
	class bipod_03_F_blk	 											{ quality = 1; price = 75; };
	class bipod_03_F_oli	 											{ quality = 1; price = 75; };
	class bipod_01_F_khk												{ quality = 1; price = 75; };

	///////// Muzzle Attachments /////////
	class muzzle_snds_acp 												{ quality = 1; price = 50; };
	class muzzle_snds_338_black 										{ quality = 3; price = 150; };
	class muzzle_snds_338_green 										{ quality = 3; price = 150; };
	class muzzle_snds_338_sand 											{ quality = 3; price = 150; };
	class muzzle_snds_93mmg 											{ quality = 3; price = 150; };
	class muzzle_snds_93mmg_tan 										{ quality = 3; price = 150; };
	class muzzle_snds_58_blk_F											{ quality = 1; price = 75; };
	class muzzle_snds_58_wdm_F											{ quality = 1; price = 75; };
	class muzzle_snds_B 												{ quality = 2; price = 75; };
	class muzzle_snds_B_khk_F											{ quality = 2; price = 75; };
	class muzzle_snds_B_snd_F											{ quality = 2; price = 75; };
	class muzzle_snds_H 												{ quality = 1; price = 75; };
	class muzzle_snds_H_khk_F											{ quality = 1; price = 75; };
	class muzzle_snds_H_snd_F											{ quality = 1; price = 75; };
	class muzzle_snds_H_MG 												{ quality = 1; price = 75; };
	class muzzle_snds_H_MG_blk_F										{ quality = 1; price = 75; };
	class muzzle_snds_H_MG_khk_F										{ quality = 1; price = 75; };
	class muzzle_snds_H_SW 												{ quality = 1; price = 75; };
	class muzzle_snds_L 												{ quality = 1; price = 50; };
	class muzzle_snds_M 												{ quality = 1; price = 75; };
	class muzzle_snds_m_khk_F											{ quality = 1; price = 75; };	
	class muzzle_snds_m_snd_F											{ quality = 1; price = 75; };		

	///////// Stealth Muzzle Attachements /////////
	class muzzle_snds_65_TI_blk_F										{ quality = 3; price = 250; };	
	class muzzle_snds_65_TI_hex_F										{ quality = 3; price = 250; };
	class muzzle_snds_65_TI_ghex_F										{ quality = 3; price = 250; };
	
	///////// Optic Attachements /////////
	class optic_Aco														{ quality = 1; price = 100; };
	class optic_ACO_grn													{ quality = 1; price = 100; };
	class optic_ACO_grn_smg												{ quality = 1; price = 100; };
	class optic_Aco_smg													{ quality = 1; price = 100; };
	class optic_AMS														{ quality = 2; price = 500; };
	class optic_AMS_khk													{ quality = 2; price = 500; };
	class optic_AMS_snd													{ quality = 2; price = 500; };
	class optic_Arco													{ quality = 1; price = 250; };
	class optic_Arco_blk_F												{ quality = 1; price = 250; };	
	class optic_Arco_ghex_F												{ quality = 1; price = 250; };		
	class optic_ERCO_blk_F												{ quality = 1; price = 250; };
	class optic_ERCO_khk_F												{ quality = 1; price = 250; };
	class optic_ERCO_snd_F												{ quality = 1; price = 250; };
	class optic_DMS														{ quality = 1; price = 350; };
	class optic_DMS_ghex_F												{ quality = 1; price = 350; };
	class optic_Hamr													{ quality = 1; price = 250; };
	class optic_Hamr_khk_F												{ quality = 1; price = 250; };
	class optic_Holosight												{ quality = 1; price = 150; };
	class optic_Holosight_smg											{ quality = 1; price = 150; };
	class optic_Holosight_blk_F											{ quality = 1; price = 150; };
	class optic_Holosight_khk_F											{ quality = 1; price = 150; };
	class optic_Holosight_smg_blk_F										{ quality = 1; price = 150; };
	class optic_KHS_blk													{ quality = 1; price = 400; };
	class optic_KHS_hex													{ quality = 1; price = 400; };
	class optic_KHS_old													{ quality = 1; price = 400; };
	class optic_KHS_tan													{ quality = 1; price = 400; };
	class optic_LRPS													{ quality = 3; price = 400; };
	class optic_LRPS_tna_F												{ quality = 3; price = 400; };
	class optic_LRPS_ghex_F												{ quality = 3; price = 400; };
	class optic_MRCO													{ quality = 1; price = 200; };
	class optic_NVS														{ quality = 1; price = 500; };
	class optic_SOS														{ quality = 1; price = 300; };
	class optic_SOS_khk_F												{ quality = 1; price = 300; };
	class optic_MRD														{ quality = 1; price = 75; };
	class optic_Yorris													{ quality = 1; price = 75; };
	class optic_Nightstalker											{ quality = 4; price = 2000; };
	//class optic_tws													{ quality = 1; price = 1500; };
	//class optic_tws_mg												{ quality = 1; price = 1500; };
	
	///////// NIArms Pointer Attachements /////////
	class hlc_acc_Surefiregrip 											{ quality = 1; price = 50; };

	///////// NIArms Muzzle Attachements /////////	
	class hlc_muzzle_Agendasix10mm 										{ quality = 1; price = 75; };
	class hlc_muzzle_Agendasix 											{ quality = 1; price = 75; };
	class hlc_muzzle_Tundra 											{ quality = 1; price = 50; };
	class hlc_muzzle_snds_AUG 											{ quality = 1; price = 75; };
	class hlc_muzzle_snds_a6AUG 										{ quality = 1; price = 75; };
	class hlc_muzzle_545SUP_AK 											{ quality = 1; price = 75; };
	class hlc_muzzle_762SUP_AK 											{ quality = 2; price = 75; };
	class hlc_muzzle_snds_M14 											{ quality = 2; price = 75; };
	class hlc_muzzle_556NATO_KAC 										{ quality = 1; price = 75; };
	class hlc_muzzle_300blk_KAC 										{ quality = 2; price = 75; };
	class hlc_muzzle_snds_fal											{ quality = 2; price = 75; };
	class hlc_muzzle_snds_g3											{ quality = 3; price = 75; };
	class hlc_muzzle_snds_HK33											{ quality = 1; price = 75; };
	class muzzle_hbadger												{ quality = 2; price = 75; };

	///////// NIArms Optic Attachements /////////	
	class HLC_Optic_PSO1 												{ quality = 1; price = 200; };
	class HLC_Optic_1p29 												{ quality = 1; price = 150; };
	class hlc_optic_kobra 												{ quality = 1; price = 150; };
	class hlc_optic_PVS4FAL 											{ quality = 2; price = 500; };
	class hlc_optic_PVS4G3 												{ quality = 2; price = 500; };
	class hlc_optic_PVS4M14 											{ quality = 2; price = 500; };
	class hlc_optic_suit 												{ quality = 1; price = 100; };
	class hlc_optic_accupoint_g3 										{ quality = 1; price = 100; };
	class HLC_Optic_G36dualoptic35x 									{ quality = 1; price = 100; };
	class HLC_Optic_G36dualoptic35x2d 									{ quality = 1; price = 100; };
	class HLC_Optic_G36Export35x 										{ quality = 1; price = 100; };
	class HLC_Optic_G36Export35x2d 										{ quality = 1; price = 100; };
	class HLC_Optic_G36Dualoptic15x 									{ quality = 1; price = 100; };
	class HLC_Optic_G36Dualoptic15x2d 									{ quality = 1; price = 100; };
	class HLC_Optic_G36Export15x 										{ quality = 1; price = 100; };
	class HLC_Optic_G36Export15x2d 										{ quality = 1; price = 100; };
	class hlc_optic_artel_m14 											{ quality = 1; price = 100; };
	class hlc_optic_LRT_m14 											{ quality = 1; price = 150; };
	class hlc_optic_Kern 												{ quality = 1; price = 100; };
	class hlc_optic_Kern2d 												{ quality = 1; price = 100; };
	class HLC_Optic_ZFSG1 												{ quality = 1; price = 100; };
	//class hlc_optic_goshawk 											{ quality = 3; price = 1500; };
	
	///////// Food /////////
	class Exile_Item_EMRE												{ quality = 1; price = 75; }; //75, 60
	class Exile_Item_GloriousKnakworst									{ quality = 1; price = 60; }; //60, 30
	class Exile_Item_Surstromming										{ quality = 1; price = 55; }; //55, 25
	class Exile_Item_SausageGravy										{ quality = 1; price = 50; }; //50, 25
	class Exile_Item_Catfood											{ quality = 1; price = 40; }; //40, 40
	class Exile_Item_MacasCheese										{ quality = 1; price = 45; }; //40, 60
	class Exile_Item_ChristmasTinner									{ quality = 1; price = 40; }; //40, 60
	class Exile_Item_BBQSandwich										{ quality = 1; price = 40; }; //40, 60
	class Exile_Item_Dogfood											{ quality = 1; price = 30; }; //30, 30
	class Exile_Item_BeefParts											{ quality = 1; price = 30; }; //30, 30
	class Exile_Item_DsNuts												{ quality = 1; price = 30; }; //30, 60
	class Exile_Item_Cheathas											{ quality = 1; price = 30; }; //30, 30
	class Exile_Item_Noodles											{ quality = 1; price = 25; }; //25, 50
	class Exile_Item_SeedAstics											{ quality = 1; price = 20; }; //20, 40
	class Exile_Item_CockONut											{ quality = 1; price = 20; }; //20, 40
	class Exile_Item_Raisins											{ quality = 1; price = 15; }; //15, 30
	class Exile_Item_Moobar												{ quality = 1; price = 10; }; //10, 30
	class Exile_Item_InstantCoffee										{ quality = 1; price = 5; };  //5, 10
	class Exile_Item_Can_Empty											{ quality = 1; price = 1; sellPrice = 1; };

	///////// Drinks /////////
	class Exile_Item_PlasticBottleCoffee	 							{ quality = 1; price = 75; sellPrice = 10; }; //100, 60
	class Exile_Item_PowerDrink											{ quality = 1; price = 70; }; //95, 10
	class Exile_Item_PlasticBottleFreshWater 							{ quality = 1; price = 60; sellPrice = 5; }; //80, 15
	class Exile_Item_Beer 												{ quality = 1; price = 55; }; //75, 30
	class Exile_Item_EnergyDrink										{ quality = 1; price = 55; }; //75, 20
	class Exile_Item_MountainDupe										{ quality = 1; price = 35; }; //50, 20
	class Exile_Item_ChocolateMilk										{ quality = 1; price = 25; }; //35, 10
	class Exile_Item_PlasticBottleEmpty									{ quality = 1; price = 5; };
	
	///////// First Aid /////////
	class Exile_Item_InstaDoc                      						{ quality = 1; price = 500; };
	class Exile_Item_Vishpirin											{ quality = 1; price = 250; };
	class Exile_Item_Bandage	                  						{ quality = 1; price = 50; };
	class Exile_Item_Heatpack	                   						{ quality = 1; price = 100; };
	//class Exile_Item_Defibrillator									{ quality = 1; price = 2500; sellPrice = 250; };
	
	///////// Hardware /////////
	class Exile_Item_DuctTape											{ quality = 1; price = 150; };
	class Exile_Item_ExtensionCord										{ quality = 1; price = 100; };
	class Exile_Item_FuelCanisterEmpty									{ quality = 1; price = 50; };
	class Exile_Item_FuelBarrelEmpty									{ quality = 1; price = 125; };
	class Exile_Item_FuelCanisterFull									{ quality = 1; price = 100; sellPrice = 50; };
	class Exile_Item_FuelBarrelFull										{ quality = 1; price = 250; sellPrice = 125; };
	class Exile_Item_WaterCanisterDirtyWater							{ quality = 1; price = 100; };
	class Exile_Item_WaterCanisterEmpty									{ quality = 1; price = 50; };
	class Exile_Item_JunkMetal											{ quality = 1; price = 400; sellPrice = 50; };
	class Exile_Item_LightBulb											{ quality = 1; price = 50; };
	class Exile_Item_MetalBoard											{ quality = 1; price = 600; };
	class Exile_Item_SafeKit											{ quality = 1; price = 10000; };
	class Exile_Item_CodeLock											{ quality = 1; price = 5000; sellPrice = 1000; };
	class Exile_Item_Laptop												{ quality = 2; price = 10000; sellPrice = 2000; };
	class Exile_Item_BaseCameraKit										{ quality = 2; price = 5000; sellPrice = 1000; };
	class Exile_Item_CamoTentKit										{ quality = 1; price = 250; };
	class Exile_Item_MetalPole											{ quality = 1; price = 800; };
	class Exile_Item_MobilePhone										{ quality = 2; price = 1000; };
	class Exile_Item_MetalScrews										{ quality = 1; price = 10; };
	class Exile_Item_Cement												{ quality = 1; price = 100; };
	class Exile_Item_Sand												{ quality = 1; price = 50; };
	//class Exile_Item_Rope												{ quality = 1; price = 100; };
	//class Exile_Item_MetalWire										{ quality = 1; price = 100; };
	//class Exile_Item_CarWheel											{ quality = 1; price = 1000; };

	///////// Tools /////////
	class Exile_Item_Matches 											{ quality = 1; price = 50; };
	class Exile_Item_CookingPot											{ quality = 1; price = 150; };
	class Exile_Melee_Axe												{ quality = 1; price = 250; };
	class Exile_Item_CanOpener											{ quality = 1; price = 150; };
	class Exile_Item_Handsaw											{ quality = 1; price = 250; };
	class Exile_Item_Pliers												{ quality = 1; price = 250; };
	class Exile_Item_Grinder											{ quality = 2; price = 2500; sellPrice = 250; };
	class Exile_Item_Knife												{ quality = 1; price = 1000; sellPrice = 100; };
	class Exile_Magazine_Battery										{ quality = 2; price = 200; };
	class Exile_Item_ZipTie												{ quality = 1; price = 100; };
	class Exile_Item_ThermalScannerPro									{ quality = 1; price = 2500; sellPrice = 250; };
	class Exile_Melee_SledgeHammer										{ quality = 1; price = 500; sellPrice = 100; };
	class Exile_Item_Foolbox											{ quality = 1; price = 1500; sellPrice = 150;};
	class Exile_Item_CordlessScrewdriver								{ quality = 1; price = 500; };
	class Exile_Item_Shovel										    	{ quality = 1; price = 500; };
	//class Exile_Item_FireExtinguisher									{ quality = 1; price = 650; };
	//class Exile_Item_Hammer											{ quality = 1; price = 600; };
	//class Exile_Item_OilCanister										{ quality = 1; price = 1750; };
	//class Exile_Item_Screwdriver										{ quality = 1; price = 250; };
	//class Exile_Item_Wrench											{ quality = 1; price = 250; };
	//class Exile_Item_SleepingMat										{ quality = 1; price = 1250; };
	//class Exile_Item_ToiletPaper										{ quality = 1; price = 5; };
	
	///////// Belt Tools /////////
	class ItemWatch														{ quality = 1; price = 50; sellPrice = 10; };	
	class ItemGPS														{ quality = 1; price = 100; sellPrice = 10; };
	class ItemMap														{ quality = 1; price = 75; sellPrice = 10; };
	class ItemCompass													{ quality = 1; price = 75; sellPrice = 10; };
	class ItemRadio														{ quality = 1; price = 75; sellPrice = 10; };
	class Binocular														{ quality = 1; price = 75; };
	class Rangefinder													{ quality = 1; price = 250; };
	class Exile_Item_XM8												{ quality = 1; price = 100; sellPrice = 10; };
	
		///////// Explosives /////////
	class HandGrenade													{ quality = 1; price = 75; };
	class MiniGrenade													{ quality = 1; price = 75; };
	class B_IR_Grenade													{ quality = 1; price = 50; };
	class O_IR_Grenade													{ quality = 1; price = 50; };
	class I_IR_Grenade													{ quality = 1; price = 50; };
	class 1Rnd_HE_Grenade_shell											{ quality = 2; price = 75; };
	class 3Rnd_HE_Grenade_shell											{ quality = 2; price = 150; };
	class APERSBoundingMine_Range_Mag									{ quality = 2; price = 500; };
	class APERSMine_Range_Mag											{ quality = 2; price = 600; };
	class APERSTripMine_Wire_Mag										{ quality = 2; price = 300; };
	class ClaymoreDirectionalMine_Remote_Mag							{ quality = 2; price = 350; };
	class DemoCharge_Remote_Mag											{ quality = 2; price = 1500; };
	class IEDLandBig_Remote_Mag											{ quality = 2; price = 1500; };
	class IEDLandSmall_Remote_Mag										{ quality = 2; price = 1000; };
	class IEDUrbanSmall_Remote_Mag										{ quality = 2; price = 1000; };
	class IEDUrbanBig_Remote_Mag										{ quality = 2; price = 1500; };
	class SatchelCharge_Remote_Mag										{ quality = 2; price = 2500; };
	class SLAMDirectionalMine_Wire_Mag									{ quality = 2; price = 700; };
	
	///////// NIArms Explosives /////////
	class 	hlc_VOG25_AK												{ quality = 1; price = 75; };
	
		///////// Exile Flags /////////
	class Exile_Item_FlagStolen1						{ quality = 1; price = 5000; sellPrice = 5000;  };
	class Exile_Item_FlagStolen2						{ quality = 1; price = 10000; sellPrice = 10000; };
	class Exile_Item_FlagStolen3						{ quality = 1; price = 15000; sellPrice = 15000; };
	class Exile_Item_FlagStolen4						{ quality = 1; price = 20000; sellPrice = 20000; };
	class Exile_Item_FlagStolen5						{ quality = 1; price = 25000; sellPrice = 25000; };
	class Exile_Item_FlagStolen6						{ quality = 1; price = 30000; sellPrice = 30000; };
	class Exile_Item_FlagStolen7						{ quality = 1; price = 35000; sellPrice = 35000; };
	class Exile_Item_FlagStolen8						{ quality = 1; price = 40000; sellPrice = 40000; };
	class Exile_Item_FlagStolen9						{ quality = 1; price = 45000; sellPrice = 45000; };
	class Exile_Item_FlagStolen10						{ quality = 1; price = 50000; sellPrice = 50000; };
	
		///////// Bikes /////////
	class Exile_Bike_OldBike 											{ quality = 1; price = 100; };
	class Exile_Bike_MountainBike 										{ quality = 1; price = 100; };
	
	///////// QuadBikes /////////
	class Exile_Bike_QuadBike_Black										{ quality = 1; price = 1000; sellPrice = 30;};
	class Exile_Bike_QuadBike_Blue										{ quality = 1; price = 1000; sellPrice = 30;};
	class Exile_Bike_QuadBike_Red										{ quality = 1; price = 1000; sellPrice = 30;};
	class Exile_Bike_QuadBike_White										{ quality = 1; price = 1000; sellPrice = 30;};
	class Exile_Bike_QuadBike_Nato										{ quality = 1; price = 1000; sellPrice = 30;};
	class Exile_Bike_QuadBike_Csat										{ quality = 1; price = 1000; sellPrice = 30;};
	class Exile_Bike_QuadBike_Fia										{ quality = 1; price = 1000; sellPrice = 30;};
	class Exile_Bike_QuadBike_Guerilla01								{ quality = 1; price = 1000; sellPrice = 30;};
	class Exile_Bike_QuadBike_Guerilla02								{ quality = 1; price = 1000; sellPrice = 30;};

	///////// Karts /////////
	class Exile_Car_Kart_BluKing										{ quality = 1; price = 650; };
	class Exile_Car_Kart_RedStone										{ quality = 1; price = 650; };
	class Exile_Car_Kart_Vrana											{ quality = 1; price = 650; };
	class Exile_Car_Kart_Green											{ quality = 1; price = 650; };
	class Exile_Car_Kart_Blue											{ quality = 1; price = 650; };
	class Exile_Car_Kart_Orange											{ quality = 1; price = 650; };
	class Exile_Car_Kart_White											{ quality = 1; price = 650; };
	class Exile_Car_Kart_Yellow											{ quality = 1; price = 650; };
	class Exile_Car_Kart_Black											{ quality = 1; price = 650; };

	///////// Boats /////////
	class Exile_Boat_MotorBoat_Police									{ quality = 1; price = 3500; };
	class Exile_Boat_MotorBoat_Orange									{ quality = 1; price = 3500; };
	class Exile_Boat_MotorBoat_White									{ quality = 1; price = 3500; };
	class Exile_Boat_RubberDuck_CSAT									{ quality = 1; price = 650; };
	class Exile_Boat_RubberDuck_Digital									{ quality = 1; price = 650; };
	class Exile_Boat_RubberDuck_Orange									{ quality = 1; price = 650; };
	class Exile_Boat_RubberDuck_Blue									{ quality = 1; price = 650; };
	class Exile_Boat_RubberDuck_Black									{ quality = 1; price = 650; };
	class Exile_Boat_RHIB												{ quality = 1; price = 2500; };
	class C_Boat_Transport_02_F											{ quality = 1; price = 2500; };
	class Exile_Boat_WaterScooter										{ quality = 1; price = 1000; };
	
	///////// Submarines /////////
	class Exile_Boat_SDV_CSAT											{ quality = 2; price = 7500; };
	class Exile_Boat_SDV_Digital										{ quality = 2; price = 7500; };
	class Exile_Boat_SDV_Grey											{ quality = 2; price = 7500; };
	
	///////// Armed Boats /////////
	class O_T_Boat_Armed_01_hmg_F										{ quality = 3; price = 12500; };
	class B_T_Boat_Armed_01_minigun_F									{ quality = 3; price = 15000; };

	///////// Civillian Helicopters /////////
	class Exile_Chopper_Hummingbird_Civillian_Blue						{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Red						{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_ION						{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_BlueLine					{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Digital					{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Elliptical				{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Furious					{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_GrayWatcher				{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Jeans						{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Light						{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Shadow					{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Sheriff					{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Speedy					{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Sunset					{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Vrana						{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Wasp						{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Wave						{ quality = 1; price = 6000; };
	class I_C_Heli_Light_01_civil_F										{ quality = 1; price = 6000; };
	
	///////// Military Helicopters /////////
	class Exile_Chopper_Hummingbird_Green								{ quality = 1; price = 7500; };
	class Exile_Chopper_Huey_Green 										{ quality = 2; price = 17000; };
	class Exile_Chopper_Huey_Desert										{ quality = 2; price = 17000; };
	class Exile_Chopper_Hellcat_Green									{ quality = 2; price = 27500; };
	class Exile_Chopper_Hellcat_FIA										{ quality = 2; price = 27500; };
	class Exile_Chopper_Huron_Black										{ quality = 2; price = 30000; };
	class Exile_Chopper_Huron_Green										{ quality = 2; price = 30000; };
	class Exile_Chopper_Mohawk_FIA										{ quality = 2; price = 20000; };
	class Exile_Chopper_Orca_CSAT										{ quality = 2; price = 12500; };
	class Exile_Chopper_Orca_Black										{ quality = 2; price = 12500; };
	class Exile_Chopper_Orca_BlackCustom								{ quality = 2; price = 12500; };
	class Exile_Chopper_Taru_Transport_CSAT								{ quality = 2; price = 12500; };
	class Exile_Chopper_Taru_Transport_Black							{ quality = 2; price = 12500; };
	class Exile_Chopper_Taru_CSAT										{ quality = 2; price = 12500; };
	class Exile_Chopper_Taru_Black										{ quality = 2; price = 12500; };
	class Exile_Chopper_Taru_Covered_CSAT								{ quality = 2; price = 12500; };
	class Exile_Chopper_Taru_Covered_Black								{ quality = 2; price = 12500; };
	
	///////// Military Helicopters Armed /////////
	class Exile_Chopper_Huey_Armed_Green								{ quality = 3; price = 25000; };
	class Exile_Chopper_Huey_Armed_Desert								{ quality = 3; price = 25000; };
	class B_Heli_Transport_01_F											{ quality = 4; price = 125000; };
	class B_Heli_Transport_01_camo_F									{ quality = 4; price = 125000; };
	class B_CTRG_Heli_Transport_01_sand_F								{ quality = 4; price = 125000; };
	class B_CTRG_Heli_Transport_01_tropic_F								{ quality = 4; price = 125000; };
	class B_Heli_Light_01_armed_F										{ quality = 4; price = 150000; };
	class B_Heli_Transport_03_F											{ quality = 4; price = 150000; };
	class B_Heli_Transport_03_black_F									{ quality = 4; price = 150000; };
	
	///////// Planes /////////
	class Exile_Plane_Cessna											{ quality = 2; price = 7500; };
	class Exile_Plane_AN2_Green											{ quality = 2; price = 15000; };
	class Exile_Plane_AN2_White											{ quality = 2; price = 15000; };
	class Exile_Plane_AN2_Stripe										{ quality = 2; price = 15000; };
	class Exile_Plane_Ceasar											{ quality = 2; price = 15000; }; 
	
	///////// Military Planes /////////
	class Exile_Plane_BlackfishInfantry									{ quality = 3; price = 45000; };
	class Exile_Plane_BlackfishVehicle									{ quality = 3; price = 45000; };
	
	///////// Military /////////
	class Exile_Car_Ifrit 												{ quality = 2; price = 20000; };
	class Exile_Car_Hunter 												{ quality = 2; price = 25000; };
	class Exile_Car_Strider 											{ quality = 2; price = 30000; };
	class Exile_Car_UAZ_Green											{ quality = 2; price = 7500; };
	class Exile_Car_UAZ_Open_Green										{ quality = 2; price = 7500; };
	class Exile_Car_QilinUnarmed										{ quality = 2; price = 10000; };
	class Exile_Car_ProwlerLight										{ quality = 2; price = 10000; };
	class Exile_Car_ProwlerUnarmed										{ quality = 2; price = 10000; };
	class Exile_Car_BTR40_Green											{ quality = 2; price = 15000; };
	class Exile_Car_BTR40_Camo											{ quality = 2; price = 15000; };
	class Exile_Car_HMMWV_UNA_Green										{ quality = 2; price = 15000; };
	class Exile_Car_HMMWV_UNA_Desert									{ quality = 2; price = 15000; };
	
	///////// Military Transport /////////
	class Exile_Car_Ural_Open_Military									{ quality = 1; price = 6000; };
	class Exile_Car_Ural_Covered_Military								{ quality = 1; price = 6000; };
	class Exile_Car_HEMMT 												{ quality = 1; price = 12000; };	
	class Exile_Car_Zamak 												{ quality = 1; price = 8000; };	
	class Exile_Car_Tempest 											{ quality = 1; price = 10000; };
	
	///////// Military Armed /////////
	class O_LSV_02_armed_F												{ quality = 3; price = 25000; };
	class B_LSV_01_armed_F												{ quality = 3; price = 25000; };
	class B_T_LSV_01_armed_F											{ quality = 3; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla01 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla02 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla03 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla04 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla05 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla06 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla07 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla08 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla09 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla10 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla11 							{ quality = 2; price = 12500; };
	class Exile_Car_Offroad_Armed_Guerilla12 							{ quality = 2; price = 12500; };
	class Exile_Car_HMMWV_M2_Green 										{ quality = 3; price = 30000; };
	class Exile_Car_HMMWV_M2_Desert 									{ quality = 3; price = 30000; };
	class Exile_Car_HMMWV_M134_Green 									{ quality = 3; price = 35000; };
	class Exile_Car_HMMWV_M134_Desert 									{ quality = 3; price = 35000; };
	class Exile_Car_BTR40_MG_Green										{ quality = 3; price = 40000; };
	class Exile_Car_BTR40_MG_Camo										{ quality = 3; price = 40000; };
	class Exile_Car_SUV_Armed_Black										{ quality = 3; price = 45000; };
	class Exile_Car_BRDM2_HQ											{ quality = 3; price = 40000; };

	///////// Military Medical /////////
	class B_Truck_01_medical_F											{ quality = 1; price = 10000; };
	class Exile_Car_LandRover_Ambulance_Green							{ quality = 2; price = 12000; };
	class Exile_Car_LandRover_Ambulance_Desert							{ quality = 2; price = 12000; };
	class Exile_Car_LandRover_Ambulance_Sand							{ quality = 2; price = 12000; };
	class Exile_Car_HMMWV_MEV_Green										{ quality = 2; price = 15000; };
	class Exile_Car_HMMWV_MEV_Desert									{ quality = 2; price = 15000; };	
	
	///////// Civillian /////////
	class Exile_Car_Golf_Red											{ quality = 1; price = 4000; };
	class Exile_Car_Golf_Black											{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_Beige										{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Green										{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Blue										{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_BlueCustom								{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_BeigeCustom								{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Yellow									{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Grey										{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Black										{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Dark										{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Rusty1									{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Rusty2									{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Rusty3									{ quality = 1; price = 6000; };
	class Exile_Car_SUVXL_Black 										{ quality = 1; price = 7500; };
	class Exile_Car_Octavius_White										{ quality = 1; price = 6000; };
	class Exile_Car_Octavius_Black										{ quality = 1; price = 6000; };	
	class Exile_Car_LandRover_Red 										{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Urban 									{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Green 									{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Sand 										{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Desert 									{ quality = 1; price = 11000; };
	class Exile_Car_Lada_Green 											{ quality = 1; price = 3000; };
	class Exile_Car_Lada_Taxi 											{ quality = 1; price = 3000; };
	class Exile_Car_Lada_Red 											{ quality = 1; price = 3000; };
	class Exile_Car_Lada_White 											{ quality = 1; price = 3000; };
	class Exile_Car_Lada_Hipster 										{ quality = 1; price = 3000; };
	class Exile_Car_Volha_Blue											{ quality = 1; price = 3000; };
	class Exile_Car_Volha_White											{ quality = 1; price = 3000; };
	class Exile_Car_Volha_Black											{ quality = 1; price = 3000; };
	class Exile_Car_Hatchback_Sport_Red									{ quality = 1; price = 10000; };
	class Exile_Car_Hatchback_Sport_Blue								{ quality = 1; price = 10000; };
	class Exile_Car_Hatchback_Sport_Orange								{ quality = 1; price = 10000; };
	class Exile_Car_Hatchback_Sport_White								{ quality = 1; price = 10000; };
	class Exile_Car_Hatchback_Sport_Beige								{ quality = 1; price = 10000; };
	class Exile_Car_Hatchback_Sport_Green								{ quality = 1; price = 10000; };
	class Exile_Car_Offroad_Red											{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Beige										{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_White										{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Blue										{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_DarkRed										{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_BlueCustom									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla01									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla02									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla03									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla04									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla05									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla06									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla07									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla08									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla09									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla10									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla11									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Guerilla12									{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Rusty1										{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Rusty2										{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Rusty3										{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Repair_Civillian 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Red 									{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Beige 								{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_White 								{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Blue 								{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_DarkRed 								{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_BlueCustom 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla01 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla02 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla03 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla04 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla05 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla06 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla07 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla08 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla09 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla10 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla11 							{ quality = 1; price = 7000; };
	class Exile_Car_Offroad_Repair_Guerilla12 							{ quality = 1; price = 7000; };
	class Exile_Car_SUV_Red 											{ quality = 1; price = 4000; };
	class Exile_Car_SUV_Black 											{ quality = 1; price = 4000; };
	class Exile_Car_SUV_Grey 											{ quality = 1; price = 4000; };
	class Exile_Car_SUV_Orange 											{ quality = 1; price = 4000; };
	class Exile_Car_SUV_Rusty1 											{ quality = 1; price = 4000; };
	class Exile_Car_SUV_Rusty2 											{ quality = 1; price = 4000; };
	class Exile_Car_SUV_Rusty3 											{ quality = 1; price = 4000; };
	class Exile_Car_MB4WDOpen 											{ quality = 1; price = 6000; };
	class Exile_Car_MB4WD												{ quality = 1; price = 6000; };
	
	///////// Civillian Transport /////////
	class Exile_Car_Van_Black 											{ quality = 1; price = 6000; };
	class Exile_Car_Van_White 											{ quality = 1; price = 6000; };
	class Exile_Car_Van_Red 											{ quality = 1; price = 6000; };
	class Exile_Car_Van_Guerilla01 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Guerilla02 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Guerilla03 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Guerilla04 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Guerilla05 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Guerilla06 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Guerilla07 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Guerilla08 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_Black 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_White 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_Red 										{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_Guerilla01 									{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_Guerilla02 									{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_Guerilla03 									{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_Guerilla04 									{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_Guerilla05 									{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_Guerilla06 									{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_Guerilla07 									{ quality = 3; price = 6000; };
	class Exile_Car_Van_Box_Guerilla08 									{ quality = 3; price = 6000; };
	class Exile_Car_Van_Fuel_Black 										{ quality = 1; price = 6000; };
	class Exile_Car_Van_Fuel_White 										{ quality = 1; price = 6000; };
	class Exile_Car_Van_Fuel_Red 										{ quality = 1; price = 6000; };
	class Exile_Car_Van_Fuel_Guerilla01 								{ quality = 1; price = 6000; };
	class Exile_Car_Van_Fuel_Guerilla02 								{ quality = 1; price = 6000; };
	class Exile_Car_Van_Fuel_Guerilla03 								{ quality = 1; price = 6000; };
	class Exile_Car_Ural_Open_Blue										{ quality = 1; price = 6000; };
	class Exile_Car_Ural_Open_Yellow									{ quality = 1; price = 6000; };
	class Exile_Car_Ural_Open_Worker									{ quality = 1; price = 6000; };
	class Exile_Car_Ural_Covered_Blue									{ quality = 1; price = 6000; };
	class Exile_Car_Ural_Covered_Yellow									{ quality = 1; price = 6000; };
	class Exile_Car_Ural_Covered_Worker									{ quality = 1; price = 6000; };
	class Exile_Car_V3S_Covered											{ quality = 1; price = 6000; };
	class Exile_Car_V3S_Open											{ quality = 1; price = 6000; };
	
	///////// Ikarus /////////
	class Exile_Car_Ikarus_Blue 										{ quality = 1; price = 7000; };
	class Exile_Car_Ikarus_Red 											{ quality = 1; price = 7000; };
	class Exile_Car_Ikarus_Party 										{ quality = 1; price = 7500; };
	
	///////// Tractors /////////
	class Exile_Car_Tractor_Red 										{ quality = 1; price = 2000; };
	class Exile_Car_OldTractor_Red 										{ quality = 1; price = 1200; };
	class Exile_Car_TowTractor_White									{ quality = 1; price = 1800; };
};
class CfgExileCustomCode 
{
	ExileClient_gui_xm8_slide = 														"GG\custom\ExileClient_gui_xm8_slide.sqf";
	ExileClient_gui_xm8_show = 															"GG\custom\ExileClient_gui_xm8_show.sqf";
	ExileClient_construction_handleAbort = 												"GG\custom\ExileClient_construction_handleAbort.sqf";
	ExileClient_object_item_construct = 												"GG\custom\ExileClient_object_item_construct.sqf";
	ExileClient_construction_thread = 													"GG\custom\ExileClient_construction_thread.sqf";
	ExileClient_gui_selectSpawnLocation_show = 											"GG\custom\ExileClient_gui_selectSpawnLocation_show.sqf";
    ExileClient_object_player_event_onEnterSafezone =       							"GG\custom\ExileClient_object_player_event_onEnterSafezone.sqf"; 
    ExileClient_object_player_event_onLeaveSafezone =       							"GG\custom\ExileClient_object_player_event_onLeaveSafezone.sqf";
    ExileClient_gui_wasteDumpDialog_show =                  							"GG\custom\ExileClient_gui_wasteDumpDialog_show.sqf";
    ExileClient_object_player_event_onInventoryOpened =     							"GG\custom\ExileClient_object_player_event_onInventoryOpened.sqf";
    ExileClient_gui_lockerDialog_show =													"GG\custom\ExileClient_gui_lockerDialog_show.sqf";
    ExileClient_system_locker_network_lockerResponse =									"GG\custom\ExileClient_system_locker_network_lockerResponse.sqf";
    ExileClient_gui_upgradeTerritoryDialog_event_onTerritoryDropDownSelectionChanged = 	"GG\custom\ExileClient_gui_upgradeTerritoryDialog_event_onTerritoryDropDownSelectionChanged.sqf";
    ExileClient_gui_xm8_showPartySlides =                                               "GG\custom\ExileClient_gui_xm8_showPartySlides.sqf";
    ExileServer_object_player_createBambi =                                             "GG\custom\ExileServer_object_player_createBambi.sqf";
    ExileServer_object_player_database_load =                                           "GG\custom\ExileServer_object_player_database_load.sqf";
    ExileServer_object_player_event_onMpKilled =                                        "GG\custom\ExileServer_object_player_event_onMpKilled.sqf";
    ExileServer_system_network_event_onPlayerConnected =                                "GG\custom\ExileServer_system_network_event_onPlayerConnected.sqf";
};

class CfgExileEnvironment
{
	class Altis 
	{
		class FireFlies
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// At this hour fire flies begin to spawn
			startHour = 18;

			// At this hour fire flies stop spawning
			endHour = 5;
		};

		class Anomalies
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// At this hour anomalies begin to spawn
			startHour = 19;

			// At this hour anomalies stop spawning
			endHour = 6;
		};

		class Breathing
		{
			// 1 = enabled, 0 = disabled
			enable = 0;
		};

		class Snow
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// https://community.bistudio.com/wiki/surfaceType
			surfaces[] = {};
		};

		class Radiation 
		{
			// 1 = enabled, 0 = disabled
			enable = 1;
		};

		class Temperature
		{
			// Temperature in °C for the time of day, per hour
			// Add the first index to the last index, so it is 25 indizes!
			daytimeTemperature[] = {15.93,16.89,18.42,20.40,22.68,25.10,27.48,29.63,31.40,32.66,33.32,33.80,33.80,33.32,32.66,31.40,29.63,27.48,25.10,22.68,20.40,18.42,16.89,15.93,15.93};
		
			// Temperature change in °C when it is 100% overcast
			overcast = -2;

			// Temperature change in °C when it is 100% raining
			rain = -5;

			// Temperature change in °C when it is 100% windy
			wind = -1;

			// Temperature change per 100m altitude in °C
			altitude = -0.5;

			// Difference from the daytime temperature to the water temperature
			water = -5;
		};
	};

	class Tanoa: Altis
	{
		class FireFlies: FireFlies
		{
			enable = 1;
		};

		class Anomalies: Anomalies
		{
			enable = 1;
		};

		class Breathing: Breathing
		{
			enable = 0;
		};

		class Snow: Snow
		{
			enable = 0;
		};

		class Radiation: Radiation
		{
			enable = 1;
		};

		class Temperature: Temperature
		{
			daytimeTemperature[] = {15.93,16.89,18.42,20.40,22.68,25.10,27.48,29.63,31.40,32.66,33.32,33.80,33.80,33.32,32.66,31.40,29.63,27.48,25.10,22.68,20.40,18.42,16.89,15.93,15.93};
		};
	};
};
class CfgExileHUD
{
	class ShortItemNames
	{
		SmokeShell[] 						= {"WHITE", 	"SMOKE"};
		1Rnd_Smoke_Grenade_shell[] 			= {"WHITE", 	"SMOKE"};
		3Rnd_Smoke_Grenade_shell[] 			= {"WHITE", 	"SMOKE"};

		SmokeShellBlue[] 					= {"BLUE", 		"SMOKE"};
		1Rnd_SmokeBlue_Grenade_shell[] 		= {"BLUE", 		"SMOKE"};
		3Rnd_SmokeBlue_Grenade_shell[] 		= {"BLUE", 		"SMOKE"};

		SmokeShellGreen[] 					= {"GREEN", 	"SMOKE"};
		1Rnd_SmokeGreen_Grenade_shell[] 	= {"GREEN", 	"SMOKE"};
		3Rnd_SmokeGreen_Grenade_shell[] 	= {"GREEN", 	"SMOKE"};

		SmokeShellOrange[] 					= {"ORANGE", 	"SMOKE"};
		1Rnd_SmokeOrange_Grenade_shell[]	= {"ORANGE", 	"SMOKE"};
		3Rnd_SmokeOrange_Grenade_shell[] 	= {"ORANGE", 	"SMOKE"};

		SmokeShellPurple[] 					= {"PURPLE", 	"SMOKE"};
		1Rnd_SmokePurple_Grenade_shell[] 	= {"PURPLE", 	"SMOKE"};
		3Rnd_SmokePurple_Grenade_shell[] 	= {"PURPLE", 	"SMOKE"};

		SmokeShellRed[] 					= {"RED", 		"SMOKE"};
		1Rnd_SmokeRed_Grenade_shell[] 		= {"RED", 		"SMOKE"};
		3Rnd_SmokeRed_Grenade_shell[] 		= {"RED", 		"SMOKE"};
				
		SmokeShellYellow[] 					= {"YELLOW", 	"SMOKE"};
		1Rnd_SmokeYellow_Grenade_shell[] 	= {"YELLOW", 	"SMOKE"};
		3Rnd_SmokeYellow_Grenade_shell[] 	= {"YELLOW", 	"SMOKE"};
				
		UGL_FlareCIR_F[] 					= {"IR", 		"FLARE"};
		3Rnd_UGL_FlareCIR_F[] 				= {"IR", 		"FLARE"};

		UGL_FlareGreen_F[] 					= {"GREEN", 	"FLARE"};
		3Rnd_UGL_FlareGreen_F[] 			= {"GREEN", 	"FLARE"};

		UGL_FlareRed_F[] 					= {"RED", 		"FLARE"};
		3Rnd_UGL_FlareRed_F[] 				= {"RED", 		"FLARE"};

		UGL_FlareWhite_F[] 					= {"WHITE", 	"FLARE"};
		3Rnd_UGL_FlareWhite_F[] 			= {"WHITE", 	"FLARE"};

		UGL_FlareYellow_F[] 				= {"YELLOW", 	"FLARE"};
		3Rnd_UGL_FlareYellow_F[] 			= {"YELLOW", 	"FLARE"};

		Chemlight_blue[] 					= {"BLUE", 		"LIGHT"};
		Chemlight_green[] 					= {"GREEN", 	"LIGHT"};
		Chemlight_red[] 					= {"RED", 		"LIGHT"};
		Chemlight_yellow[] 					= {"YELLOW", 	"LIGHT"};

		1Rnd_HE_Grenade_shell[] 			= {"40MM"};
		3Rnd_HE_Grenade_shell[] 			= {"40MM"};

		O_IR_Grenade[] 						= {"IR"};
		I_IR_Grenade[] 						= {"IR"};
		B_IR_Grenade[] 						= {"IR"};

		HandGrenade[] 						= {"RGO"};
		MiniGrenade[] 						= {"RGN"};

		Exile_Item_ZipTie[]					= {"ZIP", "TIE"};
	};
};
class CfgExileLootSettings
{
	/**
	 * Lifetime of loot in minutes. Synchronize this with
	 * the garbage collector settings of your server
	 * CfgSettings!
	 */
	lifeTime = 8;

	/**
	 * Interval in seconds when the client searches for
	 * new buildings to spawn loot in
	 */
	spawnInterval = 30;

	/**
	 * This is a percentage value to determine how many loot
	 * positions should contain loot when the system spawns loot.
	 *
	 * If a building has 20 positions defined, Exile will 
	 * spawn loot in 10 random positions of them.
	 * 
	 * This means smaller buildings spawn less loot and larger
	 * ones spawn more loot.
	 *
	 * You can also cap it at a maximum value. See below.
	 */
	maximumPositionCoverage = 30;

 	/**
 	 * Limit the number of loot positions per building. If the 
 	 * above percentage value exceeds this value, it will be capped.
 	 *
 	 * Example: Coverage is 50%. Building has 60 loot positions defined.
 	 * This results in 30 loot positions and that is too much. So we
 	 * cap this at 10
 	 */
	maximumNumberOfLootSpotsPerBuilding = 3;

	/**
	 * Exile spawns a random number of items per loot spot. This 
	 * is the upper cap for that. So 3 means it could spawn 1, 2 
	 * or 3.
	 */
	maximumNumberOfItemsPerLootSpot = 2;

	/**
	 * Radius in meter to spawn loot AROUND each player.
	 * Do NOT touch this value if you dont know what you do.
	 * The higher the number, the higher the drop rates, the
	 * easier your server will lag.
	 *
	 * 50m  = Minimum
	 * 200m = Maximum
	 */
	spawnRadius = 120;

	/**
	 * Defines the radius around trader cities where the system should
	 * not spawn loot. Set this to 0 if you want to have loot spawning
	 * in trader citites, ugh.
	 */
	minimumDistanceToTraderZones = 500;

	/**
	 * Defines the radius around territories where no loot spawns.
	 * This does not regard the actual size of a territory. So do not
	 * set this to a lower value than the maximum radius of a territory,
	 * which is 150m by default.
	 */
	minimumDistanceToTerritories = 150;
};
class CfgExileMobileXM8
{
	/**
	 * Add the 4 digit permission code here, so players can authorize
	 * your server to send them messages to their Mobile XM8 app.
	 */
	code = "3XYL";
};
class CfgExileMusic
{
	Ambient[] = {"ExileTrack03","ExileTrack04"};
	Combat[] = {"ExileTrack06","ExileTrack07"};
	Intro[] = {"ExileTrack02","ExileTrack03"};
};
class CfgExileParty 
{
	showESP = 1;
	allow3DMarkers = 1;
};
class CfgExileRussianRoulette
{
	/*
		Minimum amount to join a session of 
		russian roulette
	*/
	buyInAmount = 100;
};
class CfgFlags 
{
	class USA
	{
		name = "USA";
		texture = "\A3\Data_F\Flags\flag_us_co.paa";
		uids[] = {};
	};
};
class ExileAbstractAction
{
	title = "";
	condition = "true";
	action = "";
	priority = 1.5;
	showWindow = false;
};
class CfgInteractionMenus
{
	class Car 
	{
		targetType = 2;
		target = "Car";

		class Actions 
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !ExilePlayerInSafezone && ((locked ExileClientInteractionObject) != 1)";
				action = "_this call ExileClient_object_lock_scan";
			};

			// Locks a vehicle
			class Lock: ExileAbstractAction
			{
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			// Unlocks a vehicle
			class Unlock: ExileAbstractAction
			{
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			// Repairs a vehicle to 100%. Requires Duckttape
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "true";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Flips a vehicle so the player doesnt have to call an admin
			// Check if vector up is fucked
			class Flip: ExileAbstractAction
			{
				title = "Flip";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_flip";
			};

			// Fills fuel from a can into a car
			class Refuel: ExileAbstractAction
			{
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};

			// Drains fuel from a car into an empty jerry can
			class DrainFuel: ExileAbstractAction
			{
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};
			class PackDeployedVehicle: ExileAbstractAction
			{
				title = "Pack Vehicle";
				condition = "call ExAd_XM8_DV_fnc_canPack";
				action = "call ExAd_XM8_DV_fnc_pack";
			};
		};
	};

	class Air
	{
		target = "Air";
		targetType = 2;

		class Actions
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && ((locked ExileClientInteractionObject) != 1) && !ExilePlayerInSafezone";
				action = "_this call ExileClient_object_lock_scan";
			};

			// Locks a vehicle
			class Lock: ExileAbstractAction
			{
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			// Unlocks a vehicle
			class Unlock: ExileAbstractAction
			{
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Repairs a vehicle to 100%. Requires Duckttape
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "true";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Flips a vehicle so the player doesnt have to call an admin
			// Check if vector up is fucked
			class Flip: ExileAbstractAction
			{
				title = "Flip";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_flip";
			};

			// Fills fuel from a can into a car
			class Refuel: ExileAbstractAction
			{
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};

			// Drains fuel from a car into an empty jerry can
			class DrainFuel: ExileAbstractAction
			{
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};

			class RotateLeft: ExileAbstractAction
			{
				title = "Rotate Left";	
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "[ExileClientInteractionObject,-15] call ExileClient_object_vehicle_rotate";
			};

			class RotateRight: ExileAbstractAction
			{
				title = "Rotate Right";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "[ExileClientInteractionObject,15] call ExileClient_object_vehicle_rotate";
			};
		};
	};

	class Safe
	{
		targetType = 2;
		target = "Exile_Container_Safe";

		class Actions 
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 1) && !ExilePlayerInSafezone";
				action = "_this call ExileClient_object_lock_scan";
			};

			// Locks a vehicle
			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			class Pack : ExileAbstractAction
			{
				title = "Pack";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_container_pack";
			};

			class SetPinCode : ExileAbstractAction
			{
				title = "Set PIN";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_lock_setPin";
			};
			class HackSafe : ExileAbstractAction
			{
				title = "Hack Safe";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "_this spawn ExAd_fnc_startHack";
			};
		};
	};
	class ATM
    {
        targetType = 2;
        target = "Land_Atm_01_F";
        class Actions
        {
            class Locker: ExileAbstractAction
            {
                title = "ATM";
                condition = "true";
                action = "_this call ExileClient_gui_lockerDialog_show";
            };
        };
    };
	class Laptop
	{
		targetType = 2;
		target = "Exile_Construction_Laptop_Static";

		class Actions
		{
			class CameraSystem: ExileAbstractAction
			{
				title = "CCTV Access";
				condition = "((ExileClientInteractionObject animationPhase 'LaptopLidRotation') >= 0.5)";
				action = "_this call ExileClient_gui_baseCamera_show";
			};
			class StopHack: ExileAbstractAction
			{
				title = "Interupt Hack";
				condition = "((([ExileClientInteractionObject, getPlayerUID player] call ExileClient_util_territory_getAccessLevel) select 0) < ExAd_VG_ACCESS_LEVEL)";
				action = "_this spawn ExAd_fnc_stopHack";
			};
		};
	};

	class SupplyBox
	{
		targetType = 2;
		target = "Exile_Container_SupplyBox";

		class Actions
		{
			class Mount: ExileAbstractAction
			{
				title = "Mount";
				condition = "(isNull (attachedTo ExileClientInteractionObject)) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_mount";
			};

			class Install: ExileAbstractAction
			{
				title = "Install";
				condition = "isNull (attachedTo ExileClientInteractionObject) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_install";
			};

			class Unmount: ExileAbstractAction
			{
				title = "Unmount";
				condition = "!(isNull (attachedTo ExileClientInteractionObject)) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_unmount";
			};
		};
	};

	class Construction
	{
		targetType = 2;
		target = "Exile_Construction_Abstract_Static";

		class Actions 
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_lock_scan";
			};

			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			// Picks up the construction so you can move it
			class Move: ExileAbstractAction
			{
				title = "Move";
				condition = "call ExileClient_util_world_isInOwnTerritory";
				action = "_this spawn ExileClient_object_construction_move";
			};

			// Removes the construction.
			class Deconstruct: ExileAbstractAction
			{
				title = "Remove";
				condition = "call ExileClient_util_world_isInOwnTerritory";
				action = "_this spawn ExileClient_object_construction_deconstruct";
			};

			class AddALock : ExileAbstractAction
			{
				title = "Add a Lock";
				condition = "call ExileClient_object_construction_lockAddShow";
				action = "_this spawn ExileClient_object_construction_lockAdd";
			};

			class Upgrade : ExileAbstractAction
			{
				title = "Upgrade";
				condition = "call ExileClient_object_construction_upgradeShow";
				action = "_this call ExileClient_object_construction_upgrade";
			};

			class MakeBoom : ExileAbstractAction
			{
				title = "Plant charge";
				condition = "call ExileClient_system_breaching_condition";
				action = "_this call ExileClient_system_breaching_action";
			};

			class Repair : ExileAbstractAction
			{
				title = "Repair";
				condition = "(!((ExileClientInteractionObject getVariable ['ExileConstructionDamage',0]) isEqualTo 0)) && (call ExileClient_util_world_isInOwnTerritory)";
				action = "_this call ExileClient_object_construction_repair";
			};
		};
	};

	/*
		Tent, Storage crate etc.
	*/
	class Container
	{
		targetType = 2;
		target = "Exile_Container_Abstract";

		class Actions 
		{
			class Pack 
			{
				title = "Pack";
				condition = "!((typeOf ExileClientInteractionObject) isEqualTo 'Exile_Container_SupplyBox')";
				action = "_this spawn ExileClient_object_container_pack";
			};
			// Picks up the container so you can move it
			class Move: ExileAbstractAction
			{
				title = "Move";
				condition = "(getNumber(configFile >> 'CfgVehicles' >> typeOf ExileClientInteractionObject >> 'exileIsLockable') isEqualTo 0) || ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_construction_move";
			};
		};
	};

	class Flag
	{
		targetType = 2;
		target = "Exile_Construction_Flag_Static";

		class Actions
		{
			class StealFlag: ExileAbstractAction
			{
				title = "Steal Flag";
				condition = "((ExileClientInteractionObject getvariable ['ExileFlagStolen',1]) isEqualTo 0)";
				action = "['StealFlag', _this select 0] call ExileClient_action_execute";
			};
			
			class RestoreFlag: ExileAbstractAction
			{
				title = "Restore Flag";
				condition = "((ExileClientInteractionObject getvariable ['ExileFlagStolen',0]) isEqualTo 1)";
				action = "['restoreFlagRequest', [netID ExileClientInteractionObject]] call ExileClient_system_network_send";
			};
			class HackVG : ExileAbstractAction
			{
				title = "Hack Virtual Garage";
				condition = "((([ExileClientInteractionObject, getPlayerUID player] call ExileClient_util_territory_getAccessLevel) select 0) < ExAd_VG_ACCESS_LEVEL))";
				action = "_this spawn ExAd_fnc_startHack";
			};
		};
	};

	class Boat 
	{
		targetType = 2;
		target = "Ship";

		class Actions
		{
			// Locks a vehicle
			class Lock: ExileAbstractAction
			{
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			// Unlocks a vehicle
			class Unlock: ExileAbstractAction
			{
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Repairs a vehicle to 100%. Requires Duckttape
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "true";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Fills fuel from a can into a car
			class Refuel: ExileAbstractAction
			{
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};

			// Drains fuel from a car into an empty jerry can
			class DrainFuel: ExileAbstractAction
			{
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};

			// Pushes a boat into look direction to move into water
			class Push: ExileAbstractAction
			{
				title = "Fus Ro Dah!";
				condition = "((crew ExileClientInteractionObject) isEqualTo [])";
				action = "_this call ExileClient_object_vehicle_push";
			};
		};
	};

	class Bikes
	{
		targetType = 2;
		target = "Bicycle";

		class Actions
		{
			class Flip: ExileAbstractAction
			{
				title = "Flip";
				condition = "true";
				action = "_this call ExileClient_object_vehicle_flip";
			};
			class PackDeployedVehicle: ExileAbstractAction
			{
				title = "Pack Bike";
				condition = "call ExAd_XM8_DV_fnc_canPack";
				action = "call ExAd_XM8_DV_fnc_pack";
			};
		};
	};

	class Player 
	{
		targetType = 2;
		target = "Exile_Unit_Player";

		class Actions 
		{
			class Free: ExileAbstractAction
			{
				title = "Free";
				condition = "(alive ExileClientInteractionObject) && (ExileClientInteractionObject getVariable ['ExileIsHandcuffed', false]) && !ExileClientIsHandcuffed";
				action = "_this call ExileClient_object_handcuffs_free";
			};
			
			class Search: ExileAbstractAction
			{
				title = "Search Gear";
				condition = "(alive ExileClientInteractionObject) && (ExileClientInteractionObject getVariable ['ExileIsHandcuffed', false]) && !ExileClientIsHandcuffed";
				action = "_this call ExileClient_object_handcuffs_searchGear";
			};

			class Identify: ExileAbstractAction
			{
				title = "Identify Body";
				condition = "!(alive ExileClientInteractionObject)";
				action = "_this call ExileClient_object_player_identifyBody";
			};
			
			class HideCorpse: ExileAbstractAction
			{
				title = "Hide Body";
				condition = "!(alive ExileClientInteractionObject) && ('Exile_Melee_Shovel' isEqualTo (currentWeapon player))";
				action = "['HideBody', (_this select 0)] call ExileClient_action_execute";
			};
		};
	};
	class Bounties
	{
	    targetType = 2;
	    target = "Exile_Trader_Office";

	    class Actions
	    {
	        class MostWanted: ExileAbstractAction
	        {
	            title = "Bounties";
	            condition = "true";
	            action = "createDialog 'MostWantedDialog';";
	        };
	    };
	};
};
class CfgInteractionModels
{
	class WaterSource
	{
		name = "Water tanks, barrels, coolers or pumps";
		models[] = 	
		{
			"barrelwater_f", 
			"barrelwater_grey_f",
			"waterbarrel_f",
			"watertank_f",
			"stallwater_f",
			"waterpump_01_f",
			"water_source_f",

			// Namalsk
			"wellpump",
			"Land_jhad_stand_water",
			"Land_Jbad_Misc_Well_L",
			"Land_jbad_Fridge",
			"Land_jbad_reservoir",
			"Land_jbad_teapot",
			"Land_KBud",
			
			//Tanoa
			"watertank_01_f",
			"watertank_02_f",
			"watertank_03_f",
			"watertank_04_f"
		};
	};

	class CleanWaterSource
	{
		name = "Water cooler";
		models[] = 	
		{
			"watercooler"
		};
	};

	class WorkBench
	{
		name = "Work Bench";
		models[] = 
		{
			"workstand_f.p3d"
		};
	};

	class ShippingContainerSource
	{
		name = "Shipping Containers";
		models[] = 
		{
			// Arma 3
			"CargoBox_V1_F",
			"Cargo20_blue_F",
			"Cargo20_brick_red_F",
			"Cargo20_cyan_F",
			"Cargo20_grey_F",
			"Cargo20_light_blue_F",
			"Cargo20_light_green_F",
			"Cargo20_military_green_F",
			"Cargo20_military_ruins_F",
			"Cargo20_orange_F",
			"Cargo20_red_F",
			"Cargo20_sand_F",
			"Cargo20_white_F",
			"Cargo20_yellow_F",
			"Cargo40_blue_F",
			"Cargo40_brick_red_F",
			"Cargo40_cyan_F",
			"Cargo40_grey_F",
			"Cargo40_light_blue_F",
			"Cargo40_light_green_F",
			"Cargo40_military_green_F",
			"Cargo40_orange_F",
			"Cargo40_red_F",
			"Cargo40_sand_F",
			"Cargo40_white_F",
			"Cargo40_yellow_F",

			// Namalsk
			"nam_container.p3d",
			"misc_cargo1d.p3d",
			"misc_cargo1b.p3d",
			"misc_cargo1bo.p3d",
			"misc_cargo2c.p3d",
			"misc_cargo1ao.p3d",
			
			//Tanoa
			"containerline_01_f",
			"containerline_02_f",
			"containerline_03_f",

			// Also allow wrecks
			"wreck_"
		};
	};

	class WoodSource
	{
		name = "Trees";
		models[] = 
		{
			" t_",
			" bo_t_",

			// A2 trees
            " str_",
            " Smrk_",
            " les_",
            " brg_"			
		};
	};

	// TODO: Add https://community.bistudio.com/wikidata/images/thumb/6/60/Arma3_CfgVehicles_Land_Tank_rust_F.jpg/150px-Arma3_CfgVehicles_Land_Tank_rust_F.jpg
	class FuelSource
	{
		name = "Fuel pumps, stations or barrels";
		models[] = 
		{
			"fuelstation_feed_f.p3d",
			"metalbarrel_f.p3d",
			"flexibletank_01_f.p3d",
			"fs_feed_f.p3d",
			//Tanoa
			"fuelstation_01_pump_f.p3d",
			"fuelstation_02_pump_f.p3d"
		};	
	};
};
class CfgLocker 
{
	numbersOnly = "0123456789";
	
	maxDeposit = 10000;
};
class CfgPlayer 
{
	// In minutes ammount of time it takes to go from 100 - 0 if stationary
	hungerDecay = 90;
	thirstDecay = 60;

	// Damage taken from 0 (health||thirst)/sec
	healthDecay = 5.0;

	// Health regen if over BOTH
	thirstRegen = 90;
	hungerRegen = 90;

	// IF above meet recover HP%/MIN
	recoveryPerMinute = 2;

	// Set custom aim precision coefficient for weapon sway
	// https://community.bistudio.com/wiki/Arma_3_Stamina
	// Set to -1 if you want to use Arma 3 default value
	// setCustomAimCoef
	customAimCoefficient = 0.5;

	// 0 or 1
	enableFatigue = 0;
	enableStamina = 0;

	disableMapDrawing = 1;
};
class CfgSlothMachine
{
	spinCost = 100;
	Jackpot = 10100;
	
	chances[] = 
	{
		{85, ""}, 					// 85% = Nothing
		{95, "Level1"}, 			// 10% = 1pt
		{96, "Level2"}, 			// 1% = 10pt
		{97, "Level3"}, 			// 1% = 25pt
		{98, "Level4"}, 			// 1% = 50pt
		{99, "Level5"},				// 1% = 100pt
		{100, "Jackpot"} 			// 1% = Jackpot
	};

	class Prizes 
	{
		class Level1
		{
			symbol = "\exile_assets\texture\item\Exile_Item_ToiletPaper.paa";
			prize = 101;
		};

		class Level2
		{
			symbol = "\exile_assets\texture\item\Exile_Item_CockONut.paa";
			prize = 110;
		};

		class Level3
		{
			symbol = "\exile_assets\texture\item\Exile_Item_Beer.paa";
			prize = 125;
		};

		class Level4
		{
			symbol = "\exile_assets\texture\item\Exile_Item_Knife.paa";
			prize = 150;
		};

		class Level5
		{
			symbol = "\exile_assets\texture\item\Exile_Item_Safe.paa";
			prize = 200;
		};
		
		class Jackpot
		{
			symbol = "\exile_assets\texture\item\Exile_Item_XmasPresent.paa";
		};
	};
};
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
class CfgTraderCategories 
{
	class Community
	{
		name = "Community Items";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community2
	{
		name = "Community Items 2";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community3
	{
		name = "Community Items 3";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community4
	{
		name = "Community Items 4";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community5
	{
		name = "Community Items 5";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community6
	{
		name = "Community Items 6";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community7
	{
		name = "Community Items 7";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community8
	{
		name = "Community Items 8";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community9
	{
		name = "Community Items 9";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community10
	{
		name = "Community Items 10";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};
	class CivilianUniforms
	{
		name = "Civilian Uniforms";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			"U_C_Journalist",
			"U_C_Poloshirt_blue",
			"U_C_Poloshirt_burgundy",
			"U_C_Poloshirt_salmon",
			"U_C_Poloshirt_stripped",
			"U_C_Poloshirt_tricolour",
			"U_C_Poor_1",
			"U_C_Poor_2",
			"U_C_Poor_shorts_1",
			"U_C_Scientist",
			"U_OrestesBody",
			"U_Rangemaster",
			"U_NikosAgedBody",
			"U_NikosBody",
			"U_Competitor",
			"U_C_Man_casual_1_F",
			"U_C_Man_casual_2_F",
			"U_C_Man_casual_3_F",
			"U_C_man_sport_1_F",
			"U_C_man_sport_2_F",
			"U_C_man_sport_3_F",
			"U_C_Man_casual_4_F",
			"U_C_Man_casual_5_F",
			"U_C_Man_casual_6_F"
		};
	};
	
	class GuerillaUniforms
	{
		name = "Guerilla Uniforms";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			"U_IG_Guerilla1_1",
			"U_IG_Guerilla2_1",
			"U_IG_Guerilla2_2",
			"U_IG_Guerilla2_3",
			"U_IG_Guerilla3_1",
			"U_BG_Guerilla2_1",
			"U_IG_Guerilla3_2",
			"U_BG_Guerrilla_6_1",
			"U_BG_Guerilla1_1",
			"U_BG_Guerilla2_2",
			"U_BG_Guerilla2_3",
			"U_BG_Guerilla3_1",
			"U_BG_leader",
			"U_IG_leader",
			"U_I_G_resistanceLeader_F",
			"U_I_C_Soldier_Bandit_1_F",
			"U_I_C_Soldier_Bandit_2_F",
			"U_I_C_Soldier_Bandit_3_F",
			"U_I_C_Soldier_Bandit_4_F",
			"U_I_C_Soldier_Bandit_5_F",
			"U_I_C_Soldier_Para_1_F",
			"U_I_C_Soldier_Para_2_F",
			"U_I_C_Soldier_Para_3_F",
			"U_I_C_Soldier_Para_4_F",
			"U_I_C_Soldier_Para_5_F",
			"U_I_C_Soldier_Camo_F"
		};
	};
	
	class MilitaryUniforms
	{
		name = "Military Uniforms";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			"Exile_Uniform_Woodland",
			"U_B_survival_uniform",
			"U_B_GEN_Commander_F",
			"U_B_GEN_Soldier_F",
			"U_B_CombatUniform_mcam",
			"U_B_CombatUniform_mcam_tshirt",
			"U_B_CombatUniform_mcam_vest",
			"U_B_CombatUniform_mcam_worn",
			"U_O_CombatUniform_ocamo",
			"U_O_CombatUniform_oucamo",
			"U_B_CTRG_1",
			"U_B_CTRG_2",
			"U_B_CTRG_3",
			"U_B_CTRG_Soldier_urb_1_F",
			"U_B_CTRG_Soldier_urb_3_F",
			"U_B_CTRG_Soldier_urb_2_F",
			"U_I_CombatUniform",
			"U_I_CombatUniform_shortsleeve",
			"U_I_CombatUniform_tshirt",
			"U_I_OfficerUniform",
			"U_O_OfficerUniform_ocamo",
			"U_B_SpecopsUniform_sgg",
			"U_O_SpecopsUniform_blk",
			"U_O_SpecopsUniform_ocamo",
			"U_I_G_Story_Protagonist_F",
			"U_C_HunterBody_grn",
			"U_B_HeliPilotCoveralls",
			"U_B_PilotCoveralls",
			"U_I_HeliPilotCoveralls",
			"U_I_pilotCoveralls",
			"U_O_PilotCoveralls",
			"U_B_T_Soldier_F",
			"U_B_T_Soldier_AR_F",
			"U_O_T_Soldier_F",
			"U_O_T_Officer_F",
			"U_B_T_Soldier_SL_F"
		};
	};

	class Vests
	{
		name = "Vests";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa";
		items[] = 
		{
			"V_Press_F",
			"V_Rangemaster_belt",
			"V_TacVest_blk",
			"V_TacVest_blk_POLICE",
			"V_TacVest_gen_F",
			"V_TacVest_brn",
			"V_TacVest_camo",
			"V_TacVest_khk",
			"V_TacVest_oli",
			"V_TacVestCamo_khk",
			"V_TacVestIR_blk",
			"V_I_G_resistanceLeader_F",
			"V_TacChestrig_grn_F",
			"V_TacChestrig_oli_F",
			"V_TacChestrig_cbr_F",
			"V_BandollierB_blk",
			"V_BandollierB_cbr",
			"V_BandollierB_khk",
			"V_BandollierB_oli",
			"V_BandollierB_rgr",
			"V_BandollierB_ghex_F",
			"V_Chestrig_blk",
			"V_Chestrig_khk",
			"V_Chestrig_oli",
			"V_Chestrig_rgr",
			"V_HarnessO_brn",
			"V_HarnessO_gry",
			"V_HarnessOGL_brn",
			"V_HarnessOGL_gry",
			"V_HarnessOSpec_brn",
			"V_HarnessOSpec_gry",
			"V_HarnessO_ghex_F",
			"V_HarnessOGL_ghex_F",
			"V_PlateCarrier1_blk",
			"V_PlateCarrier1_rgr",
			"V_PlateCarrier1_tna_F",
			"V_PlateCarrier1_rgr_noflag_F",
			"V_PlateCarrier2_rgr",
			"V_PlateCarrier2_tna_F",
			"V_PlateCarrier2_rgr_noflag_F",
			"V_PlateCarrier3_rgr",
			"V_PlateCarrierGL_blk",
			"V_PlateCarrierGL_mtp",
			"V_PlateCarrierGL_rgr",
			"V_PlateCarrierH_CTRG",
			"V_PlateCarrierIA1_dgtl",
			"V_PlateCarrierIA2_dgtl",
			"V_PlateCarrierIAGL_dgtl",
			"V_PlateCarrierIAGL_oli",
			"V_PlateCarrierL_CTRG",
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrierSpec_mtp",
			"V_PlateCarrierSpec_rgr",
			"V_PlateCarrierSpec_tna_F",
			"V_PlateCarrierGL_tna_F"
		};
	};

	class Headgear 
	{
		name = "Headgear";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\headgear_ca.paa";
		items[] =
		{
			"Exile_Headgear_SafetyHelmet",
			"H_Cap_blk",
			"H_Cap_blk_Raven",
			"H_Cap_blu",
			"H_Cap_brn_SPECOPS",
			"H_Cap_grn",
			"H_Cap_headphones",
			"H_Cap_khaki_specops_UK",
			"H_Cap_oli",
			"H_Cap_press",
			"H_Cap_red",
			"H_Cap_tan",
			"H_Cap_tan_specops_US",
			"H_Watchcap_blk",
			"H_Watchcap_camo",
			"H_Watchcap_khk",
			"H_Watchcap_sgg",
			"H_MilCap_blue",
			"H_MilCap_dgtl",
			"H_MilCap_mcamo",
			"H_MilCap_ocamo",
			"H_MilCap_oucamo",
			"H_MilCap_rucamo",
			"H_Bandanna_camo",
			"H_Bandanna_cbr",
			"H_Bandanna_gry",
			"H_Bandanna_khk",
			"H_Bandanna_khk_hs",
			"H_Bandanna_mcamo",
			"H_Bandanna_sgg",
			"H_Bandanna_surfer",
			"H_Booniehat_dgtl",
			"H_Booniehat_dirty",
			"H_Booniehat_grn",
			"H_Booniehat_indp",
			"H_Booniehat_khk",
			"H_Booniehat_khk_hs",
			"H_Booniehat_mcamo",
			"H_Booniehat_tan",
			"H_Hat_blue",
			"H_Hat_brown",
			"H_Hat_camo",
			"H_Hat_checker",
			"H_Hat_grey",
			"H_Hat_tan",
			"H_StrawHat",
			"H_StrawHat_dark",
			"H_Beret_02",
			"H_Beret_blk",
			"H_Beret_blk_POLICE",
			"H_Beret_brn_SF",
			"H_Beret_Colonel",
			"H_Beret_grn",
			"H_Beret_grn_SF",
			"H_Beret_ocamo",
			"H_Beret_red",
			"H_Shemag_khk",
			"H_Shemag_olive",
			"H_Shemag_olive_hs",
			"H_Shemag_tan",
			"H_ShemagOpen_khk",
			"H_ShemagOpen_tan",
			"H_TurbanO_blk",
			"H_HelmetB",
			"H_HelmetB_black",
			"H_HelmetB_camo",
			"H_HelmetB_desert",
			"H_HelmetB_grass",
			"H_HelmetB_light",
			"H_HelmetB_light_black",
			"H_HelmetB_light_desert",
			"H_HelmetB_light_grass",
			"H_HelmetB_light_sand",
			"H_HelmetB_light_snakeskin",
			"H_HelmetB_paint",
			"H_HelmetB_plain_blk",
			"H_HelmetB_sand",
			"H_HelmetB_snakeskin",
			"H_HelmetCrew_B",
			"H_HelmetCrew_I",
			"H_HelmetCrew_O",
			"H_HelmetIA",
			"H_HelmetIA_camo",
			"H_HelmetIA_net",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetO_oucamo",
			"H_HelmetSpecB",
			"H_HelmetSpecB_blk",
			"H_HelmetSpecB_paint1",
			"H_HelmetSpecB_paint2",
			"H_HelmetSpecO_blk",
			"H_HelmetSpecO_ocamo",
			"H_CrewHelmetHeli_B",
			"H_CrewHelmetHeli_I",
			"H_CrewHelmetHeli_O",
			"H_HelmetCrew_I",
			"H_HelmetCrew_B",
			"H_HelmetCrew_O",
			"H_PilotHelmetHeli_B",
			"H_PilotHelmetHeli_I",
			"H_PilotHelmetHeli_O",
			"H_Helmet_Skate",
			"H_HelmetB_tna_F",
			"H_HelmetB_Enh_tna_F",
			"H_HelmetB_Light_tna_F",
			"H_HelmetSpecO_ghex_F",
			"H_HelmetLeaderO_ghex_F",
			"H_HelmetO_ghex_F",
			"H_HelmetCrew_O_ghex_F",
			"H_MilCap_tna_F",
			"H_MilCap_ghex_F",
			"H_Booniehat_tna_F",
			"H_Beret_gen_F",
			"H_MilCap_gen_F",
			"H_Cap_oli_Syndikat_F",
			"H_Cap_tan_Syndikat_F",
			"H_Cap_blk_Syndikat_F",
			"H_Cap_grn_Syndikat_F"
		};
	};

	class Facewear 
	{
		name = "Facewear";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\Goggles_ca.paa";
		items[] =
		{
			"G_Spectacles",
			"G_Spectacles_Tinted",
			"G_Combat",
			"G_Lowprofile",
			"G_Shades_Black",
			"G_Shades_Green",
			"G_Shades_Red",
			"G_Squares",
			"G_Squares_Tinted",
			"G_Sport_BlackWhite",
			"G_Sport_Blackyellow",
			"G_Sport_Greenblack",
			"G_Sport_Checkered",
			"G_Sport_Red",
			"G_Tactical_Black",
			"G_Aviator",
			"G_Lady_Mirror",
			"G_Lady_Dark",
			"G_Lady_Red",
			"G_Lady_Blue",
			"G_Goggles_VR",
			"G_Balaclava_blk",
			"G_Balaclava_oli",
			"G_Balaclava_combat",
			"G_Balaclava_lowprofile",
			"G_Bandanna_blk",
			"G_Bandanna_oli",
			"G_Bandanna_khk",
			"G_Bandanna_tan",
			"G_Bandanna_beast",
			"G_Bandanna_shades",
			"G_Bandanna_sport",
			"G_Bandanna_aviator",
			"G_Shades_Blue",
			"G_Sport_Blackred",
			"G_Tactical_Clear",
			"G_Balaclava_TI_blk_F",
			"G_Balaclava_TI_tna_F",
			"G_Balaclava_TI_G_blk_F",
			"G_Balaclava_TI_G_tna_F",
			"G_Combat_Goggles_tna_F"
		};
	};

	class PointerAttachments 
	{
		name = "Pointer Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"acc_flashlight",
			"hlc_acc_Surefiregrip",
			"acc_pointer_IR"
		};
	};

	class BipodAttachments 
	{
		name = "Bipod Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itembipod_ca.paa";
		items[] = 
		{
			"bipod_01_F_blk",
			"bipod_01_F_mtp",
			"bipod_01_F_khk",
			"bipod_01_F_snd",
			"bipod_02_F_blk",
			"bipod_02_F_hex",
			"bipod_02_F_tan",
			"bipod_03_F_blk",
			"bipod_03_F_oli"
		};
	};

	class MuzzleAttachments 
	{
		name = "Suppressor Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemmuzzle_ca.paa";
		items[] = 
		{
			"muzzle_snds_acp",
			"muzzle_snds_B",
			"muzzle_snds_H",
			"muzzle_snds_H_MG",
			"muzzle_snds_H_SW",
			"muzzle_snds_L",
			"muzzle_snds_M",
			"muzzle_snds_H_khk_F",
			"muzzle_snds_H_snd_F",
			"muzzle_snds_58_blk_F",
			"muzzle_snds_m_khk_F",
			"muzzle_snds_m_snd_F",
			"muzzle_snds_B_khk_F",
			"muzzle_snds_B_snd_F",
			"muzzle_snds_58_wdm_F",
			"muzzle_snds_H_MG_blk_F",
			"muzzle_snds_H_MG_khk_F",
			//NIArms
			"hlc_muzzle_Agendasix10mm",
			"hlc_muzzle_Agendasix",
			"hlc_muzzle_Tundra",
			"hlc_muzzle_snds_AUG",
			"hlc_muzzle_snds_a6AUG",
			"hlc_muzzle_545SUP_AK",
			"hlc_muzzle_762SUP_AK",
			"hlc_muzzle_snds_M14",
			"hlc_muzzle_556NATO_KAC",
			"hlc_muzzle_300blk_KAC",
			"hlc_muzzle_snds_fal",
			"hlc_muzzle_snds_g3",
			"hlc_muzzle_snds_HK33",
			"muzzle_HBADGER"
		};
	};


	class StaticMGs
	{
		name = "Static Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"O_HMG_01_support_F",
			"O_HMG_01_weapon_F"
		};
	};

	class OpticAttachments 
	{
		name = "Scopes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemoptic_ca.paa";
		items[] = 
		{
			"optic_MRD",
			"optic_Yorris",
			"optic_Aco",
			"optic_ACO_grn",
			"optic_ACO_grn_smg",
			"optic_Aco_smg",
			"optic_AMS",
			"optic_AMS_khk",
			"optic_AMS_snd",
			"optic_Arco",
			"optic_Arco_blk_F",	
			"optic_Arco_ghex_F",		
			"optic_ERCO_blk_F",
			"optic_ERCO_khk_F",
			"optic_ERCO_snd_F",
			"optic_DMS",
			"optic_DMS_ghex_F",
			"optic_Hamr",
			"optic_Hamr_khk_F",
			"optic_Holosight",
			"optic_Holosight_smg",
			"optic_Holosight_blk_F",
			"optic_Holosight_khk_F",
			"optic_Holosight_smg_blk_F",
			"optic_KHS_blk",
			"optic_KHS_hex",
			"optic_KHS_old",
			"optic_KHS_tan",
			"optic_LRPS",
			"optic_LRPS_tna_F",
			"optic_LRPS_ghex_F",
			"optic_MRCO",
			"optic_NVS",
			"optic_SOS",
			"optic_SOS_khk_F",
			"optic_Nightstalker",
			//"optic_tws"
			//"optic_tws_mg"
			//NIArms
			"HLC_Optic_PSO1",
			"HLC_Optic_1p29",
			"hlc_optic_kobra",
			//"hlc_optic_goshawk",
			"hlc_optic_PVS4FAL",
			"hlc_optic_PVS4G3",
			"hlc_optic_PVS4M14",
			"hlc_optic_suit",
			"hlc_optic_accupoint_g3",
			"HLC_Optic_G36dualoptic35x",
			"HLC_Optic_G36dualoptic35x2d",
			"HLC_Optic_G36Export35x",
			"HLC_Optic_G36Export35x2d",
			"HLC_Optic_G36Dualoptic15x",
			"HLC_Optic_G36Dualoptic15x2d",
			"HLC_Optic_G36Export15x",
			"HLC_Optic_G36Export15x2d",
			"hlc_optic_artel_m14",
			"hlc_optic_LRT_m14",
			"hlc_optic_Kern",
			"hlc_optic_Kern2d",
			"HLC_Optic_ZFSG1"
		};
	};
	
	class NVG 
	{
		name = "Night Vision Goggles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"NVGoggles",
			"NVGoggles_INDEP",
			"NVGoggles_OPFOR",
			"NVGoggles_tna_F",
			"O_NVGoggles_hex_F",
			"O_NVGoggles_urb_F",
			"O_NVGoggles_ghex_F"
		};
	};
	
	class EquipmentTools
	{
		name = "Tools";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Binocular",
			"Rangefinder",
			"ItemGPS",
			"ItemMap",
			"ItemCompass",
			"ItemRadio",
			"ItemWatch",
			"Exile_Item_XM8"			
			/*
			"Laserdesignator"
			"Laserdesignator_02"
			"Laserdesignator_03"
			*/
		};
	};

	class Hardware 
	{
		name = "Hardware";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Item_DuctTape",
			"Exile_Item_ZipTie",
			"Exile_Item_ExtensionCord",
			"Exile_Item_LightBulb",
			"Exile_Item_MetalScrews",
			"Exile_Item_JunkMetal",
			"Exile_Item_MetalBoard",
			"Exile_Item_MetalPole",
			//"Exile_Item_MobilePhone",
			"Exile_Item_SafeKit",
			"Exile_Item_CodeLock",
			"Exile_Item_FuelCanisterFull",
			"Exile_Item_FuelBarrelFull",
			"Exile_Item_WaterCanisterDirtyWater",
			"Exile_Item_CamoTentKit"
			/*
			"Exile_Item_Rope",
			"Exile_Item_MetalWire",
			"Exile_Item_Laptop",
			"Exile_Item_BaseCameraKit",
			"Exile_Item_MetalHedgehogKit",
			"Exile_Item_CarWheel",
			"Exile_Item_Cement",
			"Exile_Item_Sand"
			*/
		};
	};
	
	class Tools
	{
		name = "Tools";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Item_Matches",
			"Exile_Item_CookingPot",
			"Exile_Item_CanOpener",
			"Exile_Melee_Axe",
			"Exile_Item_Handsaw",
			"Exile_Item_Pliers",
			"Exile_Item_Grinder",
			"Exile_Item_Knife",
			"Exile_Magazine_Battery",
			"Exile_Melee_SledgeHammer",
			"Exile_Item_Foolbox",
			"Exile_Item_CordlessScrewdriver",
			"Exile_Item_Shovel"
			/*
			"Exile_Item_ThermalScannerPro",
			"Exile_Item_FireExtinguisher",
			"Exile_Item_Hammer",
			"Exile_Item_OilCanister",
			"Exile_Item_Screwdriver",
			"Exile_Item_Wrench",
			"Exile_Item_SleepingMat",	
			"Exile_Item_ToiletPaper",			
			*/
		};
	};

	class Food 
	{
		name = "Fast Food";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_EMRE",		
			"Exile_Item_GloriousKnakworst",
			"Exile_Item_Surstromming",
			"Exile_Item_SausageGravy",
			"Exile_Item_Catfood",
			"Exile_Item_MacasCheese",
			"Exile_Item_ChristmasTinner",
			"Exile_Item_BBQSandwich",
			"Exile_Item_Dogfood",
			"Exile_Item_BeefParts",
			"Exile_Item_Cheathas",
			"Exile_Item_DsNuts",
			"Exile_Item_Noodles",
			"Exile_Item_SeedAstics",
			"Exile_Item_Raisins",
			"Exile_Item_Moobar",
			"Exile_Item_CockONut",
			"Exile_Item_InstantCoffee"		
		};
	};

	class Drinks 
	{
		name = "Drinks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_PlasticBottleCoffee",
			"Exile_Item_PowerDrink",
			"Exile_Item_PlasticBottleFreshWater",
			"Exile_Item_Beer",
			"Exile_Item_EnergyDrink",
			"Exile_Item_ChocolateMilk",
			"Exile_Item_MountainDupe",
			"Exile_Item_PlasticBottleEmpty"
		};
	};

	class FirstAid
	{
		name = "FirstAid";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Item_InstaDoc",
			"Exile_Item_Bandage",
			"Exile_Item_Vishpirin",
			//"Exile_Item_Heatpack"
			//"Exile_Item_Defibrillator"
		};
	};

	class Backpacks
	{
		name = "Backpacks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
		items[] = 
		{
			"B_HuntingBackpack",
			"B_OutdoorPack_blk",
			"B_OutdoorPack_blu",
			"B_OutdoorPack_tan",
			"B_AssaultPack_blk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_dgtl",
			"B_AssaultPack_khk",
			"B_AssaultPack_mcamo",
			"B_AssaultPack_rgr",
			"B_AssaultPack_sgg",
			"B_AssaultPack_tna_F",
			"B_FieldPack_blk",
			"B_FieldPack_cbr",
			"B_FieldPack_ocamo",
			"B_FieldPack_oucamo",
			"B_FieldPack_ghex_F",
			"B_TacticalPack_blk",
			"B_TacticalPack_rgr",
			"B_TacticalPack_ocamo",
			"B_TacticalPack_mcamo",
			"B_TacticalPack_oli",
			"B_Kitbag_cbr",
			"B_Kitbag_mcamo",
			"B_Kitbag_rgr",
			"B_Kitbag_sgg",
			"B_Bergen_blk",
			"B_Bergen_mcamo",
			"B_Bergen_rgr",
			"B_Bergen_sgg",
			"B_Carryall_cbr",
			"B_Carryall_khk",
			"B_Carryall_mcamo",
			"B_Carryall_ocamo",
			"B_Carryall_oli",
			"B_Carryall_oucamo",
			"B_Carryall_ghex_F",
			"B_Bergen_dgtl_F",
			"B_Bergen_hex_F",
			"B_Bergen_mcamo_F",
			"B_Bergen_tna_F"
		};
	};
	
	class ViperHarnesses
	{
		name = "Viper Harnesses";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
		items[] = 
		{
			"B_ViperLightHarness_blk_F",
			"B_ViperLightHarness_ghex_F",
			"B_ViperLightHarness_hex_F",
			"B_ViperLightHarness_khk_F",
			"B_ViperLightHarness_oli_F",
			"B_ViperHarness_blk_F",						
			"B_ViperHarness_ghex_F",
			"B_ViperHarness_hex_F",
			"B_ViperHarness_khk_F",
			"B_ViperHarness_oli_F"
		};
	};

	class Ammunition
	{
		name = "Ammunition";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\CargoMag_ca.paa";
		items[] = 
		{
			"6Rnd_GreenSignal_F",
			"6Rnd_RedSignal_F",
			"6Rnd_45ACP_Cylinder",
			"9Rnd_45ACP_Mag",
			"11Rnd_45ACP_Mag",
			"30Rnd_45ACP_Mag_SMG_01",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
			"10Rnd_9x21_Mag",
			"16Rnd_9x21_Mag",
			"30Rnd_9x21_Mag_SMG_02",
			"30Rnd_9x21_Mag_SMG_02_Tracer_Red",
			"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",
			"30Rnd_9x21_Mag_SMG_02_Tracer_Green",
			"30Rnd_9x21_Mag",
			"20Rnd_556x45_UW_mag",
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag_green",
			"30Rnd_556x45_Stanag_red",
			"30Rnd_556x45_Stanag_Tracer_Red",
			"30Rnd_556x45_Stanag_Tracer_Yellow",
			"30Rnd_556x45_Stanag_Tracer_Green",
			"150Rnd_556x45_Drum_Mag_F",
			"150Rnd_556x45_Drum_Mag_Tracer_F",
			"200Rnd_556x45_Box_F",
			"200Rnd_556x45_Box_Red_F",
			"200Rnd_556x45_Box_Tracer_F",
			"200Rnd_556x45_Box_Tracer_Red_F",
			"30Rnd_580x42_Mag_F",
			"30Rnd_580x42_Mag_Tracer_F",
			"100Rnd_580x42_Mag_F",
			"100Rnd_580x42_Mag_Tracer_F",
			"100Rnd_65x39_caseless_mag_Tracer",			
			"30Rnd_65x39_caseless_green",
			"30Rnd_65x39_caseless_green_mag_Tracer",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag_Tracer",
			"20Rnd_650x39_Cased_Mag_F",
			"100Rnd_65x39_caseless_mag",
			"100Rnd_65x39_caseless_mag_Tracer",
			"200Rnd_65x39_cased_Box",
			"200Rnd_65x39_cased_Box_Tracer",
			"30Rnd_762x39_Mag_F",
			"30Rnd_762x39_Mag_Green_F",
			"30Rnd_762x39_Mag_Tracer_F",
			"30Rnd_762x39_Mag_Tracer_Green_F",
			"20Rnd_762x51_Mag",
			"10Rnd_762x54_Mag",
			"150Rnd_762x54_Box",
			"150Rnd_762x54_Box_Tracer",
			//"10Rnd_93x64_DMR_05_Mag",
			//"150Rnd_93x64_Mag",
			//"10Rnd_338_Mag",
			//"130Rnd_338_Mag",
			//"7Rnd_408_Mag",
			"10Rnd_127x54_Mag",
			//"5Rnd_127x108_Mag",
			//"5Rnd_127x108_APDS_Mag",
			//"10Rnd_50BW_Mag_F",
			//NIArms
			"hlc_12Rnd_45ACP_B_mk23",
			"hlc_12Rnd_45ACP_S_mk23",
			"hlc_12Rnd_45ACP_T_mk23",
			//"hlc_8Rnd_44mag_B_deagle",
			//"hlc_8Rnd_44mag_JHP_deagle",
			//"hlc_50Rnd_44mag_B_deagle",
			//"hlc_50Rnd_44mag_FUN",
			"hlc_10rnd_12g_buck_S12",
			"hlc_10rnd_12g_slug_S12",
			"hlc_25Rnd_9x19mm_M882_AUG",
			"hlc_25Rnd_9x19mm_JHP_AUG",
			"hlc_25Rnd_9x19mm_subsonic_AUG",
			"hlc_30Rnd_9x19_B_MP5",
			"hlc_30Rnd_9x19_GD_MP5",
			"hlc_30Rnd_9x19_SD_MP5",
			"hlc_32rnd_9x19_B_sten",
			"hlc_30Rnd_10mm_B_MP5",
			"hlc_30Rnd_10mm_JHP_MP5",
			"hlc_30Rnd_545x39_B_AK",
			"hlc_30Rnd_545x39_T_AK",
			"hlc_30Rnd_545x39_EP_AK",
			"hlc_30Rnd_545x39_S_AK",
			"hlc_45Rnd_545x39_t_rpk",
			"hlc_60Rnd_545x39_t_rpk",
			"hlc_30rnd_556x45_EPR",
			"hlc_30rnd_556x45_SOST",
			"hlc_30rnd_556x45_SPR",
			"hlc_30rnd_556x45_EPR_G36",
			"hlc_30rnd_556x45_SOST_G36",
			"hlc_30rnd_556x45_SPR_G36",
			"hlc_30rnd_556x45_Tracers_G36",
			"hlc_100rnd_556x45_EPR_G36",
			"hlc_30Rnd_556x45_B_AUG",
			"hlc_30Rnd_556x45_SOST_AUG",
			"hlc_30Rnd_556x45_SPR_AUG",
			"hlc_30Rnd_556x45_T_AUG",
			"hlc_40Rnd_556x45_B_AUG",
			"hlc_40Rnd_556x45_SOST_AUG",
			"hlc_40Rnd_556x45_SPR_AUG",
			"hlc_30rnd_556x45_EPR_HK33",
			"hlc_30rnd_556x45_SOST_HK33",
			"hlc_30rnd_556x45_t_HK33",
			"hlc_30rnd_556x45_b_HK33",
			"hlc_30rnd_556x45_S",
			"hlc_50rnd_556x45_EPR",
			"hlc_200rnd_556x45_M_SAW",
			"hlc_200rnd_556x45_T_SAW",
			"hlc_200rnd_556x45_B_SAW",
			"hlc_24Rnd_75x55_B_stgw",
			"hlc_24Rnd_75x55_ap_stgw",
			"hlc_24Rnd_75x55_T_stgw",
			"hlc_30Rnd_762x39_b_ak",
			"hlc_30Rnd_762x39_t_ak",
			"hlc_30rnd_762x39_s_ak",
			"hlc_45Rnd_762x39_t_rpk",
			"hlc_45Rnd_762x39_m_rpk",
			"hlc_75rnd_762x39_m_rpk",
			"hlc_20Rnd_762x51_B_fal",
			"hlc_20Rnd_762x51_t_fal",
			"hlc_20Rnd_762x51_S_fal",
			"hlc_20Rnd_762x51_barrier_fal",
			"hlc_20Rnd_762x51_mk316_fal",
			"hlc_50rnd_762x51_M_FAL",
			"hlc_20Rnd_762x51_B_G3",
			"hlc_20rnd_762x51_T_G3",
			"hlc_20rnd_762x51_Mk316_G3",
			"hlc_20rnd_762x51_barrier_G3",
			"hlc_20rnd_762x51_S_G3",
			"hlc_50rnd_762x51_M_G3",
			"hlc_20Rnd_762x51_B_M14",
			"hlc_20rnd_762x51_T_M14",
			"hlc_20Rnd_762x51_S_M14",
			"hlc_20Rnd_762x51_barrier_M14",
			"hlc_20rnd_762x51_mk316_M14",
			"hlc_50Rnd_762x51_B_M14",
			"hlc_20Rnd_762x51_b_amt",
			"hlc_20Rnd_762x51_mk316_amt",
			"hlc_20Rnd_762x51_bball_amt",
			"hlc_20Rnd_762x51_T_amt",
			"hlc_100Rnd_762x51_B_M60E4",
			"hlc_100Rnd_762x51_T_M60E4",
			"hlc_100Rnd_762x51_M_M60E4",
			"hlc_100Rnd_762x51_Barrier_M60E4",
			//"hlc_5Rnd_792_T_Kar98",
			//"hlc_5Rnd_792_AP_Kar98",
			"29rnd_300BLK_STANAG",
			"29rnd_300BLK_STANAG_T",
			"29rnd_300BLK_STANAG_S",
			"hlc_5rnd_3006_1903",
			//"hlc_10Rnd_303_B_enfield",
			//"hlc_10Rnd_303_T_enfield",
			//"hlc_10Rnd_303_AP_enfield",
			"hlc_5rnd_300WM_FMJ_AWM",
			"hlc_5rnd_300WM_AP_AWM",
			"hlc_5rnd_300WM_BTSP_AWM",
			"hlc_5rnd_300WM_mk248_AWM",
			"hlc_5rnd_300WM_SBT_AWM",
			//Exile
			"Exile_Magazine_8Rnd_74Slug",		
			"Exile_Magazine_8Rnd_74Pellets"
			
		};
	};

	class Flares 
	{
		name = "Flares";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Chemlight_blue",
			"Chemlight_green",
			"Chemlight_red",
			"FlareGreen_F",
			"FlareRed_F",
			"FlareWhite_F",
			"FlareYellow_F",
			"UGL_FlareGreen_F",
			"UGL_FlareRed_F",
			"UGL_FlareWhite_F",
			"UGL_FlareYellow_F",
			"3Rnd_UGL_FlareGreen_F",
			"3Rnd_UGL_FlareRed_F",
			"3Rnd_UGL_FlareWhite_F",
			"3Rnd_UGL_FlareYellow_F"
		};
	};

	class Smokes 
	{
		name = "Smokes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"SmokeShell",
			"SmokeShellBlue",
			"SmokeShellGreen",
			"SmokeShellOrange",
			"SmokeShellPurple",
			"SmokeShellRed",
			"SmokeShellYellow",
			"1Rnd_Smoke_Grenade_shell",
			"1Rnd_SmokeBlue_Grenade_shell",
			"1Rnd_SmokeGreen_Grenade_shell",
			"1Rnd_SmokeOrange_Grenade_shell",
			"1Rnd_SmokePurple_Grenade_shell",
			"1Rnd_SmokeRed_Grenade_shell",
			"1Rnd_SmokeYellow_Grenade_shell",
			"3Rnd_Smoke_Grenade_shell",
			"3Rnd_SmokeBlue_Grenade_shell",
			"3Rnd_SmokeGreen_Grenade_shell",
			"3Rnd_SmokeOrange_Grenade_shell",
			"3Rnd_SmokePurple_Grenade_shell",
			"3Rnd_SmokeRed_Grenade_shell",
			"3Rnd_SmokeYellow_Grenade_shell",
			//NIArms
			"hlc_GRD_White",
			"hlc_GRD_red",
			"hlc_GRD_green",
			"hlc_GRD_blue",
			"hlc_GRD_orange",
			"hlc_GRD_purple",
			"hlc_GRD_yellow"	
		};
	};	

	class Explosives
	{
		name = "Explosives";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargothrow_ca.paa";
		items[] = 
		{
			"HandGrenade",
			"MiniGrenade",
			"B_IR_Grenade",
			"O_IR_Grenade",
			"I_IR_Grenade",
			"1Rnd_HE_Grenade_shell",
			"3Rnd_HE_Grenade_shell",
			"APERSBoundingMine_Range_Mag",
			"APERSMine_Range_Mag",
			"APERSTripMine_Wire_Mag",
			"ClaymoreDirectionalMine_Remote_Mag",
			//"DemoCharge_Remote_Mag",
			"IEDLandBig_Remote_Mag",
			"IEDLandSmall_Remote_Mag",
			"IEDUrbanBig_Remote_Mag",
			"IEDUrbanSmall_Remote_Mag",
			//"SatchelCharge_Remote_Mag",
			"SLAMDirectionalMine_Wire_Mag",
			//NIArms
			"hlc_VOG25_AK"
		};
	};

	class Handguns 
	{
		name = "Handguns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";
		items[] = 
		{
			"hgun_Pistol_01_F",
			"hgun_ACPC2_F",
			"hgun_P07_F",
			"hgun_P07_khk_F",
			"hgun_Rook40_F",
			"hgun_Pistol_heavy_01_F",
			"hgun_Pistol_heavy_02_F",
			"hlc_smg_mp5k"
		};
	};

	class SubMachineGuns 
	{
		name = "Sub Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hgun_PDW2000_F",
			"SMG_01_F",
			"SMG_02_F",
			"SMG_05_F",
			"hlc_rifle_hk53",
			"hlc_rifle_hk53RAS",
			"hlc_smg_mp510",
			"hlc_smg_mp5a2",
			"hlc_smg_mp5a3",
			"hlc_smg_mp5a4",
			"hlc_smg_mp5k_PDW",
			"hlc_smg_MP5N",
			"hlc_smg_9mmar",
			"hlc_smg_mp5sd5",
			"hlc_smg_mp5sd6"
			
		};
	};

	class LightMachineGuns 
	{
		name = "Light Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"arifle_MX_SW_Black_F",
			"arifle_MX_SW_F",
			"LMG_03_F",
			"LMG_Mk200_F",
			"LMG_Zafir_F",
			//NIArms
			"hlc_lmg_m60",
			"hlc_lmg_M60E4",
			"hlc_lmg_minimi",
			"hlc_lmg_minimi_railed",
			"hlc_lmg_minimipara",
			"hlc_m249_pip1",
			"hlc_m249_pip3",
			"hlc_m249_pip4",
			"hlc_lmg_M249E2",
			"hlc_m249_pip2",
			"hlc_lmg_m60",
			"hlc_lmg_M60E4",
			"hlc_lmg_mk48",
			"hlc_rifle_rpk",
			"hlc_rifle_RPK12",
			"hlc_rifle_rpk74n",
			"hlc_rifle_MG36",
			"hlc_lmg_m249para",
			"hlc_m249_SQuantoon"
		};
	};

	class AssaultRifles
	{
		name = "Assault Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"arifle_Katiba_C_F",
			"arifle_Katiba_F",
			"arifle_Katiba_GL_F",
			"arifle_Mk20_F",
			"arifle_Mk20_GL_F",
			"arifle_Mk20_GL_plain_F",
			"arifle_Mk20_plain_F",
			"arifle_Mk20C_F",
			"arifle_Mk20C_plain_F",
			"arifle_MX_Black_F",
			"arifle_MX_F",
			"arifle_MX_khk_F",
			"arifle_MX_GL_Black_F",
			"arifle_MX_GL_F",
			"arifle_MX_GL_khk_F",
			"arifle_MXC_Black_F",
			"arifle_MXC_F",
			"arifle_MXC_khk_F",				
			"arifle_SDAR_F",
			"arifle_TRG20_F",
			"arifle_TRG21_F",
			"arifle_TRG21_GL_F",
			"arifle_AK12_F",											
			"arifle_AK12_GL_F",
			"arifle_AKM_F",
			"arifle_AKS_F",
			"arifle_CTAR_blk_F",
			"arifle_CTAR_ghex_F",
			"arifle_CTAR_hex_F",
			"arifle_CTAR_GL_blk_F",
			"arifle_CTAR_GL_ghex_F",
			"arifle_CTAR_GL_hex_F",
			"arifle_CTARS_blk_F",
			"arifle_CTARS_ghex_F",
			"arifle_CTARS_hex_F",
			"arifle_SPAR_01_blk_F",
			"arifle_SPAR_01_khk_F",
			"arifle_SPAR_01_snd_F",
			"arifle_SPAR_01_GL_blk_F",
			"arifle_SPAR_01_GL_khk_F",
			"arifle_SPAR_01_GL_snd_F",
			"arifle_SPAR_02_blk_F",
			"arifle_SPAR_02_khk_F",
			"arifle_SPAR_02_snd_F",
			"arifle_SPAR_03_blk_F",
			"arifle_SPAR_03_khk_F",
			"arifle_SPAR_03_snd_F",
			// Niarms
			"hlc_rifle_ak12",
			"hlc_rifle_ak12GL",
			"hlc_rifle_aku12",
			"hlc_rifle_ak47",
			"hlc_rifle_ak74",
			"hlc_rifle_ak74_MTK",
			"hlc_rifle_ak74_dirty",
			"hlc_rifle_ak74_dirty2",
			"hlc_rifle_ak74m",
			"hlc_rifle_ak74m_gl",
			"hlc_rifle_ak74m_MTK",
			"hlc_rifle_akm",
			"hlc_rifle_akmgl",
			"hlc_rifle_akm_MTK",
			"hlc_rifle_aks74",
			"hlc_rifle_aks74_GL",
			"hlc_rifle_aks74_MTK",
			"hlc_rifle_aks74u",
			"hlc_rifle_aks74u_MTK",
			"hlc_rifle_augsrcarb_b",
			"hlc_rifle_augsrcarb",
			"hlc_rifle_augsrhbar_b",
			"hlc_rifle_augsrhbar",
			"hlc_rifle_augsrhbar_t",
			"hlc_rifle_augsr_b",
			"hlc_rifle_augsr",
			"hlc_rifle_augsr_t",
			"hlc_rifle_augsrcarb_t",
			"hlc_rifle_augpara_b",
			"hlc_rifle_augpara",
			"hlc_rifle_augpara_t",
			"hlc_rifle_auga1carb_B",
			"hlc_rifle_auga1carb",
			"hlc_rifle_auga1carb_t",
			"hlc_rifle_aughbar_B",
			"hlc_rifle_aughbar",
			"hlc_rifle_aughbar_t",
			"hlc_rifle_auga1_b",
			"hlc_rifle_aug",
			"hlc_rifle_auga1_t",
			"hlc_rifle_auga2para_b",
			"hlc_rifle_auga2para",
			"hlc_rifle_auga2para_t",
			"hlc_rifle_auga2carb_b",
			"hlc_rifle_auga2carb",
			"hlc_rifle_auga2carb_t",
			"hlc_rifle_auga2lsw_b",
			"hlc_rifle_auga2lsw",
			"hlc_rifle_auga2lsw_t",
			"hlc_rifle_auga2_b",
			"hlc_rifle_auga2",
			"hlc_rifle_auga2_t",
			"hlc_rifle_auga3_GL_B",
			"hlc_rifle_auga3_GL_BL",
			"hlc_rifle_auga3_GL",
			"hlc_rifle_auga3_b",
			"hlc_rifle_auga3_bl",
			"hlc_rifle_auga3",
			"hlc_rifle_G36MLIC",
			"hlc_rifle_G36A1",
			"hlc_rifle_G36A1AG36",
			"hlc_rifle_G36C",
			"hlc_rifle_G36CMLIC",
			"hlc_rifle_G36CV",
			"hlc_rifle_G36CTac",
			"hlc_rifle_G36E1",
			"hlc_rifle_G36E1AG36",
			"hlc_rifle_G36KMLIC",
			"hlc_rifle_G36KA1",
			"hlc_rifle_G36KE1",
			"hlc_rifle_G36KV",
			"hlc_rifle_g36KTac",
			"hlc_rifle_G36MLIAG36",
			"hlc_rifle_G36V",
			"hlc_rifle_G36VAG36",
			"hlc_rifle_G36TAC",
			"hlc_rifle_honeybadger",
			"hlc_rifle_vendimus",
			"hlc_rifle_g3sg1",
			"hlc_rifle_g3a3",
			"hlc_rifle_g3a3v",
			"hlc_rifle_g3a3ris",
			"hlc_rifle_g3ka4",
			"hLC_Rifle_g3ka4_GL",
			"hlc_rifle_hk33a2",
			"hlc_rifle_hk33a2RIS",
			"hlc_rifle_falosw",
			"hlc_rifle_osw_GL",
			"hlc_rifle_FAL5000",
			"hlc_rifle_FAL5000Rail",
			"hlc_rifle_FAL5061",
			"hlc_rifle_FAL5061Rail",
			"hlc_rifle_slr107u",
			"hlc_rifle_slr107u_MTK",
			"hlc_rifle_RK62",
			"hlc_rifle_aek971",
			"hlc_rifle_aek971_mtk",
			"hlc_rifle_aek971worn",
			"hlc_rifle_RU5562",
			"hlc_rifle_RU556",
			"hlc_rifle_bcmjack",
			"hlc_rifle_Bushmaster300",
			"hlc_rifle_Colt727",
			"hlc_rifle_Colt727_GL",
			"hlc_rifle_M4",
			"hlc_rifle_m4m203",
			"hlc_rifle_CQBR",
			"hlc_rifle_samr2",
			"hlc_rifle_SAMR",
			"hlc_rifle_c1A1",
			"hlc_rifle_LAR",
			"hlc_rifle_SLR",
			"hlc_rifle_SLRchopmod",
			"hlc_rifle_STG58F",
			"hlc_rifle_amt",
			"hlc_rifle_sig5104",
			"hlc_rifle_STGW57",
			"hlc_rifle_stgw57_commando",
			"hlc_rifle_stgw57_RIS"			
		};
	};
	
	class Shotguns
	{
		name = "Shotguns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Weapon_M1014",
			"hlc_rifle_saiga12k"			
		};
	};

	class SniperRifles
	{
		name = "Sniper Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"arifle_MXM_Black_F",
			"arifle_MXM_F",
			"arifle_MXM_khk_F",
			"srifle_DMR_01_F",
			"srifle_DMR_03_F",
			"srifle_DMR_03_khaki_F",
			"srifle_DMR_03_multicam_F",
			"srifle_DMR_03_tan_F",
			"srifle_DMR_03_woodland_F",
			"srifle_DMR_06_camo_F",
			"srifle_DMR_06_olive_F",
			"srifle_DMR_07_blk_F",
			"srifle_DMR_07_ghex_F",
			"srifle_DMR_07_hex_F",
			"srifle_EBR_F",
			//NIArms			
			"hlc_rifle_M14",
			"hlc_rifle_M14_Bipod",
			"hlc_rifle_M14_Rail",
			"hlc_rifle_m14dmr",
			"hlc_rifle_m14sopmod",
			"hlc_rifle_L1A1SLR",
			"hlc_rifle_M21",
			"hlc_rifle_psg1",
			"hlc_rifle_psg1A1",
			"hlc_rifle_PSG1A1_RIS",
			"hlc_rifle_M1903A1",
			"hlc_rifle_M1903A1OMR",
			"hlc_rifle_M1903A1_unertl"
		};
	};
	
	class SpecOpsAR
	{
		name = "Assault Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"arifle_ARX_blk_F",
			"arifle_ARX_ghex_F",
			"arifle_ARX_hex_F"
		};
	};
	
	class SpecOpsLMG
	{
		name = "Light Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"MMG_01_hex_F",
			"MMG_01_tan_F",
			"MMG_02_black_F",
			"MMG_02_camo_F",
			"MMG_02_sand_F"
		};
	};
	
	class SpecOpsSR
	{
		name = "Sniper Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"srifle_DMR_04_F",
			"srifle_DMR_04_Tan_F",
			"srifle_DMR_02_camo_F",
			"srifle_DMR_02_F",
			"srifle_DMR_02_sniper_F",
			"srifle_DMR_05_blk_F",
			"srifle_DMR_05_hex_F",
			"srifle_DMR_05_tan_f",
			"srifle_GM6_camo_F",
			"srifle_GM6_F",
			"srifle_GM6_ghex_F",
			"srifle_LRR_camo_F",
			"srifle_LRR_F",
			"srifle_LRR_tna_F",
			//NIArms
			"hlc_rifle_awcovert_BL",
			"hlc_rifle_awcovert_FDE",
			"hlc_rifle_awcovert",
			"hlc_rifle_awmagnum_BL",
			"hlc_rifle_awMagnum_BL_ghillie",
			"hlc_rifle_awmagnum_FDE",
			"hlc_rifle_awMagnum_FDE_ghillie",
			"hlc_rifle_awmagnum",
			"hlc_rifle_awMagnum_OD_ghillie"
		};
	};
	
	class SpecOpsMuzzle
	{
		name = "Sound Supressors";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"muzzle_snds_338_black",
			"muzzle_snds_338_green",
			"muzzle_snds_338_sand",
			"muzzle_snds_93mmg",
			"muzzle_snds_93mmg_tan",
			"muzzle_snds_65_TI_blk_F",
			"muzzle_snds_65_TI_hex_F",
			"muzzle_snds_65_TI_ghex_F"
		};
	};
	
	class SpecOpsAmmo
	{
		name = "Ammuntion";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"30Rnd_65x39_caseless_green",
			"30Rnd_65x39_caseless_green_mag_Tracer",		
			"10Rnd_93x64_DMR_05_Mag",
			"150Rnd_93x64_Mag",
			"10Rnd_338_Mag",
			"130Rnd_338_Mag",
			"7Rnd_408_Mag",
			"10Rnd_127x54_Mag",	
			"5Rnd_127x108_Mag",
			//"5Rnd_127x108_APDS_Mag",
			"10Rnd_50BW_Mag_F",
			//NIArms
			"hlc_5rnd_300WM_FMJ_AWM",
			"hlc_5rnd_300WM_AP_AWM",
			"hlc_5rnd_300WM_BTSP_AWM",
			"hlc_5rnd_300WM_mk248_AWM",
			"hlc_5rnd_300WM_SBT_AWM"
		};
	};
	
	class SpecOpsLaunchers
	{
		name = "Launchers";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"launch_RPG32_F",
			"launch_RPG32_ghex_F",
			"launch_RPG7_f"
		};
	};
	
	class SpecOpsLauncherAmmo
	{
		name = "Launcher Ammunition";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{	
			"RPG32_F",
			"RPG32_HE_F",
			"RPG7_F"
		};
	};
	
	class SpecOpsOptics
	{
		name = "Scopes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemoptic_ca.paa";
		items[] = 
		{
			"optic_AMS",
			"optic_AMS_khk",
			"optic_AMS_snd",
			"optic_Arco",
			"optic_Arco_blk_F",	
			"optic_Arco_ghex_F",		
			"optic_ERCO_blk_F",
			"optic_ERCO_khk_F",
			"optic_ERCO_snd_F",
			"optic_DMS",
			"optic_DMS_ghex_F",
			"optic_Hamr",
			"optic_Hamr_khk_F",
			"optic_Holosight",
			"optic_Holosight_smg",
			"optic_Holosight_blk_F",
			"optic_Holosight_khk_F",
			"optic_Holosight_smg_blk_F",
			"optic_KHS_blk",
			"optic_KHS_hex",
			"optic_KHS_old",
			"optic_KHS_tan",
			"optic_LRPS",
			"optic_LRPS_tna_F",
			"optic_LRPS_ghex_F",
			"optic_MRCO",
			"optic_NVS",
			"optic_SOS",
			"optic_SOS_khk_F",
			"optic_Nightstalker"
			//"optic_tws"
			//"optic_tws_mg"
		};
	};
	
	class SpecOpsUniforms
	{
		name = "Uniforms";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"U_B_CTRG_Soldier_F",
			"U_B_CTRG_Soldier_3_F",
			"U_B_CTRG_Soldier_2_F",
			"U_O_V_Soldier_Viper_F",
			"U_O_V_Soldier_Viper_hex_F",
			"U_O_GhillieSuit",
			"U_B_GhillieSuit",		
			"U_I_GhillieSuit",
			"U_O_T_Sniper_F",
			"U_B_T_Sniper_F",
			"U_B_FullGhillie_ard",
			"U_B_FullGhillie_lsh",
			"U_B_FullGhillie_sard",
			"U_I_FullGhillie_ard",
			"U_I_FullGhillie_lsh",
			"U_I_FullGhillie_sard",
			"U_O_FullGhillie_ard",
			"U_O_FullGhillie_lsh",
			"U_O_FullGhillie_sard",
			"U_O_T_FullGhillie_tna_F",
			"U_B_T_FullGhillie_tna_F"
		};
	};
	
	class SpecOpsHelmets
	{
		name = "Helmets";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"H_HelmetB_TI_tna_F",
			//"H_HelmetO_ViperSP_hex_F",
			//"H_HelmetO_ViperSP_ghex_F"
		};
	};
	
	class SpecOpsSpecial
	{
		name = "Special Environment";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Headgear_GasMask"
		};
	};
	
	/*class SpecOpsNVG
	{
		name = "Night Vision Goggles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"NVGogglesB_blk_F",
			"NVGogglesB_grn_F",
			"NVGogglesB_gry_F"
		};
	};*/
	
	class Bikes
	{
		name = "Bikes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Bike_OldBike",
			"Exile_Bike_MountainBike"
		};
	};

	class Cars
	{
		name = "Cars";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Car_Kart_Black",
			"Exile_Bike_QuadBike_Black",
			"Exile_Car_OldTractor_Red",
			"Exile_Car_TowTractor_White",
			"Exile_Car_Tractor_Red",
			"Exile_Car_UAZ_Green",
			"Exile_Car_UAZ_Open_Green",
			"Exile_Car_Octavius_White",
			"Exile_Car_Golf_Red",
			"Exile_Car_LandRover_Green",
			"Exile_Car_LandRover_Ambulance_Green",
			"Exile_Car_Lada_Green",
			"Exile_Car_Volha_White",
			"Exile_Car_Hatchback_Rusty1",
			"Exile_Car_Hatchback_Rusty2",
			"Exile_Car_Hatchback_Rusty3",
			"Exile_Car_Hatchback_Sport_Red",
			"Exile_Car_SUV_Red",
			"Exile_Car_SUVXL_Black",
			"Exile_Car_SUV_Armed_Black",
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",
			"Exile_Car_Offroad_Repair_Civillian",
			"Exile_Car_Offroad_Armed_Guerilla01",
			"Exile_Car_BRDM2_HQ",
			"Exile_Car_BTR40_MG_Green",
			"Exile_Car_BTR40_Green",
			"Exile_Car_HMMWV_M134_Green",
			"Exile_Car_HMMWV_M2_Green",
			"Exile_Car_HMMWV_MEV_Green",
			"Exile_Car_HMMWV_UNA_Green",
			"Exile_Car_Strider",
			"Exile_Car_Hunter",
			"Exile_Car_Ifrit",
			"Exile_Car_ProwlerLight",
			"Exile_Car_ProwlerUnarmed",
			"Exile_Car_QilinUnarmed",
			"Exile_Car_MB4WD",
			"Exile_Car_MB4WDOpen"
		};
	};

	class Trucks
	{
		name = "Trucks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Car_Van_Black",
			"Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Fuel_Black",
			"Exile_Car_Ural_Open_Worker",
			"Exile_Car_Ural_Covered_Worker",
			"Exile_Car_V3S_Covered",
			"Exile_Car_Zamak",
			"Exile_Car_Tempest",
			"Exile_Car_HEMMT",
			"Exile_Car_Ikarus_Blue"
		};
	};

	class Choppers
	{
		name = "Helicopters";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Chopper_Hummingbird_Green",
			"Exile_Chopper_Hummingbird_Civillian_Wasp",
			"Exile_Chopper_Huey_Green",
			"Exile_Chopper_Huey_Armed_Green",
			"Exile_Chopper_Taru_Black",
			"Exile_Chopper_Taru_Covered_Black",
			"Exile_Chopper_Taru_Transport_Black",
			"Exile_Chopper_Orca_BlackCustom",
			"Exile_Chopper_Mohawk_FIA",
			"Exile_Chopper_Huron_Black",
			"Exile_Chopper_Hellcat_Green",
			"B_Heli_Light_01_armed_F"
		};
	};

	class Boats
	{
		name = "Boats";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Boat_RubberDuck_CSAT",
			"Exile_Boat_RubberDuck_Digital",
			"Exile_Boat_RubberDuck_Orange",
			"Exile_Boat_RubberDuck_Blue",
			"Exile_Boat_RubberDuck_Black",
			"Exile_Boat_MotorBoat_Police",
			"Exile_Boat_MotorBoat_Orange",
			"Exile_Boat_MotorBoat_White",
			"Exile_Boat_WaterScooter",
			"C_Boat_Transport_02_F",
			"Exile_Boat_RHIB"
		};
	};
	
	class Submarines
	{
		name = "Submarines";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Boat_SDV_CSAT",
			"Exile_Boat_SDV_Digital",
			"Exile_Boat_SDV_Grey"
	};
	};
	
	class BoatsArmed
	{
		name = "Boats Armed";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"O_T_Boat_Armed_01_hmg_F",
			"B_T_Boat_Armed_01_minigun_F"
		};
	};

	class Planes
	{
		name = "Planes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Plane_Cessna",
			"Exile_Plane_AN2_Green",
			"Exile_Plane_Ceasar",
			"Exile_Plane_BlackfishInfantry",
			"Exile_Plane_BlackfishVehicle"
		};
	};

	class Diving 
	{
		name = "Diving";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"G_B_Diving",
			"G_O_Diving",
			"G_I_Diving",
			"G_Diving",
			"V_RebreatherB",
			"V_RebreatherIA",
			"V_RebreatherIR",
			"U_I_Wetsuit",
			"U_O_Wetsuit",
			"U_B_Wetsuit"
		};
	};
};
class CfgTrading 
{
	/*
	* This factor defines the difference between sales/purchase price of
	* items and vehicles. It is used if there is no sales price defined
	* in CfgExileArsenal. 
	*/
	sellPriceFactor = 0.5;
	
	rekeyPriceFactor = 0;

	class requiredRespect 
	{
		Level1 = -9999999;
		Level2 = 15000;
		Level3 = 25000;
		Level4 = 50000;
	};
};
class CfgTraders
{
	class Exile_Trader_Armory
	{
		name = "ARMORY";
		showWeaponFilter = 1;
		categories[] = 
		{
			"Handguns",
			"Shotguns",
			"SubMachineGuns",
			"LightMachineGuns",
			"AssaultRifles",
			"SniperRifles",
			"PointerAttachments",
			"BipodAttachments",
			"OpticAttachments",
			"Ammunition",
			"Flares",
			"Smokes"			
		};
	};

	class Exile_Trader_SpecialOperations
	{
		name = "SPECIAL OPERATIONS";
		showWeaponFilter = 1; // for noob tubes
		categories[] = 
		{
			"SpecOpsAR",
			"SpecOpsLMG",
			"SpecOpsSR",
			"SpecOpsOptics",
			"MuzzleAttachments",
			"SpecOpsMuzzle",
			"PointerAttachments",
			"BipodAttachments",
			"Ammunition",			
			"SpecOpsAmmo",
			"SpecOpsLaunchers",
			"SpecOpsLauncherAmmo",
			"SpecOpsUniforms",
			"ViperHarnesses",
			"SpecOpsHelmets",
			"SpecOpsSpecial",
			//"SpecOpsNVG",
			"StaticMGs",
			"Explosives"
			//"UAVs",
		};
	};

	class Exile_Trader_Equipment
	{	
		name = "EQUIPMENT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Headgear",
			"Facewear",
			"CivilianUniforms",
			"GuerillaUniforms",
			"MilitaryUniforms",
			"ViperHarnesses",
			"Vests",
			"Backpacks",
			"NVG",
			"EquipmentTools",
			"FirstAid"
		};
	};

	class Exile_Trader_Food
	{
		name = "FAST FOOD";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Food",
			"Drinks"
		};
	};

	class Exile_Trader_Hardware
	{
		name = "HARDWARE";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Hardware",
			"Tools"
		};
	};

	class Exile_Trader_Vehicle
	{
		name = "VEHICLE";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Cars",
			"Trucks"
		};
	};

	class Exile_Trader_Aircraft
	{
		name = "AIRCRAFT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Choppers", 
			"Planes"
		};
	};

	class Exile_Trader_Boat
	{
		name = "BOAT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Boats",
			"Submarines",
			"BoatsArmed"
		};
	};

	class Exile_Trader_Diving
	{
		name = "DIVERS";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Diving"
		};
	};
	/**
	 * Sells Community Items
	 */ 
	class Exile_Trader_CommunityCustoms
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community"
		};
	};

	class Exile_Trader_CommunityCustoms2
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community2"
		};
	};

	class Exile_Trader_CommunityCustoms3
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community3"
		};
	};

	class Exile_Trader_CommunityCustoms4
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community4"
		};
	};

	class Exile_Trader_CommunityCustoms5
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community5"
		};
	};

	class Exile_Trader_CommunityCustoms6
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community6"
		};
	};

	class Exile_Trader_CommunityCustoms7
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community7"
		};
	};

	class Exile_Trader_CommunityCustoms8
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community8"
		};
	};

	class Exile_Trader_CommunityCustoms9
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community9"
		};
	};

	class Exile_Trader_CommunityCustoms10
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community10"
		};
	};
};
class CfgVehicleCustoms
{
	///////////////////////////////////////////////////////////////////////////////
	// QUAD BIKES
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Bike_QuadBike_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Bike_QuadBike_Blue",		100, "Blue",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLUE_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLUE_CO.paa"};},
			{"Exile_Bike_QuadBike_Red",			100, "Red",			{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_RED_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVRED_CO.paa"};},
			{"Exile_Bike_QuadBike_White",		100, "White",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_WHITE_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVWHITE_CO.paa"};},
			{"Exile_Bike_QuadBike_Nato",		150, "NATO",		{"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","\A3\Soft_F\Quadbike_01\Data\Quadbike_01_wheel_co.paa"};},
			{"Exile_Bike_QuadBike_Csat",		150, "CSAT",		{"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_OPFOR_CO.paa","\A3\Soft_F\Quadbike_01\Data\Quadbike_01_wheel_OPFOR_CO.paa"};},
			{"Exile_Bike_QuadBike_Fia",			150, "FIA",			{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_INDP_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_INDP_CO.paa"};},
			{"Exile_Bike_QuadBike_Guerilla01",	150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_IG_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_IG_CO.paa"};},
			{"Exile_Bike_QuadBike_Guerilla02",	150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_INDP_Hunter_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_INDP_Hunter_CO.paa"};},
			{"Exile_Bike_QuadBike_Black",		100, "Black",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLACK_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLACK_CO.paa"};},
			{"Exile_Bike_QuadBike_Black",		100, "Hex",		{"\A3\Soft_f_Exp\Quadbike_01\data\Quadbike_01_ghex_CO.paa","\A3\Soft_f_Exp\Quadbike_01\data\Quadbike_01_wheel_ghex_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// MOTOR BOATS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_MotorBoat_Abstract
	{
		skins[] = 
		{
			{"Exile_Boat_MotorBoat_Police",		350, "Police", {"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_police_co.paa","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_police_co.paa"};},
			{"Exile_Boat_MotorBoat_Orange",		300, "Orange", {"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_rescue_co.paa","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_rescue_co.paa"};},
			{"Exile_Boat_MotorBoat_White",		300, "White",  {"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_co.paa","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// RUBBER DUCKS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_RubberDuck_Abstract
	{
		skins[] = 
		{
			{"Exile_Boat_RubberDuck_CSAT",		200, "CSAT", {"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_OPFOR_CO.paa"};},
			{"Exile_Boat_RubberDuck_Digital",	200, "Digital",{"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_INDP_CO.paa"};},
			{"Exile_Boat_RubberDuck_Orange",	150, "Orange", {"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_rescue_CO.paa"};},
			{"Exile_Boat_RubberDuck_Blue",		150, "Blue", {"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_civilian_CO.paa"};},
			{"Exile_Boat_RubberDuck_Black",		150, "Black", {"\A3\boat_F\Boat_Transport_01\data\boat_transport_01_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// SDV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_SDV_Abstract
	{
		skins[] = 
		{
			{"Exile_Boat_SDV_CSAT",		200, "CSAT", {"\A3\boat_f_beta\SDV_01\data\SDV_ext_opfor_CO.paa"};},
			{"Exile_Boat_SDV_Digital",	200, "Digital", {"\A3\boat_f_beta\SDV_01\data\SDV_ext_INDP_CO.paa"};},
			{"Exile_Boat_SDV_Grey",		100, "Grey", {"\A3\boat_f_beta\SDV_01\data\SDV_ext_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hellcat
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hellcat_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Hellcat_Green", 350, "Green", 	{"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_CO.paa"};},
			{"Exile_Chopper_Hellcat_FIA", 	500, "FIA", 	{"\A3\Air_F_EPB\Heli_Light_03\data\heli_light_03_base_indp_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Karts
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Kart_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Kart_BluKing", 				100, "Bluking", 	{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_blu_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_RedStone", 			100, "RedStone", 	{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_black_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_black_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},
			{"Exile_Car_Kart_Vrana", 				100, "Vrana", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_vrana_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_vrana_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_Green", 				100, "Green", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_green_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_Blue", 				100, "Blue", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_blue_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_Orange", 				100, "Orange",		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_orange_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_White", 				100, "White", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_white_CO.paa","","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_Yellow", 				100, "Yellow", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_yellow_CO.paa","","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_Black", 				100, "Black", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_black_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_black_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};}	
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hummingbird (Civillian)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hummingbird_Civillian_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Hummingbird_Civillian_Blue", 		350, "Blue", 		{"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Red", 		350, "Red", 		{"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_ION", 		350, "ION", 		{"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_BlueLine", 	350, "BlueLine", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueLine_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Digital", 	350, "Digital", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Elliptical", 	350, "Elliptical", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Furious", 	350, "Furious", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_GrayWatcher", 350, "GrayWatcher",	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Jeans", 		350, "Jeans", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Light", 		350, "Light", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Shadow", 		350, "Shadow", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Sheriff", 	350, "Sheriff", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Speedy", 		350, "Speedy", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Sunset", 		350, "Sunset", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Vrana", 		350, "Vrana", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Wasp", 		350, "Wasp", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Wave", 		350, "Wave", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Huron
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huron_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Huron_Black", 	450, "Black", {"\A3\Air_F_Heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"};},
			{"Exile_Chopper_Huron_Green", 	450, "Green", {"\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Orca
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Orca_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Orca_CSAT", 		350, "CSAT", 			{"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_CO.paa"};},
			{"Exile_Chopper_Orca_Black", 		350, "Black", 			{"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa"};},
			{"Exile_Chopper_Orca_BlackCustom", 	350, "Black Custom", 	{"\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Taru
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Taru_CSAT",		500, "CSAT", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_co.paa"};},
			{"Exile_Chopper_Taru_Black",	500, "BLACK", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Taru (Transport)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Transport_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Taru_Transport_CSAT",	500, "CSAT", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_co.paa"};},
			{"Exile_Chopper_Taru_Transport_Black",	500, "Black", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Taru (Covered)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Covered_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Taru_Covered_CSAT",		500, "CSAT",	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_CO.paa"};},
			{"Exile_Chopper_Taru_Covered_Black",	500, "Black",	{"A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Hatchback_Rusty1", 			50, "Rusty White",		{"\exile_assets\model\RTV\Exile_Car_Hatchback_01_co.paa"};},
			{"Exile_Car_Hatchback_Rusty2", 			50, "Rusty Red",		{"\exile_assets\model\RTV\Exile_Car_Hatchback_02_co.paa"};},
			{"Exile_Car_Hatchback_Rusty3", 			50, "Rusty Yellow",		{"\exile_assets\model\RTV\Exile_Car_Hatchback_03_co.paa"};},
			{"Exile_Car_Hatchback_Beige", 			100, "Beige",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE01_CO.paa"};},
			{"Exile_Car_Hatchback_Green", 			100, "Green",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE02_CO.paa"};},
			{"Exile_Car_Hatchback_Blue", 			100, "Blue",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE03_CO.paa"};},
			{"Exile_Car_Hatchback_BlueCustom", 		100, "Blue Custom",		{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE04_CO.paa"};},
			{"Exile_Car_Hatchback_BeigeCustom", 	100, "Beige Custom",	{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE05_CO.paa"};},
			{"Exile_Car_Hatchback_Yellow", 			100, "Yellow",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE06_CO.paa"};},
			{"Exile_Car_Hatchback_Grey", 			100, "Grey",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE07_CO.paa"};},
			{"Exile_Car_Hatchback_Black", 			100, "Black",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE08_CO.paa"};},
			{"Exile_Car_Hatchback_Dark", 			100, "Dark",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE09_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback (Sport)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Sport_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Hatchback_Sport_Red", 		100, "Red",		{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT01_CO.paa"};},
			{"Exile_Car_Hatchback_Sport_Blue", 		100, "Blue",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT02_CO.paa"};},
			{"Exile_Car_Hatchback_Sport_Orange", 	100, "Orange",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT03_CO.paa"};},
			{"Exile_Car_Hatchback_Sport_White", 	100, "White",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT04_CO.paa"};},
			{"Exile_Car_Hatchback_Sport_Beige", 	100, "Beige",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT05_CO.paa"};},
			{"Exile_Car_Hatchback_Sport_Green", 	100, "Green",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT06_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Offroad
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Offroad_Rusty1", 		50, "Rusty White",	{"\exile_assets\model\RTV\Exile_offroad_03_co.paa","\exile_assets\model\RTV\Exile_offroad_03_co.paa"};},
			{"Exile_Car_Offroad_Rusty2", 		50, "Rusty Red",	{"\exile_assets\model\RTV\Exile_offroad_01_co.paa","\exile_assets\model\RTV\Exile_offroad_01_co.paa"};},
			{"Exile_Car_Offroad_Rusty3", 		50, "Rusty Blue",	{"\exile_assets\model\RTV\Exile_offroad_02_co.paa","\exile_assets\model\RTV\Exile_offroad_02_co.paa"};},
			{"Exile_Car_Offroad_Red", 			500, "Red",			{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa"};},
			{"Exile_Car_Offroad_Beige", 		500, "Beige",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa"};},
			{"Exile_Car_Offroad_White", 		500, "White",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa"};},
			{"Exile_Car_Offroad_Blue", 			500, "Blue",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa"};},
			{"Exile_Car_Offroad_DarkRed", 		500, "Dark Red",	{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa"};},
			{"Exile_Car_Offroad_BlueCustom", 	500, "Blue Custom",	{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla01", 	700, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla02", 	700, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla03", 	700, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla04", 	700, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla05", 	700, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla06", 	700, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla07", 	700, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla08", 	700, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla09", 	700, "Guerilla 09",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla10", 	700, "Guerilla 10",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla11", 	700, "Guerilla 11",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla12", 	700, "Guerilla 12",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Black", {"exile_assets\texture\vehicle\Exile_Offroad_Black_co.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Light Blue", {"exile_assets\texture\vehicle\Exile_Offroad_LightBlue_co.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Orange",{"exile_assets\texture\vehicle\Exile_Offroad_Orange_co.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Pink",	{"exile_assets\texture\vehicle\Exile_Offroad_Pink_co.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile White",	{"exile_assets\texture\vehicle\Exile_Offroad_White_co.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Yellow",{"exile_assets\texture\vehicle\Exile_Offroad_Yellow_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Land Rover
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_LandRover_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_LandRover_Red", 250, "Red", {"Exile_psycho_LRC\data\r_lr_base_co.paa","Exile_psycho_LRC\data\r_lr_special_co.paa"};},
			{"Exile_Car_LandRover_Urban", 250, "Urban", {"Exile_psycho_LRC\data\textures\lr_base_urbancamo_co.paa","Exile_psycho_LRC\data\textures\lr_special_urbancamo_co.paa"};},
			{"Exile_Car_LandRover_Green", 250, "Green", {"Exile_psycho_LRC\data\lr_acr_base_co.paa","Exile_psycho_LRC\data\lr_acr_spec_co.paa"};},
			{"Exile_Car_LandRover_Sand", 250, "Sand", {"Exile_psycho_LRC\data\lr_acr_sand_base_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"};},
			{"Exile_Car_LandRover_Desert", 250, "Desert", {"Exile_psycho_LRC\data\lr_acrs_base_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Land Rover (Ambulance)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_LandRover_Ambulance_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_LandRover_Ambulance_Green", 250, "Green", {"Exile_psycho_LRC\data\lr_acr_base_co.paa","Exile_psycho_LRC\data\lr_amb_ext_co.paa","Exile_psycho_LRC\data\lr_acr_spec_co.paa"};},
			{"Exile_Car_LandRover_Ambulance_Desert", 250, "Desert", {"Exile_psycho_LRC\data\lr_acrs_base_co.paa","Exile_psycho_LRC\data\lr_amb_ext_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"};},
			{"Exile_Car_LandRover_Ambulance_Sand", 250, "Sand", {"Exile_psycho_LRC\data\lr_acr_sand_base_co.paa","Exile_psycho_LRC\data\lr_amb_ext_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Octavius
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Octavius_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Octavius_White", 250, "White", {"exile_psycho_Octavia\Data\car_body_co.paa"};},
			{"Exile_Car_Octavius_Black", 250, "Black", {"exile_psycho_Octavia\Data\car_body_bl_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// UH-1H Huey
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huey_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Huey_Green", 700, "Green", {"Exile_psycho_UH1H\data\uh1h_co.paa","Exile_psycho_UH1H\data\uh1h_in_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"};},
			{"Exile_Chopper_Huey_Desert", 700, "Desert", {"Exile_psycho_UH1H\data\uh1d_tka_co.paa","Exile_psycho_UH1H\data\uh1d_in_tka_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// UH-1H Huey (Armed)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huey_Armed_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Huey_Armed_Green", 700, "Green", {"Exile_psycho_UH1H\data\uh1h_co.paa","Exile_psycho_UH1H\data\uh1h_in_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"};},
			{"Exile_Chopper_Huey_Armed_Desert", 700, "Desert", {"Exile_psycho_UH1H\data\uh1d_tka_co.paa","Exile_psycho_UH1H\data\uh1d_in_tka_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Armed)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Armed_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Offroad_Armed_Guerilla01",	250, "Guerilla 01", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla02",	250, "Guerilla 02", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla03",	250, "Guerilla 03", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla04",	250, "Guerilla 04", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla05",	250, "Guerilla 05", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla06",	250, "Guerilla 06", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla07",	250, "Guerilla 07", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla08",	250, "Guerilla 08", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla09",	250, "Guerilla 09", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla10",	250, "Guerilla 10", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla11",	250, "Guerilla 11", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla12",	250, "Guerilla 12", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Repair)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Repair_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Offroad_Repair_Civillian",		150, "Civillian",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\Offroad_01_ext_repair_CIV_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\Offroad_01_ext_repair_CIV_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Red",			150, "Red",			{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Beige",			150, "Beige",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa"};},
			{"Exile_Car_Offroad_Repair_White",			150, "White",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Blue",			150, "Blue",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa"};},
			{"Exile_Car_Offroad_Repair_DarkRed",		150, "DarkRed",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa"};},
			{"Exile_Car_Offroad_Repair_BlueCustom",		150, "BlueCustom",	{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla01",		250, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla02",		250, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla03",		250, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla04",		250, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla05",		250, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla06",		250, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla07",		250, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla08",		250, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla09",		250, "Guerilla 09",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla10",		250, "Guerilla 10",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla11",		250, "Guerilla 11",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla12",		250, "Guerilla 12",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// SUV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUV_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_SUV_Red", 		100, "Red",					{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_CO.paa"};},
			{"Exile_Car_SUV_Black", 	150, "Black",				{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_02_CO.paa"};},
			{"Exile_Car_SUV_Grey", 		100, "Grey",				{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_03_CO.paa"};},
			{"Exile_Car_SUV_Orange", 	100, "Orange",				{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_04_CO.paa"};},
			{"Exile_Car_SUV_Black", 	150, "Snow Camo",			{"exile_assets\texture\vehicle\Exile_SUV_Snow_co.paa"};},
			{"Exile_Car_SUV_Black", 	150, "Leaf Camo",			{"exile_assets\texture\vehicle\Exile_SUV_Leaf_Light_co.paa"};},
			{"Exile_Car_SUV_Black", 	150, "Leaf Camo (Dark)",	{"exile_assets\texture\vehicle\Exile_SUV_Leaf_Dark_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// SUV XL
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUVXL_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_SUVXL_Black", 100, "Black", {""};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Van 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Van_Black",			100, "Black",		{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_White",			100, "White",		{"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_Red",			100, "Red",			{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_Guerilla01",	150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_01_CO.paa"};},
			{"Exile_Car_Van_Guerilla02",	150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_02_CO.paa"};},
			{"Exile_Car_Van_Guerilla03",	150, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_03_CO.paa"};},
			{"Exile_Car_Van_Guerilla04",	150, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_04_CO.paa"};},
			{"Exile_Car_Van_Guerilla05",	150, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_05_CO.paa"};},
			{"Exile_Car_Van_Guerilla06",	150, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_06_CO.paa"};},
			{"Exile_Car_Van_Guerilla07",	150, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_07_CO.paa"};},
			{"Exile_Car_Van_Guerilla08",	150, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_08_CO.paa"};},
			{"Exile_Car_Van_Black",	150, "Brown",	{"\A3\Soft_F_Exp\Van_01\Data\Van_01_ext_brn_co.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\A3\Soft_F_Exp\Van_01\Data\Van_01_int_base_2_CO.paa"};},
			{"Exile_Car_Van_Black",	150, "Olive",	{"\A3\Soft_F_Exp\Van_01\Data\Van_01_ext_oli_co.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa","\A3\Soft_F_Exp\Van_01\Data\Van_01_int_base_3_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Van (Box) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Box_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Van_Box_Black",				100, "Black",		{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_Box_White",				100, "White",		{"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_Box_Red",				100, "Red",			{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla01",		150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_01_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla02",		150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_02_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla03",		150, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_03_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla04",		150, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_04_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla05",		150, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_05_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla06",		150, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_06_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla07",		150, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_07_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla08",		150, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_08_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Van (Fuel) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Fuel_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Van_Fuel_Black",			100, "Black",		{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"};},
			{"Exile_Car_Van_Fuel_White",			100, "White",		{"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"};},
			{"Exile_Car_Van_Fuel_Red",				100, "Red",			{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"};},
			{"Exile_Car_Van_Fuel_Guerilla01",		150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_01_CO.paa"};},
			{"Exile_Car_Van_Fuel_Guerilla02",		150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_02_CO.paa"};},
			{"Exile_Car_Van_Fuel_Guerilla03",		150, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_03_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// Tempest
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Tempest_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Tempest", 		200, "Green Hex",	{"\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext01_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_ext02_ghex_CO.paa","\A3\Soft_F_Exp\Truck_03\Data\Truck_03_cargo_ghex_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Ikarus
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ikarus_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Ikarus_Blue", 		200, "Blue",	{"Exile_psycho_Ikarus\Data\bus_exterior_co.paa"};},
			{"Exile_Car_Ikarus_Red", 		200, "Red",		{"Exile_psycho_Ikarus\Data\bus_exterior_eciv_co.paa"};},
			{"Exile_Car_Ikarus_Party", 		500, "Party",	{"Exile_psycho_Ikarus\Data\bus_exterior_eciv_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Ural (Open)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ural_Open_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Ural_Open_Blue",			300, "Blue",		{"Exile_psycho_Ural\data\Ural_kabina_civil_co.paa","Exile_psycho_Ural\data\ural_plachta_civil_co.paa"};},
			{"Exile_Car_Ural_Open_Yellow",			300, "Yellow",		{"Exile_psycho_Ural\data\ural_kabina_civ1_co.paa","Exile_psycho_Ural\data\ural_plachta_civ1_co.paa"};},
			{"Exile_Car_Ural_Open_Worker",			300, "Worker",		{"Exile_psycho_Ural\data\ural_kabina_civ2_co.paa","Exile_psycho_Ural\data\Ural_plachta_civil_co.paa"};},
			{"Exile_Car_Ural_Open_Military",		300, "Military",	{"Exile_psycho_Ural\data\ural_kabina_khk_co.paa","Exile_psycho_Ural\data\ural_plachta_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Ural (Covered)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ural_Covered_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Ural_Covered_Blue",			300, "Blue",		{"Exile_psycho_Ural\data\ural_kabina_civil_co.paa","Exile_psycho_Ural\data\ural_plachta_civil_co.paa"};},
			{"Exile_Car_Ural_Covered_Yellow",		300, "Yellow",		{"Exile_psycho_Ural\data\ural_kabina_civ1_co.paa","Exile_psycho_Ural\data\ural_plachta_civ1_co.paa"};},
			{"Exile_Car_Ural_Covered_Worker",		300, "Worker",		{"Exile_psycho_Ural\data\ural_kabina_civ2_co.paa","Exile_psycho_Ural\data\Ural_plachta_civil_co.paa"};},
			{"Exile_Car_Ural_Covered_Military",		300, "Military",	{"Exile_psycho_Ural\data\ural_kabina_khk_co.paa","Exile_psycho_Ural\data\ural_plachta_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Lada
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Lada_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Lada_Green", 		100, "Green",	{"exile_psycho_lada\data\lada_eciv1_co.paa","exile_psycho_lada\data\Lada_glass_ECIV1_CA.paa"};},
			{"Exile_Car_Lada_Taxi", 		100, "Taxi",	{"exile_psycho_lada\data\Lada_red_CO.paa"};},
			{"Exile_Car_Lada_Red", 			100, "Red",		{"exile_psycho_lada\data\Lada_red_CO.paa"};},
			{"Exile_Car_Lada_Hipster", 		100, "Hipster",	{"exile_psycho_lada\data\lada_eciv2_co.paa","exile_psycho_lada\data\Lada_glass_ECIV2_CA.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Volha
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Volha_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Volha_Blue", 		100, "Blue",	{"Exile_psycho_Gaz_volha\data\Volha_ECIV_CO.paa"};},
			{"Exile_Car_Volha_White", 		100, "White",	{"Exile_psycho_Gaz_volha\data\Volha_Gray_ECIV_CO.paa"};},
			{"Exile_Car_Volha_Black",		100, "Black",	{"Exile_psycho_Gaz_volha\data\Volha_Black_ECIV_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// HUNTER
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hunter_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Car_Hunter",		1000, "Exile White Edition",	{"exile_assets\texture\vehicle\Exile_Hunter_Snow_co.paa","exile_assets\texture\vehicle\Exile_Hunter_Snow_Back_co.paa"};},
			{"Exile_Car_Hunter",		1000, "Exile Hex",				{"exile_assets\texture\vehicle\Exile_Hunter_Hex_co.paa","exile_assets\texture\vehicle\Exile_Hunter_Black_Back_co.paa"};},
			{"Exile_Car_Hunter",		1000, "Exile Black",			{"exile_assets\texture\vehicle\Exile_Hunter_Black_co.paa","exile_assets\texture\vehicle\Exile_Hunter_Black_Back_co.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// IFRIT
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ifrit_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Car_Ifrit",		1000, "Green Hex",	{"\A3\Soft_F_Exp\MRAP_02\data\MRAP_02_ext_01_ghex_CO.paa","\A3\Soft_F_Exp\MRAP_02\data\MRAP_02_ext_02_ghex_CO.paa","\A3\Data_F_Exp\Vehicles\Turret_ghex_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// HMMWV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_HMMWV_M2_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Car_HMMWV_M2_Green",		1000, "Green",	{"Exile_psycho_hmmw\data\hmmwv_body_co.paa"};},
			{"Exile_Car_HMMWV_M2_Desert",		1000, "Desert",	{"Exile_psycho_hmmw\data\des\hmmwv_body_co.paa"};}
		};
	};
	
	class Exile_Car_HMMWV_M134_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Car_HMMWV_M134_Green",		1000, "Green",	{"Exile_psycho_hmmw\data\hmmwv_body_co.paa"};},
			{"Exile_Car_HMMWV_M134_Desert",		1000, "Desert",	{"Exile_psycho_hmmw\data\des\hmmwv_body_co.paa"};}
		};
	};
	
	class Exile_Car_HMMWV_MEV_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Car_HMMWV_MEV_Green",		1000, "Green",	{"Exile_psycho_hmmw\data\hmmwv_body_cm.paa"};},
			{"Exile_Car_HMMWV_MEV_Desert",		1000, "Desert",	{"Exile_psycho_hmmw\data\des\hmmwv_body_cm.paa"};}
		};
	};
	
	class Exile_Car_HMMWV_UNA_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Car_HMMWV_UNA_Green",		1000, "Green",	{"Exile_psycho_hmmw\data\hmmwv_body_co.paa"};},
			{"Exile_Car_HMMWV_UNA_Desert",		1000, "Desert",	{"Exile_psycho_hmmw\data\des\hmmwv_body_co.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// BTR40
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_BTR40_MG_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Car_BTR40_MG_Green",		1000, "Green",	{"exile_psycho_btr40\data\btr40ext_co.paa"};},
			{"Exile_Car_BTR40_MG_Camo",			1000, "Camo",	{"exile_psycho_btr40\data\btr40extcamo_co.paa"};}
		};
	};
	
	class Exile_Car_BTR40_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Car_BTR40_Green",			1000, "Green",	{"exile_psycho_btr40\data\btr40ext_co.paa"};},
			{"Exile_Car_BTR40_Camo",			1000, "Camo",	{"exile_psycho_btr40\data\btr40extcamo_co.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// Golf
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Golf_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Car_Golf_Red",				1000, "Red",	{"exile_psycho_VWGolf\data\vwgolf_body_co.paa"};},
			{"Exile_Car_Golf_Black",			1000, "Black",	{"exile_psycho_VWGolf\data\texture\black_co.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// AN-2
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Plane_AN2_Abstract
	{
		skins[] = 
		{
			{"Exile_Plane_AN2_Green", 700, "Green", {"Exile_psycho_An2\data\an2_1_co.paa","Exile_psycho_An2\data\an2_2_co.paa","Exile_psycho_An2\data\an2_wings_co.paa"};},
			{"Exile_Plane_AN2_White", 700, "Red, White & Blue", {"Exile_psycho_An2\data\an2_1_a_co.paa",
		"Exile_psycho_An2\data\an2_2_a_co.paa","Exile_psycho_An2\data\an2_wings_a_co.paa"};},
			{"Exile_Plane_AN2_Stripe", 700, "Green Stripe", {"Exile_psycho_An2\data\an2_1_b_co.paa","Exile_psycho_An2\data\an2_2_b_co.paa","Exile_psycho_An2\data\an2_wings_b_co.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// RHIB
	///////////////////////////////////////////////////////////////////////////////
	class B_G_Boat_Transport_02_F
	{
		skins[] = 
		{
			{"Exile_Boat_RHIB",		150, "Blue", {"\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_exterior_civilian_CO.paa","\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_interior_2_civilian_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// Water Scooter
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_WaterScooter_Abstract
	{
		skins[] = 
		{
			{"Exile_Boat_WaterScooter",		150, "Blue", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Blue_co.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Blue_co.paa"};},
			{"Exile_Boat_WaterScooter",		150, "Grey", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Grey_co.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Grey_co.paa"};},
			{"Exile_Boat_WaterScooter",		150, "Lime", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Lime_co.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Lime_co.paa"};},
			{"Exile_Boat_WaterScooter",		150, "Red", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Red_CO.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"};},
			{"Exile_Boat_WaterScooter",		150, "White", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_CO.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"};},
			{"Exile_Boat_WaterScooter",		150, "Yellow", {"\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa","\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// Ceasar BTT
	///////////////////////////////////////////////////////////////////////////////
	class C_Plane_Civil_01_F
	{
		skins[] = 
		{
			{"Exile_Plane_Ceasar",		150, "Racing (Tan Interior)", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};},
			{"Exile_Plane_Ceasar",		150, "Racing", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};},
			{"Exile_Plane_Ceasar",		150, "Red Line (Tan Interior)", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};},
			{"Exile_Plane_Ceasar",		150, "Tribal (Tan Interior)", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};},
			{"Exile_Plane_Ceasar",		150, "Tribal", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};},
			{"Exile_Plane_Ceasar",		150, "Blue Wave (Tan Interior)", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"};},
			{"Exile_Plane_Ceasar",		150, "Blue Wave", {"A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// V-44 X Blackfish (Infantry Transport)
	///////////////////////////////////////////////////////////////////////////////
	class B_T_VTOL_01_infantry_F
	{
		skins[] = 
		{
			{"Exile_Plane_BlackfishInfantry",		150, "Blue", {"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// V-44 X Blackfish (Vehicle Transport)
	///////////////////////////////////////////////////////////////////////////////
	class B_T_VTOL_01_vehicle_F
	{
		skins[] = 
		{
			{"Exile_Plane_BlackfishVehicle",		150, "Blue", {"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa","\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// Prowler (Light)
	///////////////////////////////////////////////////////////////////////////////
	class B_CTRG_LSV_01_light_F
	{
		skins[] = 
		{
			{"Exile_Car_ProwlerLight",		150, "Black", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_black_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_black_CO.paa"};},
			{"Exile_Car_ProwlerLight",		150, "Dazzle", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_dazzle_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"};},
			{"Exile_Car_ProwlerLight",		150, "Sand", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_sand_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// Prowler (Unarmed)
	///////////////////////////////////////////////////////////////////////////////
	class B_T_LSV_01_unarmed_black_F
	{
		skins[] = 
		{
			{"Exile_Car_ProwlerUnarmed",		150, "Olive", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"};},
			{"Exile_Car_ProwlerUnarmed",		150, "Dazzle", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_dazzle_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"};},
			{"Exile_Car_ProwlerUnarmed",		150, "Sand", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_sand_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// Qilin (Unarmed)
	///////////////////////////////////////////////////////////////////////////////
	class O_T_LSV_02_unarmed_black_F
	{
		skins[] = 
		{
			{"Exile_Car_QilinUnarmed",		150, "Arid", {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_arid_CO.paa"};},
			{"Exile_Car_QilinUnarmed",		150, "Green Hex", {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_ghex_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// MB 4WD
	///////////////////////////////////////////////////////////////////////////////
	class C_Offroad_02_unarmed_orange_F
	{
		skins[] = 
		{
			{"Exile_Car_MB4WD",		150, "Black", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"};},
			{"Exile_Car_MB4WD",		150, "Blue", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"};},
			{"Exile_Car_MB4WD",		150, "Brown", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"};},
			{"Exile_Car_MB4WD",		150, "Green", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"};},
			{"Exile_Car_MB4WD",		150, "Olive", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};},
			{"Exile_Car_MB4WD",		150, "Red", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"};},
			{"Exile_Car_MB4WD",		150, "White", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"};}
		};
	};
	
	class I_C_Offroad_02_unarmed_F
	{
		skins[] = 
		{
			{"Exile_Car_MB4WDOpen",		150, "Black", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_black_co.paa"};},
			{"Exile_Car_MB4WDOpen",		150, "Blue", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"};},
			{"Exile_Car_MB4WDOpen",		150, "Brown", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"};},
			{"Exile_Car_MB4WDOpen",		150, "Green", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"};},
			{"Exile_Car_MB4WDOpen",		150, "Orange", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa"};},
			{"Exile_Car_MB4WDOpen",		150, "Red", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"};},
			{"Exile_Car_MB4WDOpen",		150, "White", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"};},
			{"Exile_Car_MB4WDOpen",		150, "Olive", {"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa","\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};}
		};
	};
};
class CfgVehicleTransport 
{
	class Exile_Container_SupplyBox
	{
		vehicles[] = {"Exile_Car_Van_Abstract", "Exile_Car_Offroad_Abstract", "Exile_Car_Zamak_Abstract", "Exile_Car_HEMMT_Abstract", "Exile_Car_Tempest_Abstract"};

		class Exile_Car_Van_Abstract
		{
			attachPosition[] = {0, -1.1, 0.2};
			cargoIndizes[] = {2, 3, 4, 5, 6, 7}; 
			detachPosition[] = {0, -4.4};
		};

		class Exile_Car_Offroad_Abstract
		{
			attachPosition[] = {0, -1.6, 0.4};
			cargoIndizes[] = {1, 2, 3, 4}; 
			detachPosition[] = {0, -4};
		};

		class Exile_Car_Zamak_Abstract
		{
			attachPosition[] = {0.03, 0.3, 0};
			cargoIndizes[] = {2, 3, 4, 5, 6, 7}; 
			detachPosition[] = {0.03, -4.8};
		};

		class Exile_Car_HEMMT_Abstract
		{
			attachPosition[] = {0.05, -0.1, 0.3};
			cargoIndizes[] = {1, 2, 8, 9}; 
			detachPosition[] = {0.05, -6.1};
		};

		class Exile_Car_Tempest_Abstract
		{
			attachPosition[] = {0.08, -0.85, 0.4};
			cargoIndizes[] = {1, 6, 7, 9}; 
			detachPosition[] = {0.08, -6};
		};
	};
};
class CfgXM8
{
	extraApps[] = {"GG_VG","GG_CHVD","GG_Journal","GG_Quad","GG_Selfie","GG_Scan","GG_Chat","GG_Craft","GG_AirDrop","GG_kills"};
	
	class GG_VG 
	{
		title = "Virtual Garage";
		controlID = 50000;					//IDC:50000 -> 50015 || These need to be unique and out of range from each other 
		logo = "GG\ExAdClient\XM8\Apps\VG\Icon_VG.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\VG\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\VG\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\VG\onClose.sqf";
	};
	class GG_CHVD 
	{
		title = "View Distance Settings";
		controlID = 50200;					//IDC:50200 -> 50102 || These need to be unique and out of range from each other
		config = "GG\ExAdClient\XM8\Apps\CHVD\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\CHVD\Icon_CHVD.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\CHVD\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\CHVD\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\CHVD\onClose.sqf";
	};		
	class GG_Journal 
	{
		title = "Journal";
		controlID = 50300;					//IDC:50300 -> 50305 || These need to be unique and out of range from each other
		config = "GG\ExAdClient\XM8\Apps\Journal\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\Journal\Icon_Journal.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\Journal\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\Journal\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\Journal\onClose.sqf";
	};
	class GG_Quad
	{
		title = "Deploy Quad";
		bambiState = 0;
		vehicleClass = "Exile_Bike_QuadBike_Fia";
		recipe[] = {{"Exile_Item_ExtensionCord",1}};
		packable = 1;
		autoCleanUp = 1;
		quickFunction = "['GG_Quad'] call ExAd_XM8_DV_fnc_spawnVehicle";
		logo = "GG\ExAdClient\XM8\Apps\DeployVehicle\icon_DeployVehicle.paa";
		config = "GG\ExAdClient\XM8\Apps\DeployVehicle\config.sqf";
	};
	class GG_Selfie
	{
		title = "Selfie";
		config = "GG\ExAdClient\XM8\Apps\Selfie\config.sqf";
		quickFunction = "['GG_Selfie'] spawn ExAd_XM8_Selfie_fnc_TakeSelfie";
		logo = "GG\ExAdClient\XM8\Apps\Selfie\icon_Selfie.paa";
	};
	class GG_Scan
	{
		title = "Player Scan";
		config = "GG\ExAdClient\XM8\Apps\Scan\config.sqf";
		cooldownTime = 120; //cool down time on script in seconds (15 * 60 = 900) AKA 15 MINS
		scanDistance = 1000; //area sround player to scan in meters
		quickFunction = "['GG_Scan'] spawn ExAd_XM8_Scan_fnc_ScanPlayer";
		logo = "GG\ExAdClient\XM8\Apps\Scan\icon_Scan.paa";
	};
	class GG_Chat
	{
		title = "Private Chat";
		quickFunction = "createdialog 'infiSTAR_CHAT';";
		logo = "GG\ExAdClient\XM8\Apps\Chat\icon_Chat.paa";
	};
	class GG_Craft 
	{
		title = "Crafting Menu";
		controlID = 50400;
		config = "GG\ExAdClient\XM8\Apps\Crafting\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\Crafting\icon_Crafing.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\Crafting\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\Crafting\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\Crafting\onClose.sqf";
	};	
	class GG_AirDrop 
	{
		title = "Air Drop";
		controlID = 50500;
		config = "GG\ExAdClient\XM8\Apps\AirDrop\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\AirDrop\icon_AirDrop.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\AirDrop\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\AirDrop\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\AirDrop\onClose.sqf";
	};	
	class GG_kills
	{
		title = "Kill Board";
		quickFunction = "call XG_killboardClient";
		logo = "GG\ExAdClient\XM8\Apps\Kills\icon_Kills.paa"; // CHANGE
	};	
}; 
class CfgVon
{
	// self explanitory isnt it
	class global
	{
		id = 0;
		text = 0;
		von = 0;
	};

	class side
	{
		id = 1;
		text = 1;
		von = 0;
	};

	class command
	{
		id = 2;
		text = 0;
		von = 0;
	};

	class group

	{
		id = 3;
		text = 1;
		von = 1;
	};

	class vehicle
	{
		id = 4;
		text = 1;
		von = 1;
	};

	class direct
	{
		id = 5;
		text = 1;
		von = 1;
	};
};