class CfgSettings {
	class Respect {
		tradingRespectFactor = 0.1;
		
		class Frags {
			bambi = -500;
			friendlyFire = -100;
			standard = 100;
			humiliation = 300;
			passenger = 400;
			roadKill = 500;
		};
		
		class Bonus {
			per100mDistance = 10;
			firstBlood = 100;
			killStreak = 50;
			killStreakTimeout = 120;
		};
	};
	
	class BambiSettings {
		loadOut[] = {"ItemCompass", "ItemMap", "Exile_Item_XM8", "ItemRadio", "Exile_Item_PlasticBottleFreshWater"};
		parachuteSpawning = 1;
		parachuteDropHeight = 300;
		protectionDuration = 5;
		spawnZoneRadius = 500;
		spawnZoneVehicles[] = {{1, "Exile_Bike_QuadBike_Black"}, {1, "Exile_Bike_MountainBike"}};
	};
	
	class LootSettings {
		spawnChance = 80;
		spawnRadius = 200;
		lifeTime = 600;
		notifyPlayer = 1;
	};
	
	class VehicleSpawn {
		vehiclesGridSize = 3200;
		vehiclesGridAmount = 1;
		vehiclesDebugMarkers = 0;
		damageChance = 20;
		maximumDamage = 0.9;
		water[] = {"Exile_Boat_MotorBoat_Police", "Exile_Boat_MotorBoat_Orange", "Exile_Boat_MotorBoat_White", "Exile_Boat_RubberDuck_CSAT", "Exile_Boat_RubberDuck_Digital", "Exile_Boat_RubberDuck_Orange", "Exile_Boat_RubberDuck_Blue", "Exile_Boat_RubberDuck_Black", "Exile_Boat_SDV_CSAT", "Exile_Boat_SDV_Digital", "Exile_Boat_SDV_Grey"};
		ground[] = {"Exile_Bike_QuadBike_Black", "Exile_Bike_QuadBike_Blue", "Exile_Bike_QuadBike_Red", "Exile_Bike_QuadBike_White", "Exile_Bike_QuadBike_Nato", "Exile_Bike_QuadBike_Csat", "Exile_Bike_QuadBike_Fia", "Exile_Bike_QuadBike_Guerilla01", "Exile_Bike_QuadBike_Guerilla02", "Exile_Car_Hatchback_Rusty1", "Exile_Car_Hatchback_Rusty2", "Exile_Car_Hatchback_Rusty3", "Exile_Car_Hatchback_Sport_Red", "Exile_Car_SUV_Red", "Exile_Car_Offroad_Rusty1", "Exile_Car_Offroad_Rusty2", "Exile_Car_Offroad_Rusty3", "Exile_Car_Van_Black", "Exile_Car_Van_Box_Black", "Exile_Car_Van_Fuel_Black"};
	};
	
	class Construction {
		baseExpire = 30;
	};
	
	class LocalityMonitor {
		monitor = 0;
		threshold = 20;
	};
	
	class Weather {
		interval = 30;
		keyframes[] = {"Sunny", "Cloudy"};
		
		class Sunny {
			fogValue = 0.1;
			fogDecay = 0.2;
			fogBase = 5;
			overcast = 0.2;
			waves = 0.2;
			wind = 0.3;
			gusts = 0.3;
			rain = 0;
			lightnings = 0;
			rainbows = 0;
		};
		
		class Cloudy {
			fogValue = 0.2;
			fogDecay = 0.1;
			fogBase = 5;
			overcast = 0.4;
			waves = 0.4;
			wind = 0.7;
			gusts = 0.6;
			rain = 0.1;
			lightnings = 0.1;
			rainbows = 1;
		};
		
		class Thunderstorm {
			fogValue = 0.7;
			fogDecay = 0.2;
			fogBase = 5;
			overcast = 1;
			waves = 1;
			wind = 1;
			gusts = 1;
			rain = 1;
			lightnings = 1;
			rainbows = 0.5;
		};
	};
	
	class Time {
		useRealTime = 0;
		useStaticTime = 1;
		staticTime[] = {2039,6,24,12,0};
	};
};
