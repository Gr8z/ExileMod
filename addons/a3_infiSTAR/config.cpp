/*
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com // www.infiSTAR.de
*/
class CfgPatches
{
	class a3_infiSTAR_Exile
	{
		requiredVersion = 0.4076;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
		a3_infiSTAR_Exile_version = 0.4076;
	};
};
class CfgFunctions
{
	class a3_infiSTAR_Exile
	{
		class main
		{
			file = "a3_infiSTAR_Exile";
			class preInit { preInit = 1; };
		};
	};
};
#include "CUSTOM_FUNCTIONS.hpp"