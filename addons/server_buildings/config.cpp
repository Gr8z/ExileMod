class CfgPatches {
	class A3_exile_building {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_client","exile_server_config"};
	};
};
class CfgFunctions {
	class building {
		class main {
			file = "x\addons\a3_exile_server_building\init";
			class init {
				postInit = 1;
			};
		};
	};
};