/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
*/
class CfgPatches {
	class a3_infiSTAR_Exile {
		units[] = {};
		weapons[] = {};
		a3_infiSTAR_Exile_version = 0.1;
		requiredVersion = 1.36;
		requiredAddons[] = {};
	};
};
class CfgFunctions {
	class a3_infiSTAR_Exile
	{
		class main {
			file = "a3_infiSTAR_Exile";
			class preInit {
				preInit = 1;
				//	postInit = 1;
			};
		};
	};
};