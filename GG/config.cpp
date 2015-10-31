/**
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
	*/
	clanNameAlphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -!";
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
};

class CfgCraftingRecipes
{
	
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

class CookCatfood: Exile_AbstractCraftingRecipe
{
	name = "Cook Cat Food";
	pictureItem = "Exile_Item_Catfood_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_Catfood_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
		{1, "Exile_Item_Catfood"}
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
/*
class CraftWoodDrawBridge: Exile_AbstractCraftingRecipe
{
	name = "Craft Wood Draw-Bridge";
	pictureItem = "Exile_Item_WoodDrawBridgeKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodDrawBridgeKit"}
	};
	components[] = 
	{
		{4, "Exile_Item_WoodPlank"},
		{2, "Exile_Item_Rope"}
	};
};
*/
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
};
class CfgExileArsenal
{
	class Exile_Uniform_BambiOverall				{ quality = 1; price = 2; };

	///////////////////////////////////////////////////////////////////////////////
	// Civillian Clothing
	///////////////////////////////////////////////////////////////////////////////
	class U_C_Journalist 							{ quality = 1; price = 20; };
	class U_C_Poloshirt_blue 						{ quality = 1; price = 20; };
	class U_C_Poloshirt_burgundy 					{ quality = 1; price = 20; };
	class U_C_Poloshirt_salmon 						{ quality = 1; price = 20; };
	class U_C_Poloshirt_stripped 					{ quality = 1; price = 20; };
	class U_C_Poloshirt_tricolour 					{ quality = 1; price = 20; };
	class U_C_Poor_1 								{ quality = 1; price = 20; };
	class U_C_Poor_2 								{ quality = 1; price = 20; };
	class U_C_Poor_shorts_1 						{ quality = 1; price = 20; };
	class U_C_Scientist 							{ quality = 1; price = 20; };
	class U_OrestesBody 							{ quality = 3; price = 40; };
	class U_Rangemaster 							{ quality = 1; price = 40; };
	class U_NikosAgedBody 							{ quality = 3; price = 40; };
	class U_NikosBody 								{ quality = 3; price = 40; };
	class U_Competitor 								{ quality = 1; price = 40; };

	///////////////////////////////////////////////////////////////////////////////
	// Soldier Uniforms
	///////////////////////////////////////////////////////////////////////////////
	class U_B_CombatUniform_mcam 					{ quality = 2; price = 40; };
	class U_B_CombatUniform_mcam_tshirt 			{ quality = 1; price = 40; };
	class U_B_CombatUniform_mcam_vest 				{ quality = 1; price = 40; };
	class U_B_CombatUniform_mcam_worn 				{ quality = 1; price = 40; };
	class U_B_CTRG_1 								{ quality = 2; price = 40; };
	class U_B_CTRG_2 								{ quality = 2; price = 40; };
	class U_B_CTRG_3								{ quality = 2; price = 40; };
	class U_I_CombatUniform 						{ quality = 1; price = 40; };
	class U_I_CombatUniform_shortsleeve				{ quality = 1; price = 40; };
	class U_I_CombatUniform_tshirt					{ quality = 1; price = 40; };
	class U_I_OfficerUniform						{ quality = 1; price = 40; };
	class U_O_CombatUniform_ocamo 					{ quality = 1; price = 40; };
	class U_O_CombatUniform_oucamo 					{ quality = 1; price = 40; };
	class U_O_OfficerUniform_ocamo 					{ quality = 3; price = 80; };
	class U_B_SpecopsUniform_sgg 					{ quality = 3; price = 80; };
	class U_O_SpecopsUniform_blk 					{ quality = 3; price = 80; };
	class U_O_SpecopsUniform_ocamo 					{ quality = 3; price = 80; };
	class U_I_G_Story_Protagonist_F 				{ quality = 3; price = 100; };
	
	///////////////////////////////////////////////////////////////////////////////
	// TRYK's
	///////////////////////////////////////////////////////////////////////////////
	
	class TRYK_Shemagh_shade_N 						{ quality = 3; price = 100; };
	class TRYK_Shemagh_shade_G_N 					{ quality = 3; price = 100; };
	class TRYK_Shemagh_shade_WH_N 					{ quality = 3; price = 100; };
	class TRYK_TAC_EARMUFF_SHADE 					{ quality = 3; price = 100; };
	class TRYK_TAC_EARMUFF 							{ quality = 3; price = 100; };
	class TRYK_NOMIC_TAC_EARMUFF 					{ quality = 3; price = 100; };
	class TRYK_headset2 							{ quality = 3; price = 100; };
	class TRYK_Kio_Balaclava 						{ quality = 3; price = 100; };
	class TRYK_H_DELTAHELM_NV 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1_MSL_NV 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1LMSL_NV 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_MSL_NV 					{ quality = 3; price = 100; };
	class TRYK_US_ESS_Glasses_NV 					{ quality = 3; price = 100; };
	class TRYK_US_ESS_Glasses_TAN_NV 				{ quality = 3; price = 100; };
	class TRYK_Headphone_NV 						{ quality = 3; price = 100; };
	class TRYK_HRPIGEAR_NV 							{ quality = 3; price = 100; };
	class TRYK_balaclava_BLACK_NV 					{ quality = 3; price = 100; };
	class TRYK_balaclava_NV 						{ quality = 3; price = 100; };
	class TRYK_balaclava_BLACK_EAR_NV 				{ quality = 3; price = 100; };
	class TRYK_balaclava_EAR_NV 					{ quality = 3; price = 100; };
	class TRYK_Shemagh_TAN_NV 						{ quality = 3; price = 100; };
	class TRYK_Shemagh_MESH_NV 						{ quality = 3; price = 100; };
	class TRYK_Shemagh_G_NV 						{ quality = 3; price = 100; };
	class TRYK_Shemagh_WH_NV 						{ quality = 3; price = 100; };
	class TRYK_Shemagh_EAR_NV 						{ quality = 3; price = 100; };
	class TRYK_Shemagh_EAR_G_NV 					{ quality = 3; price = 100; };
	class TRYK_Shemagh_EAR_WH_NV 					{ quality = 3; price = 100; };
	class TRYK_ShemaghESSTAN_NV 					{ quality = 3; price = 100; };
	class TRYK_ShemaghESSOD_NV 						{ quality = 3; price = 100; };
	class TRYK_ShemaghESSWH_NV 						{ quality = 3; price = 100; };
	class TRYK_ESS_BLKTAN_NV 						{ quality = 3; price = 100; };
	class TRYK_ESS_BLKBLK_NV 						{ quality = 3; price = 100; };
	class TRYK_Headset_NV 							{ quality = 3; price = 100; };
	class TRYK_TAC_boonie_SET_NV 					{ quality = 3; price = 100; };
	class TRYK_TAC_SET_NV_TAN 						{ quality = 3; price = 100; };
	class TRYK_TAC_SET_NV_OD 						{ quality = 3; price = 100; };
	class TRYK_TAC_SET_NV_WH 						{ quality = 3; price = 100; };
	class TRYK_TAC_SET_NV_MESH 						{ quality = 3; price = 100; };
	class TRYK_TAC_SET_NV_TAN_2 					{ quality = 3; price = 100; };
	class TRYK_TAC_SET_NV_OD_2 						{ quality = 3; price = 100; };
	class TRYK_TAC_SET_NV_WH_2 						{ quality = 3; price = 100; };
	class TRYK_TAC_SET_NV_MESH_2 					{ quality = 3; price = 100; };
	class TRYK_G_Shades_Black_NV 					{ quality = 3; price = 100; };
	class TRYK_G_Shades_Blue_NV 					{ quality = 3; price = 100; };
	class TRYK_G_bala_ess_NV 						{ quality = 3; price = 100; };
	class TRYK_bandana_NV 							{ quality = 3; price = 100; };
	class TRYK_SPgearG_NV 							{ quality = 3; price = 100; };
	class TRYK_SPgear_PHC1_NV 						{ quality = 3; price = 100; };
	class TRYK_SPgear_PHC2_NV 						{ quality = 3; price = 100; };
	class TRYK_G_bala_wh_NV 						{ quality = 3; price = 100; };
	class TRYK_ESS_wh_NV 							{ quality = 3; price = 100; };
	class TRYK_U_B_OD_OD_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_OD_OD_R_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_TANTAN_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_TANTAN_R_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_BLKBLK_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_BLKBLK_R_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_GRYOCP_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_GRYOCP_R_CombatUniformTshirt 	{ quality = 3; price = 100; };
	class TRYK_U_B_TANOCP_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_TANOCP_R_CombatUniformTshirt 	{ quality = 3; price = 100; };
	class TRYK_U_B_BLKOCP_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_BLKOCP_R_CombatUniformTshirt 	{ quality = 3; price = 100; };
	class TRYK_U_B_BLKTAN_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_BLKTANR_CombatUniformTshirt 		{ quality = 3; price = 100; };
	class TRYK_U_B_ODTAN_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_ODTANR_CombatUniformTshirt 		{ quality = 3; price = 100; };
	class TRYK_U_B_GRTAN_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_GRTANR_CombatUniformTshirt 		{ quality = 3; price = 100; };
	class TRYK_U_B_wood_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_woodR_CombatUniformTshirt 		{ quality = 3; price = 100; };
	class TRYK_U_B_wood3c_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_wood3c_CombatUniformTshirt 		{ quality = 3; price = 100; };
	class TRYK_U_B_MARPAT_WOOD_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt 	{ quality = 3; price = 100; };
	class TRYK_U_B_WOOD_MARPAT_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt 	{ quality = 3; price = 100; };
	class TRYK_U_B_woodtan_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_woodtanR_CombatUniformTshirt 	{ quality = 3; price = 100; };
	class TRYK_U_B_JSDF_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_JSDF_CombatUniformTshirt 		{ quality = 3; price = 100; };
	class TRYK_U_B_3CD_Delta_BDU 					{ quality = 3; price = 100; };
	class TRYK_U_B_3CD_Delta_BDUTshirt 				{ quality = 3; price = 100; };
	class TRYK_U_B_3CD_Ranger_BDU 					{ quality = 3; price = 100; };
	class TRYK_U_B_3CD_Ranger_BDUTshirt 			{ quality = 3; price = 100; };
	class TRYK_U_B_3CD_BLK_BDUTshirt 				{ quality = 3; price = 100; };
	class TRYK_U_B_3CD_BLK_BDUTshirt2 				{ quality = 3; price = 100; };
	class TRYK_U_B_ACU 								{ quality = 3; price = 100; };
	class TRYK_U_B_ACUTshirt 						{ quality = 3; price = 100; };
	class TRYK_U_B_MARPAT_Wood 						{ quality = 3; price = 100; };
	class TRYK_U_B_MARPAT_Wood_Tshirt 				{ quality = 3; price = 100; };
	class TRYK_U_B_MARPAT_Desert 					{ quality = 3; price = 100; };
	class TRYK_U_B_MARPAT_Desert_Tshirt 			{ quality = 3; price = 100; };
	class TRYK_U_B_MARPAT_Desert2 					{ quality = 3; price = 100; };
	class TRYK_U_B_MARPAT_Desert2_Tshirt 			{ quality = 3; price = 100; };
	class TRYK_U_B_3c 								{ quality = 3; price = 100; };
	class TRYK_U_B_3cr 								{ quality = 3; price = 100; };
	class TRYK_U_B_Sage_Tshirt 						{ quality = 3; price = 100; };
	class TRYK_U_B_BLK3CD 							{ quality = 3; price = 100; };
	class TRYK_U_B_BLK3CD_Tshirt 					{ quality = 3; price = 100; };
	class TRYK_U_B_BLK 								{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_Tshirt 						{ quality = 3; price = 100; };
	class TRYK_U_B_BLKTAN 							{ quality = 3; price = 100; };
	class TRYK_U_B_BLKTAN_Tshirt 					{ quality = 3; price = 100; };
	class TRYK_U_B_ODTAN 							{ quality = 3; price = 100; };
	class TRYK_U_B_ODTAN_Tshirt 					{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_OD 							{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_OD_Tshirt 					{ quality = 3; price = 100; };
	class TRYK_U_B_C01_Tsirt 						{ quality = 3; price = 100; };
	class TRYK_U_B_C02_Tsirt 						{ quality = 3; price = 100; };
	class TRYK_U_B_OD_BLK 							{ quality = 3; price = 100; };
	class TRYK_U_B_OD_BLK_2 						{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_TAN_1 						{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_TAN_2 						{ quality = 3; price = 100; };
	class TRYK_V_PlateCarrier_JSDF 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_AOR1 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_AOR2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_coyo 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_Brown 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_CBR 						{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_khk 						{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_rgr 						{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_green 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_tan 						{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_Delta 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_Ranger 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_AOR1_2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_AOR2_2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_coyo2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_Brown2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_cbr2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_khk2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_rgr2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_green2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_tan2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_Delta2 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_Ranger2 					{ quality = 3; price = 100; };
	class TRYK_V_PlateCarrier_blk 					{ quality = 3; price = 100; };
	class TRYK_V_PlateCarrier_coyo 					{ quality = 3; price = 100; };
	class TRYK_V_PlateCarrier_wood 					{ quality = 3; price = 100; };
	class TRYK_V_PlateCarrier_ACU 					{ quality = 3; price = 100; };
	class TRYK_V_TacVest_coyo 						{ quality = 3; price = 100; };
	class TRYK_HRP_UCP 								{ quality = 3; price = 100; };
	class TRYK_HRP_USMC 							{ quality = 3; price = 100; };
	class TRYK_HRP_khk 								{ quality = 3; price = 100; };
	class TRYK_Hrp_vest_ucp 						{ quality = 3; price = 100; };
	class TRYK_Hrp_vest_od 							{ quality = 3; price = 100; };
	class TRYK_U_B_wh_tan_Rollup_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_wh_OD_Rollup_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_wh_blk_Rollup_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_tan_Rollup_CombatUniform 	{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_OD_Rollup_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_UCP_GRY_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_UCP_GRY_R_CombatUniform 	{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_UCP_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_UCP_R_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_OCP_c_BLK_CombatUniform 	{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_OCP_BLK_c_R_CombatUniform 	{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_OCP_BLK_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_OCP_BLK_R_CombatUniform 	{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_OCPD_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_OCPD_R_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_OCP_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_NATO_OCP_R_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_AOR1_Rollup_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_AOR2_Rollup_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_MTP_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_MTP_R_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_MTP_BLK_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_MTP_BLK_R_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_Woodland 						{ quality = 3; price = 100; };
	class TRYK_U_B_Woodland_Tshirt 					{ quality = 3; price = 100; };
	class TRYK_U_B_WDL_GRY_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_WDL_GRY_R_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_ARO1_GR_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_ARO1_GR_R_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_ARO1_GRY_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_ARO1_GRY_R_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_ARO1_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_ARO1R_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_ARO1_BLK_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_ARO1_BLK_R_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_ARO1_CBR_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_ARO1_CBR_R_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_ARO2_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_ARO2R_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_AOR2_BLK_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_AOR2_BLK_R_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_AOR2_OD_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_AOR2_OD_R_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_AOR2_GRY_CombatUniform 			{ quality = 3; price = 100; };
	class TRYK_U_B_AOR2_GRY_R_CombatUniform 		{ quality = 3; price = 100; };
	class TRYK_U_B_Snow_CombatUniform 				{ quality = 3; price = 100; };
	class TRYK_U_B_Snowt 							{ quality = 3; price = 100; };
	class TRYK_U_B_Denim_T_WH 						{ quality = 3; price = 100; };
	class TRYK_U_B_Denim_T_BK 						{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_T_WH 						{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_T_BK 						{ quality = 3; price = 100; };
	class TRYK_U_B_RED_T_BR 						{ quality = 3; price = 100; };
	class TRYK_U_B_Denim_T_BG_WH 					{ quality = 3; price = 100; };
	class TRYK_U_B_Denim_T_BG_BK 					{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_T_BG_WH 						{ quality = 3; price = 100; };
	class TRYK_U_B_BLK_T_BG_BK 						{ quality = 3; price = 100; };
	class TRYK_U_B_RED_T_BG_BR 						{ quality = 3; price = 100; };
	class TRYK_U_B_fleece 							{ quality = 3; price = 100; };
	class TRYK_U_B_fleece_UCP 						{ quality = 3; price = 100; };
	class TRYK_U_B_UCP_PCUs 						{ quality = 3; price = 100; };
	class TRYK_U_B_GRY_PCUs 						{ quality = 3; price = 100; };
	class TRYK_U_B_Wood_PCUs 						{ quality = 3; price = 100; };
	class TRYK_U_B_PCUs 							{ quality = 3; price = 100; };
	class TRYK_U_B_UCP_PCUs_R 						{ quality = 3; price = 100; };
	class TRYK_U_B_GRY_PCUs_R 						{ quality = 3; price = 100; };
	class TRYK_U_B_Wood_PCUs_R 						{ quality = 3; price = 100; };
	class TRYK_U_B_PCUs_R 							{ quality = 3; price = 100; };
	class TRYK_U_B_PCUGs 							{ quality = 3; price = 100; };
	class TRYK_U_B_PCUODs 							{ quality = 3; price = 100; };
	class TRYK_U_B_PCUGs_gry 						{ quality = 3; price = 100; };
	class TRYK_U_B_PCUGs_BLK 						{ quality = 3; price = 100; };
	class TRYK_U_B_PCUGs_OD 						{ quality = 3; price = 100; };
	class TRYK_U_B_PCUGs_gry_R 						{ quality = 3; price = 100; };
	class TRYK_U_B_PCUGs_BLK_R 						{ quality = 3; price = 100; };
	class TRYK_U_B_PCUGs_OD_R 						{ quality = 3; price = 100; };
	class TRYK_U_Bts_GRYGRY_PCUs 					{ quality = 3; price = 100; };
	class TRYK_U_Bts_UCP_PCUs 						{ quality = 3; price = 100; };
	class TRYK_U_Bts_Wood_PCUs 						{ quality = 3; price = 100; };
	class TRYK_U_Bts_PCUs 							{ quality = 3; price = 100; };
	class TRYK_U_pad_j 								{ quality = 3; price = 100; };
	class TRYK_U_pad_j_blk 							{ quality = 3; price = 100; };
	class TRYK_U_pad_hood_Cl 						{ quality = 3; price = 100; };
	class TRYK_U_pad_hood_Cl_blk 					{ quality = 3; price = 100; };
	class TRYK_U_pad_hood_tan 						{ quality = 3; price = 100; };
	class TRYK_U_pad_hood_Blk 						{ quality = 3; price = 100; };
	class TRYK_U_pad_hood_CSATBlk 					{ quality = 3; price = 100; };
	class TRYK_U_pad_hood_Blod 						{ quality = 3; price = 100; };
	class TRYK_U_pad_hood_odBK 						{ quality = 3; price = 100; };
	class TRYK_U_pad_hood_BKT2 						{ quality = 3; price = 100; };
	class TRYK_hoodie_Blk 							{ quality = 3; price = 100; };
	class TRYK_hoodie_FR 							{ quality = 3; price = 100; };
	class TRYK_hoodie_Wood 							{ quality = 3; price = 100; };
	class TRYK_hoodie_3c 							{ quality = 3; price = 100; };
	class TRYK_T_camo_tan 							{ quality = 3; price = 100; };
	class TRYK_T_camo_3c 							{ quality = 3; price = 100; };
	class TRYK_T_camo_Wood 							{ quality = 3; price = 100; };
	class TRYK_T_camo_wood_marpat 					{ quality = 3; price = 100; };
	class TRYK_T_camo_Desert_marpat 				{ quality = 3; price = 100; };
	class TRYK_T_camo_3c_BG 						{ quality = 3; price = 100; };
	class TRYK_T_camo_Wood_BG 						{ quality = 3; price = 100; };
	class TRYK_T_camo_wood_marpat_BG 				{ quality = 3; price = 100; };
	class TRYK_T_camo_desert_marpat_BG 				{ quality = 3; price = 100; };
	class TRYK_T_PAD 								{ quality = 3; price = 100; };
	class TRYK_T_OD_PAD 							{ quality = 3; price = 100; };
	class TRYK_T_TAN_PAD 							{ quality = 3; price = 100; };
	class TRYK_T_BLK_PAD 							{ quality = 3; price = 100; };
	class TRYK_T_T2_PAD 							{ quality = 3; price = 100; };
	class TRYK_T_CSAT_PAD 							{ quality = 3; price = 100; };
	class TRYK_U_nohoodPcu_gry 						{ quality = 3; price = 100; };
	class TRYK_U_hood_nc 							{ quality = 3; price = 100; };
	class TRYK_U_hood_mc 							{ quality = 3; price = 100; };
	class TRYK_U_denim_hood_blk 					{ quality = 3; price = 100; };
	class TRYK_U_denim_hood_mc 						{ quality = 3; price = 100; };
	class TRYK_U_denim_hood_3c 						{ quality = 3; price = 100; };
	class TRYK_U_denim_hood_nc 						{ quality = 3; price = 100; };
	class TRYK_U_denim_jersey_blu 					{ quality = 3; price = 100; };
	class TRYK_U_denim_jersey_blk 					{ quality = 3; price = 100; };
	class TRYK_shirts_PAD 							{ quality = 3; price = 100; };
	class TRYK_shirts_OD_PAD 						{ quality = 3; price = 100; };
	class TRYK_shirts_TAN_PAD 						{ quality = 3; price = 100; };
	class TRYK_shirts_BLK_PAD 						{ quality = 3; price = 100; };
	class TRYK_shirts_PAD_BK 						{ quality = 3; price = 100; };
	class TRYK_shirts_OD_PAD_BK 					{ quality = 3; price = 100; };
	class TRYK_shirts_TAN_PAD_BK 					{ quality = 3; price = 100; };
	class TRYK_shirts_BLK_PAD_BK 					{ quality = 3; price = 100; };
	class TRYK_shirts_PAD_BLW 						{ quality = 3; price = 100; };
	class TRYK_shirts_OD_PAD_BLW 					{ quality = 3; price = 100; };
	class TRYK_shirts_TAN_PAD_BLW 					{ quality = 3; price = 100; };
	class TRYK_shirts_BLK_PAD_BLW 					{ quality = 3; price = 100; };
	class TRYK_shirts_PAD_YEL 						{ quality = 3; price = 100; };
	class TRYK_shirts_OD_PAD_YEL 					{ quality = 3; price = 100; };
	class TRYK_shirts_TAN_PAD_YEL 					{ quality = 3; price = 100; };
	class TRYK_shirts_BLK_PAD_YEL 					{ quality = 3; price = 100; };
	class TRYK_shirts_PAD_RED2 						{ quality = 3; price = 100; };
	class TRYK_shirts_OD_PAD_RED2 					{ quality = 3; price = 100; };
	class TRYK_shirts_TAN_PAD_RED2 					{ quality = 3; price = 100; };
	class TRYK_shirts_BLK_PAD_RED2 					{ quality = 3; price = 100; };
	class TRYK_shirts_PAD_BLU3 						{ quality = 3; price = 100; };
	class TRYK_shirts_OD_PAD_BLU3 					{ quality = 3; price = 100; };
	class TRYK_shirts_TAN_PAD_BLU3 					{ quality = 3; price = 100; };
	class TRYK_shirts_BLK_PAD_BLU3 					{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_R 						{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_BL 						{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_BK 						{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_WH 						{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_BWH 					{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_RED2 					{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_WHB 					{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_ylb 					{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_od 						{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_R_Sleeve 				{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_BL_Sleeve 				{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_BK_Sleeve 				{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_WH_Sleeve 				{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_BWH_Sleeve 				{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_RED2_Sleeve 			{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_WHB_Sleeve 				{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_ylb_Sleeve 				{ quality = 3; price = 100; };
	class TRYK_shirts_DENIM_od_Sleeve 				{ quality = 3; price = 100; };
	class TRYK_shirts_PAD_BL 						{ quality = 3; price = 100; };
	class TRYK_shirts_OD_PAD_BL 					{ quality = 3; price = 100; };
	class TRYK_shirts_TAN_PAD_BL 					{ quality = 3; price = 100; };
	class TRYK_shirts_BLK_PAD_BL 					{ quality = 3; price = 100; };
	class TRYK_U_taki_wh 							{ quality = 3; price = 100; };
	class TRYK_U_taki_COY 							{ quality = 3; price = 100; };
	class TRYK_U_taki_BL 							{ quality = 3; price = 100; };
	class TRYK_U_taki_BLK 							{ quality = 3; price = 100; };
	class TRYK_U_Bts_PCUGs 							{ quality = 3; price = 100; };
	class TRYK_U_Bts_PCUODs 						{ quality = 3; price = 100; };
	class TRYK_U_taki_G_WH 							{ quality = 3; price = 100; };
	class TRYK_U_taki_G_COY 						{ quality = 3; price = 100; };
	class TRYK_U_taki_G_BL 							{ quality = 3; price = 100; };
	class TRYK_U_taki_G_BLK 						{ quality = 3; price = 100; };
	class TRYK_U_B_PCUHs 							{ quality = 3; price = 100; };
	class TRYK_U_B_PCUGHs 							{ quality = 3; price = 100; };
	class TRYK_U_B_PCUODHs 							{ quality = 3; price = 100; };
	class TRYK_B_USMC_R 							{ quality = 3; price = 100; };
	class TRYK_B_USMC_R_ROLL 						{ quality = 3; price = 100; };
	class TRYK_ZARATAKI 							{ quality = 3; price = 100; };
	class TRYK_ZARATAKI2 							{ quality = 3; price = 100; };
	class TRYK_ZARATAKI3 							{ quality = 3; price = 100; };
	class TRYK_B_TRYK_UCP_T 						{ quality = 3; price = 100; };
	class TRYK_B_TRYK_3C_T 							{ quality = 3; price = 100; };
	class TRYK_B_TRYK_MTP_T 						{ quality = 3; price = 100; };
	class TRYK_B_TRYK_OCP_T 						{ quality = 3; price = 100; };
	class TRYK_B_TRYK_OCP_D_T 						{ quality = 3; price = 100; };
	class TRYK_DMARPAT_T 							{ quality = 3; price = 100; };
	class TRYK_C_AOR2_T 							{ quality = 3; price = 100; };
	class TRYK_U_B_Sage_T 							{ quality = 3; price = 100; };
	class TRYK_U_B_Wood_T 							{ quality = 3; price = 100; };
	class TRYK_U_B_BLTAN_T 							{ quality = 3; price = 100; };
	class TRYK_U_B_BLOD_T 							{ quality = 3; price = 100; };
	class TRYK_OVERALL_flesh 						{ quality = 3; price = 100; };
	class TRYK_OVERALL_nok_flesh 					{ quality = 3; price = 100; };
	class TRYK_OVERALL_SAGE_BLKboots 				{ quality = 3; price = 100; };
	class TRYK_OVERALL_SAGE_BLKboots_nk_blk 		{ quality = 3; price = 100; };
	class TRYK_OVERALL_SAGE_BLKboots_nk 			{ quality = 3; price = 100; };
	class TRYK_OVERALL_SAGE_BLKboots_nk_blk2 		{ quality = 3; price = 100; };
	class TRYK_OVERALL_SAGE 						{ quality = 3; price = 100; };
	class TRYK_SUITS_BLK_F 							{ quality = 3; price = 100; };
	class TRYK_SUITS_BR_F 							{ quality = 3; price = 100; };
	class TRYK_H_Helmet_JSDF 						{ quality = 3; price = 100; };
	class TRYK_H_Helmet_CC 							{ quality = 3; price = 100; };
	class TRYK_H_Helmet_WOOD 						{ quality = 3; price = 100; };
	class TRYK_H_Helmet_ACU 						{ quality = 3; price = 100; };
	class TRYK_H_Helmet_MARPAT_Wood 				{ quality = 3; price = 100; };
	class TRYK_H_Helmet_MARPAT_Desert 				{ quality = 3; price = 100; };
	class TRYK_H_Helmet_MARPAT_Desert2 				{ quality = 3; price = 100; };
	class TRYK_H_Helmet_3C 							{ quality = 3; price = 100; };
	class TRYK_H_Booniehat_JSDF 					{ quality = 3; price = 100; };
	class TRYK_H_Booniehat_3CD 						{ quality = 3; price = 100; };
	class TRYK_H_Booniehat_CC 						{ quality = 3; price = 100; };
	class TRYK_H_Booniehat_WOOD 					{ quality = 3; price = 100; };
	class TRYK_H_Booniehat_MARPAT_WOOD 				{ quality = 3; price = 100; };
	class TRYK_H_Booniehat_MARPAT_Desert 			{ quality = 3; price = 100; };
	class TRYK_H_Booniehat_AOR1 					{ quality = 3; price = 100; };
	class TRYK_H_Booniehat_AOR2 					{ quality = 3; price = 100; };
	class TRYK_H_PASGT_BLK 							{ quality = 3; price = 100; };
	class TRYK_H_PASGT_OD 							{ quality = 3; price = 100; };
	class TRYK_H_PASGT_COYO 						{ quality = 3; price = 100; };
	class TRYK_H_PASGT_TAN 							{ quality = 3; price = 100; };
	class TRYK_H_Helmet_Snow 						{ quality = 3; price = 100; };
	class TRYK_H_WH 								{ quality = 3; price = 100; };
	class TRYK_H_GR 								{ quality = 3; price = 100; };
	class TRYK_H_AOR1 								{ quality = 3; price = 100; };
	class TRYK_H_AOR2 								{ quality = 3; price = 100; };
	class TRYK_H_EARMUFF 							{ quality = 3; price = 100; };
	class TRYK_H_TACEARMUFF_H 						{ quality = 3; price = 100; };
	class TRYK_H_Bandana_H 							{ quality = 3; price = 100; };
	class TRYK_H_Bandana_wig 						{ quality = 3; price = 100; };
	class TRYK_H_Bandana_wig_g 						{ quality = 3; price = 100; };
	class TRYK_H_wig 								{ quality = 3; price = 100; };
	class TRYK_H_headset2 							{ quality = 3; price = 100; };
	class TRYK_H_ghillie_over 						{ quality = 3; price = 100; };
	class TRYK_H_ghillie_top 						{ quality = 3; price = 100; };
	class TRYK_H_ghillie_top_headless 				{ quality = 3; price = 100; };
	class TRYK_H_ghillie_over_green 				{ quality = 3; price = 100; };
	class TRYK_H_ghillie_top_green 					{ quality = 3; price = 100; };
	class TRYK_H_ghillie_top_headless_green 		{ quality = 3; price = 100; };
	class TRYK_H_woolhat 							{ quality = 3; price = 100; };
	class TRYK_H_woolhat_CW 						{ quality = 3; price = 100; };
	class TRYK_H_woolhat_WH 						{ quality = 3; price = 100; };
	class TRYK_H_woolhat_br 						{ quality = 3; price = 100; };
	class TRYK_H_woolhat_cu 						{ quality = 3; price = 100; };
	class TRYK_H_woolhat_tan 						{ quality = 3; price = 100; };
	class TRYK_H_headsetcap 						{ quality = 3; price = 100; };
	class TRYK_H_headsetcap_blk 					{ quality = 3; price = 100; };
	class TRYK_H_headsetcap_od 						{ quality = 3; price = 100; };
	class TRYK_H_pakol 								{ quality = 3; price = 100; };
	class TRYK_H_pakol2 							{ quality = 3; price = 100; };
	class TRYK_H_LHS_HEL_G 							{ quality = 3; price = 100; };
	class TRYK_H_ghillie_top_headless3 				{ quality = 3; price = 100; };
	class TRYK_V_harnes_blk_L 						{ quality = 3; price = 100; };
	class TRYK_V_harnes_od_L 						{ quality = 3; price = 100; };
	class TRYK_V_harnes_TAN_L 						{ quality = 3; price = 100; };
	class TRYK_V_PlateCarrier_blk_L 				{ quality = 3; price = 100; };
	class TRYK_V_PlateCarrier_wood_L 				{ quality = 3; price = 100; };
	class TRYK_V_PlateCarrier_ACU_L 				{ quality = 3; price = 100; };
	class TRYK_V_PlateCarrier_coyo_L 				{ quality = 3; price = 100; };
	class TRYK_V_ChestRig_L 						{ quality = 3; price = 100; };
	class TRYK_V_ChestRig 							{ quality = 3; price = 100; };
	class TRYK_V_Bulletproof 						{ quality = 3; price = 100; };
	class TRYK_V_Bulletproof_BLK 					{ quality = 3; price = 100; };
	class TRYK_V_Bulletproof_BL 					{ quality = 3; price = 100; };
	class TRYK_V_IOTV_BLK 							{ quality = 3; price = 100; };
	class TRYK_V_tacSVD_BK 							{ quality = 3; price = 100; };
	class TRYK_V_tacSVD_OD 							{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TL 						{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TBL 					{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TCL 					{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TL2 					{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TBL2 					{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TCL2 					{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_T 						{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TB 						{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_T2 						{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TB2 					{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_T3 						{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TB3 					{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_T4 						{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TB4 					{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_T5 						{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TB5 					{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TBL3_BK 				{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TBL3_OD 				{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_TBL3_TN 				{ quality = 3; price = 100; };
	class TRYK_V_tacv1M_BK 							{ quality = 3; price = 100; };
	class TRYK_V_tacv1MLC_BK 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1 								{ quality = 3; price = 100; };
	class TRYK_V_tacv1_CY 							{ quality = 3; price = 100; };
	class TRYK_V_tacv1_BK 							{ quality = 3; price = 100; };
	class TRYK_V_tacv1_P_BK 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1_SHERIFF_BK 					{ quality = 3; price = 100; };
	class TRYK_V_tacv1_FBI_BK 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1LP_BK 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1LSRF_BK 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_BK 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_CY 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_OD 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_FBI_BK 					{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_SRF_BK 					{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_SRF_OD 					{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_P_BK 						{ quality = 3; price = 100; };
	class TRYK_V_PlateCarrier_POLICE 				{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_HRT_B 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_HRT_OD 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_HRT2_B 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_HRT2_OD 					{ quality = 3; price = 100; };
	class TRYK_V_ArmorVest_Winter 					{ quality = 3; price = 100; };
	class TRYK_V_Sheriff_BA_OD 						{ quality = 3; price = 100; };
	class TRYK_V_tacv10_BK 							{ quality = 3; price = 100; };
	class TRYK_V_tacv10_OD 							{ quality = 3; price = 100; };
	class TRYK_V_tacv10_TN 							{ quality = 3; price = 100; };
	class TRYK_V_tacv10LC_BK 						{ quality = 3; price = 100; };
	class TRYK_V_tacv10LC_OD 						{ quality = 3; price = 100; };
	class TRYK_V_tacv10LC_TN 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1L_BK 							{ quality = 3; price = 100; };
	class TRYK_V_tacv1L_OD 							{ quality = 3; price = 100; };
	class TRYK_V_tacv1L_CY 							{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_FBI2_BK 					{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_SRF2_BK 					{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_SRF2_OD 					{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_P2_BK 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1_MSL_BK 						{ quality = 3; price = 100; };
	class TRYK_V_tacv1LC_MSL_BK 					{ quality = 3; price = 100; };
	class TRYK_V_tacv1LMSL_BK 						{ quality = 3; price = 100; };
	class TRYK_U_B_PCUHsW 							{ quality = 3; price = 100; };
	class TRYK_U_B_PCUHsW2 							{ quality = 3; price = 100; };
	class TRYK_U_B_PCUHsW3 							{ quality = 3; price = 100; };
	class TRYK_U_B_PCUHsW3nh 						{ quality = 3; price = 100; };
	class TRYK_U_B_PCUHsW4 							{ quality = 3; price = 100; };
	class TRYK_U_B_PCUHsW5 							{ quality = 3; price = 100; };
	class TRYK_U_B_PCUHsW6 							{ quality = 3; price = 100; };
	class TRYK_LOC_AK_chestrig_OD 					{ quality = 3; price = 100; };
	class TRYK_LOC_AK_chestrig_TAN 					{ quality = 3; price = 100; };
	class TRYK_H_Helmet_Winter 						{ quality = 3; price = 100; };
	class TRYK_H_Helmet_Winter_2 					{ quality = 3; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Guerilla Uniforms
	///////////////////////////////////////////////////////////////////////////////
	class U_C_HunterBody_grn						{ quality = 1; price = 40; };
	class U_IG_Guerilla1_1							{ quality = 1; price = 40; };
	class U_IG_Guerilla2_1							{ quality = 2; price = 60; };
	class U_IG_Guerilla2_2							{ quality = 1; price = 40; };
	class U_IG_Guerilla2_3							{ quality = 1; price = 40; };
	class U_IG_Guerilla3_1							{ quality = 1; price = 40; };
	class U_BG_Guerilla2_1							{ quality = 1; price = 40; };
	class U_IG_Guerilla3_2							{ quality = 1; price = 40; };
	class U_BG_Guerrilla_6_1						{ quality = 2; price = 60; };
	class U_BG_Guerilla1_1							{ quality = 1; price = 40; };
	class U_BG_Guerilla2_2							{ quality = 1; price = 40; };
	class U_BG_Guerilla2_3							{ quality = 1; price = 40; };
	class U_BG_Guerilla3_1							{ quality = 1; price = 40; };
	class U_BG_leader								{ quality = 1; price = 40; };
	class U_IG_leader								{ quality = 1; price = 40; };
	class U_I_G_resistanceLeader_F					{ quality = 3; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Ghillie Suits
	///////////////////////////////////////////////////////////////////////////////
	class U_B_FullGhillie_ard						{ quality = 3; price = 150; };
	class U_B_FullGhillie_lsh						{ quality = 3; price = 150; };
	class U_B_FullGhillie_sard						{ quality = 3; price = 150; };
	class U_B_GhillieSuit							{ quality = 2; price = 100; };
	class U_I_FullGhillie_ard						{ quality = 3; price = 150; };
	class U_I_FullGhillie_lsh						{ quality = 3; price = 150; };
	class U_I_FullGhillie_sard						{ quality = 3; price = 150; };
	class U_I_GhillieSuit							{ quality = 2; price = 100; };
	class U_O_FullGhillie_ard						{ quality = 3; price = 150; };
	class U_O_FullGhillie_lsh						{ quality = 3; price = 150; };
	class U_O_FullGhillie_sard						{ quality = 3; price = 150; };
	class U_O_GhillieSuit							{ quality = 2; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Wet Suits
	///////////////////////////////////////////////////////////////////////////////
	class U_I_Wetsuit								{ quality = 3; price = 80; };
	class U_O_Wetsuit								{ quality = 3; price = 80; };
	class U_B_Wetsuit								{ quality = 3; price = 80; };
	class U_B_survival_uniform						{ quality = 3; price = 80; };

