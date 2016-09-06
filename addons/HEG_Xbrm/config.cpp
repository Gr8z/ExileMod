
class CfgPatches 
{
	class HEG_Xbrm {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		author[]= {"oSoDirty_HEGExile"}; 	
	};
};
class CfgFunctions 
{
	class HEGExile 
	{
		class main 
		{
			file = "\HEG_Xbrm\init";
			class init
			{
				preInit = 1;
			};
			class postinit
			{
				postInit = 1;
			};
		};
	};
};

