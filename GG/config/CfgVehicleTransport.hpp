

class CfgVehicleTransport {
	class Exile_Container_SupplyBox {
		vehicles[] = {"Exile_Car_Van_Abstract", "Exile_Car_Offroad_Abstract", "Exile_Car_Zamak_Abstract", "Exile_Car_HEMMT_Abstract", "Exile_Car_Tempest_Abstract"};
		
		class Exile_Car_Van_Abstract {
			attachPosition[] = {0, -1.1, 0.2};
			cargoIndizes[] = {2, 3, 4, 5, 6, 7};
			detachPosition[] = {0, -4.4};
		};
		
		class Exile_Car_Offroad_Abstract {
			attachPosition[] = {0, -1.6, 0.4};
			cargoIndizes[] = {1, 2, 3, 4};
			detachPosition[] = {0, -4};
		};
		
		class Exile_Car_Zamak_Abstract {
			attachPosition[] = {0.03, 0.3, 0};
			cargoIndizes[] = {2, 3, 4, 5, 6, 7};
			detachPosition[] = {0.03, -4.8};
		};
		
		class Exile_Car_HEMMT_Abstract {
			attachPosition[] = {0.05, -0.1, 0.3};
			cargoIndizes[] = {1, 2, 8, 9};
			detachPosition[] = {0.05, -6.1};
		};
		
		class Exile_Car_Tempest_Abstract {
			attachPosition[] = {0.08, -0.85, 0.4};
			cargoIndizes[] = {1, 6, 7, 9};
			detachPosition[] = {0.08, -6};
		};
	};
};