	///////////////////////////////////////////////////////////////////////////////
	// Bandolliers
	///////////////////////////////////////////////////////////////////////////////
	class V_BandollierB_blk							{ quality = 1; price = 30; };
	class V_BandollierB_cbr							{ quality = 1; price = 30; };
	class V_BandollierB_khk							{ quality = 1; price = 30; };
	class V_BandollierB_oli							{ quality = 1; price = 30; };
	class V_BandollierB_rgr							{ quality = 1; price = 30; };

	///////////////////////////////////////////////////////////////////////////////
	// Chestrigs
	///////////////////////////////////////////////////////////////////////////////
	class V_Chestrig_blk 							{ quality = 1; price = 20; };
	class V_Chestrig_khk 							{ quality = 1; price = 20; };
	class V_Chestrig_oli 							{ quality = 1; price = 20; };
	class V_Chestrig_rgr 							{ quality = 1; price = 20; };

	///////////////////////////////////////////////////////////////////////////////
	// Vests
	///////////////////////////////////////////////////////////////////////////////
	class V_Press_F									{ quality = 1; price = 10; };
	class V_Rangemaster_belt						{ quality = 1; price = 6; };
	class V_TacVest_blk								{ quality = 2; price = 50; };
	class V_TacVest_blk_POLICE						{ quality = 3; price = 300; };
	class V_TacVest_brn								{ quality = 2; price = 50; };
	class V_TacVest_camo							{ quality = 2; price = 50; };
	class V_TacVest_khk								{ quality = 2; price = 50; };
	class V_TacVest_oli								{ quality = 2; price = 50; };
	class V_TacVestCamo_khk							{ quality = 2; price = 50; };
	class V_TacVestIR_blk							{ quality = 2; price = 50; };
	class V_I_G_resistanceLeader_F					{ quality = 2; price = 50; };
	
	class rhs_6sh92								    { quality = 2; price = 50; };
	class rhs_6sh92_radio							{ quality = 2; price = 50; };
	class rhs_6sh92_vog								{ quality = 2; price = 50; };
	class rhs_6sh92_vog_headset						{ quality = 2; price = 50; };
	class rhs_6sh92_headset							{ quality = 2; price = 50; };
	class rhs_6sh92_digi							{ quality = 2; price = 50; };
	class rhs_6sh92_digi_radio					    { quality = 2; price = 50; };
	class rhs_6sh92_digi_vog						{ quality = 2; price = 50; };
	class rhs_6sh92_digi_vog_headset				{ quality = 2; price = 50; };
	class rhs_6sh92_digi_headset					{ quality = 2; price = 50; };
	class rhs_6b23								    { quality = 2; price = 50; };
	class rhs_6b23_crew							    { quality = 2; price = 50; };
	class rhs_6b23_crewofficer						{ quality = 2; price = 50; };
	class rhs_6b23_engineer					        { quality = 2; price = 50; };
	class rhs_6b23_medic							{ quality = 2; price = 50; };
	class rhs_6b23_rifleman							{ quality = 2; price = 50; };
	class rhs_6b23_sniper							{ quality = 2; price = 50; };
	class rhs_6b23_6sh92							{ quality = 2; price = 50; };
	class rhs_6b23_6sh92_radio						{ quality = 2; price = 50; };
	class rhs_6b23_6sh92_vog						{ quality = 2; price = 50; };
	class rhs_6b23_6sh92_vog_headset				{ quality = 2; price = 50; };
	class rhs_6b23_6sh92_headset					{ quality = 2; price = 50; };
	class rhs_6b23_6sh92_headset_mapcase			{ quality = 2; price = 50; };
	class rhs_6b23_digi								{ quality = 2; price = 50; };
	class rhs_6b23_digi_crew						{ quality = 2; price = 50; };
	class rhs_6b23_digi_crewofficer					{ quality = 2; price = 50; };
	class rhs_6b23_digi_engineer					{ quality = 2; price = 50; };
	class rhs_6b23_digi_medic					    { quality = 2; price = 50; };
	class rhs_6b23_digi_rifleman					{ quality = 2; price = 50; };
	class rhs_6b23_digi_sniper						{ quality = 2; price = 50; };
	class rhs_6b23_digi_6sh92						{ quality = 2; price = 50; };
	class rhs_6b23_digi_6sh92_radio					{ quality = 2; price = 50; };
	class rhs_6b23_digi_6sh92_vog				    { quality = 2; price = 50; };
	class rhs_6b23_digi_6sh92_vog_headset			{ quality = 2; price = 50; };
	class rhs_6b23_digi_6sh92_headset				{ quality = 2; price = 50; };
	class rhs_6b23_digi_6sh92_headset_mapcase		{ quality = 2; price = 50; };
	class rhs_6b23_ML							    { quality = 2; price = 50; };
	class rhs_6b23_ML_crew							{ quality = 2; price = 50; };
	class rhs_6b23_ML_crewofficer					{ quality = 2; price = 50; };
	class rhs_6b23_ML_engineer						{ quality = 2; price = 50; };
	class rhs_6b23_ML_medic							{ quality = 2; price = 50; };
	class rhs_6b23_ML_rifleman					    { quality = 2; price = 50; };
	class rhs_6b23_ML_sniper						{ quality = 2; price = 50; };
	class rhs_6b23_ML_6sh92							{ quality = 2; price = 50; };
	class rhs_6b23_ML_6sh92_radio					{ quality = 2; price = 50; };
	class rhs_6b23_ML_6sh92_vog						{ quality = 2; price = 50; };
	class rhs_6b23_ML_6sh92_vog_headset				{ quality = 2; price = 50; };
	class rhs_6b23_ML_6sh92_headset					{ quality = 2; price = 50; };
	class rhs_6b23_ML_6sh92_headset_mapcase			{ quality = 2; price = 50; };
	class rhs_6sh46								    { quality = 2; price = 50; };
	class rhs_vest_commander						{ quality = 2; price = 50; };
	class rhs_vydra_3m								{ quality = 2; price = 50; };
	class rhsusf_iotv_ucp							{ quality = 2; price = 50; };
	class rhsusf_iotv_ucp_grenadier					{ quality = 2; price = 50; };
	class rhsusf_iotv_ucp_medic						{ quality = 2; price = 50; };
	class rhsusf_iotv_ucp_repair					{ quality = 2; price = 50; };
	class rhsusf_iotv_ucp_rifleman					{ quality = 2; price = 50; };
	class rhsusf_iotv_ucp_SAW						{ quality = 2; price = 50; };
	class rhsusf_iotv_ucp_squadleader				{ quality = 2; price = 50; };
	class rhsusf_iotv_ucp_teamleader				{ quality = 2; price = 50; };
	class rhsusf_iotv_ocp							{ quality = 2; price = 50; };
	class rhsusf_iotv_ocp_grenadier					{ quality = 2; price = 50; };
	class rhsusf_iotv_ocp_medic					    { quality = 2; price = 50; };
	class rhsusf_iotv_ocp_repair					{ quality = 2; price = 50; };
	class rhsusf_iotv_ocp_rifleman					{ quality = 2; price = 50; };
	class rhsusf_iotv_ocp_SAW						{ quality = 2; price = 50; };
	class rhsusf_iotv_ocp_squadleader				{ quality = 2; price = 50; };
	class rhsusf_iotv_ocp_teamleader				{ quality = 2; price = 50; };
	class rhsusf_spc					            { quality = 2; price = 50; };

