/**
 * config
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
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
		{2, "SatchelCharge_Remote_Mag"}
	};
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
		{2, "DemoCharge_Remote_Mag"}
	};
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
};
/*
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
};
*/
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
};
/*class CraftRazorWireKit: Exile_AbstractCraftingRecipe
{
	name = "Craft Razor Wire Kit Kit";
	pictureItem = "Exile_Item_RazorWireKit_Long";
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
		{2, "Exile_Item_MetalPole"},
		{4, "Exile_Item_MetalWire"},
		{1, "Exile_Item_MetalScrews"}
	};

};*/
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
};
class CraftRepairKitMetal: Exile_AbstractCraftingRecipe
{
	name = "Craft Metal Repair Kit";
	pictureItem = "Exile_Item_MetalBoard";
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_RepairKitMetal"}
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
};
class CraftPopTabs: Exile_AbstractCraftingRecipe
{
	name = "Make Money";
	pictureItem = "Exile_Item_Can_Empty";
	returnedItems[] =
	{
		{1, "Exile_Item_Can_Empty"}
	};
	components[] = 
	{
		{1, "Exile_Item_Magazine01"},
		{1, "Exile_Item_Magazine02"},
		{1, "Exile_Item_Magazine03"},
		{1, "Exile_Item_Magazine04"}
	};
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
};
};
class CfgExileArsenal
{
	class Exile_Uniform_BambiOverall				{ quality = 1; price = 1; sellPrice = 1; };
	///////////////////////////////////////////////////////////////////////////////
	// Civillian Clothing
	///////////////////////////////////////////////////////////////////////////////
	class U_C_Journalist 							{ quality = 1; price = 50; };
	class U_C_Poloshirt_blue 						{ quality = 1; price = 50; };
	class U_C_Poloshirt_burgundy 					{ quality = 1; price = 50; };
	class U_C_Poloshirt_salmon 						{ quality = 1; price = 50; };
	class U_C_Poloshirt_stripped 					{ quality = 1; price = 50; };
	class U_C_Poloshirt_tricolour 					{ quality = 1; price = 50; };
	class U_C_Poor_1 								{ quality = 1; price = 25; };
	class U_C_Poor_2 								{ quality = 1; price = 25; };
	class U_C_Poor_shorts_1 						{ quality = 1; price = 25; };
	class U_C_Scientist 							{ quality = 1; price = 50; };
	class U_OrestesBody 							{ quality = 1; price = 75; };
	class U_Rangemaster 							{ quality = 1; price = 75; };
	class U_NikosAgedBody 							{ quality = 1; price = 75; };
	class U_NikosBody 								{ quality = 1; price = 75; };
	class U_Competitor 								{ quality = 1; price = 75; };

	///////////////////////////////////////////////////////////////////////////////
	// Soldier Uniforms
	///////////////////////////////////////////////////////////////////////////////
	class U_B_CombatUniform_mcam 					{ quality = 2; price = 150; };
	class U_B_CombatUniform_mcam_tshirt 			{ quality = 2; price = 150; };
	class U_B_CombatUniform_mcam_vest 				{ quality = 2; price = 150; };
	class U_B_CombatUniform_mcam_worn 				{ quality = 2; price = 150; };
	class U_B_CTRG_1 								{ quality = 2; price = 150; };
	class U_B_CTRG_2 								{ quality = 2; price = 150; };
	class U_B_CTRG_3								{ quality = 2; price = 150; };
	class U_I_CombatUniform 						{ quality = 2; price = 150; };
	class U_I_CombatUniform_shortsleeve				{ quality = 2; price = 150; };
	class U_I_CombatUniform_tshirt					{ quality = 2; price = 150; };
	class U_I_OfficerUniform						{ quality = 2; price = 150; };
	class U_O_CombatUniform_ocamo 					{ quality = 2; price = 150; };
	class U_O_CombatUniform_oucamo 					{ quality = 2; price = 150; };
	class U_O_OfficerUniform_ocamo 					{ quality = 2; price = 200; };
	class U_B_SpecopsUniform_sgg 					{ quality = 2; price = 200; };
	class U_O_SpecopsUniform_blk 					{ quality = 2; price = 200; };
	class U_O_SpecopsUniform_ocamo 					{ quality = 2; price = 200; };
	class U_I_G_Story_Protagonist_F 				{ quality = 2; price = 225; };
	class Exile_Uniform_Woodland 					{ quality = 3; price = 500; };

	///////////////////////////////////////////////////////////////////////////////
	// Guerilla Uniforms
	///////////////////////////////////////////////////////////////////////////////
	class U_C_HunterBody_grn						{ quality = 2; price = 145; };
	class U_IG_Guerilla1_1							{ quality = 2; price = 145; };
	class U_IG_Guerilla2_1							{ quality = 2; price = 165; };
	class U_IG_Guerilla2_2							{ quality = 2; price = 145; };
	class U_IG_Guerilla2_3							{ quality = 2; price = 145; };
	class U_IG_Guerilla3_1							{ quality = 2; price = 145; };
	class U_BG_Guerilla2_1							{ quality = 2; price = 145; };
	class U_IG_Guerilla3_2							{ quality = 2; price = 145; };
	class U_BG_Guerrilla_6_1						{ quality = 2; price = 160; };
	class U_BG_Guerilla1_1							{ quality = 2; price = 145; };
	class U_BG_Guerilla2_2							{ quality = 2; price = 145; };
	class U_BG_Guerilla2_3							{ quality = 2; price = 145; };
	class U_BG_Guerilla3_1							{ quality = 2; price = 140; };
	class U_BG_leader								{ quality = 2; price = 140; };
	class U_IG_leader								{ quality = 2; price = 140; };
	class U_I_G_resistanceLeader_F					{ quality = 2; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Ghillie Suits
	///////////////////////////////////////////////////////////////////////////////
	class U_B_FullGhillie_ard						{ quality = 3; price = 500; };
	class U_B_FullGhillie_lsh						{ quality = 3; price = 500; };
	class U_B_FullGhillie_sard						{ quality = 3; price = 500; };
	class U_B_GhillieSuit							{ quality = 2; price = 500; };
	class U_I_FullGhillie_ard						{ quality = 3; price = 500; };
	class U_I_FullGhillie_lsh						{ quality = 3; price = 500; };
	class U_I_FullGhillie_sard						{ quality = 3; price = 500; };
	class U_I_GhillieSuit							{ quality = 2; price = 500; };
	class U_O_FullGhillie_ard						{ quality = 3; price = 500; };
	class U_O_FullGhillie_lsh						{ quality = 3; price = 500; };
	class U_O_FullGhillie_sard						{ quality = 3; price = 500; };
	class U_O_GhillieSuit							{ quality = 2; price = 500; };

	///////////////////////////////////////////////////////////////////////////////
	// Wet Suits
	///////////////////////////////////////////////////////////////////////////////
	class U_I_Wetsuit								{ quality = 2; price = 350; };
	class U_O_Wetsuit								{ quality = 2; price = 350; };
	class U_B_Wetsuit								{ quality = 2; price = 350; };
	class U_B_survival_uniform						{ quality = 2; price = 350; };

	///////////////////////////////////////////////////////////////////////////////
	// Bandolliers
	///////////////////////////////////////////////////////////////////////////////
	class V_BandollierB_blk							{ quality = 1; price = 100; };
	class V_BandollierB_cbr							{ quality = 1; price = 100; };
	class V_BandollierB_khk							{ quality = 1; price = 100; };
	class V_BandollierB_oli							{ quality = 1; price = 100; };
	class V_BandollierB_rgr							{ quality = 1; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Chestrigs
	///////////////////////////////////////////////////////////////////////////////
	class V_Chestrig_blk 							{ quality = 1; price = 70; };
	class V_Chestrig_khk 							{ quality = 1; price = 70; };
	class V_Chestrig_oli 							{ quality = 1; price = 70; };
	class V_Chestrig_rgr 							{ quality = 1; price = 70; };

	///////////////////////////////////////////////////////////////////////////////
	// Vests
	///////////////////////////////////////////////////////////////////////////////
	class V_Press_F									{ quality = 2; price = 120; };
	class V_Rangemaster_belt						{ quality = 2; price = 120; };
	class V_TacVest_blk								{ quality = 2; price = 200; };
	class V_TacVest_blk_POLICE						{ quality = 2; price = 500; };
	class V_TacVest_brn								{ quality = 2; price = 150; };
	class V_TacVest_camo							{ quality = 2; price = 150; };
	class V_TacVest_khk								{ quality = 2; price = 150; };
	class V_TacVest_oli								{ quality = 2; price = 150; };
	class V_TacVestCamo_khk							{ quality = 2; price = 150; };
	class V_TacVestIR_blk							{ quality = 2; price = 150; };
	class V_I_G_resistanceLeader_F					{ quality = 2; price = 175; };

	///////////////////////////////////////////////////////////////////////////////
	// Harnesses
	///////////////////////////////////////////////////////////////////////////////
	class V_HarnessO_brn							{ quality = 1; price = 100; };
	class V_HarnessO_gry							{ quality = 1; price = 100; };
	class V_HarnessOGL_brn							{ quality = 1; price = 100; };
	class V_HarnessOGL_gry							{ quality = 1; price = 100; };
	class V_HarnessOSpec_brn						{ quality = 1; price = 100; };
	class V_HarnessOSpec_gry						{ quality = 1; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Plate Carriers
	///////////////////////////////////////////////////////////////////////////////
	class V_PlateCarrier1_blk 						{ quality = 3; price = 300; };
	class V_PlateCarrier1_rgr 						{ quality = 3; price = 300; };
	class V_PlateCarrier2_rgr 						{ quality = 3; price = 300; };
	class V_PlateCarrier3_rgr 						{ quality = 3; price = 300; };
	class V_PlateCarrierGL_blk 						{ quality = 3; price = 500; };
	class V_PlateCarrierGL_mtp 						{ quality = 3; price = 500; };
	class V_PlateCarrierGL_rgr 						{ quality = 3; price = 500; };
	class V_PlateCarrierH_CTRG 						{ quality = 3; price = 400; };
	class V_PlateCarrierIA1_dgtl 					{ quality = 3; price = 300; };
	class V_PlateCarrierIA2_dgtl 					{ quality = 3; price = 300; };
	class V_PlateCarrierIAGL_dgtl 					{ quality = 3; price = 300; };
	class V_PlateCarrierIAGL_oli 					{ quality = 3; price = 400; };
	class V_PlateCarrierL_CTRG 						{ quality = 3; price = 400; };
	class V_PlateCarrierSpec_blk 					{ quality = 3; price = 600; };
	class V_PlateCarrierSpec_mtp 					{ quality = 3; price = 600; };
	class V_PlateCarrierSpec_rgr 					{ quality = 3; price = 600; };

	///////////////////////////////////////////////////////////////////////////////
	// Caps
	///////////////////////////////////////////////////////////////////////////////
	class H_Cap_blk 								{ quality = 1; price = 6; };
	class H_Cap_blk_Raven 							{ quality = 1; price = 6; };
	class H_Cap_blu 								{ quality = 1; price = 6; };
	class H_Cap_brn_SPECOPS 						{ quality = 1; price = 6; };
	class H_Cap_grn 								{ quality = 1; price = 6; };
	class H_Cap_headphones 							{ quality = 1; price = 6; };
	class H_Cap_khaki_specops_UK 					{ quality = 1; price = 6; };
	class H_Cap_oli 								{ quality = 1; price = 6; };
	class H_Cap_press 								{ quality = 1; price = 6; };
	class H_Cap_red 								{ quality = 1; price = 6; };
	class H_Cap_tan 								{ quality = 1; price = 6; };
	class H_Cap_tan_specops_US 						{ quality = 1; price = 6; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Glasses
	///////////////////////////////////////////////////////////////////////////////
	class G_Spectacles			 		{ quality = 1; price = 6; };
	class G_Spectacles_Tinted			{ quality = 1; price = 6; };
	class G_Combat			 			{ quality = 1; price = 6; };
	class G_Lowprofile			 		{ quality = 1; price = 6; };
	class G_Shades_Black			 	{ quality = 1; price = 6; };
	class G_Shades_Green			 	{ quality = 1; price = 6; };
	class G_Shades_Red			 		{ quality = 1; price = 6; };
	class G_Squares			 			{ quality = 1; price = 6; };
	class G_Squares_Tinted			 	{ quality = 1; price = 6; };
	class G_Sport_BlackWhite			{ quality = 1; price = 6; };
	class G_Sport_Blackyellow			{ quality = 1; price = 6; };
	class G_Sport_Greenblack			{ quality = 1; price = 6; };
	class G_Sport_Checkered			 	{ quality = 1; price = 6; };
	class G_Sport_Red			 		{ quality = 1; price = 6; };
	class G_Tactical_Black			 	{ quality = 1; price = 6; };
	class G_Aviator			 			{ quality = 1; price = 6; };
	class G_Lady_Mirror			 		{ quality = 1; price = 6; };
	class G_Lady_Dark			 		{ quality = 1; price = 6; };
	class G_Lady_Red			 		{ quality = 1; price = 6; };
	class G_Lady_Blue			 		{ quality = 1; price = 6; };
	class G_Diving			 			{ quality = 1; price = 6; };
	class G_B_Diving			 		{ quality = 1; price = 6; };
	class G_O_Diving			 		{ quality = 1; price = 6; };
	class G_I_Diving			 		{ quality = 1; price = 6; };
	class G_Goggles_VR			 		{ quality = 1; price = 6; };
	class G_Balaclava_blk			 	{ quality = 2; price = 10; };
	class G_Balaclava_oli			 	{ quality = 2; price = 10; };
	class G_Balaclava_combat			{ quality = 2; price = 10; };
	class G_Balaclava_lowprofile		{ quality = 2; price = 10; };
	class G_Bandanna_blk			 	{ quality = 1; price = 6; };
	class G_Bandanna_oli			 	{ quality = 1; price = 6; };
	class G_Bandanna_khk			 	{ quality = 1; price = 6; };
	class G_Bandanna_tan			 	{ quality = 1; price = 6; };
	class G_Bandanna_beast			 	{ quality = 1; price = 6; };
	class G_Bandanna_shades			 	{ quality = 1; price = 6; };
	class G_Bandanna_sport			 	{ quality = 1; price = 6; };
	class G_Bandanna_aviator			{ quality = 1; price = 6; };
	class G_Shades_Blue			 		{ quality = 1; price = 6; };
	class G_Sport_Blackred			 	{ quality = 1; price = 6; };
	class G_Tactical_Clear			 	{ quality = 1; price = 6; };
	class G_Balaclava_TI_blk_F			{ quality = 2; price = 15; };
	class G_Balaclava_TI_tna_F			{ quality = 2; price = 15; };
	class G_Balaclava_TI_G_blk_F		{ quality = 2; price = 15; };
	class G_Balaclava_TI_G_tna_F		{ quality = 2; price = 15; };
	class G_Combat_Goggles_tna_F		{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Military Caps
	///////////////////////////////////////////////////////////////////////////////
	class H_MilCap_blue 							{ quality = 1; price = 20; };
	class H_MilCap_dgtl 							{ quality = 1; price = 20; };
	class H_MilCap_mcamo 							{ quality = 1; price = 20; };
	class H_MilCap_ocamo 							{ quality = 1; price = 20; };
	class H_MilCap_oucamo 							{ quality = 1; price = 20; };
	class H_MilCap_rucamo 							{ quality = 1; price = 20; };

	///////////////////////////////////////////////////////////////////////////////
	// Beanies
	///////////////////////////////////////////////////////////////////////////////
	class H_Watchcap_blk 							{ quality = 1; price = 50; };
	class H_Watchcap_camo 							{ quality = 1; price = 50; };
	class H_Watchcap_khk 							{ quality = 1; price = 50; };
	class H_Watchcap_sgg 							{ quality = 1; price = 50; };

	///////////////////////////////////////////////////////////////////////////////
	// Bandannas
	///////////////////////////////////////////////////////////////////////////////
	class H_Bandanna_camo							{ quality = 1; price = 20; };
	class H_Bandanna_cbr							{ quality = 1; price = 20; };
	class H_Bandanna_gry							{ quality = 1; price = 20; };
	class H_Bandanna_khk							{ quality = 1; price = 20; };
	class H_Bandanna_khk_hs							{ quality = 1; price = 20; };
	class H_Bandanna_mcamo							{ quality = 1; price = 20; };
	class H_Bandanna_sgg							{ quality = 1; price = 20; };
	class H_Bandanna_surfer							{ quality = 1; price = 20; };

	///////////////////////////////////////////////////////////////////////////////
	// Boonie Hats
	///////////////////////////////////////////////////////////////////////////////
	class H_Booniehat_dgtl							{ quality = 1; price = 75; };
	class H_Booniehat_dirty							{ quality = 1; price = 75; };
	class H_Booniehat_grn							{ quality = 1; price = 75; };
	class H_Booniehat_indp							{ quality = 1; price = 75; };
	class H_Booniehat_khk							{ quality = 1; price = 75; };
	class H_Booniehat_khk_hs						{ quality = 1; price = 75; };
	class H_Booniehat_mcamo							{ quality = 1; price = 75; };
	class H_Booniehat_tan							{ quality = 1; price = 75; };

	///////////////////////////////////////////////////////////////////////////////
	// Hats
	///////////////////////////////////////////////////////////////////////////////
	class H_Hat_blue								{ quality = 1; price = 20; };
	class H_Hat_brown								{ quality = 1; price = 20; };
	class H_Hat_camo								{ quality = 1; price = 20; };
	class H_Hat_checker								{ quality = 1; price = 20; };
	class H_Hat_grey								{ quality = 1; price = 20; };
	class H_Hat_tan									{ quality = 1; price = 20; };
	class H_StrawHat								{ quality = 1; price = 20; };
	class H_StrawHat_dark							{ quality = 1; price = 20; };
	class Exile_Headgear_SantaHat					{ quality = 3; price = 500; };
	class Exile_Headgear_SafetyHelmet				{ quality = 2; price = 20; };

	///////////////////////////////////////////////////////////////////////////////
	// Berets
	///////////////////////////////////////////////////////////////////////////////
	class H_Beret_02								{ quality = 1; price = 20; };
	class H_Beret_blk								{ quality = 1; price = 20; };
	class H_Beret_blk_POLICE						{ quality = 1; price = 20; };
	class H_Beret_brn_SF							{ quality = 1; price = 20; };
	class H_Beret_Colonel							{ quality = 3; price = 25; };
	class H_Beret_grn								{ quality = 1; price = 20; };
	class H_Beret_grn_SF							{ quality = 1; price = 20; };
	class H_Beret_ocamo								{ quality = 1; price = 20; };
	class H_Beret_red								{ quality = 1; price = 20; };

	///////////////////////////////////////////////////////////////////////////////
	// Shemags
	///////////////////////////////////////////////////////////////////////////////
	class H_Shemag_khk								{ quality = 1; price = 75; };
	class H_Shemag_olive							{ quality = 1; price = 75; };
	class H_Shemag_olive_hs							{ quality = 1; price = 75; };
	class H_Shemag_tan								{ quality = 1; price = 75; };
	class H_ShemagOpen_khk							{ quality = 1; price = 75; };
	class H_ShemagOpen_tan							{ quality = 1; price = 75; };
	class H_TurbanO_blk								{ quality = 3; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Light Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetB_light							{ quality = 1; price = 150; };
	class H_HelmetB_light_black						{ quality = 1; price = 150; };
	class H_HelmetB_light_desert					{ quality = 1; price = 150; };
	class H_HelmetB_light_grass						{ quality = 1; price = 150; };
	class H_HelmetB_light_sand						{ quality = 1; price = 150; };
	class H_HelmetB_light_snakeskin					{ quality = 1; price = 150; };

	///////////////////////////////////////////////////////////////////////////////
	// Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetIA								{ quality = 1; price = 100; };
	class H_HelmetIA_camo							{ quality = 1; price = 100; };
	class H_HelmetIA_net							{ quality = 1; price = 100; };
	class H_HelmetB									{ quality = 2; price = 100; };
	class H_HelmetB_black							{ quality = 2; price = 100; };
	class H_HelmetB_camo							{ quality = 3; price = 100; }; // This one is awesome!
	class H_HelmetB_desert							{ quality = 2; price = 100; };
	class H_HelmetB_grass							{ quality = 2; price = 100; };
	class H_HelmetB_paint							{ quality = 2; price = 100; };
	class H_HelmetB_plain_blk						{ quality = 2; price = 100; };
	class H_HelmetB_sand							{ quality = 2; price = 100; };
	class H_HelmetB_snakeskin						{ quality = 2; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Spec Ops Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetSpecB								{ quality = 3; price = 200; };
	class H_HelmetSpecB_blk							{ quality = 3; price = 200; };
	class H_HelmetSpecB_paint1						{ quality = 3; price = 200; };
	class H_HelmetSpecB_paint2						{ quality = 3; price = 200; };

	///////////////////////////////////////////////////////////////////////////////
	// Super Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetO_ocamo							{ quality = 3; price = 150; };
	class H_HelmetO_oucamo							{ quality = 3; price = 150; };
	class H_HelmetSpecO_blk							{ quality = 3; price = 100; };
	class H_HelmetSpecO_ocamo						{ quality = 3; price = 100; };
	class H_HelmetLeaderO_ocamo						{ quality = 3; price = 200; };
	class H_HelmetLeaderO_oucamo					{ quality = 3; price = 200; };

	///////////////////////////////////////////////////////////////////////////////
	// Pointer Attachments
	///////////////////////////////////////////////////////////////////////////////
	class acc_flashlight 							{ quality = 1; price = 100; };
	class acc_pointer_IR 							{ quality = 1; price = 150; };

	///////////////////////////////////////////////////////////////////////////////
	// Bitpod Attachments
	///////////////////////////////////////////////////////////////////////////////
	class bipod_01_F_blk	 						{ quality = 1; price = 150; sellPrice = 1; }; 
	class bipod_01_F_mtp	 						{ quality = 1; price = 150; sellPrice = 1; };
	class bipod_01_F_snd	 						{ quality = 1; price = 150; sellPrice = 1; };
	class bipod_02_F_blk	 						{ quality = 1; price = 150; sellPrice = 1; };
	class bipod_02_F_hex	 						{ quality = 1; price = 150; sellPrice = 1; };
	class bipod_02_F_tan	 						{ quality = 1; price = 150; sellPrice = 1; };
	class bipod_03_F_blk	 						{ quality = 1; price = 150; sellPrice = 1; };
	class bipod_03_F_oli	 						{ quality = 1; price = 150; sellPrice = 1; };

	///////////////////////////////////////////////////////////////////////////////
	// Muzzle Attachments
	///////////////////////////////////////////////////////////////////////////////
	class muzzle_snds_338_black 					{ quality = 2; price = 400; };
	class muzzle_snds_338_green 					{ quality = 2; price = 400; };
	class muzzle_snds_338_sand 						{ quality = 2; price = 400; };
	class muzzle_snds_93mmg 						{ quality = 2; price = 450; };
	class muzzle_snds_93mmg_tan 					{ quality = 2; price = 450; };
	class muzzle_snds_acp 							{ quality = 1; price = 175; };
	class muzzle_snds_B 							{ quality = 1; price = 350; };
	class muzzle_snds_H 							{ quality = 2; price = 325; };
	class muzzle_snds_H_MG 							{ quality = 2; price = 325; };
	class muzzle_snds_H_SW 							{ quality = 2; price = 325; };
	class muzzle_snds_L 							{ quality = 1; price = 150; };
	class muzzle_snds_M 							{ quality = 1; price = 300; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Money Item for the 4 Magazines
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_Can_Empty						{ quality = 1; price = 500000; sellPrice = 500000; };

	///////////////////////////////////////////////////////////////////////////////
	// Static MGs
	///////////////////////////////////////////////////////////////////////////////
	class O_HMG_01_weapon_F 						{ quality = 4; price = 50000; };
	class O_HMG_01_support_F 						{ quality = 4; price = 10000; };
	class O_HMG_01_high_weapon_F 					{ quality = 4; price = 60000; };
	class O_HMG_01_support_high_F 					{ quality = 4; price = 20000; };

	///////////////////////////////////////////////////////////////////////////////
	// Optic Attachments
	///////////////////////////////////////////////////////////////////////////////
	class optic_Aco									{ quality = 1; price = 100; };
	class optic_ACO_grn								{ quality = 1; price = 100; };
	class optic_ACO_grn_smg							{ quality = 1; price = 100; };
	class optic_Aco_smg								{ quality = 1; price = 100; };
	class optic_AMS									{ quality = 2; price = 500; };
	class optic_AMS_khk								{ quality = 2; price = 500; };
	class optic_AMS_snd								{ quality = 2; price = 500; };
	class optic_Arco								{ quality = 1; price = 250; };
	class optic_DMS									{ quality = 1; price = 350; };
	class optic_Hamr								{ quality = 3; price = 250; };
	class optic_Holosight							{ quality = 1; price = 150; };
	class optic_Holosight_smg						{ quality = 1; price = 150; };
	class optic_KHS_blk								{ quality = 1; price = 350; };
	class optic_KHS_hex								{ quality = 1; price = 350; };
	class optic_KHS_old								{ quality = 1; price = 350; };
	class optic_KHS_tan								{ quality = 1; price = 350; };
	class optic_LRPS								{ quality = 2; price = 700; };
	class optic_MRCO								{ quality = 1; price = 250; };
	class optic_MRD									{ quality = 1; price = 25; };
	class optic_NVS									{ quality = 3; price = 500; };
	class optic_SOS									{ quality = 2; price = 250; };
	class optic_Yorris								{ quality = 1; price = 25; };
	class optic_tws_mg								{ quality = 1; price = 2000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hardware
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_Rope							{ quality = 1; price = 100; };
	class Exile_Item_DuctTape						{ quality = 1; price = 500; };
	class Exile_Item_ExtensionCord					{ quality = 1; price = 50; };
	class Exile_Item_FuelCanisterEmpty				{ quality = 1; price = 50; };
	class Exile_Item_JunkMetal						{ quality = 1; price = 450; };
	class Exile_Item_LightBulb						{ quality = 1; price = 250; };
	class Exile_Item_MetalBoard						{ quality = 1; price = 1200; };
	class Exile_Item_FloodLightKit					{ quality = 1; price = 1000; };
	class Exile_Item_PortableGeneratorKit			{ quality = 1; price = 2500; };
	class Exile_Item_SafeKit						{ quality = 1; price = 15000; };
	class Exile_Item_CodeLock						{ quality = 1; price = 7500; };
	class Exile_Item_Laptop							{ quality = 1; price = 10000; };
	class Exile_Item_BaseCameraKit					{ quality = 1; price = 7500; };
//	class Exile_Magazine_Battery					{ quality = 1; price = 2000; };
	class Exile_Item_CamoTentKit					{ quality = 1; price = 250; };
	class Exile_Item_MetalPole						{ quality = 1; price = 2400; };
	class Exile_Item_MetalScrews					{ quality = 1; price = 150; };
	class Exile_Item_MetalWire						{ quality = 1; price = 300; };
	class Exile_Item_Cement							{ quality = 1; price = 1500; };
	class Exile_Item_Sand							{ quality = 1; price = 1500; };
//	class Exile_Item_MetalHedgehogKit				{ quality = 1; price = 800; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Food
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_EMRE							{ quality = 1; price = 150; }; //75, 60
	class Exile_Item_GloriousKnakworst				{ quality = 1; price = 100; }; //60, 30
	class Exile_Item_Surstromming					{ quality = 1; price = 80; }; //55, 25
	class Exile_Item_SausageGravy					{ quality = 1; price = 70; }; //50, 25
	class Exile_Item_Catfood						{ quality = 1; price = 60; }; //40, 40
	class Exile_Item_ChristmasTinner				{ quality = 1; price = 60; }; //40, 60
	class Exile_Item_BBQSandwich					{ quality = 1; price = 60; }; //40, 60
	class Exile_Item_MacasCheese					{ quality = 1; price = 20; }; //40, 60
	class Exile_Item_Dogfood						{ quality = 1; price = 50; }; //30, 30
	class Exile_Item_BeefParts						{ quality = 1; price = 50; }; //30, 30
	class Exile_Item_Cheathas						{ quality = 1; price = 50; }; //30, 30
	class Exile_Item_Noodles						{ quality = 1; price = 40; }; //25, 50
	class Exile_Item_SeedAstics						{ quality = 1; price = 30; }; //20, 40
	class Exile_Item_Raisins						{ quality = 1; price = 20; }; //15, 30
	class Exile_Item_Moobar							{ quality = 1; price = 10; }; //10, 30
	class Exile_Item_InstantCoffee					{ quality = 1; price = 30; }; //5, 10
	class Exile_Item_CockONut						{ quality = 1; price = 30; }; //5, 10
	class Exile_Item_DsNuts							{ quality = 1; price = 30; }; //5, 10

	///////////////////////////////////////////////////////////////////////////////
	// Drinks
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_PlasticBottleCoffee	 		{ quality = 1; price = 175; }; //100, 60
	class Exile_Item_PowerDrink						{ quality = 1; price = 225; }; //95, 10
	class Exile_Item_PlasticBottleFreshWater 		{ quality = 1; price = 150; sellPrice = 10; }; //80, 15
	class Exile_Item_Beer 							{ quality = 1; price = 100; }; //75, 30
	class Exile_Item_EnergyDrink					{ quality = 1; price = 125; }; //75, 20
	class Exile_Item_ChocolateMilk					{ quality = 1; price = 125; }; //75, 20
	class Exile_Item_MountainDupe					{ quality = 1; price = 75; }; //50, 20
	class Exile_Item_PlasticBottleEmpty				{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// First Aid
	///////////////////////////////////////////////////////////////////////////////	
	class Exile_Item_InstaDoc                       { quality = 1; price = 2000; };
	class Exile_Item_Vishpirin						{ quality = 1; price = 500; };
	class Exile_Item_Bandage	                    { quality = 1; price = 150; };
	class Exile_Item_Heatpack	                    { quality = 1; price = 75; };
	//class Exile_Item_Defibrillator				{ quality = 1; price = 7500; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Tools
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_Matches 						{ quality = 1; price = 60; };
	class Exile_Item_CookingPot						{ quality = 1; price = 80; };
	class Exile_Melee_Axe							{ quality = 1; price = 100; sellPrice = 10; };
	class Exile_Melee_SledgeHammmer					{ quality = 2; price = 500; };
	class Exile_Item_CanOpener						{ quality = 1; price = 15; };
	class Exile_Item_Handsaw						{ quality = 1; price = 500; };
	class Exile_Item_Pliers							{ quality = 1; price = 350; };
	class Exile_Item_Grinder						{ quality = 1; price = 1250; };
	class Exile_Item_Foolbox						{ quality = 3; price = 4000; };
	class Exile_Item_Screwdriver					{ quality = 1; price = 500; };
	class Exile_Item_CordlessScrewdriver			{ quality = 1; price = 1000; };
	class Exile_Item_Hammer							{ quality = 1; price = 1000; };
	class Exile_Item_OilCanister					{ quality = 1; price = 1750; };
	class Exile_Item_Shovel							{ quality = 1; price = 750; };
	class Exile_Item_Wrench							{ quality = 1; price = 500; };
	class Exile_Item_SleepingMat					{ quality = 1; price = 1250; };
	class Exile_Item_ToiletPaper					{ quality = 1; price = 10; };
	class Exile_Item_ZipTie							{ quality = 1; price = 300; };
	class Exile_Item_knife							{ quality = 1; price = 75000; sellprice = 25000 };

