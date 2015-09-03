class CfgPatches {
	class loot_addon {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

class CfgFunctions {
	class custom {
		class main {
		file = "loot_addon";
			class init {
				//preInit = 1;
				postInit = 1;
			};
		};
	};
};