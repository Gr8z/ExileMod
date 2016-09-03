class CfgPatches
{
	class XG_killBoard
	{
		requiredVersion = 0.1977;
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
	class XG_killBoard
	{
		class main
		{
			file = "XG_killBoard";
			class postInit { postInit = 1; };
		};
	};
};