	///////////////////////////////////////////////////////////////////////////////
	// Harnesses
	///////////////////////////////////////////////////////////////////////////////
	class V_HarnessO_brn							{ quality = 1; price = 40; };
	class V_HarnessO_gry							{ quality = 1; price = 40; };
	class V_HarnessOGL_brn							{ quality = 1; price = 30; };
	class V_HarnessOGL_gry							{ quality = 1; price = 30; };
	class V_HarnessOSpec_brn						{ quality = 1; price = 40; };
	class V_HarnessOSpec_gry						{ quality = 1; price = 40; };

	///////////////////////////////////////////////////////////////////////////////
	// Plate Carriers
	///////////////////////////////////////////////////////////////////////////////
	class V_PlateCarrier1_blk 						{ quality = 1; price = 80; };
	class V_PlateCarrier1_rgr 						{ quality = 1; price = 80; };
	class V_PlateCarrier2_rgr 						{ quality = 2; price = 100; };
	class V_PlateCarrier3_rgr 						{ quality = 2; price = 100; };
	class V_PlateCarrierGL_blk 						{ quality = 3; price = 500; };
	class V_PlateCarrierGL_mtp 						{ quality = 3; price = 500; };
	class V_PlateCarrierGL_rgr 						{ quality = 3; price = 500; };
	class V_PlateCarrierH_CTRG 						{ quality = 2; price = 100; };
	class V_PlateCarrierIA1_dgtl 					{ quality = 2; price = 80; };
	class V_PlateCarrierIA2_dgtl 					{ quality = 2; price = 100; };
	class V_PlateCarrierIAGL_dgtl 					{ quality = 3; price = 400; };
	class V_PlateCarrierIAGL_oli 					{ quality = 3; price = 400; };
	class V_PlateCarrierL_CTRG 						{ quality = 2; price = 100; };
	class V_PlateCarrierSpec_blk 					{ quality = 3; price = 200; };
	class V_PlateCarrierSpec_mtp 					{ quality = 3; price = 200; };
	class V_PlateCarrierSpec_rgr 					{ quality = 3; price = 200; };

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
	// Military Caps
	///////////////////////////////////////////////////////////////////////////////
	class H_MilCap_blue 							{ quality = 1; price = 8; };
	class H_MilCap_dgtl 							{ quality = 1; price = 8; };
	class H_MilCap_mcamo 							{ quality = 1; price = 8; };
	class H_MilCap_ocamo 							{ quality = 1; price = 8; };
	class H_MilCap_oucamo 							{ quality = 1; price = 8; };
	class H_MilCap_rucamo 							{ quality = 1; price = 8; };

	///////////////////////////////////////////////////////////////////////////////
	// Beanies
	///////////////////////////////////////////////////////////////////////////////
	class H_Watchcap_blk 							{ quality = 1; price = 6; };
	class H_Watchcap_camo 							{ quality = 1; price = 6; };
	class H_Watchcap_khk 							{ quality = 1; price = 6; };
	class H_Watchcap_sgg 							{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Bandannas
	///////////////////////////////////////////////////////////////////////////////
	class H_Bandanna_camo							{ quality = 1; price = 4; };
	class H_Bandanna_cbr							{ quality = 1; price = 4; };
	class H_Bandanna_gry							{ quality = 1; price = 4; };
	class H_Bandanna_khk							{ quality = 1; price = 4; };
	class H_Bandanna_khk_hs							{ quality = 1; price = 4; };
	class H_Bandanna_mcamo							{ quality = 1; price = 4; };
	class H_Bandanna_sgg							{ quality = 1; price = 4; };
	class H_Bandanna_surfer							{ quality = 1; price = 4; };

	///////////////////////////////////////////////////////////////////////////////
	// Boonie Hats
	///////////////////////////////////////////////////////////////////////////////
	class H_Booniehat_dgtl							{ quality = 1; price = 6; };
	class H_Booniehat_dirty							{ quality = 1; price = 6; };
	class H_Booniehat_grn							{ quality = 1; price = 6; };
	class H_Booniehat_indp							{ quality = 1; price = 6; };
	class H_Booniehat_khk							{ quality = 1; price = 6; };
	class H_Booniehat_khk_hs						{ quality = 1; price = 6; };
	class H_Booniehat_mcamo							{ quality = 1; price = 6; };
	class H_Booniehat_tan							{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Hats
	///////////////////////////////////////////////////////////////////////////////
	class H_Hat_blue								{ quality = 1; price = 6; };
	class H_Hat_brown								{ quality = 1; price = 6; };
	class H_Hat_camo								{ quality = 1; price = 6; };
	class H_Hat_checker								{ quality = 1; price = 6; };
	class H_Hat_grey								{ quality = 1; price = 6; };
	class H_Hat_tan									{ quality = 1; price = 6; };
	class H_StrawHat								{ quality = 1; price = 6; };
	class H_StrawHat_dark							{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Berets
	///////////////////////////////////////////////////////////////////////////////
	class H_Beret_02								{ quality = 1; price = 6; };
	class H_Beret_blk								{ quality = 1; price = 6; };
	class H_Beret_blk_POLICE						{ quality = 1; price = 6; };
	class H_Beret_brn_SF							{ quality = 1; price = 6; };
	class H_Beret_Colonel							{ quality = 3; price = 8; };
	class H_Beret_grn								{ quality = 1; price = 6; };
	class H_Beret_grn_SF							{ quality = 1; price = 6; };
	class H_Beret_ocamo								{ quality = 1; price = 6; };
	class H_Beret_red								{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Shemags
	///////////////////////////////////////////////////////////////////////////////
	class H_Shemag_khk								{ quality = 1; price = 10; };
	class H_Shemag_olive							{ quality = 1; price = 10; };
	class H_Shemag_olive_hs							{ quality = 1; price = 10; };
	class H_Shemag_tan								{ quality = 1; price = 10; };
	class H_ShemagOpen_khk							{ quality = 1; price = 10; };
	class H_ShemagOpen_tan							{ quality = 1; price = 10; };
	class H_TurbanO_blk								{ quality = 1; price = 10; };

	///////////////////////////////////////////////////////////////////////////////
	// Light Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetB_light							{ quality = 1; price = 20; };
	class H_HelmetB_light_black						{ quality = 1; price = 20; };
	class H_HelmetB_light_desert					{ quality = 1; price = 20; };
	class H_HelmetB_light_grass						{ quality = 1; price = 20; };
	class H_HelmetB_light_sand						{ quality = 1; price = 20; };
	class H_HelmetB_light_snakeskin					{ quality = 1; price = 20; };

	///////////////////////////////////////////////////////////////////////////////
	// Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetIA								{ quality = 1; price = 40; };
	class H_HelmetIA_camo							{ quality = 1; price = 40; };
	class H_HelmetIA_net							{ quality = 1; price = 40; };
	class H_HelmetB									{ quality = 2; price = 60; };
	class H_HelmetB_black							{ quality = 2; price = 60; };
	class H_HelmetB_camo							{ quality = 3; price = 80; }; // This one is awesome!
	class H_HelmetB_desert							{ quality = 2; price = 60; };
	class H_HelmetB_grass							{ quality = 2; price = 60; };
	class H_HelmetB_paint							{ quality = 2; price = 60; };
	class H_HelmetB_plain_blk						{ quality = 2; price = 60; };
	class H_HelmetB_sand							{ quality = 2; price = 60; };
	class H_HelmetB_snakeskin						{ quality = 2; price = 60; };
	class rhs_6b27m_digi							{ quality = 1; price = 40; };
	class rhs_6b27m_digi_ess						{ quality = 1; price = 40; };
	class rhs_6b27m_digi_bala						{ quality = 2; price = 60; };
	class rhs_6b27m_digi_ess_bala					{ quality = 2; price = 60; };

	class rhs_6b27m									{ quality = 1; price = 40; };
	class rhs_6b27m_ess								{ quality = 1; price = 40; };
	class rhs_6b27m_bala							{ quality = 2; price = 60; };
	class rhs_6b27m_ess_bala						{ quality = 2; price = 60; };

	class rhs_6b27m_ml								{ quality = 1; price = 40; };
	class rhs_6b27m_ml_ess							{ quality = 1; price = 40; };
	class rhs_6b27m_ml_bala							{ quality = 2; price = 60; };
	class rhs_6b27m_ML_ess_bala						{ quality = 2; price = 60; };

	///////////////////////////////////////////////////////////////////////////////
	// Spec Ops Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetSpecB								{ quality = 2; price = 80; };
	class H_HelmetSpecB_blk							{ quality = 2; price = 80; };
	class H_HelmetSpecB_paint1						{ quality = 2; price = 80; };
	class H_HelmetSpecB_paint2						{ quality = 2; price = 80; };

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
	class acc_flashlight 							{ quality = 1; price = 4; };
	class acc_pointer_IR 							{ quality = 1; price = 10; };
	
	// CUP Pointer Attachments

	class CUP_acc_ANPEQ_15 							{ quality = 1; price = 10; };
	class CUP_acc_ANPEQ_2 							{ quality = 1; price = 10; };
	class CUP_acc_ANPEQ_2_camo 						{ quality = 1; price = 10; };
	class CUP_acc_ANPEQ_2_desert 					{ quality = 1; price = 10; };
	class CUP_acc_ANPEQ_2_grey 						{ quality = 1; price = 10; };
	class CUP_acc_Flashlight 						{ quality = 1; price = 10; };
	class CUP_acc_Flashlight_wdl 					{ quality = 1; price = 4; };
	class CUP_acc_Flashlight_desert 				{ quality = 1; price = 4; };
	class CUP_acc_XM8_light_module 					{ quality = 1; price = 4; };
	class CUP_acc_Glock17_Flashlight 				{ quality = 1; price = 4; };
	///////////////////////////////////////////////////////////////////////////////
	// RHS
	///////////////////////////////////////////////////////////////////////////////
	class rhsusf_acc_anpeq15side					{ quality = 2; price = 50; };
	class rhsusf_acc_anpeq15						{ quality = 2; price = 50; };
	class rhsusf_acc_anpeq15A						{ quality = 1; price = 50; };
	class rhsusf_acc_anpeq15_light					{ quality = 2; price = 50; };
	

	///////////////////////////////////////////////////////////////////////////////
	// Bitpod Attachments
	///////////////////////////////////////////////////////////////////////////////
	class bipod_01_F_blk	 						{ quality = 1; price = 10; };
	class bipod_01_F_mtp	 						{ quality = 1; price = 10; };
	class bipod_01_F_snd	 						{ quality = 1; price = 10; };
	class bipod_02_F_blk	 						{ quality = 1; price = 10; };
	class bipod_02_F_hex	 						{ quality = 1; price = 10; };
	class bipod_02_F_tan	 						{ quality = 1; price = 10; };
	class bipod_03_F_blk	 						{ quality = 1; price = 10; };
	class bipod_03_F_oli	 						{ quality = 1; price = 10; };
	///////////////////////////////////////////////////////////////////////////////
	// RHS
	///////////////////////////////////////////////////////////////////////////////
	class rhsusf_acc_harris_bipod					{ quality = 3; price = 30; };

	///////////////////////////////////////////////////////////////////////////////
	// Muzzle Attachments
	///////////////////////////////////////////////////////////////////////////////
	class muzzle_snds_338_black 					{ quality = 2; price = 50; };
	class muzzle_snds_338_green 					{ quality = 2; price = 50; };
	class muzzle_snds_338_sand 						{ quality = 2; price = 50; };
	class muzzle_snds_93mmg 						{ quality = 2; price = 50; };
	class muzzle_snds_93mmg_tan 					{ quality = 2; price = 50; };
	class muzzle_snds_acp 							{ quality = 1; price = 10; };
	class muzzle_snds_B 							{ quality = 1; price = 20; };
	class muzzle_snds_H 							{ quality = 2; price = 20; };
	class muzzle_snds_H_MG 							{ quality = 2; price = 20; };
	class muzzle_snds_H_SW 							{ quality = 2; price = 20; };
	class muzzle_snds_L 							{ quality = 1; price = 10; };

	class muzzle_snds_M 							{ quality = 1; price = 10; };
	
	// CUP Muzzle Attachments

	class CUP_muzzle_snds_AWM 						{ quality = 1; price = 10; };
	class CUP_muzzle_PBS4 							{ quality = 1; price = 10; };
	class CUP_muzzle_PB6P9 							{ quality = 1; price = 10; };
	class CUP_muzzle_Bizon 							{ quality = 1; price = 10; };
	class CUP_muzzle_snds_G36_black 				{ quality = 2; price = 50; };
	class CUP_muzzle_snds_G36_desert 				{ quality = 2; price = 50; };
	class CUP_muzzle_snds_L85 						{ quality = 2; price = 50; };
	class CUP_muzzle_snds_M14 						{ quality = 3; price = 80; };
	class CUP_muzzle_snds_M16_camo 					{ quality = 2; price = 20; };
	class CUP_muzzle_snds_M16 						{ quality = 2; price = 20; };
	class CUP_muzzle_snds_M9 						{ quality = 1; price = 20; };
	class CUP_muzzle_snds_MicroUzi 					{ quality = 1; price = 20; };
	class CUP_muzzle_snds_XM8 						{ quality = 2; price = 50; };
	class CUP_muzzle_snds_SCAR_L 					{ quality = 2; price = 50; };
	class CUP_muzzle_snds_SCAR_H 					{ quality = 2; price = 50; };
	
	///////////////////////////////////////////////////////////////////////////////
	// RHS
	///////////////////////////////////////////////////////////////////////////////
//US	
	class rhsusf_acc_SF3P556						{ quality = 2; price = 40; };
	class rhsusf_acc_SFMB556						{ quality = 2; price = 40; };
	class rhsusf_acc_nt4_black						{ quality = 3; price = 80; };
	class rhsusf_acc_nt4_tan						{ quality = 3; price = 80; };
	class rhsusf_acc_rotex5_grey					{ quality = 3; price = 80; };
	class rhsusf_acc_rotex5_tan						{ quality = 3; price = 80; };
	class rhsusf_acc_SR25S							{ quality = 3; price = 90; };
	class rhsusf_acc_M2010S							{ quality = 3; price = 100; };
	
//Russian
	
	class rhs_acc_ak5								{ quality = 1; price = 40; };
	class rhs_acc_dtk								{ quality = 1; price = 40; };
	class rhs_acc_dtk1								{ quality = 1; price = 40; };
	class rhs_acc_dtk3								{ quality = 1; price = 40; };
	class rhs_acc_dtk4screws						{ quality = 2; price = 80; };
	class rhs_acc_dtk4long							{ quality = 2; price = 80; };
	class rhs_acc_dtk4short							{ quality = 2; price = 80; };
	class rhs_acc_tgpa								{ quality = 2; price = 80; };
	class rhs_acc_dtk1l								{ quality = 1; price = 40; };
	class rhs_acc_pbs1								{ quality = 2; price = 90; };

	///////////////////////////////////////////////////////////////////////////////
	// UAVS
	///////////////////////////////////////////////////////////////////////////////
	class I_UavTerminal								{ quality = 3; price = 750; };
	class I_UAV_01_backpack_F						{ quality = 3; price = 3000; };

	///////////////////////////////////////////////////////////////////////////////
	// Static MGs
	///////////////////////////////////////////////////////////////////////////////
	class O_HMG_01_weapon_F 						{ quality = 3; price = 5000; };
	class O_HMG_01_support_F 						{ quality = 3; price = 1000; };
	// Does not seem to work with HMG01, only the lower version does
	//class O_HMG_01_support_high_F 					{ quality = 3; price = 5000; };

	///////////////////////////////////////////////////////////////////////////////
	// Optic Attachments
	///////////////////////////////////////////////////////////////////////////////
	class optic_Aco									{ quality = 1; price = 70; };
	class optic_ACO_grn								{ quality = 1; price = 70; };
	class optic_ACO_grn_smg							{ quality = 1; price = 70; };
	class optic_Aco_smg								{ quality = 1; price = 70; };
	class optic_AMS									{ quality = 3; price = 300; };
	class optic_AMS_khk								{ quality = 3; price = 300; };
	class optic_AMS_snd								{ quality = 3; price = 300; };
	class optic_Arco								{ quality = 1; price = 100; };
	class optic_DMS									{ quality = 1; price = 150; };
	class optic_Hamr								{ quality = 3; price = 200; };
	class optic_Holosight							{ quality = 1; price = 50; };
	class optic_Holosight_smg						{ quality = 1; price = 50; };
	class optic_KHS_blk								{ quality = 3; price = 300; };
	class optic_KHS_hex								{ quality = 3; price = 300; };
	class optic_KHS_old								{ quality = 3; price = 300; };
	class optic_KHS_tan								{ quality = 3; price = 300; };
	class optic_LRPS								{ quality = 2; price = 300; };
	class optic_MRCO								{ quality = 1; price = 100; };
	class optic_MRD									{ quality = 1; price = 10; };


	class optic_SOS									{ quality = 2; price = 200; };


	class optic_Yorris								{ quality = 1; price = 10; };
	
	// CUP Optic Attachments

	class CUP_optic_Kobra 							{ quality = 1; price = 70; };
	class CUP_optic_HoloBlack 						{ quality = 1; price = 70; };
	class CUP_optic_HoloDesert 						{ quality = 1; price = 70; };
	class CUP_optic_Eotech533 						{ quality = 1; price = 70; };
	class CUP_optic_Eotech533Grey 					{ quality = 1; price = 70; };
	class CUP_optic_CompM4 							{ quality = 1; price = 70; };
	class CUP_optic_CompM2_Black 					{ quality = 1; price = 70; };
	class CUP_optic_CompM2_Woodland 				{ quality = 1; price = 70; };
	class CUP_optic_CompM2_Woodland2 				{ quality = 1; price = 70; };
	class CUP_optic_CompM2_Desert 					{ quality = 1; price = 70; };
	class CUP_optic_TrijiconRx01_desert 			{ quality = 1; price = 70; };
	class CUP_optic_TrijiconRx01_black 				{ quality = 1; price = 70; };
	class CUP_optic_SB_11_4x20_PM 					{ quality = 1; price = 150; };
	class CUP_optic_ZDDot 							{ quality = 1; price = 150; };
	class CUP_optic_MRad 							{ quality = 1; price = 150; };
	class CUP_optic_RCO 							{ quality = 1; price = 150; };
	class CUP_optic_RCO_desert 						{ quality = 1; price = 150; };
	class CUP_optic_ACOG 							{ quality = 1; price = 150; };
	class CUP_optic_SUSAT 							{ quality = 1; price = 150; };
	class CUP_optic_ElcanM145 						{ quality = 1; price = 150; };
	class CUP_optic_ELCAN_SpecterDR 				{ quality = 1; price = 150; };
	//class CUP_optic_CWS 							{ quality = 1; price = 150; };
	class CUP_optic_PSO_1 							{ quality = 1; price = 150; };
	class CUP_optic_PSO_3 							{ quality = 1; price = 150; };

	class CUP_optic_SB_3_12x50_PMII 				{ quality = 2; price = 300; };
	class CUP_optic_LeupoldMk4 						{ quality = 3; price = 300; };
	class CUP_optic_Leupold_VX3 					{ quality = 3; price = 300; };
	class CUP_optic_LeupoldM3LR 					{ quality = 3; price = 300; };
	class CUP_optic_LeupoldMk4_10x40_LRT_Desert 	{ quality = 3; price = 300; };
	class CUP_optic_LeupoldMk4_10x40_LRT_Woodland 	{ quality = 3; price = 300; };
	class CUP_optic_LeupoldMk4_CQ_T 				{ quality = 3; price = 300; };
	class CUP_optic_LeupoldMk4_MRT_tan 				{ quality = 3; price = 300; };
	class CUP_optic_PechenegScope 					{ quality = 2; price = 300; };

	class CUP_optic_AN_PAS_13c1 					{ quality = 3; price = 1500; };
	class CUP_optic_AN_PAS_13c2 					{ quality = 3; price = 1500; };
	class CUP_optic_AN_PVS_10 						{ quality = 3; price = 1500; };
	class CUP_optic_AN_PVS_4 						{ quality = 3; price = 1500; };
	class CUP_optic_NSPU 							{ quality = 3; price = 1500; };
	///////////////////////////////////////////////////////////////////////////////
	// RHS
	///////////////////////////////////////////////////////////////////////////////
//US
	class rhsusf_acc_eotech_552						{ quality = 2; price = 75; };
	class rhsusf_acc_compm4							{ quality = 2; price = 50; };
	class rhsusf_acc_ACOG2_USMC						{ quality = 2; price = 300; };
	class rhsusf_acc_ACOG3_USMC						{ quality = 2; price = 300; };
	class rhsusf_acc_ACOG_USMC						{ quality = 2; price = 300; };
	class rhsusf_acc_ACOG							{ quality = 2; price = 300; };
	class rhsusf_acc_ACOG_pip						{ quality = 2; price = 300; };
	class rhsusf_acc_ACOG2							{ quality = 2; price = 300; };
	class rhsusf_acc_ACOG3							{ quality = 2; price = 300; };
	class rhsusf_acc_ELCAN							{ quality = 3; price = 500; };
	class rhsusf_acc_ELCAN_pip						{ quality = 3; price = 500; };
	class rhsusf_acc_LEUPOLDMK4 					{ quality = 3; price = 850; };
	class rhsusf_acc_LEUPOLDMK4_2 					{ quality = 3; price = 850; };
	
//Russian
	
