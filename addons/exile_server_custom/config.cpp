class CfgPatches
{
	class exile_server_custom
	{
		projectName="exile_server_custom";
		author="Torndeco";
		requiredVersion = "0";
		version="1.2";
		requiredAddons[] = {"exile_client","exile_server","exile_server_config"};
		units[] = {};
		unitsCrawlers[] = {};
		unitsSlow[] = {};
		unitsMedium[] = {};
		unitsFast[] = {};
		unitsSpider[] = {};
	};
};

class CfgFunctions
{
	class exile_server_custom
	{
		class PreInit
		{
			class init
			{
				file = "exile_server_custom\init.sqf";
				preInit = 1;
			};
		};
	};
};
