#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class ZBE_Cache
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {};
		author[] = {"zorrobyte"};

	};
};

class CfgFunctions
{
    class ZBE
    {
        class Cache
        {
            class Cache_Init
            {
                file = "zbe_cache_addon_version\init.sqf";
                preInit = 1;
            };
        };
    };
};

class ZBE_Cache_Key_Setting 
{
	zbe_aiCacheDist = 1000; //At what distance is AI cached/uncached?
	zbe_cache_debug = 1; //Debug hint/RPT? 1 on 0 off
	zbe_vehicleCacheDistCar = 100; //At what distance should empty cars be cached?
	zbe_vehicleCacheDistAir = 1000; //At what distance should empty aircraft be cached?
	zbe_vehicleCacheDistBoat = 1000; //At what distance should empty boats be cached?
	zbe_minFrameRate = -1;//If the FPS drops below this number, then prevent AI from uncaching. -1 is for suggested setting (if (isDedicated) then {_fps = 15} else {_fps = 30};).
};