	class rhs_acc_1pn93_2                           { quality = 1; price = 50; };
	class rhs_acc_1p29								{ quality = 2; price = 300; };
	class rhs_acc_1p63								{ quality = 2; price = 75; };
	class rhs_acc_1p78								{ quality = 1; price = 250; };
	class rhs_acc_1pn93_1							{ quality = 1; price = 300; };
	class rhs_acc_ekp1								{ quality = 1; price = 50; };
	class rhs_acc_pgo7v								{ quality = 2; price = 300; };
	class rhs_acc_pkas								{ quality = 1; price = 50; };
	class rhs_acc_pso1m2							{ quality = 2; price = 300; };

	///////////////////////////////////////////////////////////////////////////////
	// Hardware
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_Rope							{ quality = 1; price = 20; };
	class Exile_Item_DuctTape						{ quality = 1; price = 300; };
	class Exile_Item_ExtensionCord					{ quality = 1; price = 40; };
	class Exile_Item_FuelCanisterEmpty				{ quality = 1; price = 40; };
	class Exile_Item_JunkMetal						{ quality = 1; price = 400; };
	class Exile_Item_LightBulb						{ quality = 1; price = 20; };
	class Exile_Item_MetalBoard						{ quality = 1; price = 600; };
	class Exile_Item_SafeKit						{ quality = 3; price = 10000; };
	class Exile_Item_CodeLock						{ quality = 2; price = 5000; };
	class Exile_Item_CamoTentKit					{ quality = 1; price = 250; };
	class Exile_Item_MetalPole						{ quality = 1; price = 800; };

	///////////////////////////////////////////////////////////////////////////////
	// Food
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_GloriousKnakworst				{ quality = 1; price = 40; };
	class Exile_Item_Surstromming					{ quality = 1; price = 30; };
	class Exile_Item_SausageGravy					{ quality = 1; price = 30; };
	class Exile_Item_ChristmasTinner				{ quality = 1; price = 20; };
	class Exile_Item_BBQSandwich					{ quality = 1; price = 20; };
	class Exile_Item_Catfood						{ quality = 1; price = 20; };

	///////////////////////////////////////////////////////////////////////////////
	// Drinks
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_PlasticBottleFreshWater 		{ quality = 2; price = 40; };
	class Exile_Item_PlasticBottleEmpty				{ quality = 1; price = 4; };
	class Exile_Item_Beer 							{ quality = 1; price = 50; };
	class Exile_Item_Energydrink					{ quality = 1; price = 70; };

	///////////////////////////////////////////////////////////////////////////////
	// Tools
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_Matches 						{ quality = 1; price = 60; };
	class Exile_Item_CookingPot						{ quality = 2; price = 80; };
	class Exile_Item_InstaDoc                       { quality = 1; price = 250; };
	class Exile_Melee_Axe							{ quality = 1; price = 250; };

	///////////////////////////////////////////////////////////////////////////////
	// Navigation
	///////////////////////////////////////////////////////////////////////////////
	class ItemWatch									{ quality = 1; price = 6; };	
	class ItemGPS									{ quality = 1; price = 40; };
	class ItemMap									{ quality = 1; price = 6; };
	class ItemCompass								{ quality = 1; price = 6; };
	class ItemRadio									{ quality = 1; price = 40; };
	class Binocular									{ quality = 1; price = 40; };
	class Rangefinder								{ quality = 2; price = 200; };



	class NVGoggles									{ quality = 2; price = 100; };
	class NVGoggles_INDEP							{ quality = 2; price = 100; };
	class NVGoggles_OPFOR							{ quality = 2; price = 100; };
	class Exile_Item_XM8							{ quality = 2; price = 20; };

	///////////////////////////////////////////////////////////////////////////////
	// Rebreather
	///////////////////////////////////////////////////////////////////////////////
	class V_RebreatherB								{ quality = 2; price = 250; };
	class V_RebreatherIA							{ quality = 2; price = 250; };
	class V_RebreatherIR							{ quality = 2; price = 250; };

	///////////////////////////////////////////////////////////////////////////////
	// Pilot Stuff
	///////////////////////////////////////////////////////////////////////////////
	class B_Parachute								{ quality = 3; price = 150; };
	class H_CrewHelmetHeli_B						{ quality = 2; price = 150; };
	class H_CrewHelmetHeli_I						{ quality = 2; price = 150; };
	class H_CrewHelmetHeli_O						{ quality = 2; price = 150; };
	class H_HelmetCrew_I							{ quality = 1; price = 100; };
	class H_HelmetCrew_B							{ quality = 1; price = 100; };
	class H_HelmetCrew_O							{ quality = 1; price = 100; };
	class H_PilotHelmetHeli_B						{ quality = 3; price = 100; };
	class H_PilotHelmetHeli_I						{ quality = 3; price = 100; };
	class H_PilotHelmetHeli_O						{ quality = 3; price = 100; };
	class U_B_HeliPilotCoveralls					{ quality = 1; price = 80; };
	class U_B_PilotCoveralls						{ quality = 1; price = 60; };
	class U_I_HeliPilotCoveralls					{ quality = 1; price = 60; };
	class U_I_pilotCoveralls						{ quality = 1; price = 60; };
	class U_O_PilotCoveralls						{ quality = 1; price = 60; };
	class H_PilotHelmetFighter_B					{ quality = 2; price = 150; };
	class H_PilotHelmetFighter_I					{ quality = 2; price = 150; };
	class H_PilotHelmetFighter_O					{ quality = 2; price = 150; };

	///////////////////////////////////////////////////////////////////////////////
	// Backpacks
	///////////////////////////////////////////////////////////////////////////////

	class B_AssaultPack_blk							{ quality = 1; price = 90; };
	class B_AssaultPack_cbr							{ quality = 1; price = 90; };
	class B_AssaultPack_dgtl						{ quality = 1; price = 90; };
	class B_AssaultPack_khk							{ quality = 1; price = 90; };
	class B_AssaultPack_mcamo						{ quality = 1; price = 90; };
	class B_AssaultPack_rgr							{ quality = 1; price = 90; };
	class B_AssaultPack_sgg							{ quality = 1; price = 90; };
	class B_FieldPack_blk							{ quality = 2; price = 120; };
	class B_FieldPack_cbr							{ quality = 2; price = 120; };
	class B_FieldPack_ocamo							{ quality = 2; price = 120; };
	class B_FieldPack_oucamo						{ quality = 2; price = 120; };
	class B_TacticalPack_blk						{ quality = 2; price = 150; };
	class B_TacticalPack_rgr						{ quality = 2; price = 150; };
	class B_TacticalPack_ocamo						{ quality = 2; price = 150; };
	class B_TacticalPack_mcamo						{ quality = 2; price = 150; };
	class B_TacticalPack_oli						{ quality = 2; price = 150; };
	class B_Kitbag_cbr								{ quality = 3; price = 200; };
	class B_Kitbag_mcamo							{ quality = 3; price = 200; };
	class B_Kitbag_sgg								{ quality = 3; price = 200; };
	class B_Carryall_cbr							{ quality = 3; price = 300; };
	class B_Carryall_khk							{ quality = 3; price = 300; };
	class B_Carryall_mcamo							{ quality = 3; price = 300; };
	class B_Carryall_ocamo							{ quality = 3; price = 300; };
	class B_Carryall_oli							{ quality = 3; price = 300; };
	class B_Carryall_oucamo							{ quality = 3; price = 300; };
	class B_Bergen_blk								{ quality = 2; price = 200; };
	class B_Bergen_mcamo							{ quality = 2; price = 200; };
	class B_Bergen_rgr								{ quality = 2; price = 200; };
	class B_Bergen_sgg								{ quality = 2; price = 200; };
	class B_HuntingBackpack							{ quality = 3; price = 250; };
	class B_OutdoorPack_blk							{ quality = 1; price = 80; };
	class B_OutdoorPack_blu							{ quality = 1; price = 80; };
	class B_OutdoorPack_tan							{ quality = 1; price = 80; };
	
	// CUP Backpacks
	class CUP_B_USPack_Coyote						{ quality = 3; price = 300; };
	class CUP_B_USPack_Black						{ quality = 3; price = 300; };
	class CUP_B_ACRPara_m95							{ quality = 3; price = 300; };
	class CUP_B_ACRScout_m95						{ quality = 1; price = 50; };
	class CUP_B_CivPack_WDL							{ quality = 3; price = 300; };
	class CUP_B_RPGPack_Khaki						{ quality = 2; price = 200; };
	class CUP_B_AlicePack_Khaki						{ quality = 3; price = 300; };
	class CUP_B_AssaultPack_ACU						{ quality = 1; price = 90; };
	class CUP_B_AssaultPack_Coyote					{ quality = 1; price = 90; };
	class CUP_B_AssaultPack_Black					{ quality = 1; price = 90; };
	class CUP_B_MedicPack_ACU						{ quality = 1; price = 90; };
	class CUP_B_Bergen_BAF							{ quality = 3; price = 300; };
	class CUP_B_USMC_AssaultPack					{ quality = 3; price = 300; };
	class CUP_B_USMC_MOLLE							{ quality = 3; price = 350; };
	class CUP_B_USMC_MOLLE_WDL						{ quality = 3; price = 350; };

	///////////////////////////////////////////////////////////////////////////////
	// Ammunition
	///////////////////////////////////////////////////////////////////////////////
	class 100Rnd_65x39_caseless_mag 				{ quality = 1; price = 30; };
	class 100Rnd_65x39_caseless_mag_Tracer 			{ quality = 2; price = 40; };
	class 10Rnd_127x54_Mag 							{ quality = 1; price = 30; };
	// Broken in Arma
	class 10Rnd_338_Mag 							{ quality = 1; price = 30; };

	class 10Rnd_762x54_Mag 							{ quality = 1; price = 30; };
	//class 10Rnd_762x51_Mag 							{ quality = 1; price = 30; };
	class 10Rnd_93x64_DMR_05_Mag 					{ quality = 1; price = 40; };
	class 11Rnd_45ACP_Mag 							{ quality = 1; price = 8; };
	class 150Rnd_762x54_Box 						{ quality = 1; price = 20; };
	class 150Rnd_762x54_Box_Tracer 					{ quality = 2; price = 30; };
	class 16Rnd_9x21_Mag 							{ quality = 1; price = 20; };
	class 200Rnd_65x39_cased_Box 					{ quality = 1; price = 30; };
	class 200Rnd_65x39_cased_Box_Tracer 			{ quality = 2; price = 30; };
	class 150Rnd_93x64_Mag 							{ quality = 2; price = 50; };
	class 130Rnd_338_Mag 							{ quality = 2; price = 40; };
	class 20Rnd_556x45_UW_mag 						{ quality = 1; price = 20; };
	class 20Rnd_762x51_Mag 							{ quality = 1; price = 20; };
	class 30Rnd_45ACP_Mag_SMG_01 					{ quality = 1; price = 10; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green 		{ quality = 2; price = 10; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow		{ quality = 2; price = 10; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Red			{ quality = 2; price = 10; };
	class 30Rnd_556x45_Stanag 						{ quality = 1; price = 20; };
	class 30Rnd_556x45_Stanag_Tracer_Green 			{ quality = 2; price = 20; };
	class 30Rnd_556x45_Stanag_green  				{ quality = 2; price = 20; };
	class 30Rnd_556x45_Stanag_Tracer_Red 			{ quality = 2; price = 20; };
	class 30Rnd_556x45_Stanag_Tracer_Yellow 		{ quality = 2; price = 20; };
	class 30Rnd_556x45_Stanag_red 					{ quality = 2; price = 20; };
	class 30Rnd_65x39_caseless_green 				{ quality = 1; price = 20; };
	class 30Rnd_65x39_caseless_green_mag_Tracer 	{ quality = 2; price = 30; };
	class 30Rnd_65x39_caseless_mag 					{ quality = 1; price = 20; };
	class 30Rnd_65x39_caseless_mag_Tracer 			{ quality = 2; price = 30; };
	class 30Rnd_9x21_Mag 							{ quality = 1; price = 40; };
	class 5Rnd_127x108_APDS_Mag 					{ quality = 2; price = 50; };
	class 5Rnd_127x108_Mag 							{ quality = 1; price = 40; };
	class 6Rnd_45ACP_Cylinder 						{ quality = 1; price = 8; };
	class 6Rnd_GreenSignal_F 						{ quality = 9000; price = 30; };
	class 6Rnd_RedSignal_F 							{ quality = 9000; price = 30; };
	class 7Rnd_408_Mag 								{ quality = 1; price = 10; };
	class 9Rnd_45ACP_Mag 							{ quality = 1; price = 6; };
	
	// CUP Ammunition

	class CUP_30Rnd_545x39_AK_M 					{ quality = 1; price = 20; };
	class CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M 	{ quality = 1; price = 20; };
	class CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M 		{ quality = 1; price = 20; };
	class CUP_30Rnd_TE1_White_Tracer_545x39_AK_M 	{ quality = 1; price = 20; };
	class CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M 	{ quality = 1; price = 20; };
	class CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M	{ quality = 2; price = 30; };

	class CUP_20Rnd_556x45_Stanag 					{ quality = 1; price = 20; };
	class CUP_30Rnd_556x45_Stanag 					{ quality = 1; price = 20; };
	class CUP_30Rnd_556x45_G36 						{ quality = 1; price = 20; };
	class CUP_30Rnd_TE1_Red_Tracer_556x45_G36 		{ quality = 1; price = 20; };
	class CUP_30Rnd_TE1_Green_Tracer_556x45_G36 	{ quality = 1; price = 20; };
	class CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36 	{ quality = 1; price = 20; };
	class CUP_100Rnd_556x45_BetaCMag 				{ quality = 2; price = 30; };
	class CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag { quality = 2; price = 30; };
	class CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag	{ quality = 2; price = 30; };
	class CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag 	{ quality = 2; price = 30; };
	class CUP_100Rnd_TE4_Green_Tracer_556x45_M249 	{ quality = 2; price = 30; };
	class CUP_100Rnd_TE4_Red_Tracer_556x45_M249 	{ quality = 2; price = 30; };
	class CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249 	{ quality = 2; price = 30; };
	class CUP_200Rnd_TE4_Green_Tracer_556x45_M249 	{ quality = 2; price = 30; };
	class CUP_200Rnd_TE4_Red_Tracer_556x45_M249 	{ quality = 2; price = 30; };
	class CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249 	{ quality = 2; price = 30; };
	class CUP_200Rnd_TE1_Red_Tracer_556x45_M249 	{ quality = 2; price = 30; };
	class CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1 { quality = 2; price = 30; };
	class CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1 	{ quality = 2; price = 30; };
	class CUP_200Rnd_TE4_Yellow_Tracer_556x45_L110A1	{ quality = 2; price = 30; };

	class CUP_10x_303_M 							{ quality = 1; price = 20; };

	class CUP_30Rnd_Sa58_M 							{ quality = 1; price = 20; };
	class CUP_30Rnd_Sa58_M_TracerG 					{ quality = 1; price = 20; };
	class CUP_30Rnd_762x39_AK47_M 					{ quality = 1; price = 20; };

	class CUP_5Rnd_762x51_M24 						{ quality = 2; price = 40; };
	class CUP_5x_22_LR_17_HMR_M 					{ quality = 3; price = 40; };
	class CUP_10Rnd_762x51_CZ750 					{ quality = 3; price = 50; };
	class CUP_10Rnd_762x51_CZ750_Tracer 			{ quality = 3; price = 50; };
	class CUP_20Rnd_762x51_FNFAL_M 					{ quality = 2; price = 40; };
	class CUP_20Rnd_762x51_DMR 						{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR	{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Red_Tracer_762x51_DMR 		{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Green_Tracer_762x51_DMR 	{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_White_Tracer_762x51_DMR 	{ quality = 2; price = 40; };
	class CUP_20Rnd_762x51_B_SCAR 					{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR 	{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR 		{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR 	{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_White_Tracer_762x51_SCAR 	{ quality = 2; price = 40; };
	class CUP_20Rnd_762x51_B_M110 					{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110 	{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Red_Tracer_762x51_M110 		{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Green_Tracer_762x51_M110 	{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_White_Tracer_762x51_M110 	{ quality = 2; price = 40; };
	class CUP_20Rnd_762x51_CZ805B 					{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Yellow_Tracer_762x51_CZ805B { quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Red_Tracer_762x51_CZ805B 	{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_Green_Tracer_762x51_CZ805B 	{ quality = 2; price = 40; };
	class CUP_20Rnd_TE1_White_Tracer_762x51_CZ805B 	{ quality = 2; price = 40; };
	class CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M	{ quality = 2; price = 40; };
	class CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M 		{ quality = 2; price = 40; };
	class CUP_200Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M	{ quality = 2; price = 40; };
	class CUP_200Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M 		{ quality = 2; price = 40; };

	class CUP_10Rnd_762x54_SVD_M 					{ quality = 2; price = 40; };
	class CUP_50Rnd_UK59_762x54R_Tracer 			{ quality = 2; price = 40; };
	class CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M	{ quality = 2; price = 40; };

	class CUP_10Rnd_B_765x17_Ball_M 				{ quality = 2; price = 40; };
	class CUP_20Rnd_B_765x17_Ball_M 				{ quality = 2; price = 40; };

	class CUP_5Rnd_86x70_L115A1 					{ quality = 3; price = 50; };

	class CUP_8Rnd_9x18_Makarov_M 					{ quality = 1; price = 10; };
	class CUP_8Rnd_9x18_MakarovSD_M 				{ quality = 1; price = 10; };

	class CUP_10Rnd_9x19_Compact 					{ quality = 1; price = 10; };
	class CUP_15Rnd_9x19_M9 						{ quality = 1; price = 10; };
	class CUP_17Rnd_9x19_glock17 					{ quality = 1; price = 10; };
	class CUP_18Rnd_9x19_Phantom 					{ quality = 1; price = 10; };
	class CUP_30Rnd_9x19_EVO 						{ quality = 2; price = 20; };
	class CUP_30Rnd_9x19_UZI 						{ quality = 2; price = 20; };
	class CUP_30Rnd_9x19_MP5 						{ quality = 2; price = 20; };
	class CUP_64Rnd_9x19_Bizon_M 					{ quality = 2; price = 20; };
	class CUP_64Rnd_Green_Tracer_9x19_Bizon_M 		{ quality = 2; price = 20; };
	class CUP_64Rnd_Red_Tracer_9x19_Bizon_M 		{ quality = 2; price = 20; };
	class CUP_64Rnd_White_Tracer_9x19_Bizon_M 		{ quality = 2; price = 20; };
	class CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M 		{ quality = 2; price = 20; };

	class CUP_10Rnd_9x39_SP5_VSS_M 					{ quality = 2; price = 30; };
	class CUP_20Rnd_9x39_SP5_VSS_M 					{ quality = 2; price = 30; };

	class CUP_6Rnd_45ACP_M 							{ quality = 1; price = 10; };
	class CUP_7Rnd_45ACP_1911 						{ quality = 1; price = 10; };

	class CUP_5Rnd_127x99_as50_M 					{ quality = 3; price = 60; };
	class CUP_10Rnd_127x99_M107 					{ quality = 3; price = 70; };

	class CUP_5Rnd_127x108_KSVK_M 					{ quality = 3; price = 50; };

	class CUP_8Rnd_B_Saiga12_74Slug_M 				{ quality = 1; price = 10; };
	class CUP_8Rnd_B_Saiga12_74Pellets_M 			{ quality = 1; price = 10; };
	class CUP_8Rnd_B_Beneli_74Slug 					{ quality = 1; price = 10; };
	class CUP_8Rnd_B_Beneli_74Pellets 				{ quality = 1; price = 10; };
	///////////////////////////////////////////////////////////////////////////////
	// RHS
	///////////////////////////////////////////////////////////////////////////////
//US

	class rhs_mag_30Rnd_556x45_Mk318_Stanag						{ quality = 2; price = 35; };
	class rhs_mag_30Rnd_556x45_Mk262_Stanag						{ quality = 2; price = 40; };
	class rhs_mag_30Rnd_556x45_M855A1_Stanag					{ quality = 2; price = 30; };
	class rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer			{ quality = 2; price = 30; };
	class rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red			{ quality = 2; price = 30; };
	class rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green		{ quality = 2; price = 30; };
	class rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow		{ quality = 2; price = 30; };

	class rhs_200rnd_556x45_M_SAW								{ quality = 3; price = 120; };
	class rhs_200rnd_556x45_B_SAW								{ quality = 3; price = 120; };
	class rhs_200rnd_556x45_T_SAW								{ quality = 3; price = 120; };

	class rhsusf_50Rnd_762x51									{ quality = 3; price = 50; };
	class rhsusf_50Rnd_762x51_m993								{ quality = 3; price = 50; };
	class rhsusf_50Rnd_762x51_m80a1epr							{ quality = 3; price = 95; };
	class rhsusf_100Rnd_762x51									{ quality = 3; price = 95; };
	class rhsusf_100Rnd_762x51_m993								{ quality = 3; price = 95; };
	class rhsusf_100Rnd_762x51_m80a1epr							{ quality = 3; price = 95; };

	class rhsusf_8Rnd_00Buck									{ quality = 3; price = 40; };
	class rhsusf_8Rnd_Slug									{ quality = 3; price = 50; };

	class rhsusf_20Rnd_762x51_m993_Mag							{ quality = 3; price = 45; };
	class rhsusf_5Rnd_300winmag_xm2010							{ quality = 3; price = 55; };								
		
//Russian

	class rhs_30Rnd_762x39mm									{ quality = 1; price = 20; };
	class rhs_30Rnd_762x39mm_tracer								{ quality = 1; price = 20; };
	class rhs_30Rnd_762x39mm_89									{ quality = 1; price = 20; };

	class rhs_30Rnd_545x39_AK									{ quality = 1; price = 20; };
	class rhs_30Rnd_545x39_AK_no_tracers						{ quality = 1; price = 20; };
	class rhs_30Rnd_545x39_7N10_AK								{ quality = 1; price = 20; };
	class rhs_30Rnd_545x39_7N22_AK								{ quality = 1; price = 20; };
	class rhs_30Rnd_545x39_AK_green								{ quality = 1; price = 20; };
	class rhs_45Rnd_545X39_AK									{ quality = 1; price = 40; };
	class rhs_45Rnd_545X39_7N10_AK								{ quality = 1; price = 40; };
	class rhs_45Rnd_545X39_7N22_AK								{ quality = 1; price = 40; };
	class rhs_45Rnd_545X39_AK_Green								{ quality = 1; price = 40; };