	///////////////////////////////////////////////////////////////////////////////
	// Navigation
	///////////////////////////////////////////////////////////////////////////////
	class ItemWatch									{ quality = 1; price = 10; };	
	class ItemGPS									{ quality = 1; price = 40; };
	class ItemMap									{ quality = 1; price = 10; };
	class ItemCompass								{ quality = 1; price = 10; };
	class ItemRadio									{ quality = 1; price = 250; };
	class Binocular									{ quality = 1; price = 50; };
	class Rangefinder								{ quality = 2; price = 400; };
	class NVGoggles									{ quality = 2; price = 300; };
	class NVGoggles_INDEP							{ quality = 2; price = 300; };
	class NVGoggles_OPFOR							{ quality = 2; price = 300; };
	class Exile_Item_XM8							{ quality = 2; price = 10; };	
	class Exile_Item_MobilePhone					{ quality = 6; price = 500; };

	///////////////////////////////////////////////////////////////////////////////
	// Watch out for a Walter fart! He has gas!
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Headgear_GasMask					{ quality = 1; price = 15000; };

	///////////////////////////////////////////////////////////////////////////////
	// Rebreather
	///////////////////////////////////////////////////////////////////////////////
	class V_RebreatherB								{ quality = 2; price = 250; };
	class V_RebreatherIA							{ quality = 2; price = 250; };
	class V_RebreatherIR							{ quality = 2; price = 250; };

	///////////////////////////////////////////////////////////////////////////////
	// Pilot Stuff
	///////////////////////////////////////////////////////////////////////////////
	class B_Parachute								{ quality = 1; price = 250; };
	class H_CrewHelmetHeli_B						{ quality = 2; price = 150; };
	class H_CrewHelmetHeli_I						{ quality = 2; price = 150; };
	class H_CrewHelmetHeli_O						{ quality = 2; price = 150; };
	class H_HelmetCrew_I							{ quality = 1; price = 100; };
	class H_HelmetCrew_B							{ quality = 1; price = 100; };
	class H_HelmetCrew_O							{ quality = 1; price = 100; };
	class H_PilotHelmetHeli_B						{ quality = 3; price = 100; };
	class H_PilotHelmetHeli_I						{ quality = 3; price = 100; };
	class H_PilotHelmetHeli_O						{ quality = 3; price = 100; };
	class U_B_HeliPilotCoveralls					{ quality = 1; price = 150; };
	class U_B_PilotCoveralls						{ quality = 1; price = 160; };
	class U_I_HeliPilotCoveralls					{ quality = 1; price = 160; };
	class U_I_pilotCoveralls						{ quality = 1; price = 160; };
	class U_O_PilotCoveralls						{ quality = 1; price = 160; };
	class H_PilotHelmetFighter_B					{ quality = 2; price = 150; };
	class H_PilotHelmetFighter_I					{ quality = 2; price = 150; };
	class H_PilotHelmetFighter_O					{ quality = 2; price = 150; };

	///////////////////////////////////////////////////////////////////////////////
	// Backpacks
	///////////////////////////////////////////////////////////////////////////////
	class B_HuntingBackpack							{ quality = 1; price = 350; };
	class B_OutdoorPack_blk							{ quality = 1; price = 350; };
	class B_OutdoorPack_blu							{ quality = 1; price = 350; };
	class B_OutdoorPack_tan							{ quality = 1; price = 350; };
	class B_AssaultPack_blk							{ quality = 1; price = 500; };
	class B_AssaultPack_cbr							{ quality = 1; price = 500; };
	class B_AssaultPack_dgtl						{ quality = 1; price = 500; };
	class B_AssaultPack_khk							{ quality = 1; price = 500; };
	class B_AssaultPack_mcamo						{ quality = 1; price = 500; };
	class B_AssaultPack_rgr							{ quality = 1; price = 500; };
	class B_AssaultPack_sgg							{ quality = 1; price = 500; };
	class B_FieldPack_blk							{ quality = 1; price = 700; };
	class B_FieldPack_cbr							{ quality = 1; price = 700; };
	class B_FieldPack_ocamo							{ quality = 1; price = 700; };
	class B_FieldPack_oucamo						{ quality = 1; price = 700; };
	class B_TacticalPack_blk						{ quality = 1; price = 750; };
	class B_TacticalPack_rgr						{ quality = 1; price = 750; };
	class B_TacticalPack_ocamo						{ quality = 1; price = 750; };
	class B_TacticalPack_mcamo						{ quality = 1; price = 750; };
	class B_TacticalPack_oli						{ quality = 1; price = 750; };
	class B_Kitbag_cbr								{ quality = 1; price = 1000; };
	class B_Kitbag_mcamo							{ quality = 1; price = 1000; };
	class B_Kitbag_sgg								{ quality = 1; price = 1000; };
	class B_Bergen_blk								{ quality = 1; price = 1000; };
	class B_Bergen_mcamo							{ quality = 1; price = 1000; };
	class B_Bergen_rgr								{ quality = 1; price = 1000; };
	class B_Bergen_sgg								{ quality = 1; price = 1000; };
	class B_Carryall_cbr							{ quality = 1; price = 1500; };
	class B_Carryall_khk							{ quality = 1; price = 1500; };
	class B_Carryall_mcamo							{ quality = 1; price = 1500; };
	class B_Carryall_ocamo							{ quality = 1; price = 1500; };
	class B_Carryall_oli							{ quality = 1; price = 1500; };
	class B_Carryall_oucamo							{ quality = 1; price = 1500; };

	///////////////////////////////////////////////////////////////////////////////
	// Ammunition
	///////////////////////////////////////////////////////////////////////////////
	class 100Rnd_65x39_caseless_mag 				{ quality = 1; price = 400; };
	class 100Rnd_65x39_caseless_mag_Tracer 			{ quality = 1; price = 350; };
	class 10Rnd_127x54_Mag 							{ quality = 1; price = 1200; };
	class 10Rnd_338_Mag 							{ quality = 1; price = 500; };
	class 10Rnd_762x54_Mag 							{ quality = 1; price = 300; };
	class 10Rnd_762x51_Mag 							{ quality = 1; price = 300; };
	class 10Rnd_93x64_DMR_05_Mag 					{ quality = 1; price = 500; };
	class 11Rnd_45ACP_Mag 							{ quality = 1; price = 100; };
	class 150Rnd_762x54_Box 						{ quality = 1; price = 600; };
	class 150Rnd_762x54_Box_Tracer 					{ quality = 1; price = 550; };
	class 16Rnd_9x21_Mag 							{ quality = 1; price = 75; };
	class 200Rnd_65x39_cased_Box 					{ quality = 1; price = 500; };
	class 200Rnd_65x39_cased_Box_Tracer 			{ quality = 1; price = 450; };
	class 150Rnd_93x64_Mag 							{ quality = 2; price = 1200; };
	class 130Rnd_338_Mag 							{ quality = 2; price = 1000; };
	class 20Rnd_556x45_UW_mag 						{ quality = 1; price = 200; };
	class 20Rnd_762x51_Mag 							{ quality = 1; price = 350; };
	class 30Rnd_45ACP_Mag_SMG_01 					{ quality = 1; price = 150; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green 		{ quality = 1; price = 100; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow		{ quality = 1; price = 100; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Red			{ quality = 1; price = 100; };
	class 30Rnd_556x45_Stanag 						{ quality = 1; price = 200; };
	class 30Rnd_556x45_Stanag_Tracer_Green 			{ quality = 1; price = 150; };
	class 30Rnd_556x45_Stanag_green  				{ quality = 1; price = 200; };
	class 30Rnd_556x45_Stanag_Tracer_Red 			{ quality = 1; price = 150; };
	class 30Rnd_556x45_Stanag_Tracer_Yellow 		{ quality = 1; price = 150; };
	class 30Rnd_556x45_Stanag_red 					{ quality = 1; price = 200; };
	class 30Rnd_65x39_caseless_green 				{ quality = 1; price = 250; };
	class 30Rnd_65x39_caseless_green_mag_Tracer 	{ quality = 1; price = 200; };
	class 30Rnd_65x39_caseless_mag 					{ quality = 1; price = 250; };
	class 30Rnd_65x39_caseless_mag_Tracer 			{ quality = 1; price = 200; };
	class 30Rnd_9x21_Mag 							{ quality = 1; price = 125; };
	class 5Rnd_127x108_APDS_Mag 					{ quality = 3; price = 1200; };
	class 5Rnd_127x108_Mag 							{ quality = 2; price = 1000; };
	class 6Rnd_45ACP_Cylinder 						{ quality = 1; price = 100; };
	class 6Rnd_GreenSignal_F 						{ quality = 1; price = 100; };
	class 6Rnd_RedSignal_F 							{ quality = 1; price = 100; };
	class 7Rnd_408_Mag 								{ quality = 2; price = 800; };
	class 9Rnd_45ACP_Mag 							{ quality = 1; price = 50; };

	///////////////////////////////////////////////////////////////////////////////
	// Flares
	///////////////////////////////////////////////////////////////////////////////
	class Chemlight_blue							{ quality = 1; price = 10; };
	class Chemlight_green							{ quality = 1; price = 10; };
	class Chemlight_red								{ quality = 1; price = 10; };
	class FlareGreen_F								{ quality = 1; price = 10; };
	class FlareRed_F								{ quality = 1; price = 10; };
	class FlareWhite_F								{ quality = 1; price = 10; };
	class FlareYellow_F								{ quality = 1; price = 10; };
	class UGL_FlareGreen_F							{ quality = 1; price = 10; };
	class UGL_FlareRed_F							{ quality = 1; price = 10; };
	class UGL_FlareWhite_F							{ quality = 1; price = 10; };
	class UGL_FlareYellow_F							{ quality = 1; price = 10; };
	class 3Rnd_UGL_FlareGreen_F						{ quality = 1; price = 10*3; };
	class 3Rnd_UGL_FlareRed_F						{ quality = 1; price = 10*3; };
	class 3Rnd_UGL_FlareWhite_F						{ quality = 1; price = 10*3; };
	class 3Rnd_UGL_FlareYellow_F					{ quality = 1; price = 10*3; };

	///////////////////////////////////////////////////////////////////////////////
	// Smokes
	///////////////////////////////////////////////////////////////////////////////
	class SmokeShell								{ quality = 1; price = 25; };
	class SmokeShellBlue							{ quality = 1; price = 25; };
	class SmokeShellGreen							{ quality = 1; price = 25; };
	class SmokeShellOrange							{ quality = 1; price = 25; };
	class SmokeShellPurple							{ quality = 1; price = 25; };
	class SmokeShellRed								{ quality = 1; price = 25; };
	class SmokeShellYellow							{ quality = 1; price = 25; };
	class 1Rnd_Smoke_Grenade_shell					{ quality = 1; price = 30; };
	class 1Rnd_SmokeBlue_Grenade_shell				{ quality = 1; price = 30; };
	class 1Rnd_SmokeGreen_Grenade_shell				{ quality = 1; price = 30; };
	class 1Rnd_SmokeOrange_Grenade_shell			{ quality = 1; price = 30; };
	class 1Rnd_SmokePurple_Grenade_shell			{ quality = 1; price = 30; };
	class 1Rnd_SmokeRed_Grenade_shell				{ quality = 1; price = 30; };
	class 1Rnd_SmokeYellow_Grenade_shell			{ quality = 1; price = 30; };
	class 3Rnd_Smoke_Grenade_shell					{ quality = 1; price = 30*3; };
	class 3Rnd_SmokeBlue_Grenade_shell				{ quality = 1; price = 30*3; };
	class 3Rnd_SmokeGreen_Grenade_shell				{ quality = 1; price = 30*3; };
	class 3Rnd_SmokeOrange_Grenade_shell			{ quality = 1; price = 30*3; };
	class 3Rnd_SmokePurple_Grenade_shell			{ quality = 1; price = 30*3; };
	class 3Rnd_SmokeRed_Grenade_shell				{ quality = 1; price = 30*3; };
	class 3Rnd_SmokeYellow_Grenade_shell			{ quality = 1; price = 30*3; };

	///////////////////////////////////////////////////////////////////////////////
	// Explosives
	///////////////////////////////////////////////////////////////////////////////
	class HandGrenade								{ quality = 2; price = 300; };
	class MiniGrenade								{ quality = 2; price = 150; };
	class B_IR_Grenade								{ quality = 1; price = 100; };
	class O_IR_Grenade								{ quality = 1; price = 100; };
	class I_IR_Grenade								{ quality = 1; price = 100; };
	class 1Rnd_HE_Grenade_shell						{ quality = 2; price = 300; };
	class 3Rnd_HE_Grenade_shell						{ quality = 2; price = 700; };	
	class APERSBoundingMine_Range_Mag				{ quality = 3; price = 7000; };
	class APERSMine_Range_Mag						{ quality = 3; price = 5000; };
	class APERSTripMine_Wire_Mag					{ quality = 3; price = 4500; };
	class ClaymoreDirectionalMine_Remote_Mag		{ quality = 3; price = 3500; };
	class DemoCharge_Remote_Mag						{ quality = 4; price = 7000; };
	class IEDLandBig_Remote_Mag						{ quality = 3; price = 7000; };
	class IEDLandSmall_Remote_Mag					{ quality = 3; price = 3500; };
	class IEDUrbanBig_Remote_Mag					{ quality = 3; price = 8000; };
	class IEDUrbanSmall_Remote_Mag					{ quality = 3; price = 4000; };
	class SatchelCharge_Remote_Mag					{ quality = 4; price = 10000;};
	class SLAMDirectionalMine_Wire_Mag				{ quality = 3; price = 7500; };

	///////////////////////////////////////////////////////////////////////////////
	// Launcher stuff
	///////////////////////////////////////////////////////////////////////////////
	class launch_RPG7_F 							{ quality = 5; price = 50000; };
	class launch_RPG32_F							{ quality = 5; price = 75000; };
	class launch_NLAW_F								{ quality = 5; price = 100000; };
	class launch_B_Titan_short_F					{ quality = 5; price = 100000; };
	class launch_Titan_F 							{ quality = 5; price = 100000; };
	class launch_B_Titan_F 							{ quality = 5; price = 100000; };
	class launch_I_Titan_F 							{ quality = 5; price = 100000; };
	class launch_O_Titan_F 							{ quality = 5; price = 100000; };
	class launch_O_Titan_ghex_F 					{ quality = 5; price = 100000; };
	class launch_B_Titan_tna_F 						{ quality = 5; price = 100000; };
	class RPG32_F									{ quality = 5; price = 20000; };
	class RPG32_ghex_F								{ quality = 5; price = 20000; };
	class RPG32_HE_F								{ quality = 5; price = 20000; };
	class titan_AA									{ quality = 5; price = 35000; };
	class RPG7_F									{ quality = 5; price = 20000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Pistols
	///////////////////////////////////////////////////////////////////////////////
	class hgun_ACPC2_F 								{ quality = 1; price = 600; };
	class hgun_P07_F 								{ quality = 1; price = 500; };
	class hgun_Pistol_heavy_01_F 					{ quality = 1; price = 600; };
	class hgun_Pistol_heavy_02_F 					{ quality = 1; price = 600; };
	class hgun_Pistol_Signal_F 						{ quality = 1; price = 100; };
	class hgun_Rook40_F 							{ quality = 1; price = 400; };

	///////////////////////////////////////////////////////////////////////////////
	// Sub Machine Guns
	///////////////////////////////////////////////////////////////////////////////
	class hgun_PDW2000_F 							{ quality = 1; price = 2000; };
	class SMG_01_F 									{ quality = 1; price = 4000; };
	class SMG_02_F 									{ quality = 1; price = 3000; };

	///////////////////////////////////////////////////////////////////////////////
	// Light Machine Guns
	///////////////////////////////////////////////////////////////////////////////
	class arifle_MX_SW_Black_F						{ quality = 2; price = 9000; };
	class arifle_MX_SW_F							{ quality = 2; price = 9000; };
	class LMG_Mk200_F								{ quality = 2; price = 9500; };
	class LMG_Zafir_F								{ quality = 2; price = 10000; };
	class MMG_01_hex_F								{ quality = 3; price = 15000; };
	class MMG_01_tan_F								{ quality = 3; price = 15000; };
	class MMG_02_black_F							{ quality = 3; price = 13000; };
	class MMG_02_camo_F								{ quality = 3; price = 13000; };
	class MMG_02_sand_F								{ quality = 3; price = 13000; };


	///////////////////////////////////////////////////////////////////////////////
	// Assault Rifles
	///////////////////////////////////////////////////////////////////////////////
	class arifle_Katiba_C_F							{ quality = 1; price = 7000; };
	class arifle_Katiba_F							{ quality = 1; price = 7000; };
	class arifle_Katiba_GL_F						{ quality = 2; price = 8000; };
	class arifle_Mk20_F								{ quality = 1; price = 6000; };
	class arifle_Mk20_GL_F							{ quality = 2; price = 6500; };
	class arifle_Mk20_GL_plain_F					{ quality = 2; price = 6500; };
	class arifle_Mk20_plain_F						{ quality = 1; price = 6000; };
	class arifle_Mk20C_F							{ quality = 1; price = 6000; };
	class arifle_Mk20C_plain_F						{ quality = 1; price = 6000; };
	class arifle_MX_Black_F							{ quality = 1; price = 6500; };
	class arifle_MX_F								{ quality = 1; price = 6500; };
	class arifle_MX_GL_Black_F						{ quality = 2; price = 7000; };
	class arifle_MX_GL_F							{ quality = 2; price = 7000; };
	class arifle_MXC_Black_F						{ quality = 1; price = 6500; };
	class arifle_MXC_F								{ quality = 1; price = 6500; };
	class arifle_SDAR_F								{ quality = 2; price = 6000; };
	class arifle_TRG20_F							{ quality = 1; price = 6000; };
	class arifle_TRG21_F							{ quality = 1; price = 6000; };
	class arifle_TRG21_GL_F							{ quality = 2; price = 6500; };

	///////////////////////////////////////////////////////////////////////////////
	// Sniper Rifles
	///////////////////////////////////////////////////////////////////////////////
	class arifle_MXM_Black_F						{ quality = 2; price = 9000; };
	class arifle_MXM_F 								{ quality = 2; price = 9000; };
	class srifle_DMR_01_F							{ quality = 2; price = 10000; };
	class srifle_DMR_02_camo_F						{ quality = 4; price = 16000; };
	class srifle_DMR_02_F							{ quality = 4; price = 16000; };
	class srifle_DMR_02_sniper_F					{ quality = 4; price = 16000; };
	class srifle_DMR_03_F							{ quality = 2; price = 11500; };
	class srifle_DMR_03_khaki_F						{ quality = 2; price = 11500; };
	class srifle_DMR_03_multicam_F					{ quality = 2; price = 11500; };
	class srifle_DMR_03_tan_F						{ quality = 2; price = 11500; };
	class srifle_DMR_03_woodland_F					{ quality = 2; price = 11500; };
	class srifle_DMR_04_F							{ quality = 2; price = 18000; };
	class srifle_DMR_04_Tan_F						{ quality = 2; price = 18000; };
	class srifle_DMR_05_blk_F						{ quality = 4; price = 18000; };
	class srifle_DMR_05_hex_F						{ quality = 4; price = 18000; };
	class srifle_DMR_05_tan_f						{ quality = 4; price = 18000; };
	class srifle_DMR_06_camo_F						{ quality = 3; price = 10000; };
	class srifle_DMR_06_olive_F						{ quality = 3; price = 10000; };
	class srifle_EBR_F								{ quality = 3; price = 10000; };
	class srifle_GM6_camo_F							{ quality = 5; price = 24000; };
	class srifle_GM6_F								{ quality = 5; price = 24000; };
	class srifle_LRR_camo_F							{ quality = 5; price = 20000; };
	class srifle_LRR_F 								{ quality = 5; price = 20000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// ArmA 2 Weapons
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Weapon_AK107						{ quality = 1; price = 7000; };
	class Exile_Weapon_AK107_GL						{ quality = 2; price = 7500; };
	class Exile_Weapon_AK74							{ quality = 1; price = 7000; };
	class Exile_Weapon_AK74_GL						{ quality = 2; price = 7500; };
	class Exile_Weapon_AK47							{ quality = 2; price = 7000; };
	class Exile_Weapon_AKM							{ quality = 2; price = 7000; };
	class Exile_Weapon_AKS							{ quality = 1; price = 5500; };
	class Exile_Weapon_AKS_Gold						{ quality = 2; price = 30000; };
	class Exile_Weapon_DMR							{ quality = 2; price = 9000; };
	class Exile_Weapon_LeeEnfield					{ quality = 1; price = 7000; };
	class Exile_Weapon_CZ550						{ quality = 2; price = 7000; };
	class Exile_Weapon_SVD							{ quality = 2; price = 7000; };
	class Exile_Weapon_SVDCamo						{ quality = 2; price = 7000; };
	class Exile_Weapon_VSSVintorez					{ quality = 1; price = 4000; };
	class Exile_Weapon_RPK							{ quality = 2; price = 7000; };
	class Exile_Weapon_PK							{ quality = 2; price = 7000; };
	class Exile_Weapon_PKP							{ quality = 2; price = 8000; };
	class Exile_Weapon_Colt1911						{ quality = 1; price = 600; };
	class Exile_Weapon_Makarov						{ quality = 1; price = 500; };
	class Exile_Weapon_Taurus						{ quality = 1; price = 100; };
	class Exile_Weapon_TaurusGold					{ quality = 1; price = 10000; };
	class Exile_Weapon_M1014						{ quality = 2; price = 600; };
	
	///////////////////////////////////////////////////////////////////////////////
	// ArmA 2 Ammunition
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Magazine_30Rnd_762x39_AK				{ quality = 1; price = 350; };
	class Exile_Magazine_30Rnd_545x39_AK				{ quality = 1; price = 200; };
	class Exile_Magazine_30Rnd_545x39_AK_Green			{ quality = 1; price = 150; };
	class Exile_Magazine_30Rnd_545x39_AK_Red			{ quality = 1; price = 150; };
	class Exile_Magazine_30Rnd_545x39_AK_White			{ quality = 1; price = 150; };
	class Exile_Magazine_30Rnd_545x39_AK_Yellow			{ quality = 1; price = 150; };
	class Exile_Magazine_45Rnd_545x39_RPK_Green			{ quality = 1; price = 250; };
	class Exile_Magazine_75Rnd_545x39_RPK_Green			{ quality = 1; price = 350; };
	class Exile_Magazine_20Rnd_762x51_DMR				{ quality = 1; price = 350; };
	class Exile_Magazine_20Rnd_762x51_DMR_Yellow		{ quality = 1; price = 300; };
	class Exile_Magazine_20Rnd_762x51_DMR_Red			{ quality = 1; price = 300; };
	class Exile_Magazine_20Rnd_762x51_DMR_Green			{ quality = 1; price = 300; };
	class Exile_Magazine_10Rnd_303						{ quality = 1; price = 500; };
	class Exile_Magazine_100Rnd_762x54_PK_Green			{ quality = 1; price = 400; };
	class Exile_Magazine_7Rnd_45ACP						{ quality = 1; price = 60; };
	class Exile_Magazine_8Rnd_9x18						{ quality = 1; price = 50; };
	class Exile_Magazine_6Rnd_45ACP						{ quality = 1; price = 50; };
	class Exile_Magazine_5Rnd_22LR						{ quality = 1; price = 25; };
	class Exile_Magazine_10Rnd_762x54					{ quality = 1; price = 150; };
	class Exile_Magazine_10Rnd_9x39						{ quality = 1; price = 65; };
	class Exile_Magazine_20Rnd_9x39						{ quality = 1; price = 100; };
	class Exile_Magazine_8Rnd_74Slug					{ quality = 1; price = 50; };
	class Exile_Magazine_8Rnd_74Pellets					{ quality = 1; price = 45; }; // broken?
	
