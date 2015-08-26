/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
*/
class CfgPatches {
	class a3_infiSTAR {
		units[] = {};
		weapons[] = {};
		a3_infiSTAR_version = 0.1;
		requiredVersion = 1.36;
		requiredAddons[] = {};
	};
};
class CfgFunctions {
	class a3_infiSTAR
	{
		class main {
			file = "a3_infiSTAR";
			class preInit {
				preInit = 1;
				//	postInit = 1;
			};
		};
	};
};