	class rhs_100Rnd_762x54mmR									{ quality = 2; price = 95; };
	class rhs_100Rnd_762x54mmR_green							{ quality = 2; price = 95; };

	class rhs_10Rnd_762x54mmR_7N1								{ quality = 2; price = 50; };


	///////////////////////////////////////////////////////////////////////////////
	// Flares
	///////////////////////////////////////////////////////////////////////////////
	class Chemlight_blue							{ quality = 1; price = 2; };
	class Chemlight_green							{ quality = 1; price = 2; };
	class Chemlight_red								{ quality = 1; price = 2; };
	class FlareGreen_F								{ quality = 1; price = 6; };
	class FlareRed_F								{ quality = 1; price = 6; };
	class FlareWhite_F								{ quality = 1; price = 6; };
	class FlareYellow_F								{ quality = 1; price = 6; };
	class UGL_FlareGreen_F							{ quality = 2; price = 8; };
	class UGL_FlareRed_F							{ quality = 2; price = 8; };
	class UGL_FlareWhite_F							{ quality = 2; price = 8; };
	class UGL_FlareYellow_F							{ quality = 2; price = 8; };
	class 3Rnd_UGL_FlareGreen_F						{ quality = 3; price = 8*3; };
	class 3Rnd_UGL_FlareRed_F						{ quality = 3; price = 8*3; };
	class 3Rnd_UGL_FlareWhite_F						{ quality = 3; price = 8*3; };
	class 3Rnd_UGL_FlareYellow_F					{ quality = 3; price = 8*3; };

	///////////////////////////////////////////////////////////////////////////////
	// Smokes
	///////////////////////////////////////////////////////////////////////////////
	class SmokeShell								{ quality = 1; price = 6; };
	class SmokeShellBlue							{ quality = 1; price = 6; };
	class SmokeShellGreen							{ quality = 1; price = 6; };
	class SmokeShellOrange							{ quality = 1; price = 6; };
	class SmokeShellPurple							{ quality = 1; price = 6; };
	class SmokeShellRed								{ quality = 1; price = 6; };
	class SmokeShellYellow							{ quality = 1; price = 6; };
	class 1Rnd_Smoke_Grenade_shell					{ quality = 2; price = 8; };
	class 1Rnd_SmokeBlue_Grenade_shell				{ quality = 2; price = 8; };
	class 1Rnd_SmokeGreen_Grenade_shell				{ quality = 2; price = 8; };
	class 1Rnd_SmokeOrange_Grenade_shell			{ quality = 2; price = 8; };
	class 1Rnd_SmokePurple_Grenade_shell			{ quality = 2; price = 8; };
	class 1Rnd_SmokeRed_Grenade_shell				{ quality = 2; price = 8; };
	class 1Rnd_SmokeYellow_Grenade_shell			{ quality = 2; price = 8; };
	class 3Rnd_Smoke_Grenade_shell					{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeBlue_Grenade_shell				{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeGreen_Grenade_shell				{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeOrange_Grenade_shell			{ quality = 3; price = 8*3; };
	class 3Rnd_SmokePurple_Grenade_shell			{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeRed_Grenade_shell				{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeYellow_Grenade_shell			{ quality = 3; price = 8*3; };

	///////////////////////////////////////////////////////////////////////////////
	// Explosives
	///////////////////////////////////////////////////////////////////////////////
	class HandGrenade								{ quality = 3; price = 40; };
	class MiniGrenade								{ quality = 2; price = 30; };
	class B_IR_Grenade								{ quality = 1; price = 50; };
	class O_IR_Grenade								{ quality = 1; price = 50; };
	class I_IR_Grenade								{ quality = 1; price = 50; };
	class 1Rnd_HE_Grenade_shell						{ quality = 2; price = 70; };
	class 3Rnd_HE_Grenade_shell						{ quality = 3; price = 70*3; };
	class APERSBoundingMine_Range_Mag				{ quality = 3; price = 5000; };
	class APERSMine_Range_Mag						{ quality = 3; price = 6000; };
	class APERSTripMine_Wire_Mag					{ quality = 3; price = 3000; };
	class ClaymoreDirectionalMine_Remote_Mag		{ quality = 3; price = 3500; };
	class DemoCharge_Remote_Mag						{ quality = 3; price = 7000; };
	class IEDLandBig_Remote_Mag						{ quality = 3; price = 6000; };
	class IEDLandSmall_Remote_Mag					{ quality = 3; price = 3000; };
	class IEDUrbanBig_Remote_Mag					{ quality = 3; price = 8000; };
	class IEDUrbanSmall_Remote_Mag					{ quality = 3; price = 4000; };
	class SatchelCharge_Remote_Mag					{ quality = 3; price = 10000; };
	class SLAMDirectionalMine_Wire_Mag				{ quality = 3; price = 7000; };

	///////////////////////////////////////////////////////////////////////////////
	// Pistols
	///////////////////////////////////////////////////////////////////////////////
	class hgun_ACPC2_F 								{ quality = 1; price = 50; };
	class hgun_P07_F 								{ quality = 1; price = 50; };
	class hgun_Pistol_heavy_01_F 					{ quality = 2; price = 80; };
	class hgun_Pistol_heavy_02_F 					{ quality = 2; price = 80; };
	class hgun_Pistol_Signal_F 						{ quality = 9000; price = 100; };
	class hgun_Rook40_F 							{ quality = 1; price = 50; };
	
	// CUP Pistols

	class CUP_hgun_Colt1911							{ quality = 2; price = 80; };
	class CUP_hgun_Compact							{ quality = 2; price = 80; };
	class CUP_hgun_Duty								{ quality = 2; price = 80; };
	class CUP_hgun_Phantom							{ quality = 2; price = 80; };
	class CUP_hgun_M9								{ quality = 2; price = 80; };
	class CUP_hgun_Makarov							{ quality = 1; price = 50; };
	class CUP_hgun_PB6P9							{ quality = 2; price = 150; };
	class CUP_hgun_SA61								{ quality = 2; price = 150; };
	class CUP_hgun_MicroUzi							{ quality = 2; price = 150; };
	class CUP_hgun_TaurusTracker455					{ quality = 2; price = 150; };

	///////////////////////////////////////////////////////////////////////////////
	// Sub Machine Guns
	///////////////////////////////////////////////////////////////////////////////
	class hgun_PDW2000_F 							{ quality = 1; price = 100; };
	class SMG_01_F 									{ quality = 1; price = 150; };
	class SMG_02_F 									{ quality = 1; price = 150; };
	
	// CUP Sub Machine Guns

	class CUP_smg_bizon								{ quality = 2; price = 200; };
	class CUP_smg_EVO								{ quality = 1; price = 150; };

	class CUP_smg_MP5SD6							{ quality = 1; price = 150; };
	class CUP_smg_MP5A5								{ quality = 1; price = 150; };

	class CUP_sgun_AA12								{ quality = 2; price = 250; };
	class CUP_sgun_M1014							{ quality = 1; price = 150; };
	class CUP_sgun_Saiga12K							{ quality = 2; price = 200; };

	///////////////////////////////////////////////////////////////////////////////
	// Light Machine Guns
	///////////////////////////////////////////////////////////////////////////////
	class arifle_MX_SW_Black_F						{ quality = 2; price = 250; };
	class arifle_MX_SW_F							{ quality = 2; price = 250; };
	class LMG_Mk200_F								{ quality = 2; price = 300; };
	class LMG_Zafir_F								{ quality = 2; price = 350; };
	class MMG_01_hex_F								{ quality = 3; price = 800; };
	class MMG_01_tan_F								{ quality = 3; price = 800; };
	class MMG_02_black_F							{ quality = 3; price = 450; };
	class MMG_02_camo_F								{ quality = 3; price = 450; };
	class MMG_02_sand_F								{ quality = 3; price = 450; };
	
	// CUP Light Machine Guns

	class CUP_arifle_RPK74							{ quality = 2; price = 250; };
	class CUP_arifle_RPK74M							{ quality = 2; price = 250; };
	class CUP_arifle_RPK74_45						{ quality = 2; price = 250; };
	class CUP_arifle_L86A2							{ quality = 2; price = 350; };
	class CUP_arifle_MG36							{ quality = 2; price = 350; };
	class CUP_arifle_MG36_camo						{ quality = 2; price = 350; };

	class CUP_lmg_Pecheneg							{ quality = 3; price = 550; };
	class CUP_lmg_PKM								{ quality = 2; price = 450; };
	class CUP_lmg_UK59								{ quality = 3; price = 800; };
	class CUP_lmg_L110A1							{ quality = 2; price = 350; };
	class CUP_lmg_L7A2								{ quality = 2; price = 350; };
	class CUP_lmg_M249								{ quality = 2; price = 450; };
	class CUP_lmg_M240								{ quality = 2; price = 550; };
	class CUP_lmg_M60A4								{ quality = 2; price = 250; };
	class CUP_lmg_Mk48_des							{ quality = 3; price = 750; };
	class CUP_lmg_Mk48_wdl							{ quality = 3; price = 750; };
	///////////////////////////////////////////////////////////////////////////////
	// RHS
	///////////////////////////////////////////////////////////////////////////////
//US
	
	class rhs_weap_m249_pip_L						{ quality = 3; price = 850; };
	class rhs_weap_m249_pip_L_para					{ quality = 3; price = 850; };
	class rhs_weap_m249_pip_L_vfg					{ quality = 3; price = 850; };
	class rhs_weap_m249_pip_S						{ quality = 3; price = 850; };
	class rhs_weap_m249_pip_S_para					{ quality = 3; price = 850; };
	class rhs_weap_m249_pip_S_vfg					{ quality = 3; price = 850; };
	class rhs_weap_m240B							{ quality = 3; price = 800; };
	class rhs_weap_m240B_CAP						{ quality = 3; price = 800; };
	class rhs_weap_m240G							{ quality = 3; price = 800; };

//Russian

	class rhs_weap_pkm								{ quality = 2; price = 250; };
	class rhs_weap_pkp								{ quality = 2; price = 300; };
	


	///////////////////////////////////////////////////////////////////////////////
	// Assault Rifles
	///////////////////////////////////////////////////////////////////////////////
	class arifle_Katiba_C_F							{ quality = 1; price = 150; };
	class arifle_Katiba_F							{ quality = 1; price = 150; };
	class arifle_Katiba_GL_F						{ quality = 2; price = 200; };
	class arifle_Mk20_F								{ quality = 1; price = 150; };
	class arifle_Mk20_GL_F							{ quality = 2; price = 200; };
	class arifle_Mk20_GL_plain_F					{ quality = 2; price = 200; };
	class arifle_Mk20_plain_F						{ quality = 1; price = 150; };
	class arifle_Mk20C_F							{ quality = 1; price = 150; };
	class arifle_Mk20C_plain_F						{ quality = 1; price = 150; };
	class arifle_MX_Black_F							{ quality = 1; price = 450; };
	class arifle_MX_F								{ quality = 1; price = 450; };
	class arifle_MX_GL_Black_F						{ quality = 2; price = 450; };
	class arifle_MX_GL_F							{ quality = 2; price = 450; };
	class arifle_MXC_Black_F						{ quality = 1; price = 350; };
	class arifle_MXC_F								{ quality = 1; price = 350; };
	class arifle_SDAR_F								{ quality = 3; price = 650; };
	class arifle_TRG20_F							{ quality = 1; price = 250; };
	class arifle_TRG21_F							{ quality = 1; price = 250; };
	class arifle_TRG21_GL_F							{ quality = 2; price = 350; };
	
	// CUP Assault Rifles

	class CUP_arifle_AK74							{ quality = 1; price = 250; };
	class CUP_arifle_AK74M							{ quality = 1; price = 150; };
	class CUP_arifle_AKS							{ quality = 1; price = 150; };
	class CUP_arifle_AKS74							{ quality = 1; price = 200; };
	class CUP_arifle_AKS_Gold						{ quality = 1; price = 300; };
	class CUP_arifle_AKS74U							{ quality = 1; price = 150; };
	class CUP_arifle_AK107							{ quality = 2; price = 350; };

	class CUP_arifle_AKM							{ quality = 1; price = 250; };

	class CUP_arifle_CZ805_A1						{ quality = 2; price = 450; };
	class CUP_arifle_CZ805_A2						{ quality = 2; price = 450; };
	class CUP_arifle_CZ805_B						{ quality = 2; price = 450; };
	class CUP_arifle_FNFAL_railed					{ quality = 3; price = 650; };
	class CUP_arifle_FNFAL							{ quality = 3; price = 550; };

	class CUP_arifle_G36A							{ quality = 2; price = 450; };
	class CUP_arifle_G36A_camo						{ quality = 2; price = 450; };
	class CUP_arifle_G36K							{ quality = 2; price = 350; };
	class CUP_arifle_G36K_camo						{ quality = 2; price = 350; };
	class CUP_arifle_G36C							{ quality = 1; price = 200; };
	class CUP_arifle_G36C_camo						{ quality = 1; price = 200; };
	class CUP_arifle_L85A2							{ quality = 2; price = 350; };

	class CUP_arifle_M16A2							{ quality = 1; price = 200; };
	class CUP_arifle_M4A1							{ quality = 2; price = 250; };
	class CUP_arifle_M4A1_camo						{ quality = 2; price = 250; };
	class CUP_arifle_M4A1_black						{ quality = 2; price = 250; };
	class CUP_arifle_M4A1_desert					{ quality = 2; price = 250; };

	class CUP_arifle_Sa58P							{ quality = 2; price = 400; };
	class CUP_arifle_Sa58P_des						{ quality = 2; price = 400; };
	class CUP_arifle_Sa58V							{ quality = 2; price = 400; };
	class CUP_arifle_Sa58RIS1						{ quality = 2; price = 450; };
	class CUP_arifle_Sa58RIS2						{ quality = 2; price = 450; };
	class CUP_arifle_Sa58RIS1_des					{ quality = 2; price = 450; };
	class CUP_arifle_Sa58RIS2_camo					{ quality = 2; price = 450; };
	class CUP_arifle_Mk16_STD						{ quality = 2; price = 350; };
	class CUP_arifle_Mk16_CQC						{ quality = 2; price = 350; };
	class CUP_arifle_Mk16_SV						{ quality = 2; price = 350; };
	class CUP_arifle_Mk17_CQC						{ quality = 3; price = 450; };
	class CUP_arifle_Mk17_STD						{ quality = 3; price = 450; };
	class CUP_arifle_Mk20							{ quality = 3; price = 550; };
	class CUP_arifle_XM8_Carbine					{ quality = 2; price = 250; };
	class CUP_arifle_xm8_sharpshooter				{ quality = 2; price = 450; };
	class CUP_arifle_XM8_Compact					{ quality = 1; price = 100; };
	class CUP_arifle_XM8_Compact_Rail				{ quality = 1; price = 100; };
	class CUP_arifle_XM8_Railed						{ quality = 1; price = 100; };
	class CUP_arifle_XM8_Carbine_FG					{ quality = 2; price = 250; };	
	///////////////////////////////////////////////////////////////////////////////
	// RHS
	///////////////////////////////////////////////////////////////////////////////
	
//US
	class rhs_weap_m16a4							{ quality = 1; price = 350; };
	class rhs_weap_m16a4_carryhandle				{ quality = 1; price = 350; };
	class rhs_weap_m16a4_carryhandle_grip			{ quality = 2; price = 400; };
	class rhs_weap_m16a4_carryhandle_grip_pmag		{ quality = 2; price = 400; };
	class rhs_weap_m16a4_carryhandle_M203			{ quality = 2; price = 400; };
	class rhs_weap_m16a4_carryhandle_pmag			{ quality = 2; price = 400; };
	class rhs_weap_m16a4_grip						{ quality = 1; price = 350; };

	class rhs_weap_m4								{ quality = 1; price = 350; };
	class rhs_weap_m4_grip2							{ quality = 2; price = 400; };
	class rhs_weap_m4_carryhandle					{ quality = 1; price = 350; };
	class rhs_weap_m4_carryhandle_pmag				{ quality = 1; price = 350; };
	class rhs_weap_m4_grip							{ quality = 2; price = 400; };
	class rhs_weap_m4_m203							{ quality = 3; price = 450; };
	class rhs_weap_m4_m320							{ quality = 3; price = 450; };

	class rhs_weap_m4a1_carryhandle					{ quality = 1; price = 350; };
	class rhs_weap_m4a1_carryhandle_grip2			{ quality = 2; price = 400; };
	class rhs_weap_m4a1_carryhandle_pmag			{ quality = 1; price = 350; };
	class rhs_weap_m4a1_carryhandle_m203			{ quality = 3; price = 450; };
	class rhs_weap_m4a1								{ quality = 1; price = 350; };
	class rhs_weap_m4a1_grip2						{ quality = 2; price = 400; };
	class rhs_weap_m4a1_grip						{ quality = 2; price = 400; };
	class rhs_weap_m4a1_m203						{ quality = 3; price = 450; };
	class rhs_weap_m4a1_m320						{ quality = 3; price = 450; };

	class rhs_weap_m4a1_blockII						{ quality = 3; price = 850; };
	class rhs_weap_m4a1_blockII_KAC					{ quality = 3; price = 950; };
	class rhs_weap_m4a1_blockII_grip2				{ quality = 3; price = 980; };
	class rhs_weap_m4a1_blockII_grip2_KAC			{ quality = 3; price = 980; };
	class rhs_weap_m4a1_blockII_M203				{ quality = 3; price = 1000; };			

	class rhs_weap_mk18								{ quality = 3; price = 600; };
	class rhs_weap_mk18_KAC							{ quality = 3; price = 650; };
	class rhs_weap_mk18_grip2						{ quality = 3; price = 700; };
	class rhs_weap_mk18_grip2_KAC					{ quality = 3; price = 750; };
	class rhs_weap_mk18_m320						{ quality = 3; price = 850; };

//SHOTGUNS
	class rhs_weap_M590_5RD						    { quality = 3; price = 400; };
	class rhs_weap_M590_8RD						    { quality = 3; price = 450; };
	
//Russian

	class rhs_weap_ak103							{ quality = 1; price = 150; };
	class rhs_weap_ak103_npz						{ quality = 1; price = 150; };
	class rhs_weap_ak103_1							{ quality = 1; price = 150; };


	class rhs_weap_ak74m							{ quality = 1; price = 150; };
	class rhs_weap_ak74m_2mag						{ quality = 1; price = 150; };
	class rhs_weap_ak74m_2mag_camo					{ quality = 2; price = 200; };
	class rhs_weap_ak74m_2mag_npz					{ quality = 1; price = 200; };
	class rhs_weap_ak74m_camo						{ quality = 2; price = 200; };
	class rhs_weap_ak74m_desert						{ quality = 2; price = 200; };
	class rhs_weap_ak74m_desert_npz					{ quality = 2; price = 250; };
	class rhs_weap_ak74m_desert_folded				{ quality = 1; price = 150; };
	class rhs_weap_ak74m_plummag_folded				{ quality = 1; price = 150; };
	class rhs_weap_ak74m_folded						{ quality = 1; price = 150; };
	class rhs_weap_ak74m_camo_folded				{ quality = 1; price = 150; };
	class rhs_weap_ak74m_gp25						{ quality = 2; price = 300; };
	class rhs_weap_ak74m_gp25_npz					{ quality = 2; price = 300; };
	class rhs_weap_ak74m_npz						{ quality = 1; price = 200; };
	class rhs_weap_ak74m_plummag					{ quality = 2; price = 250; };
	class rhs_weap_ak74m_plummag_npz				{ quality = 2; price = 300; };
	class rhs_weap_akm								{ quality = 1; price = 150; };
	class rhs_weap_akm_gp25							{ quality = 1; price = 250; };
	class rhs_weap_akms								{ quality = 1; price = 150; };
	class rhs_weap_akms_gp25						{ quality = 1; price = 200; };

	///////////////////////////////////////////////////////////////////////////////
	// Sniper Rifles
	///////////////////////////////////////////////////////////////////////////////
	class arifle_MXM_Black_F 						{ quality = 1; price = 550; };
	class arifle_MXM_F 								{ quality = 1; price = 550; };
	class srifle_DMR_01_F 							{ quality = 2; price = 600; };
	class srifle_DMR_02_camo_F 						{ quality = 3; price = 800; };
	class srifle_DMR_02_F 							{ quality = 3; price = 800; };
	class srifle_DMR_02_sniper_F 					{ quality = 3; price = 800; };
	class srifle_DMR_03_F 							{ quality = 3; price = 750; };
	class srifle_DMR_03_khaki_F 					{ quality = 3; price = 750; };
	class srifle_DMR_03_multicam_F 					{ quality = 3; price = 750; };
	class srifle_DMR_03_tan_F 						{ quality = 3; price = 750; };
	class srifle_DMR_03_woodland_F 					{ quality = 3; price = 750; };
	class srifle_DMR_04_F 							{ quality = 3; price = 700; };
	class srifle_DMR_04_Tan_F 						{ quality = 3; price = 700; };
	class srifle_DMR_05_blk_F 						{ quality = 3; price = 850; };
	class srifle_DMR_05_hex_F 						{ quality = 3; price = 850; };
	class srifle_DMR_05_tan_f 						{ quality = 3; price = 850; };
	class srifle_DMR_06_camo_F 						{ quality = 3; price = 800; };
	class srifle_DMR_06_olive_F 					{ quality = 3; price = 800; };
	class srifle_EBR_F 								{ quality = 2; price = 700; };
	class srifle_GM6_camo_F 						{ quality = 3; price = 9000; };
	class srifle_GM6_F 								{ quality = 3; price = 9000; };
	class srifle_LRR_camo_F 						{ quality = 3; price = 8500; };
	class srifle_LRR_F 								{ quality = 3; price = 8500; };
	
	// CUP Sniper Rifles

	class CUP_srifle_AWM_des						{ quality = 3; price = 8500; };
	class CUP_srifle_AWM_wdl						{ quality = 3; price = 8500; };

	class CUP_srifle_CZ550							{ quality = 2; price = 700; };
	class CUP_srifle_CZ750							{ quality = 3; price = 700; };

