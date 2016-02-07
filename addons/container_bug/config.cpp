class CfgPatches
{
	class ContainerBug
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0;
		requiredAddons[] = {};
	};
};

class CfgFunctions
{
	class ContainerBug
	{
		class Main
		{
			file = "container_bug";
			class preInit
			{
				preInit = 1;
			};
		};
	};
};