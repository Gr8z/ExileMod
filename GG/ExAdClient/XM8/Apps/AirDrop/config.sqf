/*

Coded and coverted by GR8
www.ghostzgamerz.com

*/

ExAd_XM8_AirDrop_orderIDcharacters = "GG";

//Starter Drop
ExAd_XM8_AirDrop_box1Cost = 5000;
ExAd_XM8_AirDrop_box1DonorCost = 1000;
ExAd_XM8_AirDrop_box1WepCount = 1;

//Medium Drop
ExAd_XM8_AirDrop_box2Cost = 10000;
ExAd_XM8_AirDrop_box2DonorCost = 2000;
ExAd_XM8_AirDrop_box2WepCount = 2;

//Pro Drop
ExAd_XM8_AirDrop_box3Cost = 30000;
ExAd_XM8_AirDrop_box3DonorCost = 3000;
ExAd_XM8_AirDrop_box3WepCount = 3;
 
ExAd_XM8_AirDrop_rareItem = ["Exile_Item_Laptop","Exile_Item_BaseCameraKit","Exile_Item_Defibrillator","Exile_Item_SafeKit","Exile_Item_CodeLock","Exile_Magazine_Battery"];
ExAd_XM8_AirDrop_BoxConstruction = ["Exile_Item_WoodWallKit","Exile_Item_WoodWallHalfKit","Exile_Item_WoodWindowKit","Exile_Item_WorkBenchKit","Exile_Item_WoodFloorPortKit","Exile_Item_WoodFloorKit","Exile_Item_WoodGateKit"];
ExAd_XM8_AirDrop_BoxTools = ["Exile_Item_Rope","Exile_Item_DuctTape","Exile_Item_ExtensionCord","Exile_Item_FuelCanisterEmpty","Exile_Item_JunkMetal","Exile_Item_LightBulb","Exile_Item_MetalBoard","Exile_Item_MetalPole","Exile_Item_CamoTentKit"];
ExAd_XM8_AirDrop_BoxFood = ["Exile_Item_EMRE","Exile_Item_GloriousKnakworst","Exile_Item_Surstromming","Exile_Item_SausageGravy","Exile_Item_Catfood","Exile_Item_ChristmasTinner","Exile_Item_BBQSandwich","Exile_Item_Dogfood","Exile_Item_BeefParts","Exile_Item_Cheathas","Exile_Item_Noodles","Exile_Item_SeedAstics","Exile_Item_Raisins","Exile_Item_Moobar","Exile_Item_InstantCoffee","Exile_Item_PlasticBottleCoffee","Exile_Item_PowerDrink","Exile_Item_PlasticBottleFreshWater","Exile_Item_Beer","Exile_Item_EnergyDrink","Exile_Item_MountainDupe"];
ExAd_XM8_AirDrop_BoxWeapons = ["LMG_Zafir_F","MMG_01_hex_F","srifle_EBR_F","srifle_DMR_01_F","srifle_GM6_F","srifle_LRR_F","srifle_DMR_02_F","MMG_01_tan_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F","srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_tan_F","srifle_DMR_05_hex_F","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F","srifle_LRR_camo_F","srifle_GM6_camo_F"];

{
    _code = '';
    _function = _x select 0;
    _file = format["GG\ExAdClient\XM8\Apps\Airdrop\Functions\%1", _x select 1];

    _code = compileFinal (preprocessFileLineNumbers _file);                    

    missionNamespace setVariable [_function, _code];
}
forEach
[
	["AirDrop_fnc_buySelected", "fn_buySelected.sqf"],
	["AirDrop_fnc_okDrop", 	"fn_okDrop.sqf"]
];