	class CUP_srifle_DMR							{ quality = 3; price = 900; };
	class CUP_srifle_M14							{ quality = 2; price = 600; };
	class CUP_srifle_M24_des						{ quality = 2; price = 650; };
	class CUP_srifle_M24_wdl						{ quality = 2; price = 650; };
	class CUP_srifle_M40A3							{ quality = 2; price = 650; };
	class CUP_srifle_M110							{ quality = 3; price = 800; };
	class CUP_srifle_SVD							{ quality = 2; price = 700; };
	class CUP_srifle_SVD_des						{ quality = 2; price = 700; };
	class CUP_srifle_VSSVintorez					{ quality = 2; price = 700; };
	class CUP_srifle_LeeEnfield						{ quality = 1; price = 550; };
	class CUP_srifle_AS50							{ quality = 3; price = 55000; };
	class CUP_srifle_ksvk							{ quality = 3; price = 9000; };
	class CUP_srifle_M107_Base						{ quality = 3; price = 32000; };
	///////////////////////////////////////////////////////////////////////////////
	// RHS
	///////////////////////////////////////////////////////////////////////////////
//US

	class rhs_weap_sr25								{ quality = 3; price = 2500; };
	class rhs_weap_sr25_ec							{ quality = 3; price = 2500; };
	class rhs_weap_m14ebrri							{ quality = 3; price = 5000; };
	class rhs_weap_XM2010							{ quality = 3; price = 5000; };
	class rhs_weap_XM2010_wd						{ quality = 3; price = 5000; };
	class rhs_weap_XM2010_d							{ quality = 3; price = 5000; };
	class rhs_weap_XM2010_sa						{ quality = 3; price = 5000; };

//Russian
	
	class rhs_weap_svd								{ quality = 3; price = 2500; };
	class rhs_weap_svdp_wd							{ quality = 3; price = 2500; };
	class rhs_weap_svdp_wd_npz						{ quality = 3; price = 2500; };
	class rhs_weap_svdp_npz							{ quality = 3; price = 2500; };
	class rhs_weap_svds								{ quality = 3; price = 2500; };
	class rhs_weap_svds_npz							{ quality = 3; price = 2500; };

	///////////////////////////////////////////////////////////////////////////////
	// BIKES
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Bike_OldBike 						{ quality = 1; price = 40; };
	class Exile_Bike_MountainBike 					{ quality = 1; price = 50; };

