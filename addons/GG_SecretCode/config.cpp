class CfgPatches
{
	class GG_SecretCode
	{
		requiredVersion = 0.1;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
		author[]= {"[GG] Ghostz Gamerz"};
		website[]= {"http://ghostzgamerz.com"};
	};
};
class CfgFunctions
{
	class GG_SecretCode
	{
		tag = "GG";
		class code
		{
			file = "GG_SecretCode\code";
			class mapText {};
			class welcomeText {};
			class drawToMap {};
			class statusBar {};
			class selfie {};
			class flashlight {};
		};
		class airDrops
		{
			file = "GG_SecretCode\code\airDrops";
			class airDrops_buySelected {};
			class airDrops_okDrop {};
		};
		class craftingApp
		{
			file = "GG_SecretCode\code\craftingApp";
			class craftingApp_componentsLoad {};
			class craftingApp_recipeLoad {};
		};
		class dailyRewards
		{
			file = "GG_SecretCode\code\dailyRewards";
			class dailyRewards_animation {};
			class dailyRewards_showReward {};
			class dailyRewards_RespectReward {};
			class dailyRewards_TabsReward {};
			class dailyRewards_CrateReward {};
			class dailyRewards_onButtonClick {};
		};
		class repairVechicle
		{
			file = "GG_SecretCode\code\repairVehicle";
			class repairVehicle_displayVehicleRepairInfo {};
			class repairVehicle_repairchopper {};
			class repairVehicle_repairchopperhalf {};
			class repairVehicle_repairSingleWheel {};
			class repairVehicle_repairWheels {};
			class repairVehicle_scavengeWheel {};
			class repairVehicle_vehicleRepairCar {};
		};
		class main
		{
			file = "GG_SecretCode\init";
			class postInit { postInit = 1; };
		};
	};
};