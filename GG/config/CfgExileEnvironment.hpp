class CfgExileEnvironment {
	class Altis {
		class FireFlies {
			enable = 0;
			startHour = 18;
			endHour = 5;
		};
		
		class Anomalies {
			enable = 0;
			startHour = 19;
			endHour = 6;
		};
		
		class Breathing {
			enable = 0;
		};
		
		class Snow {
			enable = 0;
			surfaces[] = {};
		};
		
		class Radiation {
			enable = 1;
		};
		
		class Temperature {
			daytimeTemperature[] = {15.93, 16.89, 18.42, 20.4, 22.68, 25.1, 27.48, 29.63, 31.4, 32.66, 33.32, 33.8, 33.8, 33.32, 32.66, 31.4, 29.63, 27.48, 25.1, 22.68, 20.4, 18.42, 16.89, 15.93, 15.93};
			overcast = -2;
			rain = -5;
			wind = -1;
			altitude = -0.5;
			water = -5;
		};
	};
	
	class Tanoa : Altis {
		class FireFlies : FireFlies {
			enable = 0;
		};
		
		class Anomalies : Anomalies {
			enable = 0;
		};
		
		class Breathing : Breathing {
			enable = 0;
		};
		
		class Snow : Snow {
			enable = 0;
		};
		
		class Radiation : Radiation {
			enable = 1;
		};
		
		class Temperature : Temperature {
			daytimeTemperature[] = {15.93, 16.89, 18.42, 20.4, 22.68, 25.1, 27.48, 29.63, 31.4, 32.66, 33.32, 33.8, 33.8, 33.32, 32.66, 31.4, 29.63, 27.48, 25.1, 22.68, 20.4, 18.42, 16.89, 15.93, 15.93};
		};
	};
};