	///////////////////////////////////////////////////////////////////////////////
	// QUAD BIKES
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Bike_QuadBike_Black					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Blue					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Red					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_White					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Nato					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Csat					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Fia					{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Guerilla01			{ quality = 1; price = 500; };
	class Exile_Bike_QuadBike_Guerilla02			{ quality = 1; price = 500; };

	///////////////////////////////////////////////////////////////////////////////
	// KARTS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Kart_BluKing					{ quality = 1; price = 400; };
	class Exile_Car_Kart_RedStone					{ quality = 1; price = 400; };
	class Exile_Car_Kart_Vrana						{ quality = 1; price = 400; };
	class Exile_Car_Kart_Green						{ quality = 1; price = 400; };
	class Exile_Car_Kart_Blue						{ quality = 1; price = 400; };
	class Exile_Car_Kart_Orange						{ quality = 1; price = 400; };
	class Exile_Car_Kart_White						{ quality = 1; price = 400; };
	class Exile_Car_Kart_Yellow						{ quality = 1; price = 400; };
	class Exile_Car_Kart_Black						{ quality = 1; price = 400; };

	///////////////////////////////////////////////////////////////////////////////
	// MOTOR BOATS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_MotorBoat_Police				{ quality = 1; price = 700; };
	class Exile_Boat_MotorBoat_Orange				{ quality = 1; price = 700; };
	class Exile_Boat_MotorBoat_White				{ quality = 1; price = 700; };

	///////////////////////////////////////////////////////////////////////////////
	// RUBBER DUCKS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_RubberDuck_CSAT				{ quality = 1; price = 500; };
	class Exile_Boat_RubberDuck_Digital				{ quality = 1; price = 500; };
	class Exile_Boat_RubberDuck_Orange				{ quality = 1; price = 500; };
	class Exile_Boat_RubberDuck_Blue				{ quality = 1; price = 500; };
	class Exile_Boat_RubberDuck_Black				{ quality = 1; price = 500; };

	///////////////////////////////////////////////////////////////////////////////
	// SDV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_SDV_CSAT						{ quality = 1; price = 1000; };
	class Exile_Boat_SDV_Digital					{ quality = 1; price = 1000; };
	class Exile_Boat_SDV_Grey						{ quality = 1; price = 1000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hellcat
	///////////////////////////////////////////////////////////////////////////////
	//class Exile_Chopper_Hellcat_Green				{ quality = 1; price = 14000; };
	//class Exile_Chopper_Hellcat_FIA					{ quality = 1; price = 14000; };

	class I_Heli_light_03_unarmed_F					{ quality = 1; price = 25000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Hummingbird
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hummingbird_Green			{ quality = 1; price = 12000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hummingbird (Civillian)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hummingbird_Civillian_Blue				{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Red				{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_ION				{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_BlueLine			{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Digital			{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Elliptical		{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Furious			{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_GrayWatcher		{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Jeans				{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Light				{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Shadow			{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Sheriff			{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Speedy			{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Sunset			{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Vrana				{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Wasp				{ quality = 1; price = 10000; };
	class Exile_Chopper_Hummingbird_Civillian_Wave				{ quality = 1; price = 10000; };

	///////////////////////////////////////////////////////////////////////////////
	// Huron
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huron_Black								{ quality = 1; price = 25000; };
	class Exile_Chopper_Huron_Green								{ quality = 1; price = 25000; };

	///////////////////////////////////////////////////////////////////////////////
	// Mohawk
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Mohawk_FIA								{ quality = 1; price = 18000; };

	///////////////////////////////////////////////////////////////////////////////
	// Orca
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Orca_CSAT								{ quality = 1; price = 14000; };
	class Exile_Chopper_Orca_Black								{ quality = 1; price = 14000; };
	class Exile_Chopper_Orca_BlackCustom						{ quality = 1; price = 14000; };

	///////////////////////////////////////////////////////////////////////////////
	// Taru
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Transport_CSAT						{ quality = 1; price = 16000; };
	class Exile_Chopper_Taru_Transport_Black					{ quality = 1; price = 16000; };
	
	class Exile_Chopper_Taru_CSAT								{ quality = 1; price = 16400; };
	class Exile_Chopper_Taru_Black								{ quality = 1; price = 16400; };

	class Exile_Chopper_Taru_Covered_CSAT						{ quality = 1; price = 16800; };
	class Exile_Chopper_Taru_Covered_Black						{ quality = 1; price = 16800; };

	///////////////////////////////////////////////////////////////////////////////
	// Cessna
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Plane_Cessna									{ quality = 1; price = 4000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Beige						{ quality = 1; price = 1000; };
	class Exile_Car_Hatchback_Green						{ quality = 1; price = 1000; };
	class Exile_Car_Hatchback_Blue						{ quality = 1; price = 1000; };
	class Exile_Car_Hatchback_BlueCustom				{ quality = 1; price = 1000; };
	class Exile_Car_Hatchback_BeigeCustom				{ quality = 1; price = 1000; };
	class Exile_Car_Hatchback_Yellow					{ quality = 1; price = 1000; };
	class Exile_Car_Hatchback_Grey						{ quality = 1; price = 1000; };
	class Exile_Car_Hatchback_Black						{ quality = 1; price = 1000; };
	class Exile_Car_Hatchback_Dark						{ quality = 1; price = 1000; };
	class Exile_Car_Hatchback_Rusty1					{ quality = 1; price = 900; };
	class Exile_Car_Hatchback_Rusty2					{ quality = 1; price = 900; };
	class Exile_Car_Hatchback_Rusty3					{ quality = 1; price = 900; };

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback (Sport)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Sport_Red					{ quality = 1; price = 1250; };
	class Exile_Car_Hatchback_Sport_Blue				{ quality = 1; price = 1250; };
	class Exile_Car_Hatchback_Sport_Orange				{ quality = 1; price = 1250; };
	class Exile_Car_Hatchback_Sport_White				{ quality = 1; price = 1250; };
	class Exile_Car_Hatchback_Sport_Beige				{ quality = 1; price = 1250; };
	class Exile_Car_Hatchback_Sport_Green				{ quality = 1; price = 1250; };

	///////////////////////////////////////////////////////////////////////////////
	// HEMMT
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_HEMMT 								{ quality = 1; price = 3000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hunter
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hunter 								{ quality = 1; price = 16000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ifrit
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ifrit 								{ quality = 1; price = 15000; };

	///////////////////////////////////////////////////////////////////////////////
	// Offroad
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Red							{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_Beige						{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_White						{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_Blue						{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_DarkRed						{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_BlueCustom					{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_Guerilla01					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla02					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla03					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla04					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla05					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla06					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla07					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla08					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla09					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla10					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla11					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Guerilla12					{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Rusty1						{ quality = 1; price = 2000; };
	class Exile_Car_Offroad_Rusty2						{ quality = 1; price = 2000; };
	class Exile_Car_Offroad_Rusty3						{ quality = 1; price = 2000; };

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Armed)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Armed_Guerilla01 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla02 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla03 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla04 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla05 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla06 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla07 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla08 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla09 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla10 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla11 			{ quality = 1; price = 5000; };
	class Exile_Car_Offroad_Armed_Guerilla12 			{ quality = 1; price = 5000; };

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Repair)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Repair_Civillian 			{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_Repair_Red 					{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_Repair_Beige 				{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_Repair_White 				{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_Repair_Blue 				{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_Repair_DarkRed 				{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_Repair_BlueCustom 			{ quality = 1; price = 2500; };
	class Exile_Car_Offroad_Repair_Guerilla01 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla02 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla03 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla04 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla05 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla06 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla07 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla08 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla09 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla10 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla11 			{ quality = 1; price = 2700; };
	class Exile_Car_Offroad_Repair_Guerilla12 			{ quality = 1; price = 2700; };

	///////////////////////////////////////////////////////////////////////////////
	// Strider
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Strider 							{ quality = 1; price = 18000; };

	///////////////////////////////////////////////////////////////////////////////
	// SUV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUV_Red 							{ quality = 1; price = 1500; };
	class Exile_Car_SUV_Black 							{ quality = 1; price = 1500; };
	class Exile_Car_SUV_Grey 							{ quality = 1; price = 1500; };
	class Exile_Car_SUV_Orange 							{ quality = 1; price = 1500; };

	///////////////////////////////////////////////////////////////////////////////
	// Tempest
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Tempest 							{ quality = 1; price = 4000; };

	///////////////////////////////////////////////////////////////////////////////
	// Van 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Black 							{ quality = 1; price = 2000; };
	class Exile_Car_Van_White 							{ quality = 1; price = 2000; };
	class Exile_Car_Van_Red 							{ quality = 1; price = 2000; };
	class Exile_Car_Van_Guerilla01 						{ quality = 1; price = 2300; };
	class Exile_Car_Van_Guerilla02 						{ quality = 1; price = 2300; };
	class Exile_Car_Van_Guerilla03 						{ quality = 1; price = 2300; };
	class Exile_Car_Van_Guerilla04 						{ quality = 1; price = 2300; };
	class Exile_Car_Van_Guerilla05 						{ quality = 1; price = 2300; };
	class Exile_Car_Van_Guerilla06 						{ quality = 1; price = 2300; };
	class Exile_Car_Van_Guerilla07 						{ quality = 1; price = 2300; };
	class Exile_Car_Van_Guerilla08 						{ quality = 1; price = 2300; };

	///////////////////////////////////////////////////////////////////////////////
	// Van (Box) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Box_Black 						{ quality = 1; price = 1900; };
	class Exile_Car_Van_Box_White 						{ quality = 1; price = 1900; };
	class Exile_Car_Van_Box_Red 						{ quality = 1; price = 1900; };
	class Exile_Car_Van_Box_Guerilla01 					{ quality = 1; price = 2000; };
	class Exile_Car_Van_Box_Guerilla02 					{ quality = 1; price = 2000; };
	class Exile_Car_Van_Box_Guerilla03 					{ quality = 1; price = 2000; };
	class Exile_Car_Van_Box_Guerilla04 					{ quality = 1; price = 2000; };
	class Exile_Car_Van_Box_Guerilla05 					{ quality = 1; price = 2000; };
	class Exile_Car_Van_Box_Guerilla06 					{ quality = 1; price = 2000; };
	class Exile_Car_Van_Box_Guerilla07 					{ quality = 1; price = 2000; };
	class Exile_Car_Van_Box_Guerilla08 					{ quality = 1; price = 2000; };

	///////////////////////////////////////////////////////////////////////////////
	// Van (Fuel) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Fuel_Black 						{ quality = 1; price = 4500; };
	class Exile_Car_Van_Fuel_White 						{ quality = 1; price = 4500; };
	class Exile_Car_Van_Fuel_Red 						{ quality = 1; price = 4500; };
	class Exile_Car_Van_Fuel_Guerilla01 				{ quality = 1; price = 4500; };
	class Exile_Car_Van_Fuel_Guerilla02 				{ quality = 1; price = 4500; };
	class Exile_Car_Van_Fuel_Guerilla03 				{ quality = 1; price = 4500; };

	///////////////////////////////////////////////////////////////////////////////
	// Zamak
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Zamak 								{ quality = 1; price = 3000; };
	
	///////////////////////////////////////////////////////////////////////////////
	//RHS
	///////////////////////////////////////////////////////////////////////////////

	///////////////////////////////////////////////////////////////////////////////
	// GAZ-233011
	///////////////////////////////////////////////////////////////////////////////
	class rhs_tigr_vdv									{ quality = 3; price = 5000; };
	class rhs_tigr_ffv_3camo_vdv						{ quality = 3; price = 5000; };


	///////////////////////////////////////////////////////////////////////////////
	// GAZ-66
	//////////////////////////////////////////////////////////////////////////////
	class rhs_gaz66_vmf									{ quality = 1; price = 2500; };
	class rhs_gaz66_ammo_vmf							{ quality = 1; price = 2500; };
	class rhs_gaz66_r142_vmf							{ quality = 1; price = 2500; };
	class rhs_gaz66_repair_vmf							{ quality = 1; price = 2500; };

	///////////////////////////////////////////////////////////////////////////////
	// HMVE
	//////////////////////////////////////////////////////////////////////////////
	class rhsusf_m1025_w								{ quality = 1; price = 5000; };
	class rhsusf_m1025_w_m2								{ quality = 1; price = 25000; };
	class rhsusf_m998_w_2dr								{ quality = 1; price = 5000; };
	class rhsusf_m998_w_4dr								{ quality = 1; price = 5000; };
	class rhsusf_m998_w_s_2dr_fulltop					{ quality = 1; price = 5000; };
	class rhsusf_m998_d_s_2dr_fulltop					{ quality = 1; price = 5000; };
	class rhsusf_m998_w_s_2dr_halftop					{ quality = 1; price = 5500; };
	class rhsusf_m998_d_s_2dr_halftop					{ quality = 1; price = 5500; };
	class rhsusf_m998_d_s_4dr_fulltop					{ quality = 1; price = 5000; };
	class rhsusf_m998_w_s_4dr_fulltop					{ quality = 1; price = 5000; };
	class rhsusf_m998_d_s_4dr_halftop					{ quality = 1; price = 5500; };
	class rhsusf_m998_w_s_4dr_halftop					{ quality = 1; price = 5500; };

	///////////////////////////////////////////////////////////////////////////////
	// M1078A1P2
	//////////////////////////////////////////////////////////////////////////////
	class rhsusf_M1078A1P2_wd_fmtv_usarmy				{ quality = 1; price = 4500; };
	class rhsusf_M1078A1P2_d_fmtv_usarmy				{ quality = 1; price = 4500; };
	class rhsusf_M1078A1P2_wd_open_fmtv_usarmy			{ quality = 1; price = 4500; };
	class rhsusf_M1078A1P2_d_open_fmtv_usarmy			{ quality = 1; price = 4500; };
	class rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy		{ quality = 1; price = 4500; };
	class rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy		{ quality = 1; price = 4500; };
	class rhsusf_M1078A1P2_B_d_fmtv_usarmy				{ quality = 1; price = 5000; };
	class rhsusf_M1078A1P2_B_wd_fmtv_usarmy				{ quality = 1; price = 5000; };
	class rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy		{ quality = 1; price = 4500; };
	class rhsusf_M1078A1P2_B_d_open_fmtv_usarmy			{ quality = 1; price = 4500; };
	class rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy		{ quality = 1; price = 4500; };
	class rhsusf_M1078A1P2_B_d_flatbed_fmtv_usarmy		{ quality = 1; price = 4500; };
	class rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy			{ quality = 1; price = 75500; };
	class rhsusf_M1078A1P2_B_M2_d_fmtv_usarmy			{ quality = 1; price = 75500; };
	class rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy		{ quality = 1; price = 75500; };
	class rhsusf_M1078A1P2_B_M2_d_open_fmtv_usarmy		{ quality = 1; price = 75500; };
	class rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy	{ quality = 1; price = 75500; };
	class rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy	{ quality = 1; price = 75500; };
	
	///////////////////////////////////////////////////////////////////////////////
	// RG-33
	//////////////////////////////////////////////////////////////////////////////
	class rhsusf_rg33_d									{ quality = 3; price = 20000; };
	class rhsusf_rg33_m2_d								{ quality = 3; price = 75500; };

	///////////////////////////////////////////////////////////////////////////////
	// UAZ
	//////////////////////////////////////////////////////////////////////////////
	class RHS_UAZ_MSV_01								{ quality = 1; price = 2000; };
	class rhs_uaz_open_MSV_01							{ quality = 1; price = 2000; };

	///////////////////////////////////////////////////////////////////////////////
	// URAL
	//////////////////////////////////////////////////////////////////////////////
	class RHS_Ural_Open_Civ_01							{ quality = 1; price = 2500; };
	class RHS_Ural_Open_Civ_02							{ quality = 1; price = 2500; };
	class RHS_Ural_Open_Civ_03							{ quality = 1; price = 2500; };
	class RHS_Ural_MSV_01								{ quality = 1; price = 3000; };
	class RHS_Ural_Fuel_MSV_01							{ quality = 1; price = 3000; };
	class RHS_Ural_Open_MSV_01							{ quality = 1; price = 3000; };

	///////////////////////////////////////////////////////////////////////////////
	// CH-47
	//////////////////////////////////////////////////////////////////////////////
	class RHS_CH_47F								{ quality = 1; price = 40000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ka-60
	//////////////////////////////////////////////////////////////////////////////
	class rhs_ka60_c								{ quality = 1; price = 14000; };
	class rhs_ka60_grey								{ quality = 1; price = 14000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ghosthawk
	//////////////////////////////////////////////////////////////////////////////
	class B_Heli_Transport_01_F						{ quality = 1; price = 60000; };

	///////////////////////////////////////////////////////////////////////////////
	// UH-60M
	//////////////////////////////////////////////////////////////////////////////
	class RHS_UH60M									{ quality = 1; price = 60000; };
	
};
class CfgExileCustomCode 
{

	/*
		You can overwrite every single file of our code without touching it.
		To do that, add the function name you want to overwrite plus the 
		path to your custom file here. If you wonder how this works, have a
		look at our bootstrap/fn_preInit.sqf function.

		Simply add the following scheme here:

		<Function Name of Exile> = "<New File Name>";

		Example:

		ExileClient_util_fusRoDah = "myaddon/myfunction.sqf";
	*/
	// Fix for Duping in 0.9.34 via combineMag, thermal scanner and matches
	//ExileClient_util_gear_repackMagazines = "overwrite\exile_client\code\ExileClient_util_gear_repackMagazines.sqf";
	/* // Exile 0.9.3.2 Crafting bugfix:
	ExileClient_object_item_craft = "fixes\ExileClient_object_item_craft.sqf";
	// Fixing no Loot near Territory's
	ExileClient_util_world_isTerritoryNearby = "overwrite\exile_client\code\ExileClient_util_world_isTerritoryNearby.sqf";
	
	// Fix Ghost bug:
	ExileClient_object_player_initialize = "fixes\ExileClient_object_player_initialize.sqf";
	
	//	Revert this to old "default" (much better/faster)
	ExileServer_system_network_event_onPlayerConnected = "fixes\ExileServer_system_network_event_onPlayerConnected.sqf";
	
	//	Now deconstruct works as intended and you get the item in a weaponholder if you deconstruct a construction.
	ExileServer_object_construction_network_deconstructConstructionRequest = "fixes\ExileServer_object_construction_network_deconstructConstructionRequest.sqf";
	
	//	Incase you add Tanks/Jets and whatever, this will Remove Weapons (and their magazines) from the vehicle on Purchase.
	ExileServer_object_vehicle_createPersistentVehicle = "fixes\ExileServer_object_vehicle_createPersistentVehicle.sqf";
	*/	
	//ExileServer_object_vehicle_createPersistentVehicle = "fixes\ ExileClient_object_player_event_onEnterSafezon.sqf";
	//ExileClient_object_player_event_onHandleDamage = "client\ExileClient_object_player_event_onHandleDamage.sqf";
	
};
class CfgExileMusic
{
	Ambient[] = {"ExileTrack03","ExileTrack04"};
	Combat[] = {"ExileTrack06","ExileTrack07"};
	Intro[] = {"ExileTrack02","ExileTrack03"};
};
class CfgFlags 
{
	class USA
	{
		name = "USA";
		texture = "\A3\Data_F\Flags\flag_us_co.paa";
		uid = "";
	};

	class YTUBE
	{
		name = "YouTube";
		texture = "Flags\flag_ytube.paa";
		uid = "";



	};
	class TWITCH
	{
		name = "Twitch";


		texture = "Flags\flag_twitch.paa";
		uid = "";
	};
	class SMAN
	{
		name = "Superman";
		texture = "Flags\flag_sman.paa";
		uid = "";
	};
	class SEGA
	{
		name = "SEGA";
		texture = "Flags\flag_sega.paa";
		uid = "";
	};
	class RAZOR
	{
		name = "Razor";
		texture = "Flags\flag_razor.paa";
		uid = "";
	};
	class KFC
	{
		name = "KFC";
		texture = "Flags\flag_kfc.paa";
		uid = "";
	};
	class KAPPA
	{
		name = "KAPPA";
		texture = "Flags\flag_kappa.paa";
		uid = "";
	};
	class INTEL
	{
		name = "INTEL";
		texture = "Flags\flag_intel.paa";
		uid = "";
	};
	class GOGL
	{
		name = "Google";
		texture = "Flags\flag_gogl.paa";
		uid = "";
	};
	class DAYZ
	{
		name = "DayZ";
		texture = "Flags\flag_dayz.paa";
		uid = "";
	};
	class MCD
	{
		name = "Mcdonalds";
		texture = "Flags\flag_bigmac.paa";
		uid = "";
	};
};
class CfgTerritories
{
	// Base Cost / Radius
	// Level 1 is allways for Pop Tabs, >= 2 for Respect
	prices[] = 
	{
		{5000,	15}, // Level 1
		{10000,	30}, // Level 2 
		{15000,	45}, // Level 3
		{20000,	60}, // Level 4
		{25000,	75}, // Level 5
		{30000,	90}, // Level 6
		{35000,	105}, // Level 7
		{40000,	120}, // Level 8
		{45000,	135}, // Level 9
		{50000,	150}  // Level 10
	};

	// A shortcut of the above maximum radius
	maximumRadius = 150;

	// The above * 2 plus coverving the 20m you can move while placing things
	minimumDistanceToOtherTerritories = 325; 

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

	// Defines the period in days where protection money needs to be payed.
	// Every time you pay the protection money, the "due date" will be
	// pro-longed by that period too.
	protectionPeriod = 10; 

	// Amount of pop tabs or respect per object to pay
	popTabAmountPerObject = 15;
	respectAmountPerObject = 5;
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
			"TRYK_ESS_CAP",
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
			"TRYK_US_ESS_Glasses_H",
			"TRYK_US_ESS_Glasses_Cover",
			"TRYK_Shemagh_shade_MESH",
			"TRYK_Shemagh_shade_N",
			"TRYK_Shemagh_shade_G_N",
			"TRYK_Shemagh_shade_WH_N",
			"TRYK_TAC_EARMUFF_SHADE",
			"TRYK_TAC_EARMUFF",
			"TRYK_NOMIC_TAC_EARMUFF",
			"TRYK_headset2",
			"TRYK_Kio_Balaclava",
			"TRYK_H_DELTAHELM_NV",
			"TRYK_V_tacv1_MSL_NV",
			"TRYK_V_tacv1LMSL_NV",
			"TRYK_V_tacv1LC_MSL_NV",
			"TRYK_US_ESS_Glasses_NV",
			"TRYK_US_ESS_Glasses_TAN_NV",
			"TRYK_Headphone_NV",
			"TRYK_HRPIGEAR_NV",
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
			"TRYK_ShemaghESSWH_NV",
			"TRYK_ESS_BLKTAN_NV",
			"TRYK_ESS_BLKBLK_NV",
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
			"TRYK_G_Shades_Black_NV",
			"TRYK_G_Shades_Blue_NV",
			"TRYK_G_bala_ess_NV",
			"TRYK_bandana_NV",
			"TRYK_SPgearG_NV",
			"TRYK_SPgear_PHC1_NV",
			"TRYK_SPgear_PHC2_NV",
			"TRYK_G_bala_wh_NV",
			"TRYK_ESS_wh_NV",
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
			"TRYK_HRP_UCP",
			"TRYK_HRP_USMC",
			"TRYK_HRP_khk",
			"TRYK_Hrp_vest_ucp",
			"TRYK_Hrp_vest_od",
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
			"TRYK_H_Helmet_JSDF",
			"TRYK_H_Helmet_CC",
			"TRYK_H_Helmet_WOOD",
			"TRYK_H_Helmet_ACU",
			"TRYK_H_Helmet_MARPAT_Wood",
			"TRYK_H_Helmet_MARPAT_Desert",
			"TRYK_H_Helmet_MARPAT_Desert2",
			"TRYK_H_Helmet_3C",
			"TRYK_H_Booniehat_JSDF",
			"TRYK_H_Booniehat_3CD",
			"TRYK_H_Booniehat_CC",
			"TRYK_H_Booniehat_WOOD",
			"TRYK_H_Booniehat_MARPAT_WOOD",
			"TRYK_H_Booniehat_MARPAT_Desert",
			"TRYK_H_Booniehat_AOR1",
			"TRYK_H_Booniehat_AOR2",
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
			"TRYK_H_ghillie_top_headless3",
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
			"TRYK_V_tacv1LC_MSL_BK",
			"TRYK_V_tacv1LMSL_BK",
			"TRYK_U_B_PCUHsW",
			"TRYK_U_B_PCUHsW2",
			"TRYK_U_B_PCUHsW3",
			"TRYK_U_B_PCUHsW3nh",
			"TRYK_U_B_PCUHsW4",
			"TRYK_U_B_PCUHsW5",
			"TRYK_U_B_PCUHsW6",
			"TRYK_LOC_AK_chestrig_OD",
			"TRYK_LOC_AK_chestrig_TAN",
			"TRYK_H_Helmet_Winter",
			"TRYK_H_Helmet_Winter_2"
			
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
			//RHS
			"rhs_6sh92_headset",
			"rhs_6sh92_radio",
			"rhs_6sh92_vog",
			"rhs_6sh92_vog_headset",
			"rhs_vydra_3m",
			"rhs_6sh92_digi",
			"rhs_6b13_6sh92_vog",
			"rhs_6b13_6sh92_radio",
			"rhs_6b23_digi_6sh92_vog_headset",
			"rhs_6b13_Flora",
			"rhs_6b13_Flora_6sh92",
			"rhs_6b13_Flora_6sh92_headset_mapcase",
			"rhs_6b13_Flora_6sh92_vog",
			"rhs_6b13_Flora_crewofficer",
			"rhs_6b23",
			"rhs_6b23_6sh92",
			"rhs_6b23_6sh92_headset",
			"rhs_6b23_6sh92_headset_mapcase",
			"rhs_6b23_6sh92_radio",
			"rhs_6b23_6sh92_vog",
			"rhs_6b23_6sh92_vog_headset",
			"rhs_6b23_crew",
			"rhs_6b23_engineer",
			"rhs_6b23_rifleman",
			"rhs_6b23_sniper",
			"rhs_6b23_ML",
			"rhs_6b23_ML_6sh92",
			"rhs_6b23_ML_6sh92_headset",
			"rhs_6b23_ML_6sh92_headset_mapcase",
			"rhs_6b23_ML_6sh92_radio",
			"rhs_6b23_ML_6sh92_vog",
			"rhs_6b23_ML_6sh92_vog_headset",
			"rhs_6b23_ML_crewofficer",
			"rhs_6b23_ML_crew",
			"rhs_6b23_ML_engineer",
			"rhs_6b23_ML_rifleman",
			"rhs_6b23_ML_sniper",
			"rhs_6sh46",
			"rhsusf_iotv_ocp",
			"rhsusf_iotv_ucp",
			"rhsusf_iotv_ocp_Medic",
			"rhsusf_iotv_ucp_Medic",
			"rhsusf_iotv_ocp_Repair",
			"rhsusf_iotv_ucp_Repair",
			"rhsusf_iotv_ocp_Rifleman",
			"rhsusf_iotv_ucp_Rifleman",
			"rhsusf_iotv_ocp_SAW",
			"rhsusf_iotv_ucp_SAW",
			"rhsusf_iotv_ocp_Squadleader",
			"rhsusf_iotv_ucp_Squadleader",
			"rhsusf_iotv_ocp_Teamleader",
			"rhsusf_iotv_ucp_Teamleader",
			"rhsusf_iotv_ocp_Grenadier",
			"rhsusf_iotv_ucp_Grenadier"
			
		};
	};

	class Headgear 
	{
		name = "Headgear";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\headgear_ca.paa";
		items[] =
		{
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
			"rhs_6b27m_digi",
			"rhs_6b27m_digi_bala",
			"rhs_6b27m_digi_ess",
			"rhs_6b27m_digi_ess_bala",
			"rhs_6b27m",
			"rhs_6b27m_ess",
			"rhs_6b27m_bala",
			"rhs_6b27m_ess_bala",

			"rhs_6b27m_ml",
			"rhs_6b27m_ml_bala",
			"rhs_6b27m_ml_ess",
			"rhs_6b27m_ML_ess_bala"
		};
	};


	class PointerAttachments 
	{
		name = "Pointer Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"acc_flashlight",
			"acc_pointer_IR",
			
			// CUP Pointer Attachments

			"CUP_acc_ANPEQ_15",
			"CUP_acc_ANPEQ_2",
			"CUP_acc_ANPEQ_2_camo",
			"CUP_acc_ANPEQ_2_desert",
			"CUP_acc_ANPEQ_2_grey",
			"CUP_acc_Flashlight",
			"CUP_acc_Flashlight_wdl",
			"CUP_acc_Flashlight_desert",
			"CUP_acc_XM8_light_module",
			"CUP_acc_Glock17_Flashlight",
			
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
			//RHS
			"rhsusf_acc_harris_bipod"
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
			// CUP Muzzle Attachments

			"CUP_muzzle_snds_AWM",
			"CUP_muzzle_PBS4",
			"CUP_muzzle_PB6P9",
			"CUP_muzzle_Bizon",
			"CUP_muzzle_snds_G36_black",
			"CUP_muzzle_snds_G36_desert",
			"CUP_muzzle_snds_L85",
			"CUP_muzzle_snds_M14",
			"CUP_muzzle_snds_M16_camo",
			"CUP_muzzle_snds_M16",
			"CUP_muzzle_snds_M9",
			"CUP_muzzle_snds_MicroUzi",
			"CUP_muzzle_snds_XM8",
			"CUP_muzzle_snds_SCAR_L",
			"CUP_muzzle_snds_SCAR_H",
			//RHS			
			"rhsusf_acc_rotex5_grey",
			"rhsusf_acc_rotex5_tan",
			"rhsusf_acc_nt4_black",
			"rhsusf_acc_nt4_tan",
			"rhsusf_acc_SF3P556",
			"rhsusf_acc_SFMB556",
			"rhsusf_acc_SR25S",
			"rhsusf_acc_M2010S",
			"rhs_acc_dtk4short",
			"rhs_acc_dtk4long",
			"rhs_acc_dtk4screws",
			"rhs_acc_tgpa",
			"rhs_acc_pbs1",
			"rhs_acc_dtk3",
			"rhs_acc_dtk1",
			"rhs_acc_dtk",
			"rhs_acc_dtk1l",
			"rhs_acc_ak5",
		};
	};

	class UAVs
	{
		name = "Unmanned Aerial Vehicles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\gps_ca.paa";
		items[] = 
		{
			"I_UavTerminal",
			"I_UAV_01_backpack_F"
		};
	};

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
			
			// CUP Optic Attachments

			"CUP_optic_Kobra",
			"CUP_optic_HoloBlack",
			"CUP_optic_HoloDesert",
			"CUP_optic_Eotech533",
			"CUP_optic_Eotech533Grey",
			"CUP_optic_CompM4",
			"CUP_optic_CompM2_Black",
			"CUP_optic_CompM2_Woodland",
			"CUP_optic_CompM2_Woodland2",
			"CUP_optic_CompM2_Desert",
			"CUP_optic_TrijiconRx01_desert",
			"CUP_optic_TrijiconRx01_black",
			"CUP_optic_SB_11_4x20_PM",
			"CUP_optic_ZDDot",
			"CUP_optic_MRad",
			"CUP_optic_RCO",
			"CUP_optic_RCO_desert",
			"CUP_optic_ACOG",
			"CUP_optic_SUSAT",
			"CUP_optic_ElcanM145",
			"CUP_optic_ELCAN_SpecterDR",
			//"CUP_optic_CWS",
			"CUP_optic_PSO_1",
			"CUP_optic_PSO_3",
			//RHS			
			"rhsusf_acc_eotech_552",
			"rhsusf_acc_LEUPOLDMK4",
			"rhsusf_acc_ELCAN",
			"rhsusf_acc_ELCAN_pip",
			"rhsusf_acc_ACOG",
			"rhsusf_acc_ACOG_pip",
			"rhs_acc_1pn93_2",
			"rhsusf_acc_ACOG2",
			"rhsusf_acc_ACOG_USMC",
			"rhsusf_acc_ACOG2_USMC",
			"rhsusf_acc_ACOG3_USMC",
			"rhsusf_acc_LEUPOLDMK4_2",
			"rhsusf_acc_EOTECH",
			"rhs_acc_1p29",
			"rhs_acc_1p78",
			"rhs_acc_pkas",
			"rhs_acc_1p63",
			"rhs_acc_ekp1",
			"rhs_acc_pso1m2",
			"rhs_acc_pgo7v",
			"rhs_acc_1pn93_1",

			"CUP_optic_SB_3_12x50_PMII",
			"CUP_optic_LeupoldMk4",
			"CUP_optic_Leupold_VX3",
			"CUP_optic_LeupoldM3LR",
			"CUP_optic_LeupoldMk4_10x40_LRT_Desert",
			"CUP_optic_LeupoldMk4_10x40_LRT_Woodland",
			"CUP_optic_LeupoldMk4_CQ_T",
			"CUP_optic_LeupoldMk4_MRT_tan",
			"CUP_optic_PechenegScope",

			//"CUP_optic_AN_PAS_13c1",
			//"CUP_optic_AN_PAS_13c2",
			//"CUP_optic_GOSHAWK",
			//"CUP_optic_AN_PVS_10",
			//"CUP_optic_AN_PVS_4",
			//"CUP_optic_NSPU"
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
			"Exile_Item_CodeLock"
		};
	};

	class Food 
	{
		name = "Fast Food";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_GloriousKnakworst",
			"Exile_Item_SausageGravy",
			"Exile_Item_ChristmasTinner",
			"Exile_Item_BBQSandwich",
			"Exile_Item_Surstromming",
			"Exile_Item_Catfood"
		};
	};

	class Drinks 
	{
		name = "Drinks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_PlasticBottleFreshWater",
			"Exile_Item_Beer",
			"Exile_Item_Energydrink"
		};
	};

	class Tools
	{
		name = "Tools";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Melee_Axe",
			"Exile_Item_Matches",
			"Exile_Item_CookingPot",
			"Binocular",
			"Rangefinder",
			//"Laserdesignator",
			//"Laserdesignator_02",
			//"Laserdesignator_03",
			"NVGoggles",
			"NVGoggles_INDEP",
			"NVGoggles_OPFOR",
			"ItemGPS",
			"ItemMap",
			"ItemCompass",
			"ItemRadio",
			"ItemWatch",
			"Exile_Item_XM8"
		};
	};

	class FirstAid
	{
		name = "FirstAid";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Item_InstaDoc"
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
			"V_RebreatherIR"		
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
			//RHS			
			"rhs_mag_30Rnd_556x45_M855A1_Stanag",
			"rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",
			"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
			"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green",
			"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",
			"rhs_mag_30Rnd_556x45_Mk318_Stanag",
			"rhs_mag_30Rnd_556x45_Mk262_Stanag",
			"rhs_200rnd_556x45_M_SAW",
			"rhs_200rnd_556x45_B_SAW",
			"rhs_200rnd_556x45_T_SAW",
			"rhsusf_20Rnd_762x51_m993_Mag",
			"rhsusf_5Rnd_300winmag_xm2010",
			"rhsusf_8Rnd_00Buck",
			//"rhsusf_8Rnd_Slug",
			"rhsusf_100Rnd_556x45_soft_pouch",
			"rhsusf_100Rnd_762x51",
			"rhs_30Rnd_545x39_AK",
			"rhs_30Rnd_545x39_AK_no_tracers",
			"rhs_30Rnd_545x39_AK_green",
			"rhs_30Rnd_545x39_7N10_AK",
			"rhs_30Rnd_545x39_7N22_AK",
			"rhs_45Rnd_545X39_7N22_AK",
			"rhs_45Rnd_545X39_7N10_AK",
			"rhs_45Rnd_545X39_AK_Green",
			"rhs_45Rnd_545X39_AK",
			"rhs_100Rnd_762x54mmR",
			"rhs_100Rnd_762x54mmR_green",
			"rhs_30Rnd_762x39mm",
			"rhs_30Rnd_762x39mm_tracer",
			"rhs_10Rnd_762x54mmR_7N1",
			
			// CUP Backpacks

			"CUP_B_USPack_Coyote",
			"CUP_B_USPack_Black",
			"CUP_B_ACRPara_m95",
			"CUP_B_ACRScout_m95",
			"CUP_B_CivPack_WDL",
			"CUP_B_RPGPack_Khaki",
			"CUP_B_AlicePack_Khaki",
			"CUP_B_AssaultPack_ACU",
			"CUP_B_AssaultPack_Coyote",
			"CUP_B_AssaultPack_Black",
			"CUP_B_MedicPack_ACU",
			"CUP_B_Bergen_BAF",
			"CUP_B_USMC_AssaultPack",
			"CUP_B_USMC_MOLLE",
			"CUP_B_USMC_MOLLE_WDL"
		};
	};

	class Ammunition
	{
		name = "Ammunition";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"100Rnd_65x39_caseless_mag",
			"100Rnd_65x39_caseless_mag_Tracer",
			"10Rnd_127x54_Mag",
			"10Rnd_338_Mag",
			"10Rnd_762x54_Mag",
			"10Rnd_93x64_DMR_05_Mag",
			"11Rnd_45ACP_Mag",
			"130Rnd_338_Mag",
			"150Rnd_762x54_Box",
			"150Rnd_762x54_Box_Tracer",
			"150Rnd_93x64_Mag",
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
			"5Rnd_127x108_APDS_Mag",
			"5Rnd_127x108_Mag",
			"6Rnd_45ACP_Cylinder",
			"6Rnd_GreenSignal_F",
			"6Rnd_RedSignal_F",
			"7Rnd_408_Mag",
			"9Rnd_45ACP_Mag",
			
			// CUP Ammunition

			"CUP_30Rnd_545x39_AK_M",
			"CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_White_Tracer_545x39_AK_M",
			"CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M",
			"CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",

			"CUP_20Rnd_556x45_Stanag",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_30Rnd_556x45_G36",
			"CUP_30Rnd_TE1_Red_Tracer_556x45_G36",
			"CUP_30Rnd_TE1_Green_Tracer_556x45_G36",
			"CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36",
			"CUP_100Rnd_556x45_BetaCMag",
			"CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag",
			"CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag",
			"CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag",
			"CUP_100Rnd_TE4_Green_Tracer_556x45_M249",
			"CUP_100Rnd_TE4_Red_Tracer_556x45_M249",
			"CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249",
			"CUP_200Rnd_TE4_Green_Tracer_556x45_M249",
			"CUP_200Rnd_TE4_Red_Tracer_556x45_M249",
			"CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249",
			"CUP_200Rnd_TE1_Red_Tracer_556x45_M249",
			"CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1",
			"CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1",
			"CUP_200Rnd_TE4_Yellow_Tracer_556x45_L110A1",

			"CUP_10x_303_M",

			"CUP_30Rnd_Sa58_M",
			"CUP_30Rnd_Sa58_M_TracerG",
			"CUP_30Rnd_762x39_AK47_M",

			"CUP_5Rnd_762x51_M24",
			"CUP_5x_22_LR_17_HMR_M",
			"CUP_10Rnd_762x51_CZ750",
			"CUP_10Rnd_762x51_CZ750_Tracer",
			"CUP_20Rnd_762x51_FNFAL_M",
			"CUP_20Rnd_762x51_DMR",
			"CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Red_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",
			"CUP_20Rnd_TE1_White_Tracer_762x51_DMR",
			"CUP_20Rnd_762x51_B_SCAR",
			"CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR",
			"CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR",
			"CUP_20Rnd_TE1_White_Tracer_762x51_SCAR",
			"CUP_20Rnd_762x51_B_M110",
			"CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110",
			"CUP_20Rnd_TE1_Red_Tracer_762x51_M110",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_M110",
			"CUP_20Rnd_TE1_White_Tracer_762x51_M110",
			"CUP_20Rnd_762x51_CZ805B",
			"CUP_20Rnd_TE1_Yellow_Tracer_762x51_CZ805B",
			"CUP_20Rnd_TE1_Red_Tracer_762x51_CZ805B",
			"CUP_20Rnd_TE1_Green_Tracer_762x51_CZ805B",
			"CUP_20Rnd_TE1_White_Tracer_762x51_CZ805B",
			"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M",
			"CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",
			"CUP_200Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M",
			"CUP_200Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",

			"CUP_10Rnd_762x54_SVD_M",
			"CUP_50Rnd_UK59_762x54R_Tracer",
			"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",

			"CUP_10Rnd_B_765x17_Ball_M",
			"CUP_20Rnd_B_765x17_Ball_M",

			"CUP_5Rnd_86x70_L115A1",

			"CUP_8Rnd_9x18_Makarov_M",
			"CUP_8Rnd_9x18_MakarovSD_M",

			"CUP_10Rnd_9x19_Compact",
			"CUP_15Rnd_9x19_M9",
			"CUP_17Rnd_9x19_glock17",
			"CUP_18Rnd_9x19_Phantom",
			"CUP_30Rnd_9x19_EVO",
			"CUP_30Rnd_9x19_UZI",
			"CUP_30Rnd_9x19_MP5",
			"CUP_64Rnd_9x19_Bizon_M",
			"CUP_64Rnd_Green_Tracer_9x19_Bizon_M",
			"CUP_64Rnd_Red_Tracer_9x19_Bizon_M",
			"CUP_64Rnd_White_Tracer_9x19_Bizon_M",
			"CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M",

			"16Rnd_9x21_Mag",
			"30Rnd_9x21_Mag",

			"CUP_10Rnd_9x39_SP5_VSS_M",
			"CUP_20Rnd_9x39_SP5_VSS_M",

			"CUP_6Rnd_45ACP_M",
			"CUP_7Rnd_45ACP_1911",

			"CUP_5Rnd_127x99_as50_M",
			"CUP_10Rnd_127x99_M107",

			"CUP_5Rnd_127x108_KSVK_M",

			"CUP_8Rnd_B_Saiga12_74Slug_M",
			"CUP_8Rnd_B_Saiga12_74Pellets_M",
			"CUP_8Rnd_B_Beneli_74Slug",
			"CUP_8Rnd_B_Beneli_74Pellets",

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
			// CUP Pistols

			"CUP_hgun_Colt1911",
			"CUP_hgun_Compact",
			"CUP_hgun_Duty",
			"CUP_hgun_Phantom",
			"CUP_hgun_M9",
			"CUP_hgun_Makarov",
			"CUP_hgun_PB6P9",
			"CUP_hgun_SA61",
			"CUP_hgun_MicroUzi",
			"CUP_hgun_TaurusTracker455"
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
			// CUP Sub Machine Guns

			"CUP_smg_bizon",
			"CUP_smg_EVO",

			"CUP_smg_MP5SD6",
			"CUP_smg_MP5A5",

			"CUP_sgun_M1014",
			"CUP_sgun_Saiga12K"
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
			"LMG_Mk200_F",
			"LMG_Zafir_F",
			"MMG_01_hex_F",
			"MMG_01_tan_F",
			"MMG_02_black_F",
			"MMG_02_camo_F",
			"MMG_02_sand_F",
			//RHS			
			"rhs_weap_m240B",
			"rhs_weap_m240G",
			"rhs_weap_m240B_CAP",
			"rhs_weap_m249_pip_L",
			"rhs_weap_m249_pip_L_para",
			"rhs_weap_m249_pip_L_vfg",
			"rhs_weap_m249_pip_S",
			"rhs_weap_m249_pip_S_para",
			"rhs_weap_m249_pip_S_vfg",
			"rhs_weap_pkp",
			"rhs_weap_pkm",
			// CUP Light Machine Guns

			"CUP_arifle_RPK74",
			"CUP_arifle_RPK74M",
			"CUP_arifle_RPK74_45",
			"CUP_arifle_L86A2",
			"CUP_arifle_MG36",
			"CUP_arifle_MG36_camo",
	
			"CUP_lmg_Pecheneg",
			"CUP_lmg_PKM",
			"CUP_lmg_UK59",
			"CUP_lmg_L110A1",
			"CUP_lmg_L7A2",
			"CUP_lmg_M249",
			"CUP_lmg_M240",
			"CUP_lmg_M60A4",
			"CUP_lmg_Mk48_des",
			"CUP_lmg_Mk48_wdl"
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
			//RHS
			"rhs_weap_m4",
			"rhs_weap_m4_grip",
			"rhs_weap_m4_grip2",
			"rhs_weap_m4_carryhandle",
			"rhs_weap_m4_carryhandle_pmag",
			"rhs_weap_m4_m320",
			"rhs_weap_m4_m203",
			"rhs_weap_m4a1",
			"rhs_weap_m4a1_carryhandle",
			"rhs_weap_m4a1_carryhandle_pmag",
			"rhs_weap_m4a1_m320",
			"rhs_weap_m4a1_m203",
			"rhs_weap_m4a1_carryhandle_m203",
			"rhs_weap_m4a1_blockII",
			"rhs_weap_m4a1_blockII_KAC",
			"rhs_weap_m4a1_blockII_grip2",
			"rhs_weap_m4a1_blockII_grip2_KAC",
			"rhs_weap_m4a1_blockII_M203",
			"rhs_weap_m4a1_grip",
			"rhs_weap_m4a1_grip2",
			"rhs_weap_m4a1_carryhandle_grip2",
			"rhs_weap_m16a4",
			"rhs_weap_m16a4_carryhandle",
			"rhs_weap_m16a4_carryhandle_pmag",
			"rhs_weap_m16a4_grip",
			"rhs_weap_m16a4_carryhandle_grip",
			"rhs_weap_m16a4_carryhandle_grip_pmag",
			"rhs_weap_m16a4_carryhandle_M203",
			"rhs_weap_mk18",
			"rhs_weap_mk18_KAC",
			"rhs_weap_mk18_grip2",
			"rhs_weap_mk18_grip2_KAC",
			"rhs_weap_mk18_m320",
			"rhs_weap_M590_5RD",
			"rhs_weap_M590_8RD",
			"rhs_weap_ak74m",
			"rhs_weap_ak74m_camo",
			"rhs_weap_ak74m_npz",
			"rhs_weap_ak74m_desert_npz",
			"rhs_weap_ak74m_folded",
			"rhs_weap_ak74m_camo_folded",
			"rhs_weap_ak74m_desert_folded",
			"rhs_weap_ak74m_plummag_folded",
			"rhs_weap_ak74m_2mag",
			"rhs_weap_ak74m_2mag_npz",
			"rhs_weap_ak74m_2mag_camo",
			"rhs_weap_ak74m_desert",
			"rhs_weap_ak74m_plummag",
			"rhs_weap_ak74m_plummag_npz",
			"rhs_weap_ak74m_gp25",
			"rhs_weap_akm",
			"rhs_weap_akm_gp25",
			"rhs_weap_akms",
			"rhs_weap_akms_gp25",
			"rhs_weap_ak103",
			"rhs_weap_ak103_npz",
			"rhs_weap_ak103_1",
			// CUP Assault Rifles

			"CUP_arifle_AK74",
			"CUP_arifle_AK74M",
			"CUP_arifle_AKS",
			"CUP_arifle_AKS74",
			"CUP_arifle_AKS_Gold",
			"CUP_arifle_AKS74U",
			"CUP_arifle_AK107",
			"CUP_arifle_AKM",
			"CUP_arifle_CZ805_A1",
			"CUP_arifle_CZ805_A2",
			"CUP_arifle_CZ805_B",
			"CUP_arifle_FNFAL_railed",
			"CUP_arifle_FNFAL",
			"CUP_arifle_G36A",
			"CUP_arifle_G36A_camo",
			"CUP_arifle_G36K",
			"CUP_arifle_G36K_camo",
			"CUP_arifle_G36C",
			"CUP_arifle_G36C_camo",
			"CUP_arifle_L85A2",
			"CUP_arifle_M16A2",
			"CUP_arifle_M4A1",
			"CUP_arifle_M4A1_camo",
			"CUP_arifle_M4A1_black",
			"CUP_arifle_M4A1_desert",
			"CUP_arifle_Sa58P",
			"CUP_arifle_Sa58P_des",
			"CUP_arifle_Sa58V",
			"CUP_arifle_Sa58RIS1",
			"CUP_arifle_Sa58RIS2",
			"CUP_arifle_Sa58RIS1_des",
			"CUP_arifle_Sa58RIS2_camo",
			"CUP_arifle_Mk16_STD",
			"CUP_arifle_Mk16_CQC",
			"CUP_arifle_Mk16_SV",
			"CUP_arifle_Mk17_CQC",
			"CUP_arifle_Mk17_STD",
			"CUP_arifle_Mk20",
			"CUP_arifle_XM8_Carbine",
			"CUP_arifle_xm8_sharpshooter",
			"CUP_arifle_XM8_Compact",
			"CUP_arifle_XM8_Compact_Rail",
			"CUP_arifle_XM8_Railed",
			"CUP_arifle_XM8_Carbine_FG"	
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
			//RHS			
			"rhs_weap_m14ebrri",
			"rhs_weap_sr25",
			"rhs_weap_sr25_ec",
			"rhsusf_acc_SR25S",
			"rhsusf_acc_M2010S",
			"rhs_weap_XM2010",
			"rhs_weap_XM2010_d",
			"rhs_weap_XM2010_wd",
			"rhs_weap_XM2010_sa",
			"rhs_weap_svd",
			"rhs_weap_svdp_npz",
			"rhs_weap_svdp_wd",
			"rhs_weap_svdp_wd_npz",
			"rhs_weap_svds",
			"rhs_weap_svds_npz",
			// CUP Sniper Rifles

			"CUP_srifle_AWM_des",
			"CUP_srifle_AWM_wdl",

			"CUP_srifle_CZ550",
			"CUP_srifle_CZ750",

			"CUP_srifle_DMR",
			"CUP_srifle_M14",
			"CUP_srifle_M24_des",
			"CUP_srifle_M24_wdl",
			"CUP_srifle_M40A3",
			"CUP_srifle_M110",
			"CUP_srifle_SVD",
			"CUP_srifle_SVD_des",
			"CUP_srifle_VSSVintorez",
			"CUP_srifle_LeeEnfield",
			//"CUP_srifle_AS50",
			"CUP_srifle_ksvk",
			"CUP_srifle_M107_Base"	
		};
	};

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
			"Exile_Car_Hatchback_Rusty1",
			"Exile_Car_Hatchback_Rusty2",
			"Exile_Car_Hatchback_Rusty3",
			"Exile_Car_Hatchback_Sport_Red",
			"Exile_Car_SUV_Red",
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",
			"Exile_Car_Offroad_Repair_Civillian",
			"Exile_Car_Offroad_Armed_Guerilla01",
			"Exile_Car_Strider",
			"Exile_Car_Hunter",
			"Exile_Car_Ifrit",
			//RHS
			"rhs_tigr_vdv",
			"rhs_tigr_ffv_3camo_vdv",
			"rhsusf_m1025_w",
			"rhsusf_m1025_w_m2",
			"rhsusf_m998_w_2dr",
			"rhsusf_m998_w_4dr",
			"rhsusf_m998_w_s_2dr_fulltop",
			"rhsusf_m998_d_s_2dr_fulltop",
			"rhsusf_m998_w_s_2dr_halftop",
			"rhsusf_m998_d_s_2dr_halftop",
			"rhsusf_m998_d_s_4dr_fulltop",
			"rhsusf_m998_w_s_4dr_fulltop",
			"rhsusf_m998_d_s_4dr_halftop",
			"rhsusf_m998_w_s_4dr_halftop",
			"rhsusf_rg33_d",
			"rhsusf_rg33_m2_d",
			"RHS_UAZ_MSV_01",
			"rhs_uaz_open_MSV_01",
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
			"Exile_Car_Zamak",
			"Exile_Car_Tempest",
			"Exile_Car_HEMMT",
			//RHS
			"rhs_gaz66_vmf",
			"rhs_gaz66_ammo_vmf",
			"rhs_gaz66_r142_vmf",
			"rhs_gaz66_repair_vmf",
			"rhsusf_M1078A1P2_wd_fmtv_usarmy",
			"rhsusf_M1078A1P2_d_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_d_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_wd_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_M2_d_fmtv_usarmy",
			"rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy",
			"rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy",
			"rhsusf_M1078A1P2_wd_open_fmtv_usarmy",
			"rhsusf_M1078A1P2_d_open_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_d_flatbed_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_d_open_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_M2_wd_open_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_M2_d_open_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_M2_wd_flatbed_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_M2_d_flatbed_fmtv_usarmy",
			"RHS_Ural_Open_Civ_01",
			"RHS_Ural_MSV_01",
			"RHS_Ural_Open_Civ_02",
			"RHS_Ural_Open_Civ_03",
			"RHS_Ural_Fuel_MSV_01",
			"RHS_Ural_Open_MSV_01",
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
			"Exile_Chopper_Taru_Black",
			"Exile_Chopper_Taru_Covered_Black",
			"Exile_Chopper_Taru_Transport_Black",
			"Exile_Chopper_Orca_BlackCustom",
			"Exile_Chopper_Mohawk_FIA",
			"Exile_Chopper_Huron_Black",
			//"Exile_Chopper_Hellcat_Green",
			"I_Heli_light_03_unarmed_F",
			//RHS
			"RHS_CH_47F",
			"rhs_ka60_c",
			"rhs_ka60_grey",
			"RHS_UH60M"
			
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
			"Exile_Boat_SDV_Grey"
		};
	};

	class Planes
	{
		name = "Planes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Plane_Cessna"
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
			"MuzzleAttachments",
			"OpticAttachments",
			"Ammunition",
			"Pistols",
			"SubMachineGuns",
			"LightMachineGuns",
			"AssaultRifles",
			"SniperRifles"
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
			"Flares",
			"Smokes",
			"UAVs",
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
			"Uniforms",
			"Vests",
			"Backpacks",
			"Tools",
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
			"Hardware"
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
			"Trucks"
		};
	};

	/**
	 * Sells choppers and planes
	 */
	/** */
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
//			{"Exile_Bike_QuadBike_Black",		100},
			{"Exile_Bike_QuadBike_Blue",		100},
			{"Exile_Bike_QuadBike_Red",			100},
			{"Exile_Bike_QuadBike_White",		100},
			{"Exile_Bike_QuadBike_Nato",		150},
			{"Exile_Bike_QuadBike_Csat",		150},
			{"Exile_Bike_QuadBike_Fia",			150},
			{"Exile_Bike_QuadBike_Guerilla01",	150},
			{"Exile_Bike_QuadBike_Guerilla02",	150}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// MOTOR BOATS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_MotorBoat_Abstract
	{
		skins[] = 
		{
			{"Exile_Boat_MotorBoat_Police",		350},
			{"Exile_Boat_MotorBoat_Orange",		300},
			{"Exile_Boat_MotorBoat_White",		300}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// RUBBER DUCKS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_RubberDuck_Abstract
	{
		skins[] = 
		{
			{"Exile_Boat_RubberDuck_CSAT",		200},
			{"Exile_Boat_RubberDuck_Digital",	200},
			{"Exile_Boat_RubberDuck_Orange",	150},
			{"Exile_Boat_RubberDuck_Blue",		150},
			{"Exile_Boat_RubberDuck_Black",		150}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// SDV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_SDV_Abstract
	{
		skins[] = 
		{
			{"Exile_Boat_SDV_CSAT",		200},
			{"Exile_Boat_SDV_Digital",	200},
			{"Exile_Boat_SDV_Grey",		100}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hellcat
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hellcat_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Hellcat_Green", 350},
			{"Exile_Chopper_Hellcat_FIA", 	500}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Karts
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Kart_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Kart_BluKing", 				100},	
			{"Exile_Car_Kart_RedStone", 			100},
			{"Exile_Car_Kart_Vrana", 				100},	
			{"Exile_Car_Kart_Green", 				100},	
			{"Exile_Car_Kart_Blue", 				100},	
			{"Exile_Car_Kart_Orange", 				100},	
			{"Exile_Car_Kart_White", 				100},	
			{"Exile_Car_Kart_Yellow", 				100},	
			{"Exile_Car_Kart_Black", 				100}	
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hummingbird (Civillian)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hummingbird_Civillian_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Hummingbird_Civillian_Blue", 		350},
			{"Exile_Chopper_Hummingbird_Civillian_Red", 		350},
			{"Exile_Chopper_Hummingbird_Civillian_ION", 		350},
			{"Exile_Chopper_Hummingbird_Civillian_BlueLine", 	350},
			{"Exile_Chopper_Hummingbird_Civillian_Digital", 	350},
			{"Exile_Chopper_Hummingbird_Civillian_Elliptical", 	350},
			{"Exile_Chopper_Hummingbird_Civillian_Furious", 	350},
			{"Exile_Chopper_Hummingbird_Civillian_GrayWatcher", 350},
			{"Exile_Chopper_Hummingbird_Civillian_Jeans", 		350},
			{"Exile_Chopper_Hummingbird_Civillian_Light", 		350},
			{"Exile_Chopper_Hummingbird_Civillian_Shadow", 		350},
			{"Exile_Chopper_Hummingbird_Civillian_Sheriff", 	350},
			{"Exile_Chopper_Hummingbird_Civillian_Speedy", 		350},
			{"Exile_Chopper_Hummingbird_Civillian_Sunset", 		350},
			{"Exile_Chopper_Hummingbird_Civillian_Vrana", 		350},
			{"Exile_Chopper_Hummingbird_Civillian_Wasp", 		350},
			{"Exile_Chopper_Hummingbird_Civillian_Wave", 		350}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Huron
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huron_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Huron_Black", 	450},
			{"Exile_Chopper_Huron_Green", 	450}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Orca
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Orca_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Orca_CSAT", 		350},
			{"Exile_Chopper_Orca_Black", 		350},
			{"Exile_Chopper_Orca_BlackCustom", 	350}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Taru
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Taru_CSAT",		500},
			{"Exile_Chopper_Taru_Black",	500}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Taru (Transport)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Transport_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Taru_Transport_CSAT",	500},
			{"Exile_Chopper_Taru_Transport_Black",	500}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Taru (Covered)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Covered_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Taru_Covered_CSAT",		500},
			{"Exile_Chopper_Taru_Covered_Black",	500}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Hatchback_Rusty1", 			50},
			{"Exile_Car_Hatchback_Rusty2", 			50},
			{"Exile_Car_Hatchback_Rusty3", 			50},
			{"Exile_Car_Hatchback_Beige", 			100},
			{"Exile_Car_Hatchback_Green", 			100},
			{"Exile_Car_Hatchback_Blue", 			100},
			{"Exile_Car_Hatchback_BlueCustom", 		100},
			{"Exile_Car_Hatchback_BeigeCustom", 	100},
			{"Exile_Car_Hatchback_Yellow", 			100},
			{"Exile_Car_Hatchback_Grey", 			100},
			{"Exile_Car_Hatchback_Black", 			100},
			{"Exile_Car_Hatchback_Dark", 			100}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback (Sport)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Sport_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Hatchback_Sport_Red", 		100},
			{"Exile_Car_Hatchback_Sport_Blue", 		100},
			{"Exile_Car_Hatchback_Sport_Orange", 	100},
			{"Exile_Car_Hatchback_Sport_White", 	100},
			{"Exile_Car_Hatchback_Sport_Beige", 	100},
			{"Exile_Car_Hatchback_Sport_Green", 	100}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Offroad
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Offroad_Rusty1", 		50},
			{"Exile_Car_Offroad_Rusty2", 		50},
			{"Exile_Car_Offroad_Rusty3", 		50},
			{"Exile_Car_Offroad_Red", 			500},
			{"Exile_Car_Offroad_Beige", 		500},
			{"Exile_Car_Offroad_White", 		500},
			{"Exile_Car_Offroad_Blue", 			500},
			{"Exile_Car_Offroad_DarkRed", 		500},
			{"Exile_Car_Offroad_BlueCustom", 	500},
			{"Exile_Car_Offroad_Guerilla01", 	700},
			{"Exile_Car_Offroad_Guerilla02", 	700},
			{"Exile_Car_Offroad_Guerilla03", 	700},
			{"Exile_Car_Offroad_Guerilla04", 	700},
			{"Exile_Car_Offroad_Guerilla05", 	700},
			{"Exile_Car_Offroad_Guerilla06", 	700},
			{"Exile_Car_Offroad_Guerilla07", 	700},
			{"Exile_Car_Offroad_Guerilla08", 	700},
			{"Exile_Car_Offroad_Guerilla09", 	700},
			{"Exile_Car_Offroad_Guerilla10", 	700},
			{"Exile_Car_Offroad_Guerilla11", 	700},
			{"Exile_Car_Offroad_Guerilla12", 	700}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Armed)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Armed_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Offroad_Armed_Guerilla01",	250},
			{"Exile_Car_Offroad_Armed_Guerilla02",	250},
			{"Exile_Car_Offroad_Armed_Guerilla03",	250},
			{"Exile_Car_Offroad_Armed_Guerilla04",	250},
			{"Exile_Car_Offroad_Armed_Guerilla05",	250},
			{"Exile_Car_Offroad_Armed_Guerilla06",	250},
			{"Exile_Car_Offroad_Armed_Guerilla07",	250},
			{"Exile_Car_Offroad_Armed_Guerilla08",	250},
			{"Exile_Car_Offroad_Armed_Guerilla09",	250},
			{"Exile_Car_Offroad_Armed_Guerilla10",	250},
			{"Exile_Car_Offroad_Armed_Guerilla11",	250},
			{"Exile_Car_Offroad_Armed_Guerilla12",	250}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Repair)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Repair_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Offroad_Repair_Civillian",		150},
			{"Exile_Car_Offroad_Repair_Red",			150},
			{"Exile_Car_Offroad_Repair_Beige",			150},
			{"Exile_Car_Offroad_Repair_White",			150},
			{"Exile_Car_Offroad_Repair_Blue",			150},
			{"Exile_Car_Offroad_Repair_DarkRed",		150},
			{"Exile_Car_Offroad_Repair_BlueCustom",		150},
			{"Exile_Car_Offroad_Repair_Guerilla01",		250},
			{"Exile_Car_Offroad_Repair_Guerilla02",		250},
			{"Exile_Car_Offroad_Repair_Guerilla03",		250},
			{"Exile_Car_Offroad_Repair_Guerilla04",		250},
			{"Exile_Car_Offroad_Repair_Guerilla05",		250},
			{"Exile_Car_Offroad_Repair_Guerilla06",		250},
			{"Exile_Car_Offroad_Repair_Guerilla07",		250},
			{"Exile_Car_Offroad_Repair_Guerilla08",		250},
			{"Exile_Car_Offroad_Repair_Guerilla09",		250},
			{"Exile_Car_Offroad_Repair_Guerilla10",		250},
			{"Exile_Car_Offroad_Repair_Guerilla11",		250},
			{"Exile_Car_Offroad_Repair_Guerilla12",		250}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// SUV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUV_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_SUV_Red", 		100},
			{"Exile_Car_SUV_Black", 	150},
			{"Exile_Car_SUV_Grey", 		100},
			{"Exile_Car_SUV_Orange", 	100}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Van 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Van_Black",			100},
			{"Exile_Car_Van_White",			100},
			{"Exile_Car_Van_Red",			100},
			{"Exile_Car_Van_Guerilla01",	150},
			{"Exile_Car_Van_Guerilla02",	150},
			{"Exile_Car_Van_Guerilla03",	150},
			{"Exile_Car_Van_Guerilla04",	150},
			{"Exile_Car_Van_Guerilla05",	150},
			{"Exile_Car_Van_Guerilla06",	150},
			{"Exile_Car_Van_Guerilla07",	150},
			{"Exile_Car_Van_Guerilla08",	150}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Van (Box) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Box_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Van_Box_Black",				100},
			{"Exile_Car_Van_Box_White",				100},
			{"Exile_Car_Van_Box_Red",				100},
			{"Exile_Car_Van_Box_Guerilla01",		150},
			{"Exile_Car_Van_Box_Guerilla02",		150},
			{"Exile_Car_Van_Box_Guerilla03",		150},
			{"Exile_Car_Van_Box_Guerilla04",		150},
			{"Exile_Car_Van_Box_Guerilla05",		150},
			{"Exile_Car_Van_Box_Guerilla06",		150},
			{"Exile_Car_Van_Box_Guerilla07",		150},
			{"Exile_Car_Van_Box_Guerilla08",		150}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Van (Fuel) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Fuel_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Van_Fuel_Black",			100},
			{"Exile_Car_Van_Fuel_White",			100},
			{"Exile_Car_Van_Fuel_Red",				100},
			{"Exile_Car_Van_Fuel_Guerilla01",		150},
			{"Exile_Car_Van_Fuel_Guerilla02",		150},
			{"Exile_Car_Van_Fuel_Guerilla03",		150}
		};
	};
};