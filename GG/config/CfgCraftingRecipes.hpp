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
			{3, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"},
			{1, "Exile_Item_ConcreteDoorwayKit"}
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
			{2, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"},
			{1, "Exile_Item_ConcreteFloorKit"}
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
			{3, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"},
			{1, "Exile_Item_ConcreteFloorPortKit"}
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
			{4, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"},
			{1, "Exile_Item_ConcreteGateKit"}
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
			{1, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"},
			{1, "Exile_Item_ConcreteStairsKit"}
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
			{1, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"},
			{1, "Exile_Item_ConcreteSupportKit"}
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
			{2, "Exile_Item_WaterCanisterEmpty"},
			{1, "Exile_Item_FuelCanisterEmpty"},
			{1, "Exile_Item_ConcreteWallKit"}
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
	/*class CraftMetalHedgehog: Exile_AbstractCraftingRecipe
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
	};*/
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
	/*class CraftWireFenceKit: Exile_AbstractCraftingRecipe
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
	};*/
	class CraftWoodDoorWay: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Doorway";
		pictureItem = "Exile_Item_WoodDoorwayKit";
		requiredInteractionModelGroup = "WorkBench";
		tools[] = {"Exile_Item_CordlessScrewdriver" , "Exile_Item_Handsaw"};
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
		tools[] = {"Exile_Item_CordlessScrewdriver" , "Exile_Item_Handsaw"};
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodFloorKit"}
		};
		components[] = 
		{
			{4, "Exile_Item_WoodPlank"},
			{1, "Exile_Item_MetalScrews"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodFloorPort: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Floor Port";
		pictureItem = "Exile_Item_WoodFloorPortKit";
		requiredInteractionModelGroup = "WorkBench";
		tools[] = {"Exile_Item_CordlessScrewdriver" , "Exile_Item_Handsaw"};
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodFloorPortKit"}
		};
		components[] = 
		{
			{6, "Exile_Item_WoodPlank"},
			{1, "Exile_Item_MetalScrews"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodGate: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Gate";
		pictureItem = "Exile_Item_WoodGateKit";
		requiredInteractionModelGroup = "WorkBench";
		tools[] = {"Exile_Item_CordlessScrewdriver" , "Exile_Item_Handsaw"};
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodGateKit"}
		};
		components[] = 
		{
			{8, "Exile_Item_WoodPlank"},
			{1, "Exile_Item_MetalScrews"}
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
		tools[] = {"Exile_Item_CordlessScrewdriver" , "Exile_Item_Handsaw"};
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodStairsKit"}
		};
		components[] = 
		{
			{6, "Exile_Item_WoodPlank"},
			{1, "Exile_Item_MetalScrews"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodSupport: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Support";
		pictureItem = "Exile_Item_WoodSupportKit";
		requiredInteractionModelGroup = "WorkBench";
		tools[] = {"Exile_Item_CordlessScrewdriver" , "Exile_Item_Handsaw"};
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodSupportKit"}
		};
		components[] = 
		{
			{6, "Exile_Item_WoodPlank"},
			{1, "Exile_Item_MetalScrews"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodWall: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Wall";
		pictureItem = "Exile_Item_WoodWallKit";
		requiredInteractionModelGroup = "WorkBench";
		tools[] = {"Exile_Item_CordlessScrewdriver" , "Exile_Item_Handsaw"};
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodWallKit"}
		};
		components[] = 
		{
			{4, "Exile_Item_WoodPlank"},
			{1, "Exile_Item_MetalScrews"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodWallHalf: Exile_AbstractCraftingRecipe
	{
		name = "Craft 1/2 Wood Wall";
		pictureItem = "Exile_Item_WoodWallHalfKit";
		requiredInteractionModelGroup = "WorkBench";
		tools[] = {"Exile_Item_CordlessScrewdriver" , "Exile_Item_Handsaw"};
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodWallHalfKit"}
		};
		components[] = 
		{
			{2, "Exile_Item_WoodPlank"},
			{1, "Exile_Item_MetalScrews"}
		};
		category = "Wood Contructions";
	};
	class CraftWoodWindow: Exile_AbstractCraftingRecipe
	{
		name = "Craft Wood Window";
		pictureItem = "Exile_Item_WoodWindowKit";
		requiredInteractionModelGroup = "WorkBench";
		tools[] = {"Exile_Item_CordlessScrewdriver" , "Exile_Item_Handsaw"};
		returnedItems[] = 
		{
			{1, "Exile_Item_WoodWindowKit"}
		};
		components[] = 
		{
			{6, "Exile_Item_WoodPlank"},
			{1, "Exile_Item_MetalScrews"}
		};
		category = "Wood Contructions";
	};
	class CraftWorkBench: Exile_AbstractCraftingRecipe
	{
		name = "Craft Work Bench";
		pictureItem = "Exile_Item_WorkBenchKit";
		tools[] = {"Exile_Item_Handsaw"};
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
	/*class FillFuelCanister: Exile_AbstractCraftingRecipe
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
	};*/
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
		tools[] = {"Exile_Item_Foolbox", "Exile_Item_Screwdriver", "Exile_Item_Grinder", "Exile_Item_Pliers"};
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
	class GoldGun: Exile_AbstractCraftingRecipe
	{
	    name = "Craft Gold";
	    pictureItem = "Exile_Weapon_TaurusGold";
	    returnedItems[] =
	    {
	        {1, "Exile_weapon_taurusgold"}
	    };
	    components[] =
	    {
	        {1, "Exile_Item_Magazine01"},
	        {1, "Exile_Item_Magazine02"},
	        {1, "Exile_Item_Magazine03"},
			{1, "Exile_Item_Magazine04"}
	    };
	    category = "Tools & Items";
	};
	/*class ViperHelmet01: Exile_AbstractCraftingRecipe
	{
	    name = "Craft Viper Helmet (Hex)";
	    pictureItem = "H_HelmetO_ViperSP_hex_F";
		tools[] = {"Exile_Item_Foolbox", "Exile_Item_Screwdriver", "Exile_Item_Grinder", "Exile_Item_Pliers"};
	    returnedItems[] =
	    {
	        {1, "H_HelmetO_ViperSP_hex_F"}
	    };
	    components[] =
	    {
	        {4, "Exile_magazine_Battery"},
	        {2, "Exile_item_Laptop"},
	        {2, "Exile_item_thermalscannerpro"}
	    };
	    category = "Tools & Items";
		
	};
	class ViperHelmet02: Exile_AbstractCraftingRecipe
	{
	    name = "Craft Viper Helmet (Green Hex)";
	    pictureItem = "H_HelmetO_ViperSP_ghex_F";
		tools[] = {"Exile_Item_Foolbox", "Exile_Item_Screwdriver", "Exile_Item_Grinder", "Exile_Item_Pliers"};
	    returnedItems[] =
	    {
	        {1, "H_HelmetO_ViperSP_ghex_F"}
	    };
	    components[] =
	    {
	        {4, "Exile_magazine_Battery"},
	        {2, "Exile_item_Laptop"},
	        {2, "Exile_item_thermalscannerpro"}
	    };
	    category = "Tools & Items";
		
	};
	class ENVG01: Exile_AbstractCraftingRecipe
	{
	    name = "Craft ENVG (Black)";
	    pictureItem = "NVGogglesB_blk_F";
		tools[] = {"Exile_Item_Foolbox", "Exile_Item_Screwdriver", "Exile_Item_Grinder", "Exile_Item_Pliers"};
	    returnedItems[] =
	    {
	        {1, "NVGogglesB_blk_F"}
	    };
	    components[] =
	    {
	        {1, "Exile_item_mobilephone"},
	        {2, "Exile_item_Laptop"},
	        {1, "Exile_item_basecamerakit"},
			{2, "Exile_magazine_Battery"}
	    };
	    category = "Tools & Items";
		
	};
	class ENVG02: Exile_AbstractCraftingRecipe
	{
	    name = "Craft ENVG (Green)";
	    pictureItem = "NVGogglesB_grn_F";
		tools[] = {"Exile_Item_Foolbox", "Exile_Item_Screwdriver", "Exile_Item_Grinder", "Exile_Item_Pliers"};
	    returnedItems[] =
	    {
	        {1, "NVGogglesB_grn_F"}
	    };
	    components[] =
	    {
	        {1, "Exile_item_mobilephone"},
	        {2, "Exile_item_Laptop"},
	        {1, "Exile_item_basecamerakit"},
			{2, "Exile_magazine_Battery"}
	    };
	    category = "Tools & Items";
		
	};
	class ENVG03: Exile_AbstractCraftingRecipe
	{
	    name = "Craft ENVG (Grey)";
	    pictureItem = "NVGogglesB_gry_F";
		tools[] = {"Exile_Item_Foolbox", "Exile_Item_Screwdriver", "Exile_Item_Grinder", "Exile_Item_Pliers"};
	    returnedItems[] =
	    {
	        {1, "NVGogglesB_gry_F"}
	    };
	    components[] =
	    {
	        {1, "Exile_item_mobilephone"},
	        {2, "Exile_item_Laptop"},
	        {1, "Exile_item_basecamerakit"},
			{2, "Exile_magazine_Battery"}
	    };
	    category = "Tools & Items";
		
	};*/
};