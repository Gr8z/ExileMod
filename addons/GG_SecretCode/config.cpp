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
			class getLoadout {};
			class airDrops {};
		};
		class main
		{
			file = "GG_SecretCode\init";
			class postInit { postInit = 1; };
		};
	};
};