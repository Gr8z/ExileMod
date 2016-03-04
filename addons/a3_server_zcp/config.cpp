class CfgPatches {
	class A3_exile_zcp {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_client","exile_server_config"};
	};
};
class CfgFunctions {
	class zcp {
		class main {
			file = "x\addons\a3_server_zcp\zcp";
			class init {postInit = 1;};
			class config {};
			class missionLooper {};

		};
		class compileFunctions {
			file = "x\addons\a3_server_zcp\zcp\functions";
			class inDebug {};
			class nearWater {};
			class paraDrop {};
			class start {};
			class findPosition {};
			class cleanupBase {};
			class initCPData {};
			class giveReward {};
			class keepMarker {};
			class createBase {};
			class nearTrader {};
		};
	};
};