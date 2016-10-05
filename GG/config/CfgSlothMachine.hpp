

class CfgSlothMachine {
	spinCost = 100;
	Jackpot = 10100;
	chances[] = {{85, ""}, {95, "Level1"}, {96, "Level2"}, {97, "Level3"}, {98, "Level4"}, {99, "Level5"}, {100, "Jackpot"}};
	
	class Prizes {
		class Level1 {
			symbol = "\exile_assets\texture\item\Exile_Item_ToiletPaper.paa";
			prize = 101;
		};
		
		class Level2 {
			symbol = "\exile_assets\texture\item\Exile_Item_CockONut.paa";
			prize = 110;
		};
		
		class Level3 {
			symbol = "\exile_assets\texture\item\Exile_Item_Beer.paa";
			prize = 125;
		};
		
		class Level4 {
			symbol = "\exile_assets\texture\item\Exile_Item_Knife.paa";
			prize = 150;
		};
		
		class Level5 {
			symbol = "\exile_assets\texture\item\Exile_Item_Safe.paa";
			prize = 200;
		};
		
		class Jackpot {
			symbol = "\exile_assets\texture\item\Exile_Item_XmasPresent.paa";
		};
	};
};
