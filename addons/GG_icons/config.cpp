class CfgPatches {
	class GG_icons {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_client","exile_server_config"};
	};
};

class CfgMarkers {
	class third_icons;
	
		class GG_atm : third_icons {
		name = "ATM";
		icon = "GG\images\icons\atm.paa";
		shadow = true;
		scope = 1;
		color[] = {1, 0, 0, 1};
	};
	
};