#include "CfgPatches.hpp"
#include "CfgBuildings.hpp"
#include "CfgLootTables.hpp"
#include "CfgSettings.hpp"

class CfgFunctions
{
	class ExileServerConfig
	{
		class Bootstrap_custom
		{
			file = "exile_server_config\bootstrap";
			class preInit
			{
				preInit = 1;
			};
			class postInit
			{
				postInit = 1;
			};
		};
	};
};