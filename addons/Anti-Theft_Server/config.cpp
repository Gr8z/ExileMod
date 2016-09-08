/*
	Project:
		XG_Anti-Theft

	Authors:
		[XG] StokesMagee:
			www.xexgaming.com

	Credits:
		Diamond
			http://www.legiongaminghq.org/
		Kuplion
			https://www.facebook.com/FriendlyPlayerShooting/
		William Rogers
			http://www.arma3-dayzrp.com/
*/

class CfgPatches
{
	class XG_AntiTheft
	{
		requiredVersion = 1;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
		version = v1;
	};
};
class CfgFunctions
{
	class XG_AntiTheft
	{
		class main
		{
			file = "XG_AntiTheft";
			class postInit { postInit = 1; };
		};
	};
};