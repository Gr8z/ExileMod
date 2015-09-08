class CfgPatches {
	class heli_crashes {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_client", "exile_server_config", "exile_server"};
	};
};

class CfgFunctions {
	class heli_crashes {
		class helicrash {
			file = "heli_crashes";
			class init {
				postInit = 1;
			};
		};
	};
};