	///////////////////////////////////////////////////////////////////////////////
	// Apex Items & Weapons
	///////////////////////////////////////////////////////////////////////////////
	class hgun_Pistol_01_F            { quality = 1; price = 500; };
	class hgun_P07_khk_F              { quality = 1; price = 500; };
	class SMG_05_F					  { quality = 1; price = 3000; };
	class LMG_03_F					  { quality = 1; price = 7500; };
	class arifle_MX_khk_F             { quality = 1; price = 6500; };
	class arifle_MX_GL_khk_F          { quality = 1; price = 7000; };
	class arifle_MXC_khk_F            { quality = 1; price = 6500; };
	class arifle_MXM_khk_F            { quality = 1; price = 9000; };
	class srifle_LRR_tna_F            { quality = 5; price = 20000; };
	class srifle_GM6_ghex_F           { quality = 5; price = 24000; };
	class srifle_DMR_07_blk_F         { quality = 2; price = 8500; };
	class srifle_DMR_07_hex_F         { quality = 2; price = 8500; };
	class srifle_DMR_07_ghex_F        { quality = 2; price = 8500; };
	class arifle_AK12_F               { quality = 2; price = 7000; };
	class arifle_AK12_GL_F            { quality = 2; price = 7500; };
	class arifle_AKM_F                { quality = 2; price = 7000; };
	class arifle_AKM_FL_F             { quality = 2; price = 7500; };
	class arifle_AKS_F                { quality = 1; price = 5500; };
	class arifle_ARX_blk_F            { quality = 4; price = 12000; };
	class arifle_ARX_ghex_F           { quality = 4; price = 12000; };
	class arifle_ARX_hex_F            { quality = 4; price = 12000; };
	class arifle_CTAR_blk_F           { quality = 1; price = 6000; };
	class arifle_CTAR_hex_F           { quality = 1; price = 6000; };
	class arifle_CTAR_ghex_F          { quality = 1; price = 6000; };
	class arifle_CTAR_GL_blk_F        { quality = 1; price = 6500; };
	class arifle_CTARS_blk_F          { quality = 1; price = 6000; };
	class arifle_CTARS_ghex_F         { quality = 1; price = 6000; };
	class arifle_CTARS_hex_F          { quality = 1; price = 6000; };
	class arifle_SPAR_01_blk_F        { quality = 1; price = 5500; };
	class arifle_SPAR_01_khk_F        { quality = 1; price = 5500; };
	class arifle_SPAR_01_snd_F        { quality = 1; price = 5500; };
	class arifle_SPAR_01_GL_blk_F     { quality = 1; price = 6000; };
	class arifle_SPAR_01_GL_khk_F     { quality = 1; price = 6000; };
	class arifle_SPAR_01_GL_snd_F     { quality = 1; price = 6000; };
	class arifle_SPAR_02_blk_F        { quality = 1; price = 5000; };
	class arifle_SPAR_02_khk_F        { quality = 1; price = 5000; };
	class arifle_SPAR_02_snd_F        { quality = 1; price = 5000; };
	class arifle_SPAR_03_blk_F        { quality = 2; price = 7000; };
	class arifle_SPAR_03_khk_F        { quality = 2; price = 7000; };
	class arifle_SPAR_03_snd_F        { quality = 2; price = 7000; };					
	class muzzle_snds_H_khk_F         { quality = 1; price = 325; };
	class muzzle_snds_H_snd_F         { quality = 1; price = 325; };
	class muzzle_snds_58_blk_F        { quality = 1; price = 325; };
	class muzzle_snds_m_khk_F         { quality = 1; price = 300; };
	class muzzle_snds_m_snd_F         { quality = 1; price = 300; };
	class muzzle_snds_B_khk_F         { quality = 1; price = 350; };
	class muzzle_snds_B_snd_F         { quality = 1; price = 350; };
	class muzzle_snds_58_wdm_F        { quality = 1; price = 325; };
	class muzzle_snds_65_TI_blk_F     { quality = 1; price = 325; };
	class muzzle_snds_65_TI_hex_F     { quality = 1; price = 325; };
	class muzzle_snds_65_TI_ghex_F    { quality = 1; price = 325; };
	class muzzle_snds_H_MG_blk_F      { quality = 1; price = 350; };
	class muzzle_snds_H_MG_khk_F      { quality = 1; price = 350; };
	class optic_Arco_blk_F            { quality = 1; price = 250; };
	class optic_Arco_ghex_F           { quality = 1; price = 250; };
	class optic_DMS_ghex_F            { quality = 1; price = 350; };
	class optic_Hamr_khk_F            { quality = 1; price = 250; };
	class optic_ERCO_blk_F            { quality = 1; price = 250; };
	class optic_ERCO_khk_F            { quality = 1; price = 250; };
	class optic_ERCO_snd_F            { quality = 1; price = 250; };
	class optic_SOS_khk_F             { quality = 1; price = 200; };
	class optic_LRPS_tna_F            { quality = 2; price = 300; };
	class optic_LRPS_ghex_F           { quality = 2; price = 300; };
	class optic_Holosight_blk_F       { quality = 1; price = 100; };
	class optic_Holosight_khk_F       { quality = 1; price = 100; };
	class optic_Holosight_smg_blk_F   { quality = 1; price = 100; };
	class bipod_01_F_khk              { quality = 1; price = 100; sellPrice = 1; };
	class O_NVGoggles_hex_F           { quality = 1; price = 300; };
	class O_NVGoggles_urb_F           { quality = 1; price = 300; };
	class O_NVGoggles_ghex_F          { quality = 1; price = 300; };
	class NVGoggles_tna_F             { quality = 1; price = 300; };
	//class NVGogglesB_blk_F            { quality = 1; price = 1000; }; //Normal NightV but fullscreen thermal
	//class NVGogglesB_grn_F            { quality = 1; price = 1000; };	//Normal NightV but fullscreen thermal
	//class NVGogglesB_gry_F            { quality = 1; price = 1000; };	//Normal NightV but fullscreen thermal
	//class Laserdesignator_01_khk_F    { quality = 1; price = 1000; };	//Thermal
	//class Laserdesignator_02_ghex_F   { quality = 1; price = 1000; };	//Thermal
	class U_B_T_Soldier_F             { quality = 2; price = 150; };
	class U_B_T_Soldier_AR_F          { quality = 2; price = 150; };
	class U_B_T_Soldier_SL_F          { quality = 2; price = 150; };
	class U_B_T_Sniper_F              { quality = 3; price = 150; };
	class U_B_T_FullGhillie_tna_F     { quality = 3; price = 500; };
	class U_B_CTRG_Soldier_F          { quality = 2; price = 150; };
	class U_B_CTRG_Soldier_2_F        { quality = 2; price = 150; };
	class U_B_CTRG_Soldier_3_F        { quality = 2; price = 150; };
	class U_B_GEN_Soldier_F           { quality = 2; price = 150; };
	class U_B_GEN_Commander_F         { quality = 2; price = 150; };
	class U_O_T_Soldier_F             { quality = 2; price = 150; };
	class U_O_T_Officer_F             { quality = 3; price = 150; };
	class U_O_T_Sniper_F              { quality = 3; price = 150; };
	class U_O_T_FullGhillie_tna_F     { quality = 3; price = 500; };
	class U_O_V_Soldier_Viper_F       { quality = 4; price = 5000; };
	class U_O_V_Soldier_Viper_hex_F   { quality = 4; price = 5000; };
	class U_I_C_Soldier_Para_1_F      { quality = 2; price = 100; };
	class U_I_C_Soldier_Para_2_F      { quality = 2; price = 100; };
	class U_I_C_Soldier_Para_3_F      { quality = 2; price = 100; };
	class U_I_C_Soldier_Para_4_F      { quality = 2; price = 100; };
	class U_I_C_Soldier_Para_5_F      { quality = 2; price = 100; };
	class U_I_C_Soldier_Bandit_1_F    { quality = 1; price = 100; };
	class U_I_C_Soldier_Bandit_2_F    { quality = 1; price = 100; };
	class U_I_C_Soldier_Bandit_3_F    { quality = 1; price = 100; };
	class U_I_C_Soldier_Bandit_4_F    { quality = 1; price = 100; };
	class U_I_C_Soldier_Bandit_5_F    { quality = 1; price = 100; };
	class U_I_C_Soldier_Camo_F        { quality = 2; price = 150; };
	class U_C_man_sport_1_F           { quality = 1; price = 100; };
	class U_C_man_sport_2_F           { quality = 1; price = 100; };
	class U_C_man_sport_3_F           { quality = 1; price = 100; };
	class U_C_Man_casual_1_F          { quality = 1; price = 100; };
	class U_C_Man_casual_2_F          { quality = 1; price = 100; };
	class U_C_Man_casual_3_F          { quality = 1; price = 100; };
	class U_C_Man_casual_4_F          { quality = 1; price = 100; };
	class U_C_Man_casual_5_F          { quality = 1; price = 100; };
	class U_C_Man_casual_6_F          { quality = 1; price = 100; };
	class U_B_CTRG_Soldier_urb_1_F    { quality = 2; price = 150; };
	class U_B_CTRG_Soldier_urb_2_F    { quality = 2; price = 150; };
	class U_B_CTRG_Soldier_urb_3_F    { quality = 2; price = 150; };
	class H_Helmet_Skate              { quality = 2; price = 20; };
	class H_HelmetB_TI_tna_F          { quality = 4; price = 500; };
	//class H_HelmetO_ViperSP_hex_F     { quality = 4; price = 10000; };		//Thermal
	//class H_HelmetO_ViperSP_ghex_F    { quality = 4; price = 10000; }; 	//Thermal 
	class H_HelmetB_tna_F             { quality = 3; price = 300; };
	class H_HelmetB_Enh_tna_F         { quality = 4; price = 100; };
	class H_HelmetB_Light_tna_F       { quality = 2; price = 100; };
	class H_HelmetSpecO_ghex_F        { quality = 2; price = 100; };
	class H_HelmetLeaderO_ghex_F      { quality = 2; price = 175; };
	class H_HelmetO_ghex_F            { quality = 2; price = 150; };
	class H_HelmetCrew_O_ghex_F       { quality = 2; price = 100; };
	class H_MilCap_tna_F              { quality = 1; price = 8; };
	class H_MilCap_ghex_F             { quality = 1; price = 8; };
	class H_Booniehat_tna_F           { quality = 1; price = 4; };
	class H_Beret_gen_F               { quality = 2; price = 12; };
	class H_MilCap_gen_F              { quality = 1; price = 10; };
	class H_Cap_oli_Syndikat_F        { quality = 1; price = 6; };
	class H_Cap_tan_Syndikat_F        { quality = 1; price = 6; };
	class H_Cap_blk_Syndikat_F        { quality = 1; price = 6; };
	class H_Cap_grn_Syndikat_F        { quality = 1; price = 6; };
	class H_FakeHeadgear_Syndikat_F   { quality = 1; price = 6; };
	class V_TacChestrig_grn_F         { quality = 1; price = 100; };
	class V_TacChestrig_oli_F         { quality = 1; price = 100; };
	class V_TacChestrig_cbr_F         { quality = 1; price = 100; };
	class V_PlateCarrier1_tna_F       { quality = 3; price = 300; };
	class V_PlateCarrier2_tna_F       { quality = 3; price = 300; };
	class V_PlateCarrierSpec_tna_F    { quality = 3; price = 600; };
	class V_PlateCarrierGL_tna_F      { quality = 3; price = 500; };
	class V_HarnessO_ghex_F           { quality = 2; price = 100; };
	class V_HarnessOGL_ghex_F         { quality = 1; price = 100; };
	class V_BandollierB_ghex_F        { quality = 1; price = 100; };
	class V_TacVest_gen_F             { quality = 1; price = 25; };
	class V_PlateCarrier1_rgr_noflag_F		{ quality = 2; price = 300; };
	class V_PlateCarrier2_rgr_noflag_F		{ quality = 2; price = 300; };
	class B_Bergen_Base_F					{ quality = 3; price = 5000; };
	class B_Bergen_mcamo_F                  { quality = 3; price = 5000; };
	class B_Bergen_dgtl_F                   { quality = 3; price = 5000; };
	class B_Bergen_hex_F                    { quality = 3; price = 5000; };
	class B_Bergen_tna_F                    { quality = 3; price = 5000; };
	class B_AssaultPack_tna_F               { quality = 1; price = 500; };
	class B_Carryall_ghex_F                 { quality = 1; price = 1500; };
	class B_FieldPack_ghex_F                { quality = 1; price = 700; };
	class B_ViperHarness_base_F             { quality = 3; price = 1000; };
	class B_ViperHarness_blk_F              { quality = 3; price = 1000; };
	class B_ViperHarness_ghex_F             { quality = 3; price = 1000; };
	class B_ViperHarness_hex_F              { quality = 3; price = 1000; };
	class B_ViperHarness_khk_F              { quality = 3; price = 1000; };
	class B_ViperHarness_oli_F              { quality = 3; price = 1000; };
	class B_ViperLightHarness_base_F        { quality = 2; price = 1000; };
	class B_ViperLightHarness_blk_F         { quality = 2; price = 1000; };
	class B_ViperLightHarness_ghex_F        { quality = 2; price = 1000; };
	class B_ViperLightHarness_hex_F         { quality = 2; price = 1000; };
	class B_ViperLightHarness_khk_F         { quality = 2; price = 1000; };
	class B_ViperLightHarness_oli_F         { quality = 2; price = 1000; };
	class 30Rnd_9x21_Mag_SMG_02						{quality = 1; price = 120; };
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Red          {quality = 1; price = 120; };
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Yellow       {quality = 1; price = 120; };
	class 30Rnd_9x21_Mag_SMG_02_Tracer_Green        {quality = 1; price = 120; };
	class 30Rnd_580x42_Mag_F                        {quality = 1; price = 200; };
	class 30Rnd_580x42_Mag_Tracer_F                 {quality = 1; price = 200; };
	class 100Rnd_580x42_Mag_F                       {quality = 1; price = 200; };
	class 100Rnd_580x42_Mag_Tracer_F                {quality = 1; price = 200; };
	class 20Rnd_650x39_Cased_Mag_F                  {quality = 1; price = 250; };
	class 10Rnd_50BW_Mag_F                          {quality = 3; price = 350; };
	class 150Rnd_556x45_Drum_Mag_F                  {quality = 1; price = 350; };
	class 150Rnd_556x45_Drum_Mag_Tracer_F           {quality = 1; price = 350; };
	class 30Rnd_762x39_Mag_F                        {quality = 1; price = 300; };
	class 30Rnd_762x39_Mag_Green_F                  {quality = 1; price = 300; };
	class 30Rnd_762x39_Mag_Tracer_F                 {quality = 1; price = 300; };
	class 30Rnd_762x39_Mag_Tracer_Green_F           {quality = 1; price = 300; };
	class 30Rnd_545x39_Mag_F                        {quality = 1; price = 150; };
	class 30Rnd_545x39_Mag_Green_F                  {quality = 1; price = 150; };
	class 30Rnd_545x39_Mag_Tracer_F                 {quality = 1; price = 150; };
	class 30Rnd_545x39_Mag_Tracer_Green_F           {quality = 1; price = 150; };
	class 200Rnd_556x45_Box_F                       {quality = 1; price = 350; };
	class 200Rnd_556x45_Box_Red_F                   {quality = 1; price = 350; };
	class 200Rnd_556x45_Box_Tracer_F                {quality = 1; price = 350; };
	class 200Rnd_556x45_Box_Tracer_Red_F            {quality = 1; price = 350; };
	class 10Rnd_9x21_Mag							{quality = 1; price = 50; };
	class 30Rnd_9x21_Yellow_Mag						{quality = 1; price = 40; };
	class 30Rnd_9x21_Green_Mag						{quality = 1; price = 40; };
	class 30Rnd_9x21_Red_Mag						{quality = 1; price = 40; };
	
