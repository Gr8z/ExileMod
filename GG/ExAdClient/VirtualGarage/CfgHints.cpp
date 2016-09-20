/*  
	CfgHints.cpp
*/

class VGStore
{
	displayName = "Vehicle stored";
	/*displayNameShort = "Your vehicle has been stored and is available through the Virtual Garage interface";*/
	description = "Your vehicle has been stored and is only available through the territory it has been stored at. ";
	image = "GG\images\logo.paa";
	noImage = false;
	tip = "";
	arguments[] = {};
};
class VGLoad
{
	displayName = "Vehicle loaded to world";
	description = "%1Your vehicle has been loaded to the world, the pin code is %11";
	image = "GG\images\logo.paa";
	noImage = false;
	tip = "";
	arguments[] = {"VGLoad select 0"};
	parameters[] = {"STRING"};
};