	///////////////////////////////////////////////////////////////////////////////
	// BIKES
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Bike_OldBike 						{ quality = 1; price = 80; };
	class Exile_Bike_MountainBike 					{ quality = 1; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// QUAD BIKES
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Bike_QuadBike_Blue					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Red					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Nato					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Csat					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Fia					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Guerilla01			{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Guerilla02			{ quality = 1; price = 500; };

	///////////////////////////////////////////////////////////////////////////////
	// KARTS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Kart_BluKing					{ quality = 1; price = 1000; };
	class Exile_Car_Kart_RedStone					{ quality = 1; price = 1000; };
	class Exile_Car_Kart_Vrana						{ quality = 1; price = 1000; };
	class Exile_Car_Kart_Green						{ quality = 1; price = 1000; };
	class Exile_Car_Kart_Blue						{ quality = 1; price = 1000; };
	class Exile_Car_Kart_Orange						{ quality = 1; price = 1000; };
	class Exile_Car_Kart_White						{ quality = 1; price = 1000; };
	class Exile_Car_Kart_Yellow						{ quality = 1; price = 1000; };
	class Exile_Car_Kart_Black						{ quality = 1; price = 1000; };

	///////////////////////////////////////////////////////////////////////////////
	// MOTOR BOATS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_MotorBoat_Police				{ quality = 1; price = 2000; };
	class Exile_Boat_MotorBoat_Orange				{ quality = 1; price = 2000; };
	class Exile_Boat_MotorBoat_White				{ quality = 1; price = 2000; };

	///////////////////////////////////////////////////////////////////////////////
	// RUBBER DUCKS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_RubberDuck_CSAT				{ quality = 1; price = 1000; };
	class Exile_Boat_RubberDuck_Digital				{ quality = 1; price = 1000; };
	class Exile_Boat_RubberDuck_Orange				{ quality = 1; price = 1000; };
	class Exile_Boat_RubberDuck_Blue				{ quality = 1; price = 1000; };
	class Exile_Boat_RubberDuck_Black				{ quality = 1; price = 1000; };

	///////////////////////////////////////////////////////////////////////////////
	// SDV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_SDV_CSAT						{ quality = 2; price = 10000; };
	class Exile_Boat_SDV_Digital					{ quality = 2; price = 10000; };
	class Exile_Boat_SDV_Grey						{ quality = 2; price = 10000; };

	///////////////////////////////////////////////////////////////////////////////
	// UH-1H Huey
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huey_Green 					{ quality = 2; price = 24000; };
	class Exile_Chopper_Huey_Desert					{ quality = 2; price = 24000; };
	class Exile_Chopper_Huey_Armed_Green			{ quality = 2; price = 36000; };
	class Exile_Chopper_Huey_Armed_Desert			{ quality = 2; price = 36000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// ARMED BOAT
	///////////////////////////////////////////////////////////////////////////////
	class B_Boat_Armed_01_minigun_F            		{ quality = 5; price = 50000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Hellcat
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hellcat_Green				{ quality = 2; price = 25000; };
	class I_Heli_light_03_F							{ quality = 6; price = 425000; };	
	class Exile_Chopper_Hellcat_FIA					{ quality = 2; price = 25000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hummingbird
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hummingbird_Green			{ quality = 2; price = 10000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hummingbird (Civillian)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hummingbird_Civillian_Blue				{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Red				{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_ION				{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_BlueLine			{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Digital			{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Elliptical		{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Furious			{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_GrayWatcher		{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Jeans				{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Light				{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Shadow			{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Sheriff			{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Speedy			{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Sunset			{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Vrana				{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Wasp				{ quality = 1; price = 8000; };
	class Exile_Chopper_Hummingbird_Civillian_Wave				{ quality = 1; price = 8000; };

	///////////////////////////////////////////////////////////////////////////////
	// Huron
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huron_Black								{ quality = 3; price = 55000; };
	class Exile_Chopper_Huron_Green								{ quality = 3; price = 55000; };

	///////////////////////////////////////////////////////////////////////////////
	// Mohawk
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Mohawk_FIA								{ quality = 3; price = 24000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ghosthawk
	///////////////////////////////////////////////////////////////////////////////
	class B_Heli_Transport_01_F								{ quality = 5; price = 150000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Pawnee
	///////////////////////////////////////////////////////////////////////////////
	class B_Heli_light_01_armed_F								{ quality = 6; price = 250000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Orca
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Orca_CSAT								{ quality = 2; price = 16000; };
	class Exile_Chopper_Orca_Black								{ quality = 2; price = 16000; };
	class Exile_Chopper_Orca_BlackCustom						{ quality = 2; price = 16000; };

	///////////////////////////////////////////////////////////////////////////////
	// Taru
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Transport_CSAT						{ quality = 2; price = 45000; };
	class Exile_Chopper_Taru_Transport_Black					{ quality = 2; price = 45000; };                                                                                      
	class Exile_Chopper_Taru_CSAT								{ quality = 2; price = 40000; };
	class Exile_Chopper_Taru_Black								{ quality = 2; price = 40000; };                                                                         
	class Exile_Chopper_Taru_Covered_CSAT						{ quality = 2; price = 35000; };
	class Exile_Chopper_Taru_Covered_Black						{ quality = 2; price = 35000; };

	///////////////////////////////////////////////////////////////////////////////
	// Cessna
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Plane_Cessna									{ quality = 1; price = 10000; };

	///////////////////////////////////////////////////////////////////////////////
	// An-2
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Plane_AN2_Green									{ quality = 2; price = 17000; };
	class Exile_Plane_AN2_White									{ quality = 2; price = 17000; };
	class Exile_Plane_AN2_Stripe								{ quality = 2; price = 17000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Hatchback
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Beige						{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_Green						{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_Blue						{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_BlueCustom				{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_BeigeCustom				{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_Yellow					{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_Grey						{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_Black						{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_Dark						{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_Rusty1					{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_Rusty2					{ quality = 1; price = 4000; };
	class Exile_Car_Hatchback_Rusty3					{ quality = 1; price = 4000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Golf
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Golf_Red							{ quality = 1; price = 4500; };
	class Exile_Car_Golf_Black							{ quality = 1; price = 4500; };

	///////////////////////////////////////////////////////////////////////////////
	// Ikarus
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ikarus_Blue 				{ quality = 1; price = 7000; };
	class Exile_Car_Ikarus_Red 					{ quality = 1; price = 7000; };
	class Exile_Car_Ikarus_Party 				{ quality = 1; price = 7000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ural (Open)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ural_Open_Blue			{ quality = 1; price = 18000; };
	class Exile_Car_Ural_Open_Yellow		{ quality = 1; price = 18000; };
	class Exile_Car_Ural_Open_Worker		{ quality = 1; price = 18000; };
	class Exile_Car_Ural_Open_Military		{ quality = 1; price = 18000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ural (Covered)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ural_Covered_Blue			{ quality = 2; price = 20000; };
	class Exile_Car_Ural_Covered_Yellow			{ quality = 2; price = 20000; };
	class Exile_Car_Ural_Covered_Worker			{ quality = 2; price = 20000; };
	class Exile_Car_Ural_Covered_Military		{ quality = 2; price = 20000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// V3S
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_V3S_Open			{ quality = 2; price = 28000; };
	class Exile_Car_V3S_Covered			{ quality = 2; price = 28000; };

	///////////////////////////////////////////////////////////////////////////////
	// SUVXL
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUVXL_Black 				{ quality = 1; price = 15000; };

	///////////////////////////////////////////////////////////////////////////////
	// Tractor
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Tractor_Red 				{ quality = 1; price = 2500; };

	///////////////////////////////////////////////////////////////////////////////
	// Tractor (Old)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_OldTractor_Red 				{ quality = 1; price = 2000; };

	///////////////////////////////////////////////////////////////////////////////
	// Tow Tractor
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_TowTractor_White			{ quality = 1; price = 3000; };

	///////////////////////////////////////////////////////////////////////////////
	// Octavius
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Octavius_White				{ quality = 1; price = 6000; };
	class Exile_Car_Octavius_Black				{ quality = 1; price = 6000; };

	///////////////////////////////////////////////////////////////////////////////
	// UAZ
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_UAZ_Green				{ quality = 1; price = 10000; };

	///////////////////////////////////////////////////////////////////////////////
	// UAZ (Open)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_UAZ_Open_Green			{ quality = 1; price = 8000; };

	///////////////////////////////////////////////////////////////////////////////
	// Land Rover
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_LandRover_Red 				{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Urban 			{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Green 			{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Sand 				{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Desert 			{ quality = 1; price = 11000; };

	///////////////////////////////////////////////////////////////////////////////
	// Land Rover (Ambulance)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_LandRover_Ambulance_Green		{ quality = 1; price = 12000; };
	class Exile_Car_LandRover_Ambulance_Desert		{ quality = 1; price = 12000; };
	class Exile_Car_LandRover_Ambulance_Sand		{ quality = 1; price = 12000; };

	///////////////////////////////////////////////////////////////////////////////
	// Lada
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Lada_Green 				{ quality = 1; price = 6000; };
	class Exile_Car_Lada_Taxi 				{ quality = 1; price = 6000; };
	class Exile_Car_Lada_Red 				{ quality = 1; price = 6000; };
	class Exile_Car_Lada_White 				{ quality = 1; price = 6000; };
	class Exile_Car_Lada_Hipster 			{ quality = 1; price = 6000; };

	///////////////////////////////////////////////////////////////////////////////
	// Volha
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Volha_Blue				{ quality = 1; price = 7000; };
	class Exile_Car_Volha_White				{ quality = 1; price = 7000; };
	class Exile_Car_Volha_Black				{ quality = 1; price = 7000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback (Sport)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Sport_Red					{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Sport_Blue				{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Sport_Orange				{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Sport_White				{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Sport_Beige				{ quality = 1; price = 6000; };
	class Exile_Car_Hatchback_Sport_Green				{ quality = 1; price = 6000; };

	///////////////////////////////////////////////////////////////////////////////
	// HEMMT
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_HEMMT 								{ quality = 3; price = 40000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hunter
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hunter 								{ quality = 3; price = 35000; };
	class B_MRAP_01_hmg_F 								{ quality = 4; price = 150000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ifrit
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ifrit 								{ quality = 3; price = 40000; };
	class O_MRAP_02_hmg_F 								{ quality = 4; price = 175000; };

	///////////////////////////////////////////////////////////////////////////////
	// Offroad
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Red							{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Beige						{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_White						{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Blue						{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_DarkRed						{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_BlueCustom					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla01					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla02					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla03					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla04					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla05					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla06					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla07					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla08					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla09					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla10					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla11					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Guerilla12					{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Rusty1						{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Rusty2						{ quality = 1; price = 17500; };
	class Exile_Car_Offroad_Rusty3						{ quality = 1; price = 17500; };

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Armed)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Armed_Guerilla01 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla02 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla03 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla04 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla05 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla06 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla07 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla08 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla09 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla10 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla11 			{ quality = 2; price = 30000; };
	class Exile_Car_Offroad_Armed_Guerilla12 			{ quality = 2; price = 30000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Repair)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Repair_Civillian 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Red 					{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Beige 				{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_White 				{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Blue 				{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_DarkRed 				{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_BlueCustom 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla01 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla02 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla03 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla04 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla05 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla06 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla07 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla08 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla09 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla10 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla11 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla12 			{ quality = 1; price = 12500; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Strider
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Strider 							{ quality = 3; price = 50000; };
	class I_MRAP_03_hmg_F 							   { quality = 6; price = 200000; };

	///////////////////////////////////////////////////////////////////////////////
	// SUV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUV_Red 							{ quality = 1; price = 13000; };
	class Exile_Car_SUV_Black 							{ quality = 1; price = 13000; };
	class Exile_Car_SUV_Grey 							{ quality = 1; price = 13000; };
	class Exile_Car_SUV_Orange 							{ quality = 1; price = 13000; };

	///////////////////////////////////////////////////////////////////////////////
	// SUV (Armed)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUV_Armed_Black 					{ quality = 4; price = 55000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// BRDM2
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_BRDM2_HQ 							{ quality = 4; price = 85000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// BTR40
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_BTR40_MG_Green 							{ quality = 4; price = 38000; };
	class Exile_Car_BTR40_MG_Camo 							{ quality = 4; price = 38000; };
	class Exile_Car_BTR40_Green 							{ quality = 2; price = 20000; };
	class Exile_Car_BTR40_Camo 								{ quality = 2; price = 20000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// HMMWV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_HMMWV_M134_Green 							{ quality = 5; price = 70000; };
	class Exile_Car_HMMWV_M134_Desert 							{ quality = 5; price = 70000; };
	class Exile_Car_HMMWV_M2_Green 								{ quality = 5; price = 25000; };
	class Exile_Car_HMMWV_M2_Desert 							{ quality = 5; price = 25000; };
	class Exile_Car_HMMWV_MEV_Green 							{ quality = 2; price = 13000; };
	class Exile_Car_HMMWV_MEV_Desert 							{ quality = 2; price = 13000; };
	class Exile_Car_HMMWV_UNA_Green 							{ quality = 2; price = 13000; };
	class Exile_Car_HMMWV_UNA_Desert 							{ quality = 2; price = 13000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Tempest
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Tempest 							{ quality = 3; price = 35000; };

	///////////////////////////////////////////////////////////////////////////////
	// Van 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Black 							{ quality = 2; price = 15000; };
	class Exile_Car_Van_White 							{ quality = 2; price = 15000; };
	class Exile_Car_Van_Red 							{ quality = 2; price = 15000; };
	class Exile_Car_Van_Guerilla01 						{ quality = 2; price = 15000; };
	class Exile_Car_Van_Guerilla02 						{ quality = 2; price = 15000; };
	class Exile_Car_Van_Guerilla03 						{ quality = 2; price = 15000; };
	class Exile_Car_Van_Guerilla04 						{ quality = 2; price = 15000; };
	class Exile_Car_Van_Guerilla05 						{ quality = 2; price = 15000; };
	class Exile_Car_Van_Guerilla06 						{ quality = 2; price = 15000; };
	class Exile_Car_Van_Guerilla07 						{ quality = 2; price = 15000; };
	class Exile_Car_Van_Guerilla08 						{ quality = 2; price = 15000; };

	///////////////////////////////////////////////////////////////////////////////
	// Van (Box) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Box_Black 						{ quality = 2; price = 16000; };
	class Exile_Car_Van_Box_White 						{ quality = 2; price = 16000; };
	class Exile_Car_Van_Box_Red 						{ quality = 2; price = 16000; };
	class Exile_Car_Van_Box_Guerilla01 					{ quality = 2; price = 16000; };
	class Exile_Car_Van_Box_Guerilla02 					{ quality = 2; price = 16000; };
	class Exile_Car_Van_Box_Guerilla03 					{ quality = 2; price = 16000; };
	class Exile_Car_Van_Box_Guerilla04 					{ quality = 2; price = 16000; };
	class Exile_Car_Van_Box_Guerilla05 					{ quality = 2; price = 16000; };
	class Exile_Car_Van_Box_Guerilla06 					{ quality = 2; price = 16000; };
	class Exile_Car_Van_Box_Guerilla07 					{ quality = 2; price = 16000; };
	class Exile_Car_Van_Box_Guerilla08 					{ quality = 2; price = 16000; };

	///////////////////////////////////////////////////////////////////////////////
	// Van (Fuel) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Fuel_Black 						{ quality = 2; price = 18000; };
	class Exile_Car_Van_Fuel_White 						{ quality = 2; price = 18000; };
	class Exile_Car_Van_Fuel_Red 						{ quality = 2; price = 18000; };
	class Exile_Car_Van_Fuel_Guerilla01 				{ quality = 2; price = 18000; };
	class Exile_Car_Van_Fuel_Guerilla02 				{ quality = 2; price = 18000; };
	class Exile_Car_Van_Fuel_Guerilla03 				{ quality = 2; price = 18000; };

	///////////////////////////////////////////////////////////////////////////////
	// Zamak
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Zamak 								{ quality = 3; price = 43000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Water Scooter
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_WaterScooter						{ quality = 1; price = 800; };
	
	///////////////////////////////////////////////////////////////////////////////
	// RHIB
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_RHIB								{ quality = 2; price = 1500; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Ceaser BTT
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Plane_Ceasar							{ quality = 2; price = 15000; };
	
	///////////////////////////////////////////////////////////////////////////////

	// V-44 X Blackfish
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Plane_BlackfishInfantry					{ quality = 5; price = 60000; };
	class Exile_Plane_BlackfishVehicle					{ quality = 5; price = 60000; };
	class B_T_VTOL_01_infantry_F						{ quality = 6; price = 110000; };
	class B_T_VTOL_01_vehicle_F							{ quality = 6; price = 120000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Prowler
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_ProwlerLight						{ quality = 2; price = 22000; };
	class Exile_Car_ProwlerUnarmed						{ quality = 2; price = 22000; };
	class B_lsv_01_armed_f								{ quality = 2; price = 35000; };
	class B_lsv_01_armed_black_f						{ quality = 2; price = 35000; };
	class B_lsv_01_armed_olive_f						{ quality = 2; price = 35000; };
	class B_lsv_01_armed_sand_f							{ quality = 2; price = 35000; };
	
	
	///////////////////////////////////////////////////////////////////////////////
	// Qilin
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_QilinUnarmed						{ quality = 2; price = 20000; };
	class O_lsv_02_armed_f						 		{ quality = 2; price = 75000; };
	class O_LSV_02_armed_black_f						{ quality = 2; price = 75000; };
	class O_LSV_02_armed_arid_f							{ quality = 2; price = 75000; };
	class O_LSV_02_armed_ghex_f							{ quality = 2; price = 75000; };
	///////////////////////////////////////////////////////////////////////////////
	// MB 4WD
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_MB4WD								{ quality = 1; price = 15000; };
	class Exile_Car_MB4WDOpen							{ quality = 1; price = 15000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Flags
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_FlagStolen1						{ quality = 1; price = 10000;  sellPrice = 10000; };
	class Exile_Item_FlagStolen2						{ quality = 1; price = 20000; sellPrice = 20000; };
	class Exile_Item_FlagStolen3						{ quality = 1; price = 30000; sellPrice = 30000; };
	class Exile_Item_FlagStolen4						{ quality = 1; price = 40000; sellPrice = 40000; };
	class Exile_Item_FlagStolen5						{ quality = 1; price = 50000; sellPrice = 50000; };
	class Exile_Item_FlagStolen6						{ quality = 1; price = 60000; sellPrice = 60000; };
	class Exile_Item_FlagStolen7						{ quality = 1; price = 70000; sellPrice = 70000; };
	class Exile_Item_FlagStolen8						{ quality = 1; price = 80000; sellPrice = 80000; };
	class Exile_Item_FlagStolen9						{ quality = 1; price = 90000; sellPrice = 90000; };
	class Exile_Item_FlagStolen10						{ quality = 1; price = 100000; sellPrice = 100000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// NIARMS
	///////////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////////////////////////////////////
	// Attachments
	///////////////////////////////////////////////////////////////////////////////
	
	
	///////////////////////////////////////////////////////////////////////////////
	// Muzzle Attachments
	///////////////////////////////////////////////////////////////////////////////
	class hlc_muzzle_300blk_KAC 					{ quality = 1; price = 400; };
	class hlc_muzzle_545SUP_AK 						{ quality = 1; price = 400; };
	class hlc_muzzle_556NATO_KAC 					{ quality = 1; price = 400; };
	class hlc_muzzle_762SUP_AK						{ quality = 1; price = 400; };
	class hlc_muzzle_Agendasix 						{ quality = 1; price = 400; };
	class hlc_muzzle_Agendasix10mm 					{ quality = 1; price = 400; };
	class hlc_muzzle_snds_a6AUG 					{ quality = 1; price = 400; };
	class hlc_muzzle_snds_AUG 						{ quality = 1; price = 400; };
	class hlc_muzzle_snds_fal 						{ quality = 1; price = 400; };
	class hlc_muzzle_snds_g3 						{ quality = 1; price = 400; };
	class hlc_muzzle_snds_HK33 						{ quality = 1; price = 400; };
	class hlc_muzzle_snds_M14 						{ quality = 1; price = 400; };
	class hlc_muzzle_Tundra 						{ quality = 1; price = 400; };
	class Muzzle_HBadger 							{ quality = 1; price = 400; };	
	
	///////////////////////////////////////////////////////////////////////////////
	// Optic Attachments
	///////////////////////////////////////////////////////////////////////////////
	class HLC_Optic_1p29 							{ quality = 1; price = 300; };
	class hlc_optic_accupoint_g3 					{ quality = 1; price = 400; };
	class hlc_optic_artel_m14 						{ quality = 1; price = 400; };
	class HLC_Optic_G36Dualoptic15x 				{ quality = 1; price = 300; };
	class HLC_Optic_G36Dualoptic15x2d				{ quality = 1; price = 400; };
	class HLC_Optic_G36dualoptic35x					{ quality = 1; price = 300; };
	class HLC_Optic_G36dualoptic35x2d 				{ quality = 1; price = 400; };
	class HLC_Optic_G36Export15x 					{ quality = 1; price = 300; };
	class HLC_Optic_G36Export15x2d 					{ quality = 1; price = 400; };
	class HLC_Optic_G36Export35x 					{ quality = 1; price = 300; };
	class HLC_Optic_G36Export35x2d 					{ quality = 1; price = 400; };
	class hlc_optic_goshawk 						{ quality = 1; price = 20000; };
	class hlc_optic_Kern 							{ quality = 1; price = 500; };
	class hlc_optic_Kern2d 							{ quality = 1; price = 500; };
	class hlc_optic_kobra 							{ quality = 1; price = 200; };
	class hlc_optic_LRT_m14 						{ quality = 1; price = 300; };
	class HLC_Optic_PSO1 							{ quality = 1; price = 500; };
	class hlc_optic_PVS4FAL							{ quality = 1; price = 300; };
	class hlc_optic_PVS4G3 							{ quality = 1; price = 300; };
	class hlc_optic_PVS4M14 						{ quality = 1; price = 300; };
	class hlc_optic_suit 							{ quality = 1; price = 500; };
	class HLC_Optic_ZFSG1 							{ quality = 1; price = 750; };
	

	///////////////////////////////////////////////////////////////////////////////
	// Ammunition
	///////////////////////////////////////////////////////////////////////////////
	class hlc_100rnd_556x45_EPR_G36    				{ quality = 1; price = 100; };
    class hlc_100Rnd_762x51_B_M60E4           		{ quality = 1; price = 400; };
    class hlc_100Rnd_762x51_Barrier_M60E4    		{ quality = 1; price = 400; };
    class hlc_100Rnd_762x51_M_M60E4    				{ quality = 1; price = 400; };
    class hlc_100Rnd_762x51_T_M60E4    				{ quality = 1; price = 400; };
    class hlc_10rnd_12g_buck_S12    				{ quality = 1; price = 50; };
	class hlc_10rnd_12g_slug_S12	   				{ quality = 1; price = 50; };
    class hlc_200rnd_556x45_B_SAW    				{ quality = 1; price = 250; };
    class hlc_200rnd_556x45_M_SAW    				{ quality = 1; price = 250; };
    class hlc_200rnd_556x45_T_SAW    				{ quality = 1; price = 250; };
    class hlc_20Rnd_762x51_b_amt   					{ quality = 1; price = 75; };
    class hlc_20Rnd_762x51_B_fal    				{ quality = 1; price = 75; };
    class hlc_20rnd_762x51_b_G3    					{ quality = 1; price = 100; };
    class hlc_20Rnd_762x51_B_M14    				{ quality = 1; price = 250; };
    class hlc_20Rnd_762x51_barrier_fal    			{ quality = 1; price = 200; };
    class hlc_20rnd_762x51_barrier_G3    			{ quality = 1; price = 250; };
    class hlc_20Rnd_762x51_barrier_M14    			{ quality = 1; price = 250; };
    class hlc_20Rnd_762x51_bball_amt    			{ quality = 1; price = 75; };
    class hlc_20Rnd_762x51_mk316_amt    			{ quality = 1; price = 250; };
    class hlc_20Rnd_762x51_mk316_fal    			{ quality = 1; price = 250; };
    class hlc_20rnd_762x51_Mk316_G3    				{ quality = 1; price = 250; };
    class hlc_20Rnd_762x51_mk316_M14    			{ quality = 1; price = 250; };
    class hlc_20Rnd_762x51_S_fal    				{ quality = 1; price = 150; };
    class hlc_20rnd_762x51_S_G3    					{ quality = 1; price = 150; };
    class hlc_20Rnd_762x51_S_M14    				{ quality = 1; price = 150; };
    class hlc_20Rnd_762x51_T_amt    				{ quality = 1; price = 75; };
    class hlc_20Rnd_762x51_T_fal    				{ quality = 1; price = 150; };
    class hlc_20rnd_762x51_T_G3    					{ quality = 1; price = 200; };
	class hlc_20Rnd_762x51_T_M14    				{ quality = 1; price = 250; };
    class hlc_24Rnd_75x55_ap_stgw    				{ quality = 1; price = 150; };
    class hlc_24Rnd_75x55_B_stgw    				{ quality = 1; price = 150; };
    class hlc_24Rnd_75x55_T_stgw                    { quality = 1; price = 150; };
    class hlc_25Rnd_9x19mm_JHP_AUG    				{ quality = 1; price = 75; };
    class hlc_25Rnd_9x19mm_M882_AUG    				{ quality = 1; price = 75; };
    class hlc_25Rnd_9x19mm_subsonic_AUG    			{ quality = 1; price = 75; };
    class hlc_30Rnd_10mm_B_MP5   					{ quality = 1; price = 75; };
    class hlc_30Rnd_10mm_JHP_MP5    				{ quality = 1; price = 75; };
	class hlc_30Rnd_545x39_B_AK   					{ quality = 1; price = 100; };
    class hlc_30Rnd_545x39_EP_ak   					{ quality = 1; price = 100; };
    class hlc_30Rnd_545x39_S_AK    					{ quality = 1; price = 75; };
    class hlc_30Rnd_545x39_t_ak    					{ quality = 1; price = 100; };
    class hlc_30Rnd_556x45_B_AUG   					{ quality = 1; price = 100; };
    class hlc_30rnd_556x45_b_HK33   				{ quality = 1; price = 100; };
    class hlc_30rnd_556x45_EPR    					{ quality = 1; price = 100; };
    class hlc_30rnd_556x45_EPR_G36    				{ quality = 1; price = 100; };
    class hlc_30rnd_556x45_EPR_HK33    				{ quality = 1; price = 100; };
    class hlc_30rnd_556x45_S    					{ quality = 1; price = 75; };
	class hlc_30rnd_556x45_SOST						{ quality = 1; price = 100; };
    class hlc_30Rnd_556x45_SOST_AUG    				{ quality = 1; price = 100; };
    class hlc_30rnd_556x45_SOST_G36    				{ quality = 1; price = 100; };
    class hlc_30rnd_556x45_SOST_HK33    			{ quality = 1; price = 100; };
    class hlc_30rnd_556x45_SPR    					{ quality = 1; price = 150; };
    class hlc_30Rnd_556x45_SPR_AUG   				{ quality = 1; price = 150; };
    class hlc_30rnd_556x45_SPR_G36   				{ quality = 1; price = 150; };
    class hlc_30Rnd_556x45_T_AUG    				{ quality = 1; price = 100; };
    class hlc_30rnd_556x45_t_HK33   				{ quality = 1; price = 100; };
	class hlc_30rnd_556x45_Tracers_G36				{ quality = 1; price = 100; };
	class hlc_30Rnd_762x39_b_ak   					{ quality = 1; price = 175; };
    class hlc_30rnd_762x39_s_ak   					{ quality = 1; price = 175; };
    class hlc_30Rnd_762x39_t_ak    					{ quality = 1; price = 175; };
    class hlc_30Rnd_9x19_B_MP5    					{ quality = 1; price = 50; };
    class hlc_30Rnd_9x19_GD_MP5    					{ quality = 1; price = 50; };
    class hlc_30Rnd_9x19_SD_MP5    					{ quality = 1; price = 50; };
	class hlc_40Rnd_556x45_B_AUG					{ quality = 1; price = 200; };
    class hlc_40Rnd_556x45_SOST_AUG    				{ quality = 1; price = 200; };
    class hlc_40Rnd_556x45_SPR_AUG    				{ quality = 1; price = 200; };
    class hlc_45Rnd_545x39_t_rpk    				{ quality = 1; price = 350; };
    class hlc_45Rnd_762x39_m_rpk    				{ quality = 1; price = 350; };
    class hlc_45Rnd_762x39_t_rpk   					{ quality = 1; price = 350; };
    class hlc_50rnd_556x45_EPR   					{ quality = 1; price = 200; };
    class hlc_50Rnd_762x51_B_M14    				{ quality = 1; price = 750; };
    class hlc_50rnd_762x51_M_FAL   					{ quality = 1; price = 400; };
	class hlc_50rnd_762x51_M_G3						{ quality = 1; price = 750; };
	class hlc_50rnd_9x19_B_9mmar    				{ quality = 1; price = 400; };
	class hlc_5rnd_3006_1903						{ quality = 1; price = 400; };
    class hlc_5rnd_300WM_AP_AWM    					{ quality = 1; price = 500; };
    class hlc_5rnd_300WM_BTSP_AWM    				{ quality = 1; price = 500; };
    class hlc_5rnd_300WM_FMJ_AWM    				{ quality = 1; price = 500; };
    class hlc_5rnd_300WM_mk248_AWM    				{ quality = 1; price = 500; };
    class hlc_5rnd_300WM_SBT_AWM   					{ quality = 1; price = 500; };
    class hlc_60Rnd_545x39_t_rpk   					{ quality = 1; price = 400; };
    class hlc_75Rnd_762x39_m_rpk    				{ quality = 1; price = 400; };
	class 29rnd_300BLK_stanag   					{ quality = 1; price = 500; };
	class 29rnd_300BLK_stanag_T   					{ quality = 1; price = 500; };
	class 29rnd_300BLK_stanag_S   					{ quality = 1; price = 500; };
   
	///////////////////////////////////////////////////////////////////////////////
	// Pistols
	///////////////////////////////////////////////////////////////////////////////
    class hlc_smg_mp5k 								{ quality = 1; price = 2000; }; //HK MP5K

    ///////////////////////////////////////////////////////////////////////////////
	// Shotguns
	///////////////////////////////////////////////////////////////////////////////
	class hlc_rifle_saiga12k 						{ quality = 1; price = 2000; }; //Izhmash Saiga12K

	///////////////////////////////////////////////////////////////////////////////
	// Sub Machine Guns
	///////////////////////////////////////////////////////////////////////////////
    class hlc_smg_mp510 							{ quality = 1; price = 2500; }; //HK mp5/10
	class hlc_smg_mp5a2								{ quality = 1; price = 3500; }; //HK mp5A2
    class hlc_smg_mp5a3 							{ quality = 1; price = 3000; }; //HK mp5a3
    class hlc_smg_mp5a4 							{ quality = 1; price = 3500; }; //HK mp5a4
    class hlc_smg_mp5k_PDW							{ quality = 1; price = 3000; }; //HK MP5K-PDW
    class hlc_smg_mp5n 								{ quality = 1; price = 3000; }; //HK MP5N
	class hlc_smg_9mmar								{ quality = 1; price = 5000; }; //HK mp5n 9mmar has 40mm GL
	class hlc_smg_mp5sd5 							{ quality = 1; price = 4000; }; //HK MP5SD5
    class hlc_smg_mp5sd6							{ quality = 1; price = 4000; }; //HK MP5SD6  
	class hlc_rifle_augpara							{ quality = 1; price = 4000; }; //Steyr AUGA1 9mm OD
	class hlc_rifle_augpara_b						{ quality = 1; price = 4000; }; //Steyr AUGA1 9mm Black
	class hlc_rifle_augpara_t						{ quality = 1; price = 4000; }; //Steyr AUGA1 9mm Tan
	class hlc_rifle_auga2para						{ quality = 1; price = 4500; }; //Steyr AUGA2 9mm OD
	class hlc_rifle_auga2para_b						{ quality = 1; price = 4500; }; //Steyr AUGA2 9mm Black
	class hlc_rifle_auga2para_t						{ quality = 1; price = 4500; }; //Steyr AUGA2 9mm Tan

	///////////////////////////////////////////////////////////////////////////////
	// Light Machine Guns
	///////////////////////////////////////////////////////////////////////////////
    class hlc_lmg_M249E2							{ quality = 1; price = 7500; }; //M249E2
    class hlc_lmg_m249para 							{ quality = 1; price = 7500; }; //M249E2 Para13.7 in
    class hlc_lmg_M60 								{ quality = 1; price = 8500; }; //M60
    class hlc_lmg_M60E4								{ quality = 1; price = 8500; }; //M60E4
    class hlc_lmg_minimi							{ quality = 1; price = 7500; }; //FN Minimi 18.3 in
    class hlc_lmg_minimi_railed 					{ quality = 1; price = 7500; }; //FN Minimi RIS Solid Stock
    class hlc_lmg_minimipara 						{ quality = 1; price = 7500; }; //FN Minimi Para
    class hlc_lmg_mk48 								{ quality = 1; price = 7500; }; //Mk48 Mod 0
    class hlc_m249_pip1 							{ quality = 1; price = 7500; }; //M249 PIP RIS18.3 in
    class hlc_m249_pip2 							{ quality = 1; price = 7500; }; //M249E2 RIS13.7 in
    class hlc_m249_pip3 							{ quality = 1; price = 7500; }; //M249 PIP RIS PIP Stock
	class hlc_m249_pip4								{ quality = 1; price = 7500; }; //M249 PIP VFGPIP Stock
	class hlc_m249_squantoon						{ quality = 1; price = 7500; }; //M249 Squantoon Special
	class hlc_rifle_mg36							{ quality = 1; price = 5000; }; //MG36
	class hlc_rifle_rpk								{ quality = 1; price = 6000; }; //RPK
	class hlc_rifle_rpk12							{ quality = 1; price = 8000; }; //RPK12
	class hlc_rifle_rpk74n							{ quality = 1; price = 6000; }; //RPK74
	
	///////////////////////////////////////////////////////////////////////////////
	// Assault Rifles
	///////////////////////////////////////////////////////////////////////////////	
    class hlc_rifle_aug 							{ quality = 1; price = 5000; };
	class hlc_rifle_auga1_b 						{ quality = 1; price = 5000; };
	class hlc_rifle_auga1_t 						{ quality = 1; price = 5000; };
	class hlc_rifle_auga1carb 						{ quality = 1; price = 5000; };
	class hlc_rifle_auga1carb_b 					{ quality = 1; price = 5000; };
	class hlc_rifle_auga1carb_t 					{ quality = 1; price = 5000; };
	class hlc_rifle_auga2 							{ quality = 1; price = 5000; };
	class hlc_rifle_auga2_b 						{ quality = 1; price = 5000; };
	class hlc_rifle_auga2_t 						{ quality = 1; price = 5000; };
	class hlc_rifle_auga2carb 						{ quality = 1; price = 5000; };
	class hlc_rifle_auga2carb_b 					{ quality = 1; price = 5000; };
	class hlc_rifle_auga2carb_t 					{ quality = 1; price = 5000; };
	class hlc_rifle_auga2lsw 						{ quality = 1; price = 5500; };
	class hlc_rifle_auga2lsw_b 						{ quality = 1; price = 5500; };
	class hlc_rifle_auga2lsw_t 						{ quality = 1; price = 5500; };
	class hlc_rifle_auga3 							{ quality = 2; price = 6000; };
	class hlc_rifle_auga3_b 						{ quality = 2; price = 6000; };
	class hlc_rifle_auga3_bl 						{ quality = 2; price = 6000; };
	class hlc_rifle_auga3_gl 						{ quality = 2; price = 7500; };
	class hlc_rifle_auga3_gl_b 						{ quality = 2; price = 7500; };
	class hlc_rifle_auga3_gl_bl 					{ quality = 2; price = 7500; };
	class hlc_rifle_aughbar 						{ quality = 1; price = 6000; };
	class hlc_rifle_aughbar_b 						{ quality = 1; price = 6000; };
	class hlc_rifle_aughbar_t 						{ quality = 1; price = 6000; };
	class hlc_rifle_augsr 							{ quality = 1; price = 5000; };
	class hlc_rifle_augsr_b 						{ quality = 1; price = 5000; };
	class hlc_rifle_augsr_t 						{ quality = 1; price = 5000; };
	class hlc_rifle_augsrcarb 						{ quality = 1; price = 5000; };
	class hlc_rifle_augsrcarb_t 					{ quality = 1; price = 5000; };
	class hlc_rifle_augsrcarb_b 					{ quality = 1; price = 5000; };
	class hlc_rifle_augsrhbar 						{ quality = 1; price = 6000; };
	class hlc_rifle_augsrhbar_b 					{ quality = 1; price = 6000; };
    class hlc_rifle_augsrhbar_t 					{ quality = 1; price = 6000; };
	class hlc_rifle_ak12 							{ quality = 1; price = 6000; };
	class hlc_rifle_ak12gl 							{ quality = 1; price = 6500; };
	class hlc_rifle_ak47 							{ quality = 1; price = 6000; };
	class hlc_rifle_ak74 							{ quality = 1; price = 5000; };
	class hlc_rifle_ak74_dirty 						{ quality = 1; price = 5000; };
	class hlc_rifle_ak74_dirty2 					{ quality = 1; price = 5000; };
	class hlc_rifle_ak74_mtk 						{ quality = 1; price = 4500; };
	class hlc_rifle_ak74m 							{ quality = 1; price = 5000; };
	class hlc_rifle_ak74m_gl 						{ quality = 1; price = 5500; };
	class hlc_rifle_ak74m_mtk 						{ quality = 1; price = 4500; };
	class hlc_rifle_akm 							{ quality = 1; price = 5000; };
	class hlc_rifle_akm_mtk 						{ quality = 1; price = 3500; };
	class hlc_rifle_akmgl 							{ quality = 1; price = 5500; };
	class hlc_rifle_aks74 							{ quality = 1; price = 5000; };
	class hlc_rifle_aks74_gl 						{ quality = 1; price = 5500; };
	class hlc_rifle_aks74_mtk 						{ quality = 1; price = 4500; };
	class hlc_rifle_aks74u 							{ quality = 1; price = 4000; };
	class hlc_rifle_aks74u_mtk 						{ quality = 1; price = 3500; };
	class hlc_rifle_aku12 							{ quality = 1; price = 6000; };
	class hlc_rifle_rk62 							{ quality = 1; price = 4500; };
	class hlc_rifle_aek971 							{ quality = 1; price = 5000; };
	class hlc_rifle_aek971_mtk 						{ quality = 1; price = 4500; };
	class hlc_rifle_aek971worn 						{ quality = 1; price = 5000; };
	class hlc_rifle_g36a1 							{ quality = 1; price = 5000; };
	class hlc_rifle_g36a1ag36 						{ quality = 2; price = 6000; };
	class hlc_rifle_g36c 							{ quality = 1; price = 5000; };
	class hlc_rifle_g36cmlic 						{ quality = 4; price = 7000; };
	class hlc_rifle_g36ctac 						{ quality = 1; price = 5000; };
	class hlc_rifle_g36cv 							{ quality = 1; price = 5000; };
	class hlc_rifle_g36e1 							{ quality = 1; price = 5000; };
	class hlc_rifle_g36e1ag36 						{ quality = 3; price = 6000; };
	class hlc_rifle_g36ka1 							{ quality = 1; price = 5000; };
	class hlc_rifle_g36ke1 							{ quality = 1; price = 5000; };
	class hlc_rifle_g36kmlic 						{ quality = 1; price = 7000; };
	class hlc_rifle_g36ktac 						{ quality = 1; price = 5000; };
	class hlc_rifle_g36kv 							{ quality = 1; price = 5000; };
	class hlc_rifle_g36mliag36 						{ quality = 4; price = 7500; };
	class hlc_rifle_g36mlic 						{ quality = 4; price = 7000; };
	class hlc_rifle_g36tac 							{ quality = 1; price = 5000; };
	class hlc_rifle_g36v 							{ quality = 1; price = 5000; };
	class hlc_rifle_g36vag36 						{ quality = 1; price = 6000  };
	class hlc_rifle_g3a3 							{ quality = 1; price = 6500; };
	class hlc_rifle_g3a3ris 						{ quality = 1; price = 7000; };
	class hlc_rifle_g3a3v 							{ quality = 1; price = 6500; };
	class hlc_rifle_g3ka4 							{ quality = 1; price = 6500; };
	class hlc_rifle_g3ka4_gl 						{ quality = 1; price = 8000; };
	class hlc_rifle_hk33a2 							{ quality = 1; price = 4500; };
	class hlc_rifle_hk33a2ris 						{ quality = 1; price = 5000; };
	class hlc_rifle_hk51 							{ quality = 1; price = 5000; };
	class hlc_rifle_hk53 							{ quality = 1; price = 5000; };
	class hlc_rifle_hk53ras 						{ quality = 1; price = 5500; };
	class hlc_rifle_amt 							{ quality = 1; price = 5000; };
	class hlc_rifle_bcmjack 						{ quality = 4; price = 5500; };
	class hlc_rifle_bushmaster300 					{ quality = 5; price = 9000; };
	class hlc_rifle_c1a1 							{ quality = 1; price = 5500; };
	class hlc_rifle_colt727 						{ quality = 1; price = 5500; };
	class hlc_rifle_colt727_gl 						{ quality = 1; price = 7000; };
	class hlc_rifle_cqbr 							{ quality = 1; price = 5000; };
	class hlc_rifle_fal5000 						{ quality = 1; price = 5000; };
	class hlc_rifle_fal5000rail 					{ quality = 1; price = 5500; };
	class hlc_rifle_fal5061 						{ quality = 1; price = 5000; };
	class hlc_rifle_fal5061rail 					{ quality = 1; price = 5500; };
	class hlc_rifle_falosw 							{ quality = 3; price = 6000; };
	class hlc_rifle_honeybadger 					{ quality = 5; price = 10000;};
	class hlc_rifle_l1a1slr 						{ quality = 1; price = 5500; };
	class hlc_rifle_lar 							{ quality = 1; price = 5500; };
	class hlc_rifle_m4 								{ quality = 1; price = 5000; };
	class hlc_rifle_m4m203 							{ quality = 1; price = 5500; };
	class hlc_rifle_osw_gl 							{ quality = 3; price = 9000; };
	class hlc_rifle_ru556 							{ quality = 4; price = 6500; };
	class hlc_rifle_ru5562 							{ quality = 4; price = 6500; };
	class hlc_rifle_samr 							{ quality = 5; price = 8000; };
	class hlc_rifle_samr2 							{ quality = 5; price = 8000; };
	class hlc_rifle_sig5104 						{ quality = 1; price = 5500; };
	class hlc_rifle_slr 							{ quality = 1; price = 5000; };
	class hlc_rifle_slr107u 						{ quality = 1; price = 5000; };
	class hlc_rifle_slr107u_mtk 					{ quality = 1; price = 4000; };
	class hlc_rifle_slrchopmod 						{ quality = 1; price = 5000; };
	class hlc_rifle_stg58f 							{ quality = 1; price = 5000; };
	class hlc_rifle_stgw57 							{ quality = 1; price = 5000; };
	class hlc_rifle_stgw57_commando 				{ quality = 1; price = 5000; };
	class hlc_rifle_stgw57_ris 						{ quality = 1; price = 6000; };
	class hlc_rifle_vendimus 						{ quality = 5; price = 9000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// NIARMS Sniper Rifles
	///////////////////////////////////////////////////////////////////////////////	
    class hlc_rifle_awcovert 						{ quality = 1; price = 9000; }; //AI AWC-M OD
    class hlc_rifle_awcovert_BL 					{ quality = 1; price = 9000; }; //AI AWC-M Black
    class hlc_rifle_awcovert_FDE 					{ quality = 1; price = 9000; }; //AI AWC-M FDE
    class hlc_rifle_awmagnum 						{ quality = 1; price = 8000; }; //AI AWM OD
    class hlc_rifle_awmagnum_bl 					{ quality = 1; price = 8000; }; //AI AWM Black
    class hlc_rifle_awmagnum_bl_ghillie 			{ quality = 1; price = 8000; }; //AI AWM Black+Ghillie
    class hlc_rifle_awmagnum_fde 					{ quality = 1; price = 8000; };
	class hlc_rifle_awmagnum_fde_ghillie			{ quality = 1; price = 8000; };
	class hlc_rifle_awmagnum_OD_ghillie 			{ quality = 1; price = 8000; };
	class hlc_rifle_psg1 							{ quality = 1; price = 7500; };	
	class hlc_rifle_psg1a1 							{ quality = 1; price = 7500; };
	class hlc_rifle_psg1a1_ris 						{ quality = 1; price = 8000; };
	class hlc_rifle_g3sg1 							{ quality = 1; price = 7500; };
	class hlc_rifle_m1903a1 						{ quality = 1; price = 6000; };
	class hlc_rifle_m1903a1_unertl					{ quality = 1; price = 9500; };
	class hlc_rifle_m1903A1OMR 						{ quality = 1; price = 6000; };
	class hlc_rifle_m14 							{ quality = 1; price = 6500; };
	class hlc_rifle_m14_bipod 						{ quality = 1; price = 7500; };
	class hlc_rifle_m14_rail 						{ quality = 1; price = 7500; };
	class hlc_rifle_m14dmr 							{ quality = 1; price = 7500; };
	class hlc_rifle_m14sopmod 						{ quality = 1; price = 8000; };
	class hlc_rifle_m21 							{ quality = 1; price = 8500; };
	
	///////////////////////////////////////////////////////////////////////////////
	// TRYK
	///////////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////////////////////////////////////
    // TRYK Glasses Glasses w/NVGS built in
    ///////////////////////////////////////////////////////////////////////////////
    class TRYK_US_ESS_Glasses                           { quality = 1; price = 150; };
    class TRYK_US_ESS_Glasses_WH                        { quality = 1; price = 150; };
    class TRYK_US_ESS_Glasses_BLK                       { quality = 1; price = 150; };
    class TRYK_US_ESS_Glasses_TAN                       { quality = 1; price = 150; };
    class TRYK_US_ESS_Glasses_TAN_BLK                   { quality = 1; price = 150; };
    class TRYK_SPGEAR_Glasses                           { quality = 1; price = 150; };
    class TRYK_headset_Glasses                          { quality = 1; price = 150; };
    class TRYK_SpsetG_Glasses                           { quality = 1; price = 150; };
    class TRYK_Spset_PHC1_Glasses                       { quality = 1; price = 150; };
    class TRYK_Spset_PHC2_Glasses                       { quality = 1; price = 150; };
    class TRYK_US_ESS_Glasses_H                         { quality = 1; price = 150; };
    class TRYK_US_ESS_Glasses_Cover                     { quality = 1; price = 150; };
    class TRYK_headset2_glasses                         { quality = 1; price = 150; };
 
    ///////////////////////////////////////////////////////////////////////////////
    // TRYK HeadGear
    ///////////////////////////////////////////////////////////////////////////////
    class TRYK_US_ESS_Glasses_NV                        { quality = 1; price = 1250; };
    class TRYK_US_ESS_Glasses_TAN_NV                    { quality = 1; price = 1250; };
    class TRYK_ESS_BLKTAN_NV                            { quality = 1; price = 1250; };
    class TRYK_ESS_BLKBLK_NV                            { quality = 1; price = 1250; };
    class TRYK_G_Shades_Black_NV                        { quality = 1; price = 1250; };
    class TRYK_G_Shades_Blue_NV                         { quality = 1; price = 1250; };
    class TRYK_G_bala_ess_NV                            { quality = 1; price = 1250; };
    class TRYK_bandana_NV                               { quality = 1; price = 1250; };
    class TRYK_SPgearG_NV                               { quality = 1; price = 1250; };
    class TRYK_SPgear_PHC1_NV                           { quality = 1; price = 1250; };
    class TRYK_SPgear_PHC2_NV                           { quality = 1; price = 1250; };
    class TRYK_G_bala_wh_NV                             { quality = 1; price = 1250; };
    class TRYK_ESS_wh_NV                                { quality = 1; price = 1250; };
 
    ///////////////////////////////////////////////////////////////////////////////
    // TRYK HeadGear
    ///////////////////////////////////////////////////////////////////////////////
    class TRYK_ESS_CAP_OD                               { quality = 1; price = 150; };
    class TRYK_ESS_CAP_tan                              { quality = 1; price = 150; };
    class TRYK_R_CAP_BLK                                { quality = 1; price = 150; };
    class TRYK_R_CAP_TAN                                { quality = 1; price = 150; };
    class TRYK_R_CAP_OD_US                              { quality = 1; price = 150; };
    class TRYK_r_cap_tan_Glasses                        { quality = 1; price = 150; };
    class TRYK_r_cap_blk_Glasses                        { quality = 1; price = 150; };
    class TRYK_r_cap_od_Glasses                         { quality = 1; price = 150; };
    class TRYK_H_headsetcap_Glasses                     { quality = 1; price = 150; };
    class TRYK_H_headsetcap_blk_Glasses                 { quality = 1; price = 150; };
    class TRYK_H_headsetcap_od_Glasses                  { quality = 1; price = 150; };
    class TRYK_TAC_EARMUFF_SHADE                        { quality = 1; price = 150; };
    class TRYK_TAC_EARMUFF                              { quality = 1; price = 150; };
    class TRYK_NOMIC_TAC_EARMUFF                        { quality = 1; price = 150; };
    class TRYK_headset2                                 { quality = 1; price = 150; };
    class TRYK_TAC_EARMUFF_Gs                           { quality = 1; price = 150; };
    class TRYK_TAC_SET_bn                               { quality = 1; price = 150; };
    class TRYK_NOMIC_TAC_EARMUFF_Gs                     { quality = 1; price = 150; };
    class TRYK_TAC_EARMUFF_SHADE_Gs                     { quality = 1; price = 150; };
    class TRYK_TAC_SET_TAN                              { quality = 1; price = 150; };
    class TRYK_TAC_SET_OD                               { quality = 1; price = 150; };
    class TRYK_TAC_SET_WH                               { quality = 1; price = 150; };
    class TRYK_TAC_SET_MESH                             { quality = 1; price = 150; };
    class TRYK_TAC_SET_TAN_2                            { quality = 1; price = 150; };
    class TRYK_TAC_SET_OD_2                             { quality = 1; price = 150; };
    class TRYK_TAC_SET_WH_2                             { quality = 1; price = 150; };
    class TRYK_TAC_SET_MESH_2                           { quality = 1; price = 150; };
    class TRYK_bandana_g                                { quality = 1; price = 150; };
    class TRYK_H_PASGT_BLK                              { quality = 1; price = 150; };
    class TRYK_H_PASGT_OD                               { quality = 1; price = 150; };
    class TRYK_H_PASGT_COYO                             { quality = 1; price = 150; };
    class TRYK_H_PASGT_TAN                              { quality = 1; price = 150; };
    class TRYK_H_Helmet_Snow                            { quality = 1; price = 150; };
    class TRYK_H_WH                                     { quality = 1; price = 150; };
    class TRYK_H_GR                                     { quality = 1; price = 150; };
    class TRYK_H_AOR1                                   { quality = 1; price = 150; };
    class TRYK_H_AOR2                                   { quality = 1; price = 150; };
    class TRYK_H_EARMUFF                                { quality = 1; price = 150; };
    class TRYK_H_TACEARMUFF_H                           { quality = 1; price = 150; };
    class TRYK_H_Bandana_H                              { quality = 1; price = 150; };
    class TRYK_H_Bandana_wig                            { quality = 1; price = 150; };
    class TRYK_H_Bandana_wig_g                          { quality = 1; price = 150; };
    class TRYK_H_wig                                    { quality = 1; price = 150; };
    class TRYK_H_headset2                               { quality = 1; price = 150; };
    class TRYK_H_ghillie_over                           { quality = 1; price = 150; };
    class TRYK_H_ghillie_top                            { quality = 1; price = 150; };
    class TRYK_H_ghillie_top_headless                   { quality = 1; price = 150; };
    class TRYK_H_ghillie_over_green                     { quality = 1; price = 150; };
    class TRYK_H_ghillie_top_green                      { quality = 1; price = 150; };
    class TRYK_H_ghillie_top_headless_green             { quality = 1; price = 150; };
    class TRYK_H_woolhat                                { quality = 1; price = 150; };
    class TRYK_H_woolhat_CW                             { quality = 1; price = 150; };
    class TRYK_H_woolhat_WH                             { quality = 1; price = 150; };
    class TRYK_H_woolhat_br                             { quality = 1; price = 150; };
    class TRYK_H_woolhat_cu                             { quality = 1; price = 150; };
    class TRYK_H_woolhat_tan                            { quality = 1; price = 150; };
    class TRYK_H_headsetcap                             { quality = 1; price = 150; };
    class TRYK_H_headsetcap_blk                         { quality = 1; price = 150; };
    class TRYK_H_headsetcap_od                          { quality = 1; price = 150; };
    class TRYK_H_pakol                                  { quality = 1; price = 150; };
    class TRYK_H_pakol2                                 { quality = 1; price = 150; };
    class TRYK_H_LHS_HEL_G                              { quality = 1; price = 150; };
    class TRYK_H_Helmet_Winter                          { quality = 1; price = 150; };
    class TRYK_H_Helmet_Winter_2                        { quality = 1; price = 150; };
 
    ///////////////////////////////////////////////////////////////////////////////
    // TRYK HeadGear w/NVGS built in
    ///////////////////////////////////////////////////////////////////////////////
 
    class TRYK_Headphone_NV                             { quality = 1; price = 1000; };
    class TRYK_HRPIGEAR_NV                              { quality = 1; price = 1000; };
    class TRYK_Headset_NV                               { quality = 1; price = 1000; };
    class TRYK_TAC_boonie_SET_NV                        { quality = 1; price = 1000; };
    class TRYK_TAC_SET_NV_TAN                           { quality = 1; price = 1000; };
    class TRYK_TAC_SET_NV_OD                            { quality = 1; price = 1000; };
    class TRYK_TAC_SET_NV_WH                            { quality = 1; price = 1000; };
    class TRYK_TAC_SET_NV_MESH                          { quality = 1; price = 1000; };
    class TRYK_TAC_SET_NV_TAN_2                         { quality = 1; price = 1000; };
    class TRYK_TAC_SET_NV_OD_2                          { quality = 1; price = 1000; };
    class TRYK_TAC_SET_NV_WH_2                          { quality = 1; price = 1000; };
    class TRYK_TAC_SET_NV_MESH_2                        { quality = 1; price = 1000; };
    class TRYK_H_DELTAHELM_NV                           { quality = 1; price = 1000; };
 
    ///////////////////////////////////////////////////////////////////////////////
    // TRYK NeckGear
    ///////////////////////////////////////////////////////////////////////////////
 
    class TRYK_Shemagh_shade_MESH                       { quality = 1; price = 100; };
    class TRYK_Shemagh_shade_N                          { quality = 1; price = 100; };
    class TRYK_Shemagh_shade_G_N                        { quality = 1; price = 100; };
    class TRYK_Shemagh_shade_WH_N                       { quality = 1; price = 100; };
    class TRYK_kio_balaclava_WH                         { quality = 1; price = 100; };
    class TRYK_kio_balaclava_BLK                        { quality = 1; price = 100; };
    class TRYK_kio_balaclavas                           { quality = 1; price = 100; };
    class TRYK_kio_balaclava_BLK_ear                    { quality = 1; price = 100; };
    class TRYK_kio_balaclava_ear                        { quality = 1; price = 100; };
    class TRYK_kio_balaclava_ESS                        { quality = 1; price = 100; };
    class TRYK_Shemagh                                  { quality = 1; price = 100; };
    class TRYK_Shemagh_mesh                             { quality = 1; price = 100; };
    class TRYK_Shemagh_G                                { quality = 1; price = 100; };
    class TRYK_Shemagh_WH                               { quality = 1; price = 100; };
    class TRYK_Shemagh_shade                            { quality = 1; price = 100; };
    class TRYK_Shemagh_shade_G                          { quality = 1; price = 100; };
    class TRYK_Shemagh_shade_WH                         { quality = 1; price = 100; };
    class TRYK_Shemagh_shade_MH                         { quality = 1; price = 100; };
    class TRYK_Shemagh_ESS                              { quality = 1; price = 100; };
    class TRYK_Shemagh_ESS_G                            { quality = 1; price = 100; };
    class TRYK_Shemagh_ESS_WH                           { quality = 1; price = 100; };
    class TRYK_Shemagh_EAR_TAN                          { quality = 1; price = 100; };
    class TRYK_Shemagh_EAR_WH                           { quality = 1; price = 100; };
 
    ///////////////////////////////////////////////////////////////////////////////
    // TRYK NeckGear NeckGear w/NVGS built in
    ///////////////////////////////////////////////////////////////////////////////
 
    class TRYK_balaclava_BLACK_NV                       { quality = 1; price = 1000; };
    class TRYK_balaclava_NV                             { quality = 1; price = 1000; };
    class TRYK_balaclava_BLACK_EAR_NV                   { quality = 1; price = 1000; };
    class TRYK_balaclava_EAR_NV                         { quality = 1; price = 1000; };
    class TRYK_Shemagh_TAN_NV                           { quality = 1; price = 1000; };
    class TRYK_Shemagh_MESH_NV                          { quality = 1; price = 1000; };
    class TRYK_Shemagh_G_NV                             { quality = 1; price = 1000; };
    class TRYK_Shemagh_WH_NV                            { quality = 1; price = 1000; };
    class TRYK_Shemagh_EAR_NV                           { quality = 1; price = 1000; };
    class TRYK_Shemagh_EAR_G_NV                         { quality = 1; price = 1000; };
    class TRYK_Shemagh_EAR_WH_NV                        { quality = 1; price = 1000; };
    class TRYK_ShemaghESSTAN_NV                         { quality = 1; price = 1000; };
    class TRYK_ShemaghESSOD_NV                          { quality = 1; price = 1000; };
    class TRYK_ShemaghESSWH_NV                          { quality = 1; price = 1000; };
 
    ///////////////////////////////////////////////////////////////////////////////
    // TRYK Uniforms
    ///////////////////////////////////////////////////////////////////////////////
 
    class TRYK_HRP_UCP                                  { quality = 1; price = 100; };
    class TRYK_HRP_USMC                                 { quality = 1; price = 100; };
    class TRYK_HRP_khk                                  { quality = 1; price = 100; };
    class TRYK_U_B_OD_OD_CombatUniform                  { quality = 1; price = 100; };
    class TRYK_U_B_OD_OD_R_CombatUniform                { quality = 1; price = 100; };
    class TRYK_U_B_TANTAN_CombatUniform                 { quality = 1; price = 100; };
    class TRYK_U_B_TANTAN_R_CombatUniform               { quality = 1; price = 100; };
    class TRYK_U_B_BLKBLK_CombatUniform                 { quality = 1; price = 100; };
    class TRYK_U_B_BLKBLK_R_CombatUniform               { quality = 1; price = 100; };
    class TRYK_U_B_GRYOCP_CombatUniform                 { quality = 1; price = 100; };
    class TRYK_U_B_GRYOCP_R_CombatUniformTshirt         { quality = 1; price = 100; };
    class TRYK_U_B_TANOCP_CombatUniform                 { quality = 1; price = 100; };
    class TRYK_U_B_TANOCP_R_CombatUniformTshirt         { quality = 1; price = 100; };
    class TRYK_U_B_BLKOCP_CombatUniform                 { quality = 1; price = 100; };
    class TRYK_U_B_BLKOCP_R_CombatUniformTshirt         { quality = 1; price = 100; };
    class TRYK_U_B_BLKTAN_CombatUniform                 { quality = 1; price = 100; };
    class TRYK_U_B_BLKTANR_CombatUniformTshirt          { quality = 1; price = 100; };
    class TRYK_U_B_ODTAN_CombatUniform                  { quality = 1; price = 100; };
    class TRYK_U_B_ODTANR_CombatUniformTshirt           { quality = 1; price = 100; };
    class TRYK_U_B_GRTAN_CombatUniform                  { quality = 1; price = 100; };
    class TRYK_U_B_GRTANR_CombatUniformTshirt           { quality = 1; price = 100; };
    class TRYK_U_B_wood_CombatUniform                   { quality = 1; price = 100; };
    class TRYK_U_B_woodR_CombatUniformTshirt            { quality = 1; price = 100; };
    class TRYK_U_B_wood3c_CombatUniform                 { quality = 1; price = 100; };
    class TRYK_U_B_wood3c_CombatUniformTshirt           { quality = 1; price = 100; };
    class TRYK_U_B_MARPAT_WOOD_CombatUniform            { quality = 1; price = 100; };
    class TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt      { quality = 1; price = 100; };
    class TRYK_U_B_WOOD_MARPAT_CombatUniform            { quality = 1; price = 100; };
    class TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt      { quality = 1; price = 100; };
    class TRYK_U_B_woodtan_CombatUniform                { quality = 1; price = 100; };
    class TRYK_U_B_woodtanR_CombatUniformTshirt         { quality = 1; price = 100; };
    class TRYK_U_B_JSDF_CombatUniform                   { quality = 1; price = 100; };
    class TRYK_U_B_JSDF_CombatUniformTshirt             { quality = 1; price = 100; };
    class TRYK_U_B_3CD_Delta_BDU                        { quality = 1; price = 100; };
    class TRYK_U_B_3CD_Delta_BDUTshirt                  { quality = 1; price = 100; };
    class TRYK_U_B_3CD_Ranger_BDU                       { quality = 1; price = 100; };
    class TRYK_U_B_3CD_Ranger_BDUTshirt                 { quality = 1; price = 100; };
    class TRYK_U_B_3CD_BLK_BDUTshirt                    { quality = 1; price = 100; };
    class TRYK_U_B_3CD_BLK_BDUTshirt2                   { quality = 1; price = 100; };
    class TRYK_U_B_ACU                                  { quality = 1; price = 100; };
    class TRYK_U_B_ACUTshirt                            { quality = 1; price = 100; };
    class TRYK_U_B_MARPAT_Wood                          { quality = 1; price = 100; };
    class TRYK_U_B_MARPAT_Wood_Tshirt                   { quality = 1; price = 100; };
    class TRYK_U_B_MARPAT_Desert                        { quality = 1; price = 100; };
    class TRYK_U_B_MARPAT_Desert_Tshirt                 { quality = 1; price = 100; };
    class TRYK_U_B_MARPAT_Desert2                       { quality = 1; price = 100; };
    class TRYK_U_B_MARPAT_Desert2_Tshirt                { quality = 1; price = 100; };
    class TRYK_U_B_3c                                   { quality = 1; price = 100; };
    class TRYK_U_B_3cr                                  { quality = 1; price = 100; };
    class TRYK_U_B_Sage_Tshirt                          { quality = 1; price = 100; };
    class TRYK_U_B_BLK3CD                               { quality = 1; price = 100; };
    class TRYK_U_B_BLK3CD_Tshirt                        { quality = 1; price = 100; };
    class TRYK_U_B_BLK                                  { quality = 1; price = 100; };
    class TRYK_U_B_BLK_Tshirt                           { quality = 1; price = 100; };
    class TRYK_U_B_BLKTAN                               { quality = 1; price = 100; };
    class TRYK_U_B_BLKTAN_Tshirt                        { quality = 1; price = 100; };
    class TRYK_U_B_ODTAN                                { quality = 1; price = 100; };
    class TRYK_U_B_ODTAN_Tshirt                         { quality = 1; price = 100; };
    class TRYK_U_B_BLK_OD                               { quality = 1; price = 100; };
    class TRYK_U_B_BLK_OD_Tshirt                        { quality = 1; price = 100; };
    class TRYK_U_B_C01_Tsirt                            { quality = 1; price = 100; };
    class TRYK_U_B_C02_Tsirt                            { quality = 1; price = 100; };
    class TRYK_U_B_OD_BLK                               { quality = 1; price = 100; };
    class TRYK_U_B_OD_BLK_2                             { quality = 1; price = 100; };
    class TRYK_U_B_BLK_TAN_1                            { quality = 1; price = 100; };
    class TRYK_U_B_BLK_TAN_2                            { quality = 1; price = 100; };
    class TRYK_U_B_wh_tan_Rollup_CombatUniform          { quality = 1; price = 100; };
    class TRYK_U_B_wh_OD_Rollup_CombatUniform           { quality = 1; price = 100; };
    class TRYK_U_B_wh_blk_Rollup_CombatUniform          { quality = 1; price = 100; };
    class TRYK_U_B_BLK_tan_Rollup_CombatUniform         { quality = 1; price = 100; };
    class TRYK_U_B_BLK_OD_Rollup_CombatUniform          { quality = 1; price = 100; };
    class TRYK_U_B_NATO_UCP_GRY_CombatUniform           { quality = 1; price = 100; };
    class TRYK_U_B_NATO_UCP_GRY_R_CombatUniform         { quality = 1; price = 100; };
    class TRYK_U_B_NATO_UCP_CombatUniform               { quality = 1; price = 100; };
    class TRYK_U_B_NATO_UCP_R_CombatUniform             { quality = 1; price = 100; };
    class TRYK_U_B_NATO_OCP_c_BLK_CombatUniform         { quality = 1; price = 100; };
    class TRYK_U_B_NATO_OCP_BLK_c_R_CombatUniform       { quality = 1; price = 100; };
    class TRYK_U_B_NATO_OCP_BLK_CombatUniform           { quality = 1; price = 100; };
    class TRYK_U_B_NATO_OCP_BLK_R_CombatUniform         { quality = 1; price = 100; };
    class TRYK_U_B_NATO_OCPD_CombatUniform              { quality = 1; price = 100; };
    class TRYK_U_B_NATO_OCPD_R_CombatUniform            { quality = 1; price = 100; };
    class TRYK_U_B_NATO_OCP_CombatUniform               { quality = 1; price = 100; };
    class TRYK_U_B_NATO_OCP_R_CombatUniform             { quality = 1; price = 100; };
    class TRYK_U_B_AOR1_Rollup_CombatUniform            { quality = 1; price = 100; };
    class TRYK_U_B_AOR2_Rollup_CombatUniform            { quality = 1; price = 100; };
    class TRYK_U_B_MTP_CombatUniform                    { quality = 1; price = 100; };
    class TRYK_U_B_MTP_R_CombatUniform                  { quality = 1; price = 100; };
    class TRYK_U_B_MTP_BLK_CombatUniform                { quality = 1; price = 100; };
    class TRYK_U_B_MTP_BLK_R_CombatUniform              { quality = 1; price = 100; };
    class TRYK_U_B_Woodland                             { quality = 1; price = 100; };
    class TRYK_U_B_Woodland_Tshirt                      { quality = 1; price = 100; };
    class TRYK_U_B_WDL_GRY_CombatUniform                { quality = 1; price = 100; };
    class TRYK_U_B_WDL_GRY_R_CombatUniform              { quality = 1; price = 100; };
    class TRYK_U_B_ARO1_GR_CombatUniform                { quality = 1; price = 100; };
    class TRYK_U_B_ARO1_GR_R_CombatUniform              { quality = 1; price = 100; };
    class TRYK_U_B_ARO1_GRY_CombatUniform               { quality = 1; price = 100; };
    class TRYK_U_B_ARO1_GRY_R_CombatUniform             { quality = 1; price = 100; };
    class TRYK_U_B_ARO1_CombatUniform                   { quality = 1; price = 100; };
    class TRYK_U_B_ARO1R_CombatUniform                  { quality = 1; price = 100; };
    class TRYK_U_B_ARO1_BLK_CombatUniform               { quality = 1; price = 100; };
    class TRYK_U_B_ARO1_BLK_R_CombatUniform             { quality = 1; price = 100; };
    class TRYK_U_B_ARO1_CBR_CombatUniform               { quality = 1; price = 100; };
    class TRYK_U_B_ARO1_CBR_R_CombatUniform             { quality = 1; price = 100; };
    class TRYK_U_B_ARO2_CombatUniform                   { quality = 1; price = 100; };
    class TRYK_U_B_ARO2R_CombatUniform                  { quality = 1; price = 100; };
    class TRYK_U_B_AOR2_BLK_CombatUniform               { quality = 1; price = 100; };
    class TRYK_U_B_AOR2_BLK_R_CombatUniform             { quality = 1; price = 100; };
    class TRYK_U_B_AOR2_OD_CombatUniform                { quality = 1; price = 100; };
    class TRYK_U_B_AOR2_OD_R_CombatUniform              { quality = 1; price = 100; };
    class TRYK_U_B_AOR2_GRY_CombatUniform               { quality = 1; price = 100; };
    class TRYK_U_B_AOR2_GRY_R_CombatUniform             { quality = 1; price = 100; };
    class TRYK_U_B_Snow_CombatUniform                   { quality = 1; price = 100; };
    class TRYK_U_B_Snowt                                { quality = 1; price = 100; };
    class TRYK_U_B_Denim_T_WH                           { quality = 1; price = 100; };
    class TRYK_U_B_Denim_T_BK                           { quality = 1; price = 100; };
    class TRYK_U_B_BLK_T_WH                             { quality = 1; price = 100; };
    class TRYK_U_B_BLK_T_BK                             { quality = 1; price = 100; };
    class TRYK_U_B_RED_T_BR                             { quality = 1; price = 100; };
    class TRYK_U_B_Denim_T_BG_WH                        { quality = 1; price = 100; };
    class TRYK_U_B_Denim_T_BG_BK                        { quality = 1; price = 100; };
    class TRYK_U_B_BLK_T_BG_WH                          { quality = 1; price = 100; };
    class TRYK_U_B_BLK_T_BG_BK                          { quality = 1; price = 100; };
    class TRYK_U_B_RED_T_BG_BR                          { quality = 1; price = 100; };
    class TRYK_U_B_fleece                               { quality = 1; price = 100; };
    class TRYK_U_B_fleece_UCP                           { quality = 1; price = 100; };
    class TRYK_U_B_UCP_PCUs                             { quality = 1; price = 100; };
    class TRYK_U_B_GRY_PCUs                             { quality = 1; price = 100; };
    class TRYK_U_B_Wood_PCUs                            { quality = 1; price = 100; };
    class TRYK_U_B_PCUs                                 { quality = 1; price = 100; };
    class TRYK_U_B_UCP_PCUs_R                           { quality = 1; price = 100; };
    class TRYK_U_B_GRY_PCUs_R                           { quality = 1; price = 100; };
    class TRYK_U_B_Wood_PCUs_R                          { quality = 1; price = 100; };
    class TRYK_U_B_PCUs_R                               { quality = 1; price = 100; };
    class TRYK_U_B_PCUGs                                { quality = 1; price = 100; };
    class TRYK_U_B_PCUODs                               { quality = 1; price = 100; };
    class TRYK_U_B_PCUGs_gry                            { quality = 1; price = 100; };
    class TRYK_U_B_PCUGs_BLK                            { quality = 1; price = 100; };
    class TRYK_U_B_PCUGs_OD                             { quality = 1; price = 100; };
    class TRYK_U_B_PCUGs_gry_R                          { quality = 1; price = 100; };
    class TRYK_U_B_PCUGs_BLK_R                          { quality = 1; price = 100; };
    class TRYK_U_B_PCUGs_OD_R                           { quality = 1; price = 100; };
    class TRYK_U_Bts_GRYGRY_PCUs                        { quality = 1; price = 100; };
    class TRYK_U_Bts_UCP_PCUs                           { quality = 1; price = 100; };
    class TRYK_U_Bts_Wood_PCUs                          { quality = 1; price = 100; };
    class TRYK_U_Bts_PCUs                               { quality = 1; price = 100; };
    class TRYK_U_pad_j                                  { quality = 1; price = 100; };
    class TRYK_U_pad_j_blk                              { quality = 1; price = 100; };
    class TRYK_U_pad_hood_Cl                            { quality = 1; price = 100; };
    class TRYK_U_pad_hood_Cl_blk                        { quality = 1; price = 100; };
    class TRYK_U_pad_hood_tan                           { quality = 1; price = 100; };
    class TRYK_U_pad_hood_Blk                           { quality = 1; price = 100; };
    class TRYK_U_pad_hood_CSATBlk                       { quality = 1; price = 100; };
    class TRYK_U_pad_hood_Blod                          { quality = 1; price = 100; };
    class TRYK_U_pad_hood_odBK                          { quality = 1; price = 100; };
    class TRYK_U_pad_hood_BKT2                          { quality = 1; price = 100; };
    class TRYK_hoodie_Blk                               { quality = 1; price = 100; };
    class TRYK_hoodie_FR                                { quality = 1; price = 100; };
    class TRYK_hoodie_Wood                              { quality = 1; price = 100; };
    class TRYK_hoodie_3c                                { quality = 1; price = 100; };
    class TRYK_T_camo_tan                               { quality = 1; price = 100; };
    class TRYK_T_camo_3c                                { quality = 1; price = 100; };
    class TRYK_T_camo_Wood                              { quality = 1; price = 100; };
    class TRYK_T_camo_wood_marpat                       { quality = 1; price = 100; };
    class TRYK_T_camo_Desert_marpat                     { quality = 1; price = 100; };
    class TRYK_T_camo_3c_BG                             { quality = 1; price = 100; };
    class TRYK_T_camo_Wood_BG                           { quality = 1; price = 100; };
    class TRYK_T_camo_wood_marpat_BG                    { quality = 1; price = 100; };
    class TRYK_T_camo_desert_marpat_BG                  { quality = 1; price = 100; };
    class TRYK_T_PAD                                    { quality = 1; price = 100; };
    class TRYK_T_OD_PAD                                 { quality = 1; price = 100; };
    class TRYK_T_TAN_PAD                                { quality = 1; price = 100; };
    class TRYK_T_BLK_PAD                                { quality = 1; price = 100; };
    class TRYK_T_T2_PAD                                 { quality = 1; price = 100; };
    class TRYK_T_CSAT_PAD                               { quality = 1; price = 100; };
    class TRYK_U_nohoodPcu_gry                          { quality = 1; price = 100; };
    class TRYK_U_hood_nc                                { quality = 1; price = 100; };
    class TRYK_U_hood_mc                                { quality = 1; price = 100; };
    class TRYK_U_denim_hood_blk                         { quality = 1; price = 100; };
    class TRYK_U_denim_hood_mc                          { quality = 1; price = 100; };
    class TRYK_U_denim_hood_3c                          { quality = 1; price = 100; };
    class TRYK_U_denim_hood_nc                          { quality = 1; price = 100; };
    class TRYK_U_denim_jersey_blu                       { quality = 1; price = 100; };
    class TRYK_U_denim_jersey_blk                       { quality = 1; price = 100; };
    class TRYK_shirts_PAD                               { quality = 1; price = 100; };
    class TRYK_shirts_OD_PAD                            { quality = 1; price = 100; };
    class TRYK_shirts_TAN_PAD                           { quality = 1; price = 100; };
    class TRYK_shirts_BLK_PAD                           { quality = 1; price = 100; };
    class TRYK_shirts_PAD_BK                            { quality = 1; price = 100; };
    class TRYK_shirts_OD_PAD_BK                         { quality = 1; price = 100; };
    class TRYK_shirts_TAN_PAD_BK                        { quality = 1; price = 100; };
    class TRYK_shirts_BLK_PAD_BK                        { quality = 1; price = 100; };
    class TRYK_shirts_PAD_BLW                           { quality = 1; price = 100; };
    class TRYK_shirts_OD_PAD_BLW                        { quality = 1; price = 100; };
    class TRYK_shirts_TAN_PAD_BLW                       { quality = 1; price = 100; };
    class TRYK_shirts_BLK_PAD_BLW                       { quality = 1; price = 100; };
    class TRYK_shirts_PAD_YEL                           { quality = 1; price = 100; };
    class TRYK_shirts_OD_PAD_YEL                        { quality = 1; price = 100; };
    class TRYK_shirts_TAN_PAD_YEL                       { quality = 1; price = 100; };
    class TRYK_shirts_BLK_PAD_YEL                       { quality = 1; price = 100; };
    class TRYK_shirts_PAD_RED2                          { quality = 1; price = 100; };
    class TRYK_shirts_OD_PAD_RED2                       { quality = 1; price = 100; };
    class TRYK_shirts_TAN_PAD_RED2                      { quality = 1; price = 100; };
    class TRYK_shirts_BLK_PAD_RED2                      { quality = 1; price = 100; };
    class TRYK_shirts_PAD_BLU3                          { quality = 1; price = 100; };
    class TRYK_shirts_OD_PAD_BLU3                       { quality = 1; price = 100; };
    class TRYK_shirts_TAN_PAD_BLU3                      { quality = 1; price = 100; };
    class TRYK_shirts_BLK_PAD_BLU3                      { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_R                           { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_BL                          { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_BK                          { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_WH                          { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_BWH                         { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_RED2                        { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_WHB                         { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_ylb                         { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_od                          { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_R_Sleeve                    { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_BL_Sleeve                   { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_BK_Sleeve                   { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_WH_Sleeve                   { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_BWH_Sleeve                  { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_RED2_Sleeve                 { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_WHB_Sleeve                  { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_ylb_Sleeve                  { quality = 1; price = 100; };
    class TRYK_shirts_DENIM_od_Sleeve                   { quality = 1; price = 100; };
    class TRYK_shirts_PAD_BL                            { quality = 1; price = 100; };
    class TRYK_shirts_OD_PAD_BL                         { quality = 1; price = 100; };
    class TRYK_shirts_TAN_PAD_BL                        { quality = 1; price = 100; };
    class TRYK_shirts_BLK_PAD_BL                        { quality = 1; price = 100; };
    class TRYK_U_taki_wh                                { quality = 1; price = 100; };
    class TRYK_U_taki_COY                               { quality = 1; price = 100; };
    class TRYK_U_taki_BL                                { quality = 1; price = 100; };
    class TRYK_U_taki_BLK                               { quality = 1; price = 100; };
    class TRYK_U_Bts_PCUGs                              { quality = 1; price = 100; };
    class TRYK_U_Bts_PCUODs                             { quality = 1; price = 100; };
    class TRYK_U_taki_G_WH                              { quality = 1; price = 100; };
    class TRYK_U_taki_G_COY                             { quality = 1; price = 100; };
    class TRYK_U_taki_G_BL                              { quality = 1; price = 100; };
    class TRYK_U_taki_G_BLK                             { quality = 1; price = 100; };
    class TRYK_U_B_PCUHs                                { quality = 1; price = 100; };
    class TRYK_U_B_PCUGHs                               { quality = 1; price = 100; };
    class TRYK_U_B_PCUODHs                              { quality = 1; price = 100; };
    class TRYK_B_USMC_R                                 { quality = 1; price = 100; };
    class TRYK_B_USMC_R_ROLL                            { quality = 1; price = 100; };
    class TRYK_ZARATAKI                                 { quality = 1; price = 100; };
    class TRYK_ZARATAKI2                                { quality = 1; price = 100; };
    class TRYK_ZARATAKI3                                { quality = 1; price = 100; };
    class TRYK_B_TRYK_UCP_T                             { quality = 1; price = 100; };
    class TRYK_B_TRYK_3C_T                              { quality = 1; price = 100; };
    class TRYK_B_TRYK_MTP_T                             { quality = 1; price = 100; };
    class TRYK_B_TRYK_OCP_T                             { quality = 1; price = 100; };
    class TRYK_B_TRYK_OCP_D_T                           { quality = 1; price = 100; };
    class TRYK_DMARPAT_T                                { quality = 1; price = 100; };
    class TRYK_C_AOR2_T                                 { quality = 1; price = 100; };
    class TRYK_U_B_Sage_T                               { quality = 1; price = 100; };
    class TRYK_U_B_Wood_T                               { quality = 1; price = 100; };
    class TRYK_U_B_BLTAN_T                              { quality = 1; price = 100; };
    class TRYK_U_B_BLOD_T                               { quality = 1; price = 100; };
    class TRYK_OVERALL_flesh                            { quality = 1; price = 100; };
    class TRYK_OVERALL_nok_flesh                        { quality = 1; price = 100; };
    class TRYK_OVERALL_SAGE_BLKboots                    { quality = 1; price = 100; };
    class TRYK_OVERALL_SAGE_BLKboots_nk_blk             { quality = 1; price = 100; };
    class TRYK_OVERALL_SAGE_BLKboots_nk                 { quality = 1; price = 100; };
    class TRYK_OVERALL_SAGE_BLKboots_nk_blk2            { quality = 1; price = 100; };
    class TRYK_OVERALL_SAGE                             { quality = 1; price = 100; };
    class TRYK_SUITS_BLK_F                              { quality = 1; price = 100; };
    class TRYK_SUITS_BR_F                               { quality = 1; price = 100; };
    class TRYK_H_ghillie_top_headless3glass             { quality = 1; price = 100; };
    class TRYK_shoulder_armor_BK                        { quality = 1; price = 100; };
    class TRYK_shoulder_armor_OD                        { quality = 1; price = 100; };
    class TRYK_shoulder_armor_CY                        { quality = 1; price = 100; };
    class TRYK_H_ghillie_top_headless3                  { quality = 1; price = 100; };
    class TRYK_U_B_PCUHsW                               { quality = 1; price = 100; };
    class TRYK_U_B_PCUHsW2                              { quality = 1; price = 100; };
    class TRYK_U_B_PCUHsW3                              { quality = 1; price = 100; };
    class TRYK_U_B_PCUHsW3nh                            { quality = 1; price = 100; };
    class TRYK_U_B_PCUHsW4                              { quality = 1; price = 100; };
    class TRYK_U_B_PCUHsW5                              { quality = 1; price = 100; };
    class TRYK_U_B_PCUHsW6                              { quality = 1; price = 100; };
 
    ///////////////////////////////////////////////////////////////////////////////
    // TRYK Vests
    ///////////////////////////////////////////////////////////////////////////////
 
    class TRYK_Hrp_vest_ucp                             { quality = 1; price = 100; };
    class TRYK_Hrp_vest_od                              { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_JSDF                      { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_AOR1                         { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_AOR2                         { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_coyo                         { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_Brown                        { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_CBR                          { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_khk                          { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_rgr                          { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_green                        { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_tan                          { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_Delta                        { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_Ranger                       { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_AOR1_2                       { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_AOR2_2                       { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_coyo2                        { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_Brown2                       { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_cbr2                         { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_khk2                         { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_rgr2                         { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_green2                       { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_tan2                         { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_Delta2                       { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_Ranger2                      { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_blk                       { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_oli                       { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_coyo                      { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_wood                      { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_ACU                       { quality = 1; price = 100; };
    class TRYK_V_TacVest_coyo                           { quality = 1; price = 100; };
    class TRYK_V_harnes_blk_L                           { quality = 1; price = 100; };
    class TRYK_V_harnes_od_L                            { quality = 1; price = 100; };
    class TRYK_V_harnes_TAN_L                           { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_blk_L                     { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_wood_L                    { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_ACU_L                     { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_coyo_L                    { quality = 1; price = 100; };
    class TRYK_V_ChestRig_L                             { quality = 1; price = 100; };
    class TRYK_V_ChestRig                               { quality = 1; price = 100; };
    class TRYK_V_Bulletproof                            { quality = 1; price = 100; };
    class TRYK_V_Bulletproof_BLK                        { quality = 1; price = 100; };
    class TRYK_V_Bulletproof_BL                         { quality = 1; price = 100; };
    class TRYK_V_IOTV_BLK                               { quality = 1; price = 100; };
    class TRYK_V_tacv1M_BK                              { quality = 1; price = 100; };
    class TRYK_V_tacv1MLC_BK                            { quality = 1; price = 100; };
    class TRYK_V_tacv1                                  { quality = 1; price = 100; };
    class TRYK_V_tacv1_CY                               { quality = 1; price = 100; };
    class TRYK_V_tacv1_BK                               { quality = 1; price = 100; };
    class TRYK_V_tacv1_P_BK                             { quality = 1; price = 100; };
    class TRYK_V_tacv1_SHERIFF_BK                       { quality = 1; price = 100; };
    class TRYK_V_tacv1_FBI_BK                           { quality = 1; price = 100; };
    class TRYK_V_tacv1LP_BK                             { quality = 1; price = 100; };
    class TRYK_V_tacv1LSRF_BK                           { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_BK                             { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_CY                             { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_OD                             { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_FBI_BK                         { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_SRF_BK                         { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_SRF_OD                         { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_P_BK                           { quality = 1; price = 100; };
    class TRYK_V_PlateCarrier_POLICE                    { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_HRT_B                        { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_HRT_OD                       { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_HRT2_B                       { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_HRT2_OD                      { quality = 1; price = 100; };
    class TRYK_V_ArmorVest_Winter                       { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_OD                          { quality = 1; price = 100; };
    class TRYK_V_tacv10_BK                              { quality = 1; price = 100; };
    class TRYK_V_tacv10_OD                              { quality = 1; price = 100; };
    class TRYK_V_tacv10_TN                              { quality = 1; price = 100; };
    class TRYK_V_tacv10LC_BK                            { quality = 1; price = 100; };
    class TRYK_V_tacv10LC_OD                            { quality = 1; price = 100; };
    class TRYK_V_tacv10LC_TN                            { quality = 1; price = 100; };
    class TRYK_V_tacv1L_BK                              { quality = 1; price = 100; };
    class TRYK_V_tacv1L_OD                              { quality = 1; price = 100; };
    class TRYK_V_tacv1L_CY                              { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_FBI2_BK                        { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_SRF2_BK                        { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_SRF2_OD                        { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_P2_BK                          { quality = 1; price = 100; };
    class TRYK_V_tacv1_MSL_BK                           { quality = 1; price = 100; };
    class TRYK_V_tacv1_MSL_NV                           { quality = 1; price = 100; };
    class TRYK_V_tacv1LMSL_BK                           { quality = 1; price = 100; };
    class TRYK_V_tacv1LMSL_NV                           { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_MSL_BK                         { quality = 1; price = 100; };
    class TRYK_V_tacv1LC_MSL_NV                         { quality = 1; price = 100; };
    class TRYK_V_tacSVD_BK                              { quality = 1; price = 100; };
    class TRYK_V_tacSVD_OD                              { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TL                          { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TBL                         { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TCL                         { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TL2                         { quality = 1; price = 500; };
    class TRYK_V_Sheriff_BA_TBL2                        { quality = 1; price = 500; };
    class TRYK_V_Sheriff_BA_TCL2                        { quality = 1; price = 500; };
    class TRYK_V_Sheriff_BA_T                           { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TB                          { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_T2                          { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TB2                         { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_T3                          { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TB3                         { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_T4                          { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TB4                         { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_T5                          { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TB5                         { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TBL3_BK                     { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TBL3_OD                     { quality = 1; price = 100; };
    class TRYK_V_Sheriff_BA_TBL3_TN                     { quality = 1; price = 100; };
    class TRYK_LOC_AK_chestrig_OD                       { quality = 1; price = 100; };
    class TRYK_LOC_AK_chestrig_TAN                      { quality = 1; price = 100; };
 
    ///////////////////////////////////////////////////////////////////////////////
    // TRYK BackPacks
    ///////////////////////////////////////////////////////////////////////////////
   
    class TRYK_B_AssaultPack_UCP                        { quality = 1; price = 500; };
    class TRYK_B_AssaultPack_Type2camo                  { quality = 1; price = 500; };
    class TRYK_B_AssaultPack_MARPAT_Desert              { quality = 1; price = 500; };
    class TRYK_B_AssaultPack_MARPAT_Wood                { quality = 1; price = 500; };
    class TRYK_B_Kitbag_Base                            { quality = 2; price = 1000; };
    class TRYK_B_Kitbag_blk                             { quality = 2; price = 1000; };
    class TRYK_B_Kitbag_aaf                             { quality = 2; price = 1000; };
    class TRYK_B_Carryall_blk                           { quality = 3; price = 1500; };
    class TRYK_B_Carryall_wh                            { quality = 3; price = 1500; };
    class TRYK_B_Carryall_wood                          { quality = 3; price = 1500; };
    class TRYK_B_Carryall_JSDF                          { quality = 3; price = 1500; };
    class TRYK_B_Kitbag_Base_JSDF                       { quality = 1; price = 1000; };
    class TRYK_B_Coyotebackpack                         { quality = 1; price = 700; };
    class TRYK_B_Coyotebackpack_OD                      { quality = 1; price = 700; };
    class TRYK_B_Coyotebackpack_BLK                     { quality = 1; price = 700; };
    class TRYK_B_Coyotebackpack_WH                      { quality = 1; price = 700; };
    class TRYK_B_Alicepack                              { quality = 1; price = 700; };
    class TRYK_B_Medbag                                 { quality = 1; price = 100; };
    class TRYK_B_Medbag_OD                              { quality = 1; price = 100; };
    class TRYK_B_Medbag_BK                              { quality = 1; price = 100; };
    class TRYK_B_Medbag_ucp                             { quality = 1; price = 100; };
    class TRYK_B_Belt                                   { quality = 1; price = 100; };
    class TRYK_B_Belt_BLK                               { quality = 1; price = 100; };
    class TRYK_B_Belt_CYT                               { quality = 1; price = 100; };
    class TRYK_B_Belt_tan                               { quality = 1; price = 100; };
    class TRYK_B_Belt_br                                { quality = 1; price = 100; };
    class TRYK_B_Belt_GR                                { quality = 1; price = 100; };
    class TRYK_B_Belt_AOR1                              { quality = 1; price = 100; };
    class TRYK_B_Belt_AOR2                              { quality = 1; price = 100; };
    class TRYK_B_BAF_BAG_BLK                            { quality = 1; price = 100; };
    class TRYK_B_BAF_BAG_CYT                            { quality = 1; price = 100; };
    class TRYK_B_BAF_BAG_OD                             { quality = 1; price = 100; };
    class TRYK_B_BAF_BAG_rgr                            { quality = 1; price = 100; };
    class TRYK_B_BAF_BAG_mcamo                          { quality = 1; price = 100; };
    class TRYK_B_tube_cyt                               { quality = 1; price = 100; };
    class TRYK_B_tube_od                                { quality = 1; price = 100; };
    class TRYK_B_tube_blk                               { quality = 1; price = 100; };
    class TRYK_B_FieldPack_Wood                         { quality = 1; price = 100; };
    class TRYK_Winter_pack                              { quality = 1; price = 100; };
};

class CfgXM8
{
	extraApps[] = {"ExAd_VG","ExAd_CHVD","ExAd_Journal","ExAd_Bike","GG_SB"};
	
	class ExAd_VG 
	{
		title = "Virtual Garage";
		controlID = 50000;					//IDC:50000 -> 50015 || These need to be unique and out of range from each other 
		logo = "GG\ExAdClient\XM8\Apps\VG\Icon_VG.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\VG\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\VG\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\VG\onClose.sqf";
	};
	class ExAd_CHVD 
	{
		title = "View Distance Settings";
		controlID = 50200;					//IDC:50200 -> 50102 || These need to be unique and out of range from each other
		config = "GG\ExAdClient\XM8\Apps\CHVD\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\CHVD\Icon_CHVD.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\CHVD\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\CHVD\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\CHVD\onClose.sqf";
	};		
	class ExAd_Journal 
	{
		title = "Journal";
		controlID = 50300;					//IDC:50300 -> 50305 || These need to be unique and out of range from each other
		config = "GG\ExAdClient\XM8\Apps\Journal\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\Journal\Icon_Journal.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\Journal\onLoad.sqf";
		onOpen = "GG\ExAdClient\XM8\Apps\Journal\onOpen.sqf";
		onClose = "GG\ExAdClient\XM8\Apps\Journal\onClose.sqf";
	};
	class ExAd_Bike
	{
		title = "Deploy Bike";
		config = "GG\ExAdClient\XM8\Apps\DeployVehicle\config.sqf";
		logo = "GG\ExAdClient\XM8\Apps\DeployVehicle\icon_DeployVehicle.paa";
		bambiState = 0;
		vehicleClass = "Exile_Bike_Quadbike_Black";
		recipe[] = {{"Exile_Item_ExtensionCord",1}};
		packable = 1;
		autoCleanUp = 1;
		quickFunction = "['ExAd_Bike'] call ExAd_XM8_DV_fnc_spawnVehicle";
	};
	class GG_SB 
	{
		title = "Statsbar Settings";
		controlID = 50400;					//IDC:50400 -> 50475 || These need to be unique and out of range from each other
		logo = "GG\ExadClient\XM8\Apps\SB_Settings\Icon_SB.paa";
		onLoad = "GG\ExAdClient\XM8\Apps\SB_Settings\onLoad.sqf";
	};
}; 

class CfgExileCustomCode 
{
	
	ExileClient_gui_xm8_slide = 				 		"GG\override\GG_gui_xm8_slide.sqf";
	ExileClient_gui_xm8_show = 					 		"GG\override\GG_gui_xm8_show.sqf";
	ExileClient_gui_selectSpawnLocation_show = 			"GG\override\GG_gui_selectSpawnLocation_show.sqf";
	ExileClient_object_item_construct = 				"GG\override\GG_object_item_construct.sqf";
	ExileClient_gui_xm8_slide_server_onOpen = 			"GG\override\GG_gui_xm8_slide_server_onOpen.sqf";
	ExileClient_gui_lockerDialog_show = 				"GG\override\GG_gui_lockerDialog_show.sqf";
	ExileClient_system_locker_network_lockerResponse =	"GG\override\GG_system_locker_network_lockerResponse.sqf";
	ExileClient_util_playerEquipment_add =				"GG\override\GG_util_playerEquipment_add.sqf";
	ExileClient_object_player_bambiStateBegin =			"GG\override\GG_object_player_bambiStateBegin.sqf";
	ExileClient_system_territory_database_load =		"GG\override\GG_system_territory_database_load.sqf";
	ExileServer_object_vehicle_createNonPersistentVehicle = "GG\override\GG_object_vehicle_createNonPersistentVehicle.sqf";
};
class CfgExileEnvironment
{
	class Altis 
	{
		// A list of {position, radius} where building is not allowed at all
		nonConstructionZones[] = {
			{{21845.1, 20977.6, 30}, 1000};
			{{14562.4,16925.7,17.279}, 1500};
			
			};


		class FireFlies
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// At this hour fire flies begin to spawn
			startHour = 18;

			// At this hour fire flies stop spawning
			endHour = 4;
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

			/*
				Defines contaminated zones in a specific map. 
				You can define multiple zones per map. The format
				of the zones is:

				[Position ASL(!), Full Radiation Radius, Maximum Radius]

				The radius works as follows:

	            |-------------------------------------------------------|
	                                Maximum Radius
				
				|------------------------|
				  Full Radiation Radius   

				Within the full radiation radius, radiation factor is
				always at a maximum. Outside of this, it lowers down
				to no radiation smoothly.

				Radiation:

	            |------------------------|------------------------------|
	            1        1      1        1     0.75    0.5     0.25    0
			*/
			contaminatedZones[] = 
			{
				{{21845.1, 20977.6, 30}, 300, 400}	// Ghost Hotel
			};
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

	class Namalsk: Altis 
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
			enable = 1;
		};

		class Snow: Snow
		{
			enable = 1;
			surfaces[] = {"#nam_snow"};
		};

		class Radiation: Radiation
		{
			enable = 1;
			contaminatedZones[] = 
			{
				{{3960.14,	8454.75,	152.862}, 	80, 	140},	// Object A1
				{{4974.70,	6632.82,	4.74293}, 	40, 	150},	// Object A2
				{{6487.92,	9302.03,	36.0014}, 	60, 	110}	// Sebjan Chemical Factory
			};
		};

		class Temperature: Temperature
		{
			daytimeTemperature[] = {-2.00,-1.77,-1.12,-0.10,1.24,2.78,4.40,6.00,7.46,8.65,9.50,9.90,9.90,9.50,8.65,7.46,6.00,4.40,2.78,1.24,-0.10,-1.12,-1.77,-2.00,-2.00};
		};
	};
	
	class Chernarus 
	{
		// A list of {position, radius} where building is not allowed at all
		nonConstructionZones[] = {
			{{8347.18,5990.92,291.991}, 1000};
			};


		class FireFlies
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// At this hour fire flies begin to spawn
			startHour = 18;

			// At this hour fire flies stop spawning
			endHour = 4;
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

			/*
				Defines contaminated zones in a specific map. 
				You can define multiple zones per map. The format
				of the zones is:

				[Position ASL(!), Full Radiation Radius, Maximum Radius]

				The radius works as follows:

	            |-------------------------------------------------------|
	                                Maximum Radius
				
				|------------------------|
				  Full Radiation Radius   

				Within the full radiation radius, radiation factor is
				always at a maximum. Outside of this, it lowers down
				to no radiation smoothly.

				Radiation:

	            |------------------------|------------------------------|
	            1        1      1        1     0.75    0.5     0.25    0
			*/
			contaminatedZones[] = 
			{
				{{8347.18,5990.92,291.991}, 300, 400}	// radiation church
			};
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

	class Tanoa 
	{
		// A list of {position, radius} where building is not allowed at all
		nonConstructionZones[] = {
			//{{8347.18,5990.92,291.991}, 1000};
				{{2901.51,12333.8,291.991}, 1600};
			};


		class FireFlies
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// At this hour fire flies begin to spawn
			startHour = 18;

			// At this hour fire flies stop spawning
			endHour = 4;
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

			/*
				Defines contaminated zones in a specific map. 
				You can define multiple zones per map. The format
				of the zones is:

				[Position ASL(!), Full Radiation Radius, Maximum Radius]

				The radius works as follows:

	            |-------------------------------------------------------|
	                                Maximum Radius
				
				|------------------------|
				  Full Radiation Radius   

				Within the full radiation radius, radiation factor is
				always at a maximum. Outside of this, it lowers down
				to no radiation smoothly.

				Radiation:

	            |------------------------|------------------------------|
	            1        1      1        1     0.75    0.5     0.25    0
			*/
			contaminatedZones[] = 
			{
				{{2901.51,12333.8,291.991}, 1300, 1600}	// radiation
			};
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
	lifeTime = 4;

	/**
	 * Interval in seconds when the client searches for
	 * new buildings to spawn loot in
	 */
	spawnInterval = 60;

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
	maximumPositionCoverage = 75;

 	/**
 	 * Limit the number of loot positions per building. If the 
 	 * above percentage value exceeds this value, it will be capped.
 	 *
 	 * Example: Coverage is 50%. Building has 60 loot positions defined.
 	 * This results in 30 loot positions and that is too much. So we
 	 * cap this at 10
 	 */
	maximumNumberOfLootSpotsPerBuilding = 5;

	/**
	 * Exile spawns a random number of items per loot spot. This 
	 * is the upper cap for that. So 3 means it could spawn 1, 2 
	 * or 3.
	 */
	maximumNumberOfItemsPerLootSpot = 1;

	/**
	 * Radius in meter to spawn loot AROUND each player.
	 * Do NOT touch this value if you dont know what you do.
	 * The higher the number, the higher the drop rates, the
	 * easier your server will lag.
	 *
	 * 50m  = Minimum
	 * 200m = Maximum
	 */
	spawnRadius = 100;

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
	minimumDistanceToTerritories = 100;
};
class CfgExileMobileXM8
{
	/**
	 * Add the 4 digit permission code here, so players can authorize
	 * your server to send them messages to their Mobile XM8 app.
	 */
	code = "";
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
	buyInAmount = 500;
};
class CfgFlags 
{
	class USA
	{
		name = "USA";
		texture = "\A3\Data_F\Flags\flag_us_co.paa";
		uids[] = {};
	};
	class YTUBE
	{
		name = "YouTube";
		texture = "GG\images\flags\flag_ytube.paa";
		uids[] = {};
	};
	class TWITCH
	{
		name = "Twitch";
		texture = "GG\images\flags\flag_twitch.paa";
		uids[] = {};
	};
	class SMAN
	{
		name = "Superman";
		texture = "GG\images\flags\flag_sman.paa";
		uids[] = {};
	};
	class SEGA
	{
		name = "SEGA";
		texture = "GG\images\flags\flag_sega.paa";
		uids[] = {};
	};
	class RAZOR
	{
		name = "Razor";
		texture = "GG\images\flags\flag_razor.paa";
		uids[] = {};
	};
	class KFC
	{
		name = "KFC";
		texture = "GG\images\flags\flag_kfc.paa";
		uids[] = {};
	};
	class KAPPA
	{
		name = "KAPPA";
		texture = "GG\images\flags\flag_kappa.paa";
		uids[] = {};
	};
	class INTEL
	{
		name = "INTEL";
		texture = "GG\images\flags\flag_intel.paa";
		uids[] = {};
	};
	class GOGL
	{
		name = "Google";
		texture = "GG\images\flags\flag_gogl.paa";
		uids[] = {};
	};
	class DAYZ
	{
		name = "DayZ";
		texture = "GG\images\flags\flag_dayz.paa";
		uids[] = {};
	};
	class MCD
	{
		name = "Mcdonalds";
		texture = "GG\images\flags\flag_bigmac.paa";
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

/**
 * Sort this by probability of occurence to speed things up a bit
 */
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
				condition = "(ExileClientInteractionObject getVariable ['ExAd_HACKING_IN_PROGRESS', false])";
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
		target = "Exile_Bike_MountainBike";

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
};
/**
 * Classname is used for reference
 * name is displayed in crafting requirements
 * models is used for crafting and interaction menus
 */
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
			"misc_well.p3d",
			"watertank_f.p3d",
			"pumpa.p3d",
			"Land_Water_source_F",
			"Land_WaterTank_F",
			"Land_BarrelEmpty_F",
			"Land_BarrelWater_F",
			"Land_BarrelWater_grey_F",
			"Land_WaterBarrel_F",
			"Land_WaterCooler_01_new_F",
			"Land_WaterCooler_01_old_F",
			"Land_pumpa",
			"kasna_new.p3d",

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
			"land_containerline_01_f",
			"land_containerline_02_f",
			"land_containerline_03_f",

			// Also allow wrecks
			"wreck_"
/*			
			"wreck_bmp2_f.p3d",
			"wreck_brdm2_f.p3d",
			"wreck_car2_f.p3d",
			"wreck_car3_f.p3d",
			"wreck_car_f.p3d",
			"wreck_cardismantled_f.p3d",
			"wreck_hmmwv_f.p3d",
			"wreck_hunter_f.p3d",
			"wreck_offroad2_f.p3d",
			"wreck_offroad_f.p3d",
			"wreck_skodovka_f.p3d",
			"wreck_slammer_f.p3d",
			"wreck_slammer_hull_f.p3d",
			"wreck_slammer_turret_f.p3d",
			"wreck_t72_hull_f.p3d",
			"wreck_t72_turret_f.p3d",
			"wreck_truck_dropside_f.p3d",
			"wreck_truck_f.p3d",
			"wreck_uaz_f.p3d",
			"wreck_ural_f.p3d"
			"wreck_van_f.p3d",
			*/


			// TODO: Ask community for CUP/AiA model names	
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
			"fuelstation_02_pump_f.p3d",
			"fuel_tank_big.p3d",
			"fuel_tank_small.p3d",
			"fuel_tank_stairs.p3d",
			"a_fuelstation_feed.p3d",
			"ind_tanksmall.p3d",
			"ind_tanksmall2.p3d",
			"benzina_schenell.p3d",
			"fuelstation_army.p3d",
			"fuelstation.p3d",
			"Tank_rust_F"
		};	
	};
};
class CfgLocker 
{
	numbersOnly = "0123456789";
	
	maxDeposit = 5000000;
};

class CfgPlayer 
{
	// In minutes ammount of time it takes to go from 100 - 0 if stationary
	hungerDecay = 90;
	thirstDecay = 60;

	// Damage taken from 0 (health||thirst)/sec
	healthDecay = 1.0;

	// Health regen if over BOTH
	thirstRegen = 80;
	hungerRegen = 80;

	// IF above meet recover HP%/MIN
	recoveryPerMinute = 5;

	// Set custom aim precision coefficient for weapon sway
	// https://community.bistudio.com/wiki/Arma_3_Stamina
	// Set to -1 if you want to use Arma 3 default value
	// setCustomAimCoef
	customAimCoefficient = 0.15;

	// 0 or 1
	enableFatigue = 0;
	enableStamina = 0;

	disableMapDrawing = 1;
};
class CfgSlothMachine
{
	spinCost = 500;
	Jackpot = 50000;
	
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
	// Level 1 is always for Pop Tabs, >= 2 for Respect
	prices[] = 
	{
		// Purchase Price 		Radius 		Number of Objects
		{10000,					10,			30 					}, // Level 1
		{50000,					20,			60 					}, // Level 2 
		{100000,				30,			90 					}, // Level 3
		{150000,				40,			120					}, // Level 4
		{200000,				50,			150					}, // Level 5
		{250000,				60,			180					}, // Level 6
		{300000,				70,			210					}, // Level 7
		{350000,				80,			240					}, // Level 8
		{400000,				90,			270					}, // Level 9
		{500000,				100,		300					}  // Level 10
	};

	// A shortcut of the above maximum radius
	maximumRadius = 100;

	// The above * 2 plus coverving the 20m you can move while placing things
	minimumDistanceToOtherTerritories = 220; 

	// Maximum number of territories a player can own
	maximumNumberOfTerritoriesPerPlayer = 2;

	/**
	 * Defines the minimum distance to safe zones / trader cities where players
	 * cannot build territories
	 */
	minimumDistanceToTraderZones = 500;

	/**
	 * Defines the minimum distance to spawn zones where players
	 * cannot build territories
	 */
	minimumDistanceToSpawnZones = 1000;

	// Amount of pop tabs per object to pay
	popTabAmountPerObject = 60;
};
class CfgTraderCategories 
{
	class TRYKUniforms
	{
		name = "TRYK Uniforms";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] =
		{
			"TRYK_HRP_UCP",
			"TRYK_HRP_USMC",
			"TRYK_HRP_khk",
			"TRYK_U_B_OD_OD_CombatUniform",
			"TRYK_U_B_OD_OD_R_CombatUniform",
			"TRYK_U_B_TANTAN_CombatUniform",
			"TRYK_U_B_TANTAN_R_CombatUniform",
			"TRYK_U_B_BLKBLK_CombatUniform",
			"TRYK_U_B_BLKBLK_R_CombatUniform",
			"TRYK_U_B_GRYOCP_CombatUniform",
			"TRYK_U_B_GRYOCP_R_CombatUniformTshirt",
			"TRYK_U_B_TANOCP_CombatUniform",
			"TRYK_U_B_TANOCP_R_CombatUniformTshirt",
			"TRYK_U_B_BLKOCP_CombatUniform",
			"TRYK_U_B_BLKOCP_R_CombatUniformTshirt",
			"TRYK_U_B_BLKTAN_CombatUniform",
			"TRYK_U_B_BLKTANR_CombatUniformTshirt",
			"TRYK_U_B_ODTAN_CombatUniform",
			"TRYK_U_B_ODTANR_CombatUniformTshirt",
			"TRYK_U_B_GRTAN_CombatUniform",
			"TRYK_U_B_GRTANR_CombatUniformTshirt",
			"TRYK_U_B_wood_CombatUniform",
			"TRYK_U_B_woodR_CombatUniformTshirt",
			"TRYK_U_B_wood3c_CombatUniform",
			"TRYK_U_B_wood3c_CombatUniformTshirt",
			"TRYK_U_B_MARPAT_WOOD_CombatUniform",
			"TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt",
			"TRYK_U_B_WOOD_MARPAT_CombatUniform",
			"TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",
			"TRYK_U_B_woodtan_CombatUniform",
			"TRYK_U_B_woodtanR_CombatUniformTshirt",
			"TRYK_U_B_JSDF_CombatUniform",
			"TRYK_U_B_JSDF_CombatUniformTshirt",
			"TRYK_U_B_3CD_Delta_BDU",
			"TRYK_U_B_3CD_Delta_BDUTshirt",
			"TRYK_U_B_3CD_Ranger_BDU",
			"TRYK_U_B_3CD_Ranger_BDUTshirt",
			"TRYK_U_B_3CD_BLK_BDUTshirt",
			"TRYK_U_B_3CD_BLK_BDUTshirt2",
			"TRYK_U_B_ACU",
			"TRYK_U_B_ACUTshirt",
			"TRYK_U_B_MARPAT_Wood",
			"TRYK_U_B_MARPAT_Wood_Tshirt",
			"TRYK_U_B_MARPAT_Desert",
			"TRYK_U_B_MARPAT_Desert_Tshirt",
			"TRYK_U_B_MARPAT_Desert2",
			"TRYK_U_B_MARPAT_Desert2_Tshirt",
			"TRYK_U_B_3c",
			"TRYK_U_B_3cr",
			"TRYK_U_B_Sage_Tshirt",
			"TRYK_U_B_BLK3CD",
			"TRYK_U_B_BLK3CD_Tshirt",
			"TRYK_U_B_BLK",
			"TRYK_U_B_BLK_Tshirt",
			"TRYK_U_B_BLKTAN",
			"TRYK_U_B_BLKTAN_Tshirt",
			"TRYK_U_B_ODTAN",
			"TRYK_U_B_ODTAN_Tshirt",
			"TRYK_U_B_BLK_OD",
			"TRYK_U_B_BLK_OD_Tshirt",
			"TRYK_U_B_C01_Tsirt",
			"TRYK_U_B_C02_Tsirt",
			"TRYK_U_B_OD_BLK",
			"TRYK_U_B_OD_BLK_2",
			"TRYK_U_B_BLK_TAN_1",
			"TRYK_U_B_BLK_TAN_2",
			"TRYK_U_B_wh_tan_Rollup_CombatUniform",
			"TRYK_U_B_wh_OD_Rollup_CombatUniform",
			"TRYK_U_B_wh_blk_Rollup_CombatUniform",
			"TRYK_U_B_BLK_tan_Rollup_CombatUniform",
			"TRYK_U_B_BLK_OD_Rollup_CombatUniform",
			"TRYK_U_B_NATO_UCP_GRY_CombatUniform",
			"TRYK_U_B_NATO_UCP_GRY_R_CombatUniform",
			"TRYK_U_B_NATO_UCP_CombatUniform",
			"TRYK_U_B_NATO_UCP_R_CombatUniform",
			"TRYK_U_B_NATO_OCP_c_BLK_CombatUniform",
			"TRYK_U_B_NATO_OCP_BLK_c_R_CombatUniform",
			"TRYK_U_B_NATO_OCP_BLK_CombatUniform",
			"TRYK_U_B_NATO_OCP_BLK_R_CombatUniform",
			"TRYK_U_B_NATO_OCPD_CombatUniform",
			"TRYK_U_B_NATO_OCPD_R_CombatUniform",
			"TRYK_U_B_NATO_OCP_CombatUniform",
			"TRYK_U_B_NATO_OCP_R_CombatUniform",
			"TRYK_U_B_AOR1_Rollup_CombatUniform",
			"TRYK_U_B_AOR2_Rollup_CombatUniform",
			"TRYK_U_B_MTP_CombatUniform",
			"TRYK_U_B_MTP_R_CombatUniform",
			"TRYK_U_B_MTP_BLK_CombatUniform",
			"TRYK_U_B_MTP_BLK_R_CombatUniform",
			"TRYK_U_B_Woodland",
			"TRYK_U_B_Woodland_Tshirt",
			"TRYK_U_B_WDL_GRY_CombatUniform",
			"TRYK_U_B_WDL_GRY_R_CombatUniform",
			"TRYK_U_B_ARO1_GR_CombatUniform",
			"TRYK_U_B_ARO1_GR_R_CombatUniform",
			"TRYK_U_B_ARO1_GRY_CombatUniform",
			"TRYK_U_B_ARO1_GRY_R_CombatUniform",
			"TRYK_U_B_ARO1_CombatUniform",
			"TRYK_U_B_ARO1R_CombatUniform",
			"TRYK_U_B_ARO1_BLK_CombatUniform",
			"TRYK_U_B_ARO1_BLK_R_CombatUniform",
			"TRYK_U_B_ARO1_CBR_CombatUniform",
			"TRYK_U_B_ARO1_CBR_R_CombatUniform",
			"TRYK_U_B_ARO2_CombatUniform",
			"TRYK_U_B_ARO2R_CombatUniform",
			"TRYK_U_B_AOR2_BLK_CombatUniform",
			"TRYK_U_B_AOR2_BLK_R_CombatUniform",
			"TRYK_U_B_AOR2_OD_CombatUniform",
			"TRYK_U_B_AOR2_OD_R_CombatUniform",
			"TRYK_U_B_AOR2_GRY_CombatUniform",
			"TRYK_U_B_AOR2_GRY_R_CombatUniform",
			"TRYK_U_B_Snow_CombatUniform",
			"TRYK_U_B_Snowt",
			"TRYK_U_B_Denim_T_WH",
			"TRYK_U_B_Denim_T_BK",
			"TRYK_U_B_BLK_T_WH",
			"TRYK_U_B_BLK_T_BK",
			"TRYK_U_B_RED_T_BR",
			"TRYK_U_B_Denim_T_BG_WH",
			"TRYK_U_B_Denim_T_BG_BK",
			"TRYK_U_B_BLK_T_BG_WH",
			"TRYK_U_B_BLK_T_BG_BK",
			"TRYK_U_B_RED_T_BG_BR",
			"TRYK_U_B_fleece",
			"TRYK_U_B_fleece_UCP",
			"TRYK_U_B_UCP_PCUs",
			"TRYK_U_B_GRY_PCUs",
			"TRYK_U_B_Wood_PCUs",
			"TRYK_U_B_PCUs",
			"TRYK_U_B_UCP_PCUs_R",
			"TRYK_U_B_GRY_PCUs_R",
			"TRYK_U_B_Wood_PCUs_R",
			"TRYK_U_B_PCUs_R",
			"TRYK_U_B_PCUGs",
			"TRYK_U_B_PCUODs",
			"TRYK_U_B_PCUGs_gry",
			"TRYK_U_B_PCUGs_BLK",
			"TRYK_U_B_PCUGs_OD",
			"TRYK_U_B_PCUGs_gry_R",
			"TRYK_U_B_PCUGs_BLK_R",
			"TRYK_U_B_PCUGs_OD_R",
			"TRYK_U_Bts_GRYGRY_PCUs",
			"TRYK_U_Bts_UCP_PCUs",
			"TRYK_U_Bts_Wood_PCUs",
			"TRYK_U_Bts_PCUs",
			"TRYK_U_pad_j",
			"TRYK_U_pad_j_blk",
			"TRYK_U_pad_hood_Cl",
			"TRYK_U_pad_hood_Cl_blk",
			"TRYK_U_pad_hood_tan",
			"TRYK_U_pad_hood_Blk",
			"TRYK_U_pad_hood_CSATBlk",
			"TRYK_U_pad_hood_Blod",
			"TRYK_U_pad_hood_odBK",
			"TRYK_U_pad_hood_BKT2",
			"TRYK_hoodie_Blk",
			"TRYK_hoodie_FR",
			"TRYK_hoodie_Wood",
			"TRYK_hoodie_3c",
			"TRYK_T_camo_tan",
			"TRYK_T_camo_3c",
			"TRYK_T_camo_Wood",
			"TRYK_T_camo_wood_marpat",
			"TRYK_T_camo_Desert_marpat",
			"TRYK_T_camo_3c_BG",
			"TRYK_T_camo_Wood_BG",
			"TRYK_T_camo_wood_marpat_BG",
			"TRYK_T_camo_desert_marpat_BG",
			"TRYK_T_PAD",
			"TRYK_T_OD_PAD",
			"TRYK_T_TAN_PAD",
			"TRYK_T_BLK_PAD",
			"TRYK_T_T2_PAD",
			"TRYK_T_CSAT_PAD",
			"TRYK_U_nohoodPcu_gry",
			"TRYK_U_hood_nc",
			"TRYK_U_hood_mc",
			"TRYK_U_denim_hood_blk",
			"TRYK_U_denim_hood_mc",
			"TRYK_U_denim_hood_3c",
			"TRYK_U_denim_hood_nc",
			"TRYK_U_denim_jersey_blu",
			"TRYK_U_denim_jersey_blk",
			"TRYK_shirts_PAD",
			"TRYK_shirts_OD_PAD",
			"TRYK_shirts_TAN_PAD",
			"TRYK_shirts_BLK_PAD",
			"TRYK_shirts_PAD_BK",
			"TRYK_shirts_OD_PAD_BK",
			"TRYK_shirts_TAN_PAD_BK",
			"TRYK_shirts_BLK_PAD_BK",
			"TRYK_shirts_PAD_BLW",
			"TRYK_shirts_OD_PAD_BLW",
			"TRYK_shirts_TAN_PAD_BLW",
			"TRYK_shirts_BLK_PAD_BLW",
			"TRYK_shirts_PAD_YEL",
			"TRYK_shirts_OD_PAD_YEL",
			"TRYK_shirts_TAN_PAD_YEL",
			"TRYK_shirts_BLK_PAD_YEL",
			"TRYK_shirts_PAD_RED2",
			"TRYK_shirts_OD_PAD_RED2",
			"TRYK_shirts_TAN_PAD_RED2",
			"TRYK_shirts_BLK_PAD_RED2",
			"TRYK_shirts_PAD_BLU3",
			"TRYK_shirts_OD_PAD_BLU3",
			"TRYK_shirts_TAN_PAD_BLU3",
			"TRYK_shirts_BLK_PAD_BLU3",
			"TRYK_shirts_DENIM_R",
			"TRYK_shirts_DENIM_BL",
			"TRYK_shirts_DENIM_BK",
			"TRYK_shirts_DENIM_WH",
			"TRYK_shirts_DENIM_BWH",
			"TRYK_shirts_DENIM_RED2",
			"TRYK_shirts_DENIM_WHB",
			"TRYK_shirts_DENIM_ylb",
			"TRYK_shirts_DENIM_od",
			"TRYK_shirts_DENIM_R_Sleeve",
			"TRYK_shirts_DENIM_BL_Sleeve",
			"TRYK_shirts_DENIM_BK_Sleeve",
			"TRYK_shirts_DENIM_WH_Sleeve",
			"TRYK_shirts_DENIM_BWH_Sleeve",
			"TRYK_shirts_DENIM_RED2_Sleeve",
			"TRYK_shirts_DENIM_WHB_Sleeve",
			"TRYK_shirts_DENIM_ylb_Sleeve",
			"TRYK_shirts_DENIM_od_Sleeve",
			"TRYK_shirts_PAD_BL",
			"TRYK_shirts_OD_PAD_BL",
			"TRYK_shirts_TAN_PAD_BL",
			"TRYK_shirts_BLK_PAD_BL",
			"TRYK_U_taki_wh",
			"TRYK_U_taki_COY",
			"TRYK_U_taki_BL",
			"TRYK_U_taki_BLK",
			"TRYK_U_Bts_PCUGs",
			"TRYK_U_Bts_PCUODs",
			"TRYK_U_taki_G_WH",
			"TRYK_U_taki_G_COY",
			"TRYK_U_taki_G_BL",
			"TRYK_U_taki_G_BLK",
			"TRYK_U_B_PCUHs",
			"TRYK_U_B_PCUGHs",
			"TRYK_U_B_PCUODHs",
			"TRYK_B_USMC_R",
			"TRYK_B_USMC_R_ROLL",
			"TRYK_ZARATAKI",
			"TRYK_ZARATAKI2",
			"TRYK_ZARATAKI3",
			"TRYK_B_TRYK_UCP_T",
			"TRYK_B_TRYK_3C_T",
			"TRYK_B_TRYK_MTP_T",
			"TRYK_B_TRYK_OCP_T",
			"TRYK_B_TRYK_OCP_D_T",
			"TRYK_DMARPAT_T",
			"TRYK_C_AOR2_T",
			"TRYK_U_B_Sage_T",
			"TRYK_U_B_Wood_T",
			"TRYK_U_B_BLTAN_T",
			"TRYK_U_B_BLOD_T",
			"TRYK_OVERALL_flesh",
			"TRYK_OVERALL_nok_flesh",
			"TRYK_OVERALL_SAGE_BLKboots",
			"TRYK_OVERALL_SAGE_BLKboots_nk_blk",
			"TRYK_OVERALL_SAGE_BLKboots_nk",
			"TRYK_OVERALL_SAGE_BLKboots_nk_blk2",
			"TRYK_OVERALL_SAGE",
			"TRYK_SUITS_BLK_F",
			"TRYK_SUITS_BR_F",
			"TRYK_H_ghillie_top_headless3glass",
			"TRYK_shoulder_armor_BK",
			"TRYK_shoulder_armor_OD",
			"TRYK_shoulder_armor_CY",
			"TRYK_H_ghillie_top_headless3",
			"TRYK_U_B_PCUHsW",
			"TRYK_U_B_PCUHsW2",
			"TRYK_U_B_PCUHsW3",
			"TRYK_U_B_PCUHsW3nh",
			"TRYK_U_B_PCUHsW4",
			"TRYK_U_B_PCUHsW5",
			"TRYK_U_B_PCUHsW6"
			};
	};

	class TRYKVests
	{
		name = "TRYK Vests";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa";
		items[] =
		{
			"TRYK_Hrp_vest_ucp",
			"TRYK_V_PlateCarrier_JSDF",
			"TRYK_V_ArmorVest_AOR1",
			"TRYK_V_ArmorVest_AOR2",
			"TRYK_V_ArmorVest_coyo",
			"TRYK_V_ArmorVest_Brown",
			"TRYK_V_ArmorVest_CBR",
			"TRYK_V_ArmorVest_khk",
			"TRYK_V_ArmorVest_rgr",
			"TRYK_V_ArmorVest_green",
			"TRYK_V_ArmorVest_tan",
			"TRYK_V_ArmorVest_Delta",
			"TRYK_V_ArmorVest_Ranger",
			"TRYK_V_ArmorVest_AOR1_2",
			"TRYK_V_ArmorVest_AOR2_2",
			"TRYK_V_ArmorVest_coyo2",
			"TRYK_V_ArmorVest_Brown2",
			"TRYK_V_ArmorVest_cbr2",
			"TRYK_V_ArmorVest_khk2",
			"TRYK_V_ArmorVest_rgr2",
			"TRYK_V_ArmorVest_green2",
			"TRYK_V_ArmorVest_tan2",
			"TRYK_V_ArmorVest_Delta2",
			"TRYK_V_ArmorVest_Ranger2",
			"TRYK_V_PlateCarrier_blk",
			"TRYK_V_PlateCarrier_coyo",
			"TRYK_V_PlateCarrier_wood",
			"TRYK_V_PlateCarrier_ACU",
			"TRYK_V_TacVest_coyo",
			"TRYK_V_harnes_blk_L",
			"TRYK_V_harnes_od_L",
			"TRYK_V_harnes_TAN_L",
			"TRYK_V_PlateCarrier_blk_L",
			"TRYK_V_PlateCarrier_wood_L",
			"TRYK_V_PlateCarrier_ACU_L",
			"TRYK_V_PlateCarrier_coyo_L",
			"TRYK_V_ChestRig_L",
			"TRYK_V_ChestRig",
			"TRYK_V_Bulletproof",
			"TRYK_V_Bulletproof_BLK",
			"TRYK_V_Bulletproof_BL",
			"TRYK_V_IOTV_BLK",
			"TRYK_V_tacv1M_BK",
			"TRYK_V_tacv1MLC_BK",
			"TRYK_V_tacv1",
			"TRYK_V_tacv1_CY",
			"TRYK_V_tacv1_BK",
			"TRYK_V_tacv1_P_BK",
			"TRYK_V_tacv1_SHERIFF_BK",
			"TRYK_V_tacv1_FBI_BK",
			"TRYK_V_tacv1LP_BK",
			"TRYK_V_tacv1LSRF_BK",
			"TRYK_V_tacv1LC_BK",
			"TRYK_V_tacv1LC_CY",
			"TRYK_V_tacv1LC_OD",
			"TRYK_V_tacv1LC_FBI_BK",
			"TRYK_V_tacv1LC_SRF_BK",
			"TRYK_V_tacv1LC_SRF_OD",
			"TRYK_V_tacv1LC_P_BK",
			"TRYK_V_PlateCarrier_POLICE",
			"TRYK_V_ArmorVest_HRT_B",
			"TRYK_V_ArmorVest_HRT_OD",
			"TRYK_V_ArmorVest_HRT2_B",
			"TRYK_V_ArmorVest_HRT2_OD",
			"TRYK_V_ArmorVest_Winter",
			"TRYK_V_Sheriff_BA_OD",
			"TRYK_V_tacv10_BK",
			"TRYK_V_tacv10_OD",
			"TRYK_V_tacv10_TN",
			"TRYK_V_tacv10LC_BK",
			"TRYK_V_tacv10LC_OD",
			"TRYK_V_tacv10LC_TN",
			"TRYK_V_tacv1L_BK",
			"TRYK_V_tacv1L_OD",
			"TRYK_V_tacv1L_CY",
			"TRYK_V_tacv1LC_FBI2_BK",
			"TRYK_V_tacv1LC_SRF2_BK",
			"TRYK_V_tacv1LC_SRF2_OD",
			"TRYK_V_tacv1LC_P2_BK",
			"TRYK_V_tacv1_MSL_BK",
			"TRYK_V_tacv1_MSL_NV",
			"TRYK_V_tacv1LMSL_BK",
			"TRYK_V_tacv1LMSL_NV",
			"TRYK_V_tacv1LC_MSL_BK",
			"TRYK_V_tacv1LC_MSL_NV",
			"TRYK_V_tacSVD_BK",
			"TRYK_V_tacSVD_OD",
			"TRYK_V_Sheriff_BA_TL",
			"TRYK_V_Sheriff_BA_TBL",
			"TRYK_V_Sheriff_BA_TCL",
			"TRYK_V_Sheriff_BA_TL2",
			"TRYK_V_Sheriff_BA_TBL2",
			"TRYK_V_Sheriff_BA_TCL2",
			"TRYK_V_Sheriff_BA_T",
			"TRYK_V_Sheriff_BA_TB",
			"TRYK_V_Sheriff_BA_T2",
			"TRYK_V_Sheriff_BA_TB2",
			"TRYK_V_Sheriff_BA_T3",
			"TRYK_V_Sheriff_BA_TB3",
			"TRYK_V_Sheriff_BA_T4",
			"TRYK_V_Sheriff_BA_TB4",
			"TRYK_V_Sheriff_BA_T5",
			"TRYK_V_Sheriff_BA_TB5",
			"TRYK_V_Sheriff_BA_TBL3_BK",
			"TRYK_V_Sheriff_BA_TBL3_OD",
			"TRYK_V_Sheriff_BA_TBL3_TN",
			"TRYK_LOC_AK_chestrig_OD",
			"TRYK_LOC_AK_chestrig_TAN"
		};
	};

	class TRYKHeadgear
	{
		name = "TRYK Headgear";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\headgear_ca.paa";
		items[] =
		{
			"TRYK_US_ESS_Glasses",
			"TRYK_US_ESS_Glasses_WH",
			"TRYK_US_ESS_Glasses_BLK",
			"TRYK_US_ESS_Glasses_TAN",
			"TRYK_US_ESS_Glasses_TAN_BLK",
			"TRYK_SPGEAR_Glasses",
			"TRYK_headset_Glasses",
			"TRYK_SpsetG_Glasses",
			"TRYK_Spset_PHC1_Glasses",
			"TRYK_Spset_PHC2_Glasses",
			"TRYK_US_ESS_Glasses_H",
			"TRYK_US_ESS_Glasses_Cover",
			"TRYK_headset2_glasses",
			"TRYK_ESS_CAP_OD",
			"TRYK_ESS_CAP_tan",
			"TRYK_R_CAP_BLK",
			"TRYK_R_CAP_TAN",
			"TRYK_R_CAP_OD_US",
			"TRYK_r_cap_tan_Glasses",
			"TRYK_r_cap_blk_Glasses",
			"TRYK_r_cap_od_Glasses",
			"TRYK_H_headsetcap_Glasses",
			"TRYK_H_headsetcap_blk_Glasses",
			"TRYK_H_headsetcap_od_Glasses",
			"TRYK_TAC_EARMUFF_SHADE",
			"TRYK_TAC_EARMUFF",
			"TRYK_NOMIC_TAC_EARMUFF",
			"TRYK_headset2",
			"TRYK_TAC_EARMUFF_Gs",
			"TRYK_TAC_SET_bn",
			"TRYK_NOMIC_TAC_EARMUFF_Gs",
			"TRYK_TAC_EARMUFF_SHADE_Gs",
			"TRYK_TAC_SET_TAN",
			"TRYK_TAC_SET_OD",
			"TRYK_TAC_SET_WH",
			"TRYK_TAC_SET_MESH",
			"TRYK_TAC_SET_TAN_2",
			"TRYK_TAC_SET_OD_2",
			"TRYK_TAC_SET_WH_2",
			"TRYK_TAC_SET_MESH_2",
			"TRYK_bandana_g",
			"TRYK_H_PASGT_BLK",
			"TRYK_H_PASGT_OD",
			"TRYK_H_PASGT_COYO",
			"TRYK_H_PASGT_TAN",
			"TRYK_H_Helmet_Snow",
			"TRYK_H_WH",
			"TRYK_H_GR",
			"TRYK_H_AOR1",
			"TRYK_H_AOR2",
			"TRYK_H_EARMUFF",
			"TRYK_H_TACEARMUFF_H",
			"TRYK_H_Bandana_H",
			"TRYK_H_Bandana_wig",
			"TRYK_H_Bandana_wig_g",
			"TRYK_H_wig",
			"TRYK_H_headset2",
			"TRYK_H_ghillie_over",
			"TRYK_H_ghillie_top",
			"TRYK_H_ghillie_top_headless",
			"TRYK_H_ghillie_over_green",
			"TRYK_H_ghillie_top_green",
			"TRYK_H_ghillie_top_headless_green",
			"TRYK_H_woolhat",
			"TRYK_H_woolhat_CW",
			"TRYK_H_woolhat_WH",
			"TRYK_H_woolhat_br",
			"TRYK_H_woolhat_cu",
			"TRYK_H_woolhat_tan",
			"TRYK_H_headsetcap",
			"TRYK_H_headsetcap_blk",
			"TRYK_H_headsetcap_od",
			"TRYK_H_pakol",
			"TRYK_H_pakol2",
			"TRYK_H_LHS_HEL_G",
			"TRYK_H_Helmet_Winter",
			"TRYK_H_Helmet_Winter_2",
			"TRYK_Shemagh_shade_MESH",
			"TRYK_Shemagh_shade_N",
			"TRYK_Shemagh_shade_G_N",
			"TRYK_Shemagh_shade_WH_N",
			"TRYK_kio_balaclava_WH",
			"TRYK_kio_balaclava_BLK",
			"TRYK_kio_balaclavas",
			"TRYK_kio_balaclava_BLK_ear",
			"TRYK_kio_balaclava_ear",
			"TRYK_kio_balaclava_ESS",
			"TRYK_Shemagh",
			"TRYK_Shemagh_mesh",
			"TRYK_Shemagh_G",
			"TRYK_Shemagh_WH",
			"TRYK_Shemagh_shade",
			"TRYK_Shemagh_shade_G",
			"TRYK_Shemagh_shade_WH",
			"TRYK_Shemagh_shade_MH",
			"TRYK_Shemagh_ESS",
			"TRYK_Shemagh_ESS_G",
			"TRYK_Shemagh_ESS_WH",
			"TRYK_Shemagh_EAR_TAN",
			"TRYK_Shemagh_EAR_WH"
		};
	};

	class TRYKNVGHeadgear
	{
		name = "TRYK NVG Headgear";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\headgear_ca.paa";
		items[] =
		{
			"TRYK_US_ESS_Glasses_NV",
			"TRYK_US_ESS_Glasses_TAN_NV",
			"TRYK_ESS_BLKTAN_NV",
			"TRYK_ESS_BLKBLK_NV",
			"TRYK_G_Shades_Black_NV",
			"TRYK_G_Shades_Blue_NV",
			"TRYK_G_bala_ess_NV",
			"TRYK_bandana_NV",
			"TRYK_SPgearG_NV",
			"TRYK_SPgear_PHC1_NV",
			"TRYK_SPgear_PHC2_NV",
			"TRYK_G_bala_wh_NV",
			"TRYK_ESS_wh_NV",
			"TRYK_Headphone_NV",
			"TRYK_HRPIGEAR_NV",
			"TRYK_Headset_NV",
			"TRYK_TAC_boonie_SET_NV",
			"TRYK_TAC_SET_NV_TAN",
			"TRYK_TAC_SET_NV_OD",
			"TRYK_TAC_SET_NV_WH",
			"TRYK_TAC_SET_NV_MESH",
			"TRYK_TAC_SET_NV_TAN_2",
			"TRYK_TAC_SET_NV_OD_2",
			"TRYK_TAC_SET_NV_WH_2",
			"TRYK_TAC_SET_NV_MESH_2",
			"TRYK_H_DELTAHELM_NV",
			"TRYK_balaclava_BLACK_NV",
			"TRYK_balaclava_NV",
			"TRYK_balaclava_BLACK_EAR_NV",
			"TRYK_balaclava_EAR_NV",
			"TRYK_Shemagh_TAN_NV",
			"TRYK_Shemagh_MESH_NV",
			"TRYK_Shemagh_G_NV",
			"TRYK_Shemagh_WH_NV",
			"TRYK_Shemagh_EAR_NV",
			"TRYK_Shemagh_EAR_G_NV",
			"TRYK_Shemagh_EAR_WH_NV",
			"TRYK_ShemaghESSTAN_NV",
			"TRYK_ShemaghESSOD_NV",
			"TRYK_ShemaghESSWH_NV"
		};
	};

 
	class TRYKBackpacks
	{
		name = "TRYK Backpacks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
		items[] =
		{
			"TRYK_B_AssaultPack_UCP",
			"TRYK_B_AssaultPack_Type2camo",
			"TRYK_B_AssaultPack_MARPAT_Desert",
			"TRYK_B_AssaultPack_MARPAT_Wood",
			"TRYK_B_Kitbag_Base",
			"TRYK_B_Kitbag_blk",
			"TRYK_B_Kitbag_aaf",
			"TRYK_B_Carryall_blk",
			"TRYK_B_Carryall_wh",
			"TRYK_B_Carryall_wood",
			"TRYK_B_Carryall_JSDF",
			"TRYK_B_Kitbag_Base_JSDF",
			"TRYK_B_Coyotebackpack",
			"TRYK_B_Coyotebackpack_OD",
			"TRYK_B_Coyotebackpack_BLK",
			"TRYK_B_Coyotebackpack_WH",
			"TRYK_B_Alicepack",
			"TRYK_B_Medbag",
			"TRYK_B_Medbag_OD",
			"TRYK_B_Medbag_BK",
			"TRYK_B_Medbag_ucp",
			"TRYK_B_Belt",
			"TRYK_B_Belt_BLK",
			"TRYK_B_Belt_CYT",
			"TRYK_B_Belt_tan",
			"TRYK_B_Belt_br",
			"TRYK_B_Belt_GR",
			"TRYK_B_Belt_AOR1",
			"TRYK_B_Belt_AOR2",
			"TRYK_B_BAF_BAG_BLK",
			"TRYK_B_BAF_BAG_CYT",
			"TRYK_B_BAF_BAG_OD",
			"TRYK_B_BAF_BAG_rgr",
			"TRYK_B_BAF_BAG_mcamo",
			"TRYK_B_tube_cyt",
			"TRYK_B_tube_od",
			"TRYK_B_tube_blk",
			"TRYK_B_FieldPack_Wood",
			"TRYK_Winter_pack"
		};
	};	
	
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

	class Uniforms
	{
		name = "Uniforms";
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
			"U_B_CombatUniform_mcam",
			"U_B_CombatUniform_mcam_tshirt",
			"U_B_CombatUniform_mcam_vest",
			"U_B_CombatUniform_mcam_worn",
			"U_B_CTRG_1",
			"U_B_CTRG_2",
			"U_B_CTRG_3",
			"U_I_CombatUniform",
			"U_I_CombatUniform_shortsleeve",
			"U_I_CombatUniform_tshirt",
			"U_I_OfficerUniform",
			"U_O_CombatUniform_ocamo",
			"U_O_CombatUniform_oucamo",
			"U_O_OfficerUniform_ocamo",
			"U_B_SpecopsUniform_sgg",
			"U_O_SpecopsUniform_blk",
			"U_O_SpecopsUniform_ocamo",
			"U_I_G_Story_Protagonist_F",
			"Exile_Uniform_Woodland",
			"U_C_HunterBody_grn",
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
			"U_B_FullGhillie_ard",
			"U_B_FullGhillie_lsh",
			"U_B_FullGhillie_sard",
			"U_B_GhillieSuit",
			"U_I_FullGhillie_ard",
			"U_I_FullGhillie_lsh",
			"U_I_FullGhillie_sard",
			"U_I_GhillieSuit",
			"U_O_FullGhillie_ard",
			"U_O_FullGhillie_lsh",
			"U_O_FullGhillie_sard",
			"U_O_GhillieSuit",
			"U_I_Wetsuit",
			"U_O_Wetsuit",
			"U_B_Wetsuit",
			"U_B_survival_uniform",
			"U_B_HeliPilotCoveralls",
			"U_I_HeliPilotCoveralls",
			"U_B_PilotCoveralls",
			"U_I_pilotCoveralls",
			"U_O_PilotCoveralls",
			//Apex
			"U_B_T_Soldier_F",
			"U_B_T_Soldier_AR_F",
			"U_B_T_Soldier_SL_F",
			"U_B_T_Sniper_F",
			"U_B_T_FullGhillie_tna_F",
			"U_B_CTRG_Soldier_F",
			"U_B_CTRG_Soldier_2_F",
			"U_B_CTRG_Soldier_3_F",
			"U_B_GEN_Soldier_F",
			"U_B_GEN_Commander_F",
			"U_O_T_Soldier_F",
			"U_O_T_Officer_F",
			"U_O_T_Sniper_F",
			"U_O_T_FullGhillie_tna_F",
			"U_O_V_Soldier_Viper_F",
			"U_O_V_Soldier_Viper_hex_F",
			"U_I_C_Soldier_Para_1_F",
			"U_I_C_Soldier_Para_2_F",
			"U_I_C_Soldier_Para_3_F",
			"U_I_C_Soldier_Para_4_F",
			"U_I_C_Soldier_Para_5_F",
			"U_I_C_Soldier_Bandit_1_F",
			"U_I_C_Soldier_Bandit_2_F",
			"U_I_C_Soldier_Bandit_3_F",
			"U_I_C_Soldier_Bandit_4_F",
			"U_I_C_Soldier_Bandit_5_F",
			"U_I_C_Soldier_Camo_F",
			"U_C_man_sport_1_F",
			"U_C_man_sport_2_F",
			"U_C_man_sport_3_F",
			"U_C_Man_casual_1_F",
			"U_C_Man_casual_2_F",
			"U_C_Man_casual_3_F",
			"U_C_Man_casual_4_F",
			"U_C_Man_casual_5_F",
			"U_C_Man_casual_6_F",
			"U_B_CTRG_Soldier_urb_1_F",
			"U_B_CTRG_Soldier_urb_2_F",
			"U_B_CTRG_Soldier_urb_3_F"
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
			"V_TacVest_brn",
			"V_TacVest_camo",
			"V_TacVest_khk",
			"V_TacVest_oli",
			"V_TacVestCamo_khk",
			"V_TacVestIR_blk",
			"V_I_G_resistanceLeader_F",
			"V_BandollierB_blk",
			"V_BandollierB_cbr",
			"V_BandollierB_khk",
			"V_BandollierB_oli",
			"V_BandollierB_rgr",
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
			"V_PlateCarrier1_blk",
			"V_PlateCarrier1_rgr",
			"V_PlateCarrier2_rgr",
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
			//Apex
			"V_TacChestrig_grn_F",
			"V_TacChestrig_oli_F",
			"V_TacChestrig_cbr_F",
			"V_PlateCarrier1_tna_F",
			"V_PlateCarrier2_tna_F",
			"V_PlateCarrierSpec_tna_F",
			"V_PlateCarrierGL_tna_F",
			"V_HarnessO_ghex_F",
			"V_HarnessOGL_ghex_F",
			"V_BandollierB_ghex_F",
			"V_TacVest_gen_F",
			"V_PlateCarrier1_rgr_noflag_F",
			"V_PlateCarrier2_rgr_noflag_F"
		};
	};

	class Headgear 
	{
		name = "Headgear";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\headgear_ca.paa";
		items[] =
		{
			"Exile_Headgear_SantaHat",
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
			//Apex
			"H_Helmet_Skate",
			"H_HelmetB_TI_tna_F",
			//"H_HelmetO_ViperSP_hex_F",
			//"H_HelmetO_ViperSP_ghex_F",
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

class Glasses 
	{
		name = "Glasses";
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
			"G_Diving",
			"G_B_Diving",
			"G_O_Diving",
			"G_I_Diving",
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
			"bipod_01_F_snd",
			"bipod_02_F_blk",
			"bipod_02_F_hex",
			"bipod_02_F_tan",
			"bipod_03_F_blk",
			"bipod_03_F_oli",
			//Apex
			"bipod_01_F_khk"
		};
	};

	class MuzzleAttachments 
	{
		name = "Suppressor Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemmuzzle_ca.paa";
		items[] = 
		{
			"muzzle_snds_338_black",
			"muzzle_snds_338_green",
			"muzzle_snds_338_sand",
			"muzzle_snds_93mmg",
			"muzzle_snds_93mmg_tan",
			"muzzle_snds_acp",
			"muzzle_snds_B",
			"muzzle_snds_H",
			"muzzle_snds_H_MG",
			"muzzle_snds_H_SW",
			"muzzle_snds_L",
			"muzzle_snds_M",
			//Apex
			"muzzle_snds_H_khk_F",
			"muzzle_snds_H_snd_F",
			"muzzle_snds_58_blk_F",
			"muzzle_snds_m_khk_F",
			"muzzle_snds_m_snd_F",
			"muzzle_snds_B_khk_F",
			"muzzle_snds_B_snd_F",
			"muzzle_snds_58_wdm_F",
			"muzzle_snds_65_TI_blk_F",
			"muzzle_snds_65_TI_hex_F",
			"muzzle_snds_65_TI_ghex_F",
			"muzzle_snds_H_MG_blk_F",
			"muzzle_snds_H_MG_khk_F"
		};
	};
	
	class NIARMSMUZZLE 
	{
		name = "NIARMS Suppressor Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemmuzzle_ca.paa";
		items[] = 
		{
			"hlc_muzzle_300blk_KAC",
			"hlc_muzzle_545SUP_AK",
			"hlc_muzzle_556NATO_KAC",
			"hlc_muzzle_762SUP_AK",
			"hlc_muzzle_Agendasix",
			"hlc_muzzle_Agendasix10mm",
			"hlc_muzzle_snds_a6AUG",
			"hlc_muzzle_snds_AUG",
			"hlc_muzzle_snds_fal",
			"hlc_muzzle_snds_g3",
			"hlc_muzzle_snds_HK33",
			"hlc_muzzle_snds_M14",
			"hlc_muzzle_Tundra",
			"muzzle_HBadger"
		};
	};

	/*class UAVs
	{
		name = "Unmanned Aerial Vehicles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\gps_ca.paa";
		items[] = 
		{
			"I_UavTerminal",
			"I_UAV_01_backpack_F"
		};
	};*/

	class StaticMGs
	{
		name = "Static Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"O_HMG_01_support_F",
			//"O_HMG_01_support_high_F", // Does not seem to work with HMG01, only the lower version does
			"O_HMG_01_weapon_F"
		};
	};

	class OpticAttachments 
	{
		name = "Scopes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemoptic_ca.paa";
		items[] = 
		{
			"optic_Aco",
			"optic_ACO_grn",
			"optic_ACO_grn_smg",
			"optic_Aco_smg",
			"optic_AMS",
			"optic_AMS_khk",
			"optic_AMS_snd",
			"optic_Arco",
			"optic_DMS",
			"optic_Hamr",
			"optic_Holosight",
			"optic_Holosight_smg",
			"optic_KHS_blk",
			"optic_KHS_hex",
			"optic_KHS_old",
			"optic_KHS_tan",
			"optic_LRPS",
			"optic_MRCO",
			"optic_MRD",
			//"optic_Nightstalker",
			"optic_NVS",
			"optic_SOS",
			//"optic_tws",
			//"optic_tws_mg",
			"optic_Yorris",
			//Apex
			"optic_Arco_blk_F",
			"optic_Arco_ghex_F",
			"optic_DMS_ghex_F",
			"optic_Hamr_khk_F",
			"optic_ERCO_blk_F",
			"optic_ERCO_khk_F",
			"optic_ERCO_snd_F",
			"optic_SOS_khk_F",
			"optic_LRPS_tna_F",
			"optic_LRPS_ghex_F",
			"optic_Holosight_blk_F",
			"optic_Holosight_khk_F",
			"optic_Holosight_smg_blk_F"
		};
	};
	
	class NIARMSOPTICS 
	{
		name = "NIARMS Scopes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemoptic_ca.paa";
		items[] = 
		{
			"HLC_Optic_1p29",
			"hlc_optic_accupoint_g3",
			"hlc_optic_artel_m14",
			"HLC_Optic_G36Dualoptic15x",
			"HLC_Optic_G36Dualoptic15x2d",
			"HLC_Optic_G36dualoptic35x",
			"HLC_Optic_G36dualoptic35x2d",
			"HLC_Optic_G36Export15x",
			"HLC_Optic_G36Export15x2d",
			"HLC_Optic_G36Export35x",
			"HLC_Optic_G36Export35x2d",
			//"hlc_optic_goshawk",
			"hlc_optic_Kern",
			"hlc_optic_Kern2d",
			"hlc_optic_kobra",
			"hlc_optic_LRT_m14",
			"HLC_Optic_PSO1",
			"hlc_optic_PVS4FAL",
			"hlc_optic_PVS4G3",
			"hlc_optic_PVS4M14",
			"hlc_optic_suit",
			"HLC_Optic_ZFSG1"
		};
	};

	class Hardware 
	{
		name = "Hardware";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Item_Rope",
			"Exile_Item_DuctTape",
			"Exile_Item_ExtensionCord",
			"Exile_Item_FuelCanisterEmpty",
			"Exile_Item_JunkMetal",
			"Exile_Item_LightBulb",
			"Exile_Item_MetalBoard",
			"Exile_Item_MetalPole",
			"Exile_Item_SafeKit",
			"Exile_Item_CamoTentKit",
			"Exile_Item_CodeLock",
			"Exile_Item_MetalScrews",
			"Exile_Item_MetalWire",
			"Exile_Item_Laptop",
			"Exile_Item_BaseCameraKit",
			//"Exile_Item_MetalHedgehogKit",
			//"Exile_Item_CarWheel",
			"Exile_Item_Cement",
			"Exile_Item_Sand"
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
			"Exile_Item_ChristmasTinner",
			"Exile_Item_BBQSandwich",
			"Exile_Item_MacasCheese",
			"Exile_Item_Dogfood",
			"Exile_Item_BeefParts",
			"Exile_Item_Cheathas",
			"Exile_Item_Noodles",
			"Exile_Item_SeedAstics",
			"Exile_Item_Raisins",
			"Exile_Item_Moobar",
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

	class Tools
	{
		name = "Tools";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Item_Matches",
			"Exile_Item_CookingPot",
			"Exile_Melee_Axe",
			"Exile_Item_CanOpener",
			"Exile_Item_Handsaw",
			"Exile_Item_Pliers",
			"Exile_Item_Grinder",
			"Exile_Item_Foolbox",
			/*
			"Exile_Item_CordlessScrewdriver",
			"Exile_Item_FireExtinguisher",
			"Exile_Item_Hammer",
			"Exile_Item_OilCanister",
			"Exile_Item_Screwdriver",
			"Exile_Item_Shovel",
			"Exile_Item_Wrench",
			"Exile_Item_SleepingMat",*/	
			"Exile_Item_ToiletPaper",			
			"Exile_Item_ZipTie",
			"Binocular",
			"Rangefinder",
			/*"Laserdesignator",
			"Laserdesignator_02",
			"Laserdesignator_03",*/
			"NVGoggles",
			"NVGoggles_INDEP",
			"NVGoggles_OPFOR",
			"ItemGPS",
			"ItemMap",
			"ItemCompass",
			"ItemRadio",
			"ItemWatch",
			"Exile_Item_XM8",
			
			//Apex
			"O_NVGoggles_hex_F",
			"O_NVGoggles_urb_F",
			"O_NVGoggles_ghex_F",
			"NVGoggles_tna_F"
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
			"Exile_Item_Heatpack"

			// Not available in 0.9.4!
			//"Exile_Item_Defibrillator"
		};
	};

	class Navigation
	{
		name = "Special Environment";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"B_Parachute",
			"V_RebreatherB",
			"V_RebreatherIA",
			"V_RebreatherIR",
			"Exile_Headgear_GasMask",
			"G_Diving",
			"G_B_Diving",
			"G_O_Diving",
			"G_I_Diving"
		};
	};

	class Backpacks
	{
		name = "Backpacks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
		items[] = 
		{
			"B_AssaultPack_blk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_dgtl",
			"B_AssaultPack_khk",
			"B_AssaultPack_mcamo",
			"B_AssaultPack_rgr",
			"B_AssaultPack_sgg",
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
			"B_FieldPack_blk",
			"B_FieldPack_cbr",
			"B_FieldPack_ocamo",
			"B_FieldPack_oucamo",
			"B_HuntingBackpack",
			"B_Kitbag_cbr",
			"B_Kitbag_mcamo",
			"B_Kitbag_sgg",
			"B_OutdoorPack_blk",
			"B_OutdoorPack_blu",
			"B_OutdoorPack_tan",
			"B_TacticalPack_blk",
			"B_TacticalPack_mcamo",
			"B_TacticalPack_ocamo",
			"B_TacticalPack_oli",
			"B_TacticalPack_rgr",
			//Apex
			"B_Bergen_mcamo_F",
			"B_Bergen_dgtl_F",
			"B_Bergen_hex_F",
			"B_Bergen_tna_F",
			"B_AssaultPack_tna_F",
			"B_Carryall_ghex_F",
			"B_FieldPack_ghex_F",
			"B_ViperHarness_blk_F",
			"B_ViperHarness_ghex_F",
			"B_ViperHarness_hex_F",
			"B_ViperHarness_khk_F",
			"B_ViperHarness_oli_F",
			"B_ViperLightHarness_blk_F",
			"B_ViperLightHarness_ghex_F",
			"B_ViperLightHarness_hex_F",
			"B_ViperLightHarness_khk_F",
			"B_ViperLightHarness_oli_F"
		};
	};

	class Ammunition
	{
		name = "Ammunition";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"1Rnd_HE_Grenade_shell",
			"3Rnd_HE_Grenade_shell",
			"100Rnd_65x39_caseless_mag",
			"100Rnd_65x39_caseless_mag_Tracer",
			"10Rnd_127x54_Mag",
			"10Rnd_338_Mag",
			"10Rnd_762x54_Mag",
			"10Rnd_93x64_DMR_05_Mag",
			"11Rnd_45ACP_Mag",
			"130Rnd_338_Mag", //SPMG
			"150Rnd_762x54_Box",
			"150Rnd_762x54_Box_Tracer",
			"150Rnd_93x64_Mag", // NAVID
			"16Rnd_9x21_Mag",
			"200Rnd_65x39_cased_Box",
			"200Rnd_65x39_cased_Box_Tracer",
			"20Rnd_556x45_UW_mag",
			"20Rnd_762x51_Mag",
			"30Rnd_45ACP_Mag_SMG_01",
			"30Rnd_45ACP_Mag_SMG_01_tracer_green",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag_Tracer_Green",
			"30Rnd_556x45_Stanag_Tracer_Red",
			"30Rnd_556x45_Stanag_Tracer_Yellow",
			"30Rnd_65x39_caseless_green",
			"30Rnd_65x39_caseless_green_mag_Tracer",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag_Tracer",
			"30Rnd_9x21_Mag",
			"30Rnd_9x21_Yellow_Mag",
			"30Rnd_9x21_Green_Mag",
			"30Rnd_9x21_Red_Mag",
			"5Rnd_127x108_APDS_Mag",
			"5Rnd_127x108_Mag",
			"6Rnd_45ACP_Cylinder",
			"6Rnd_GreenSignal_F",
			"6Rnd_RedSignal_F",
			"7Rnd_408_Mag",
			"9Rnd_45ACP_Mag",
			"Exile_Magazine_30Rnd_762x39_AK",
			"Exile_Magazine_30Rnd_545x39_AK_Green",
			"Exile_Magazine_30Rnd_545x39_AK_Red",
			"Exile_Magazine_30Rnd_545x39_AK_White",
			"Exile_Magazine_30Rnd_545x39_AK_Yellow",
			"Exile_Magazine_45Rnd_545x39_RPK_Green",
			"Exile_Magazine_75Rnd_545x39_RPK_Green",
			"Exile_Magazine_20Rnd_762x51_DMR",
			"Exile_Magazine_20Rnd_762x51_DMR_Yellow",
			"Exile_Magazine_20Rnd_762x51_DMR_Red",
			"Exile_Magazine_20Rnd_762x51_DMR_Green",
			"Exile_Magazine_10Rnd_303",
			"Exile_Magazine_100Rnd_762x54_PK_Green",
			"Exile_Magazine_7Rnd_45ACP",
			"Exile_Magazine_8Rnd_9x18",
			"Exile_Magazine_30Rnd_545x39_AK",
			"Exile_Magazine_6Rnd_45ACP",
			"Exile_Magazine_5Rnd_22LR",
			"Exile_Magazine_10Rnd_762x54",
			"Exile_Magazine_10Rnd_9x39",
			"Exile_Magazine_20Rnd_9x39",
			"Exile_Magazine_20Rnd_9x39",
			"Exile_Magazine_8Rnd_74Pellets",
			"Exile_Magazine_8Rnd_74Slug",
			//Apex
			"30Rnd_9x21_Mag_SMG_02",
			"30Rnd_9x21_Mag_SMG_02_Tracer_Red",
			"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",
			"30Rnd_9x21_Mag_SMG_02_Tracer_Green",
			"30Rnd_580x42_Mag_F",
			"30Rnd_580x42_Mag_Tracer_F",
			"100Rnd_580x42_Mag_F",
			"100Rnd_580x42_Mag_Tracer_F",
			"20Rnd_650x39_Cased_Mag_F",
			"10Rnd_50BW_Mag_F",
			"150Rnd_556x45_Drum_Mag_F",
			"150Rnd_556x45_Drum_Mag_Tracer_F",
			"30Rnd_762x39_Mag_F",
			"30Rnd_762x39_Mag_Green_F",
			"30Rnd_762x39_Mag_Tracer_F",
			"30Rnd_762x39_Mag_Tracer_Green_F",
			"30Rnd_545x39_Mag_F",
			"30Rnd_545x39_Mag_Green_F",
			"30Rnd_545x39_Mag_Tracer_F",
			"30Rnd_545x39_Mag_Tracer_Green_F",
			"200Rnd_556x45_Box_F",
			"200Rnd_556x45_Box_Red_F",
			"200Rnd_556x45_Box_Tracer_F",
			"200Rnd_556x45_Box_Tracer_Red_F",
			"10Rnd_9x21_Mag"
		};
	};
	
	class NIARMSAMMO
	{
		name = "NIARMS Ammunition";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hlc_100rnd_556x45_EPR_G36",
			"hlc_100Rnd_762x51_B_M60E4",
			"hlc_100Rnd_762x51_Barrier_M60E4",
			"hlc_100Rnd_762x51_M_M60E4",
			"hlc_100Rnd_762x51_T_M60E4",
			"hlc_10rnd_12g_buck_S12",
			"hlc_10rnd_12g_slug_S12",
			"hlc_200rnd_556x45_B_SAW",
			"hlc_200rnd_556x45_M_SAW",
			"hlc_200rnd_556x45_T_SAW",
			"hlc_20Rnd_762x51_b_amt",
			"hlc_20Rnd_762x51_B_fal",
			"hlc_20rnd_762x51_b_G3",
			"hlc_20Rnd_762x51_B_M14",
			"hlc_20Rnd_762x51_barrier_fal",
			"hlc_20rnd_762x51_barrier_G3",
			"hlc_20Rnd_762x51_barrier_M14",
			"hlc_20Rnd_762x51_bball_amt",
			"hlc_20Rnd_762x51_mk316_amt",
			"hlc_20Rnd_762x51_mk316_fal",
			"hlc_20rnd_762x51_Mk316_G3",
			"hlc_20Rnd_762x51_mk316_M14",
			"hlc_20Rnd_762x51_S_fal",
			"hlc_20rnd_762x51_S_G3",
			"hlc_20Rnd_762x51_S_M14",
			"hlc_20Rnd_762x51_T_amt",
			"hlc_20Rnd_762x51_T_fal",
			"hlc_20rnd_762x51_T_G3",
			"hlc_20Rnd_762x51_T_M14",
			"hlc_24Rnd_75x55_ap_stgw",
			"hlc_24Rnd_75x55_B_stgw",
			"hlc_24Rnd_75x55_T_stgw",
			"hlc_25Rnd_9x19mm_JHP_AUG",
			"hlc_25Rnd_9x19mm_M882_AUG",
			"hlc_25Rnd_9x19mm_subsonic_AUG",
			"hlc_30Rnd_10mm_B_MP5",
			"hlc_30Rnd_10mm_JHP_MP5",
			"hlc_30Rnd_545x39_B_AK",
			"hlc_30Rnd_545x39_EP_ak",
			"hlc_30Rnd_545x39_S_AK",
			"hlc_30Rnd_545x39_t_ak",
			"hlc_30Rnd_556x45_B_AUG",
			"hlc_30rnd_556x45_b_HK33",
			"hlc_30rnd_556x45_EPR",
			"hlc_30rnd_556x45_EPR_G36",
			"hlc_30rnd_556x45_EPR_HK33",
			"hlc_30rnd_556x45_S",
			"hlc_30rnd_556x45_SOST",
			"hlc_30Rnd_556x45_SOST_AUG",
			"hlc_30rnd_556x45_SOST_G36",
			"hlc_30rnd_556x45_SOST_HK33",
			"hlc_30rnd_556x45_SPR",
			"hlc_30Rnd_556x45_SPR_AUG",
			"hlc_30rnd_556x45_SPR_G36",
			"hlc_30Rnd_556x45_T_AUG",
			"hlc_30rnd_556x45_t_HK33",
			"hlc_30rnd_556x45_Tracers_G36",
			"hlc_30Rnd_762x39_b_ak",
			"hlc_30rnd_762x39_s_ak",
			"hlc_30Rnd_762x39_t_ak",
			"hlc_30Rnd_9x19_B_MP5",
			"hlc_30Rnd_9x19_GD_MP5",
			"hlc_30Rnd_9x19_SD_MP5",
			"hlc_40Rnd_556x45_B_AUG",
			"hlc_40Rnd_556x45_SOST_AUG",
			"hlc_40Rnd_556x45_SPR_AUG",
			"hlc_45Rnd_545x39_t_rpk",
			"hlc_45Rnd_762x39_m_rpk",
			"hlc_45Rnd_762x39_t_rpk",
			"hlc_50rnd_556x45_EPR",
			"hlc_50Rnd_762x51_B_M14",
			"hlc_50rnd_762x51_M_FAL",
			"hlc_50rnd_762x51_M_G3",
			"hlc_50rnd_9x19_B_9mmar",
			"hlc_5rnd_3006_1903",
			"hlc_5rnd_300WM_AP_AWM",
			"hlc_5rnd_300WM_BTSP_AWM",
			"hlc_5rnd_300WM_FMJ_AWM",
			"hlc_5rnd_300WM_mk248_AWM",
			"hlc_5rnd_300WM_SBT_AWM",
			"hlc_60Rnd_545x39_t_rpk",
			"hlc_75Rnd_762x39_m_rpk",
			"29rnd_300blk_stanag",
			"29rnd_300blk_stanag_T",
			"29rnd_300blk_stanag_S",
			"hlc_10rnd_12g_buck_S12",
			"hlc_10rnd_12g_slug_S12"

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
			"3Rnd_SmokeYellow_Grenade_shell"
		};
	};	
	
	class NIARMSGL
	{
		name = "NIARMS GL";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hlc_GRD_blue",
			"hlc_GRD_green",
			"hlc_GRD_orange",
			"hlc_GRD_purple",
			"hlc_GRD_red",
			"hlc_GRD_white",
			"hlc_GRD_yellow",
			"hlc_VOG25_AK"
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
			"DemoCharge_Remote_Mag",
			"IEDLandBig_Remote_Mag",
			"IEDLandSmall_Remote_Mag",
			"IEDUrbanBig_Remote_Mag",
			"IEDUrbanSmall_Remote_Mag",
			"SatchelCharge_Remote_Mag",
			"SLAMDirectionalMine_Wire_Mag"
		};
	};
	
	class Launchers
	{
		name = "Launchers";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargothrow_ca.paa";
		items[] = 
		{
			//"launch_RPG7_F"
			"launch_RPG32_F",
			"launch_Titan_F",
			"launch_I_Titan_F",
			"launch_O_Titan_F",
			"launch_B_Titan_F",
			"launch_O_Titan_ghex_F",
			"launch_B_Titan_tna_F",
			"RPG32_F",
			"RPG32_ghex_F",
			"RPG32_HE_F",
			"RPG7_F",
			"Titan_AA"
		};
	};

	class Pistols 
	{
		name = "Pistols";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";
		items[] = 
		{
			"hgun_ACPC2_F",
			"hgun_P07_F",
			"hgun_Pistol_heavy_01_F",
			"hgun_Pistol_heavy_02_F",
			"hgun_Pistol_Signal_F",
			"hgun_Rook40_F",
			"Exile_Weapon_Colt1911",
			"Exile_Weapon_Makarov",
			"Exile_Weapon_Taurus",
			"Exile_Weapon_TaurusGold",
			//Apex
			"hgun_Pistol_01_F",
			"hgun_P07_khk_F",
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
			"SMG_05_F"
		};
	};
	
	class NIARMSSubMachineGuns 
	{
		name = "NIARMS Sub Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hlc_smg_mp510",
			"hlc_smg_mp5a2",
			"hlc_smg_mp5a3",
			"hlc_smg_mp5a4",
			"hlc_smg_mp5k_PDW",
			"hlc_smg_mp5n",
			"hlc_smg_9mmar",
			"hlc_smg_mp5sd5",
			"hlc_smg_mp5sd6",
			"hlc_rifle_augpara",
			"hlc_rifle_augpara_b",
			"hlc_rifle_augpara_t",
			"hlc_rifle_auga2para",
			"hlc_rifle_auga2para_b",
			"hlc_rifle_auga2para_t"
			
		};
	};

	class LightMachineGuns 
	{
		name = "Light Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"LMG_03_F",
			"arifle_MX_SW_Black_F",
			"arifle_MX_SW_F",
			"LMG_Mk200_F",
			"LMG_Zafir_F",
			"Exile_Weapon_RPK",
			"Exile_Weapon_PK",
			"Exile_Weapon_PKP",
			"MMG_01_hex_F",
			"MMG_01_tan_F",
			"MMG_02_black_F",
			"MMG_02_camo_F",
			"MMG_02_sand_F"
		};
	};
	
	class NIARMSLightMachineGuns 
	{
		name = "NIARMS Light Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hlc_lmg_M249E2",
			"hlc_lmg_m249para",
			"hlc_lmg_M60",
			"hlc_lmg_M60E4",
			"hlc_lmg_minimi",
			"hlc_lmg_minimi_railed",
			"hlc_lmg_minimipara",
			"hlc_lmg_mk48",
			"hlc_m249_pip1",
			"hlc_m249_pip2",
			"hlc_m249_pip3",
			"hlc_m249_pip4",
			"hlc_m249_squantoon"
			
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
			"arifle_MX_GL_Black_F",
			"arifle_MX_GL_F",
			"arifle_MXC_Black_F",
			"arifle_MXC_F",
			"arifle_SDAR_F",
			"arifle_TRG20_F",
			"arifle_TRG21_F",
			"arifle_TRG21_GL_F",
			"Exile_Weapon_AK107",
			"Exile_Weapon_AK107_GL",
			"Exile_Weapon_AK74",
			"Exile_Weapon_AK74_GL",
			"Exile_Weapon_AK47",
			"Exile_Weapon_AKS_Gold",
			//Apex
			"arifle_AK12_F",
			"arifle_AK12_GL_F",
			"arifle_AKM_F",
			"arifle_AKM_FL_F",
			"arifle_AKS_F",
			"arifle_ARX_blk_F",
			"arifle_ARX_ghex_F",
			"arifle_ARX_hex_F",
			"arifle_CTAR_blk_F",
			"arifle_CTAR_hex_F",
			"arifle_CTAR_ghex_F",
			"arifle_CTAR_GL_blk_F",
			"arifle_CTARS_blk_F",
			"arifle_CTARS_hex_F",
			"arifle_CTARS_ghex_F",
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
			"arifle_MX_khk_F",
			"arifle_MX_GL_khk_F",
			"arifle_MXC_khk_F",
			"arifle_MXM_khk_F"
		};
	};
	
	class NIARMSAUG
	{
		name = "Steyr AUG Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hlc_rifle_aug",
			"hlc_rifle_auga1_b",
			"hlc_rifle_auga1_t",
			"hlc_rifle_auga1carb",
			"hlc_rifle_auga1carb_b",
			"hlc_rifle_auga1carb_t",
			"hlc_rifle_auga2",
			"hlc_rifle_auga2_b",
			"hlc_rifle_auga2_t",
			"hlc_rifle_auga2carb",
			"hlc_rifle_auga2carb_b",
			"hlc_rifle_auga2carb_t",
			"hlc_rifle_auga2lsw",
			"hlc_rifle_auga2lsw_b",
			"hlc_rifle_auga2lsw_t",
			"hlc_rifle_auga3",
			"hlc_rifle_auga3_b",
			"hlc_rifle_auga3_bl",
			"hlc_rifle_auga3_gl",
			"hlc_rifle_auga3_gl_b",
			"hlc_rifle_auga3_gl_bl",
			"hlc_rifle_aughbar",
			"hlc_rifle_aughbar_b",
			"hlc_rifle_aughbar_t",
			"hlc_rifle_augsr",
			"hlc_rifle_augsr_b",
			"hlc_rifle_augsr_t",
			"hlc_rifle_augsrcarb",
			"hlc_rifle_augsrcarb_t",
			"hlc_rifle_augsrcarb_b",
			"hlc_rifle_augsrhbar",
			"hlc_rifle_augsrhbar_b",
			"hlc_rifle_augsrhbar_t"
		};
	};
	
	class NIARMSAK
	{
		name = "AK Style Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hlc_rifle_ak12",
			"hlc_rifle_ak12gl",
			"hlc_rifle_ak47",
			"hlc_rifle_ak74",
			"hlc_rifle_ak74_dirty",
			"hlc_rifle_ak74_dirty2",
			"hlc_rifle_ak74_mtk",
			"hlc_rifle_ak74m",
			"hlc_rifle_ak74m_gl",
			"hlc_rifle_ak74m_mtk",
			"hlc_rifle_akm",
			"hlc_rifle_akm_mtk",
			"hlc_rifle_akmgl",
			"hlc_rifle_aks74",
			"hlc_rifle_aks74_gl",
			"hlc_rifle_aks74_mtk",
			"hlc_rifle_aks74u",
			"hlc_rifle_aks74u_mtk",
			"hlc_rifle_aku12",
			"hlc_rifle_rk62",
			"hlc_rifle_aek971",
			"hlc_rifle_aek971_mtk",
			"hlc_rifle_aek971worn",
			"hlc_rifle_rpk",
			"hlc_rifle_RPK12",
			"hlc_rifle_rpk74n"
		};
	};
	
	class NIARMSHK
	{
		name = "Heckler & Koch Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hlc_rifle_g36a1",
			"hlc_rifle_g36a1ag36",
			"hlc_rifle_g36c",
			"hlc_rifle_g36cmlic",
			"hlc_rifle_g36ctac",
			"hlc_rifle_g36cv",
			"hlc_rifle_g36e1",
			"hlc_rifle_g36e1ag36",
			"hlc_rifle_g36ka1",
			"hlc_rifle_g36ke1",
			"hlc_rifle_g36kmlic",
			"hlc_rifle_g36ktac",
			"hlc_rifle_g36kv",
			"hlc_rifle_g36mliag36",
			"hlc_rifle_g36mlic",
			"hlc_rifle_g36tac",
			"hlc_rifle_g36v",
			"hlc_rifle_g36vag36",
			"hlc_rifle_mg36",
			"hlc_rifle_g3a3",
			"hlc_rifle_g3a3ris",
			"hlc_rifle_g3a3v",
			"hlc_rifle_g3ka4",
			"hlc_rifle_g3ka4_gl",
			"hlc_rifle_hk33a2",
			"hlc_rifle_hk33a2ris",
			"hlc_rifle_hk51",
			"hlc_rifle_hk53",
			"hlc_rifle_hk53ras"
		};
	};
	
	class NIARMSRIFLES
	{
		name = "NIARMS Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hlc_rifle_amt",
			"hlc_rifle_bcmjack",
			"hlc_rifle_bushmaster300",
			"hlc_rifle_c1a1",
			"hlc_rifle_colt727",
			"hlc_rifle_colt727_gl",
			"hlc_rifle_cqbr",
			"hlc_rifle_fal5000",
			"hlc_rifle_fal5000rail",
			"hlc_rifle_fal5061",
			"hlc_rifle_fal5061",
			"hlc_rifle_falosw",
			"hlc_rifle_honeybadger",
			"hlc_rifle_l1a1slr",
			"hlc_rifle_lar",
			"hlc_rifle_m4",
			"hlc_rifle_m4m203",
			"hlc_rifle_osw_gl",
			"hlc_rifle_ru556",
			"hlc_rifle_ru5562",
			"hlc_rifle_samr",
			"hlc_rifle_samr2",
			"hlc_rifle_sig5104",
			"hlc_rifle_slr",
			"hlc_rifle_slr107u",
			"hlc_rifle_slr107u_mtk",
			"hlc_rifle_slrchopmod",
			"hlc_rifle_stg58f",
			"hlc_rifle_stgw57",
			"hlc_rifle_stgw57_commando",
			"hlc_rifle_stgw57_ris",
			"hlc_rifle_vendimus"
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
			"srifle_DMR_01_F",
			"srifle_DMR_02_camo_F",
			"srifle_DMR_02_F",
			"srifle_DMR_02_sniper_F",
			"srifle_DMR_03_F",
			"srifle_DMR_03_khaki_F",
			"srifle_DMR_03_multicam_F",
			"srifle_DMR_03_tan_F",
			"srifle_DMR_03_woodland_F",
			"srifle_DMR_04_F",
			"srifle_DMR_04_Tan_F",
			"srifle_DMR_05_blk_F",
			"srifle_DMR_05_hex_F",
			"srifle_DMR_05_tan_f",
			"srifle_DMR_06_camo_F",
			"srifle_DMR_06_olive_F",
			"srifle_EBR_F",
			"srifle_GM6_camo_F",
			"srifle_GM6_F",
			"srifle_LRR_camo_F",
			"srifle_LRR_F",
			"Exile_Weapon_CZ550",
			"Exile_Weapon_SVD",
			"Exile_Weapon_SVDCamo",
			"Exile_Weapon_VSSVintorez",
			"Exile_Weapon_DMR",
			"Exile_Weapon_LeeEnfield",
			//Apex
			"srifle_LRR_tna_F",
			"srifle_GM6_ghex_F",
			"srifle_DMR_07_blk_F",
			"srifle_DMR_07_hex_F",
			"srifle_DMR_07_ghex_F"
		};
	};

class NIARMSSniperRifles
	{
		name = "NIARMS Sniper Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hlc_rifle_awcovert",
			"hlc_rifle_awcovert_BL",
			"hlc_rifle_awcovert_FDE",
			"hlc_rifle_awmagnum",
			"hlc_rifle_awmagnum_bl",
			"hlc_rifle_awmagnum_bl_ghillie",
			"hlc_rifle_awmagnum_fde",
			"hlc_rifle_awmagnum_fde_ghillie",
			"hlc_rifle_awmagnum_OD_ghillie",
			"hlc_rifle_m1903a1",
			"hlc_rifle_psg1",
			"hlc_rifle_psg1a1",
			"hlc_rifle_psg1a1_ris",
			"hlc_rifle_g3sg1",
			"hlc_rifle_m1903a1_unertl",
			"hlc_rifle_M1903A1OMR",
			"hlc_rifle_m14",
			"hlc_rifle_m14_bipod",
			"hlc_rifle_m14_rail",
			"hlc_rifle_m14dmr",
			"hlc_rifle_m14sopmod",
			"hlc_rifle_m21",
			"hlc_rifle_g3sg1"
		};
	};

	class Cars
	{
		name = "Cars";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Car_Kart_Black",
			"Exile_Bike_QuadBike_Red",
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
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",
			"Exile_Car_Offroad_Repair_Civillian",
			"Exile_Car_BTR40_Green",
			"Exile_Car_HMMWV_MEV_Green",
			"Exile_Car_HMMWV_UNA_Green",
			"Exile_Car_Strider",
			"Exile_Car_Hunter",
			"Exile_Car_Ifrit",
			//Apex cars
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

	class ArmedVehicles
	{
		name = "Armed Vehicles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Car_SUV_Armed_Black",
			"Exile_Car_Offroad_Armed_Guerilla01",
			"Exile_Car_BRDM2_HQ",
			"Exile_Car_BTR40_MG_Green",
			"Exile_Car_HMMWV_M134_Green",
			"Exile_Car_HMMWV_M2_Green",
			"B_MRAP_01_hmg_F",
			"O_MRAP_02_hmg_F",
			"I_MRAP_03_hmg_F",
			"B_lsv_01_armed_f",
			"O_LSV_02_armed_f"
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
			"B_Heli_Transport_01_F",
			"B_heli_Light_01_armed_F",
			"I_Heli_light_03_F"
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
			"Exile_Boat_SDV_CSAT",
			"Exile_Boat_SDV_Digital",
			"Exile_Boat_SDV_Grey",
			"Exile_Boat_WaterScooter",
			"Exile_Boat_RHIB"
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
			//Apex
			"Exile_Plane_Ceasar",
			"Exile_Plane_BlackfishInfantry",
			"Exile_Plane_BlackfishVehicle",
			"B_T_VTOL_01_vehicle_F",
			"B_T_VTOL_01_infantry_F"
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
			"V_RebreatherB",
			"V_RebreatherIA",
			"V_RebreatherIR",
			"U_I_Wetsuit",
			"U_O_Wetsuit",
			"U_B_Wetsuit"
		};
	};
};

class CfgTraders
{
	/**
	 * Weapons, scopes, silencers, ammo
	 */
	class Exile_Trader_Armory
	{
		name = "ARMORY";
		showWeaponFilter = 1;
		categories[] = 
		{
			"PointerAttachments",
			"BipodAttachments",
			"NIARMSMUZZLE",
			"MuzzleAttachments",
			"OpticAttachments",
			"NIARMSOPTICS",
			"Ammunition",
			"NIARMSAMMO",
			"AssaultRifles",
			"NIARMSRIFLES",
			"NIARMSHK",
			"NIARMSAUG",
			"NIARMSAK",
			"SniperRifles",
			"NIARMSSniperRifles",
			"LightMachineGuns",
			"NIARMSLightMachineGuns",
			"Pistols",
			"Shotguns",
			"SubMachineGuns",
			"NIARMSSubMachineGuns",
		};
	};

	/**
	 * Satchels, nades, UAVs, static MGs
	 */
	class Exile_Trader_SpecialOperations
	{
		name = "SPECIAL OPERATIONS";
		showWeaponFilter = 1; // for noob tubes
		categories[] = 
		{
			"Launchers",
			"Flares",
			"Smokes",
			"NIARMSGL",
			//"UAVs",
			"StaticMGs",
			"Explosives",
			"Navigation"
		};
	};

	/**
	 * Uniforms, vests, helmets, backpacks
	 */
	class Exile_Trader_Equipment
	{	
		name = "EQUIPMENT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Headgear",
			"Glasses",
			"Uniforms",
			"Vests",
			"Backpacks",
			"TRYKUniforms",
			"TRYKVests",
			"TRYKHeadgear",
			"TRYKNVGHeadgear",
			"TRYKBackpacks",
			"FirstAid"
		};
	};

	/**
	 * Cans, cans, cans
	 */
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

	/**
	 * Light bulbs, metal, etc.
	 */
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

	/**
	 * Sells cars and general vehicles
	 */
	class Exile_Trader_Vehicle
	{
		name = "VEHICLE";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Cars",
			"Trucks",
			"ArmedVehicles"
		};
	};

	/**
	 * Sells choppers and planes
	 */
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

	/**
	 * Sells ships and boats
	 */ 
	class Exile_Trader_Boat
	{
		name = "BOAT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Boats"
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
class CfgTrading 
{
	/*
	* This factor defines the difference between sales/purchase price of
	* items and vehicles. It is used if there is no sales price defined
	* in CfgExileArsenal. 
	*/
	sellPriceFactor = 0.4;
	
	rekeyPriceFactor = 0.1;

	class requiredRespect 
	{
		Level1 = 0;
		Level2 = 10000;
		Level3 = 25000;
		Level4 = 50000;
		Level5 = 75000;
		Level6 = 100000;
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
			{"Exile_Bike_QuadBike_Blue",		100, "White",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_WHITE_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVWHITE_CO.paa"};},
			{"Exile_Bike_QuadBike_Nato",		150, "NATO",		{"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","\A3\Soft_F\Quadbike_01\Data\Quadbike_01_wheel_co.paa"};},
			{"Exile_Bike_QuadBike_Csat",		150, "CSAT",		{"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_OPFOR_CO.paa","\A3\Soft_F\Quadbike_01\Data\Quadbike_01_wheel_OPFOR_CO.paa"};},
			{"Exile_Bike_QuadBike_Fia",			150, "FIA",			{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_INDP_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_INDP_CO.paa"};},
			{"Exile_Bike_QuadBike_Guerilla01",	150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_IG_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_IG_CO.paa"};},
			{"Exile_Bike_QuadBike_Guerilla02",	150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_INDP_Hunter_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_INDP_Hunter_CO.paa"};},
			{"Exile_Bike_QuadBike_Red",		100, "Black",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLACK_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLACK_CO.paa"};},
			{"Exile_Bike_QuadBike_Red",		100, "Hex",		{"\A3\Soft_f_Exp\Quadbike_01\data\Quadbike_01_ghex_CO.paa","\A3\Soft_f_Exp\Quadbike_01\data\Quadbike_01_wheel_ghex_CO.paa"};}
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
	// Prowler 
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
	
	class LSV_01_armed_base_f
	{
		skins[] = 
		{
			{"LSV_01_armed_f",				150, "Olive", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"};},
			{"LSV_01_armed_f",				150, "Dazzle", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_dazzle_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"};},
			{"LSV_01_armed_f",				150, "Sand", {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_sand_CO.paa"};}
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
	
	class LSV_02_armed_base_f
	{
		skins[] = 
		{
			{"LSV_02_armed_f",		150, "Arid", {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_arid_CO.paa"};},
			{"LSV_02_armed_f",		150, "Green Hex", {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_ghex_CO.paa"};}
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
