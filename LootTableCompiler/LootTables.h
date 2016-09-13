/*
	///////////////////////////////////////////////////////////////////////////////
	// Class Names
	///////////////////////////////////////////////////////////////////////////////

	Remember that item class names, group names and loot table names cannot 
	contain spaces. Also be 100% sure to have the exact same name as in Arma,
	as they are *case sensive*.

	///////////////////////////////////////////////////////////////////////////////
	// Item Groups
	///////////////////////////////////////////////////////////////////////////////

	You can link one group of items to loot tables.
	One item should only be in one group.

	Syntax:
	= <Group Name>
	<Spawn Chance Within Group>,<Item Class Name>

	///////////////////////////////////////////////////////////////////////////////
	// Propability
	///////////////////////////////////////////////////////////////////////////////

	<Spawn Chance>,<Item>

	10, Banana
	20, Tomato
	30, Cherry

	Sum of chances:
	10 + 20 + 30 = 60 = 100%

	Spawn chances:
	Banana	10 : 60 = 10 * 100 / 60 = 16.67%
	Tomato	20 : 60 = 20 * 100 / 60 = 33.33%
	Cherry	30 : 60 = 30 * 100 / 60 = 50%

	In words: 
	If Exile should spawn an item of the above group, it has a 33.33%
	chance to spawn a Banana.

	///////////////////////////////////////////////////////////////////////////////
	// Loot Tables
	///////////////////////////////////////////////////////////////////////////////

	Defines which item group spawns in which building type. The loot table itself
	is linked with a building in exile_server_config.pbo/config/CfgBuildings. Spawn
	chances work like for items.

	Syntax:
	> <Loot Table Name>
	<Spawn Chance Within Loot Table>,<Group Name>
*/



/*
	Loot Tables
*/

///////////////////////////////////////////////////////////////////////////////
// Slums/Ghetto, Farms, Village Houses, Castle etc.
// Spawn Guerilla things :)
///////////////////////////////////////////////////////////////////////////////
> CivillianLowerClass
30, Trash
28, Food
10, Drinks
8, Pistols
5, PistolAmmo
3, PistolAttachments
4, Shotguns
3, ShotgunAmmo
4, SMG
3, SMGAmmo
3, SMGAttachments
20, CivilianClothing
11, CivilianBackpacks
5, CivilianVests
20, CivilianHeadgear
10, CivilianItems
1, Restraints
10, Chemlights
10, RoadFlares

///////////////////////////////////////////////////////////////////////////////
// Apartments, Offices etc.
///////////////////////////////////////////////////////////////////////////////
> CivillianUpperClass
30, Trash
28, Food
10, Drinks
8, Pistols
5, PistolAmmo
3, PistolAttachments
4, Shotguns
3, ShotgunAmmo
4, SMG
3, SMGAmmo
3, SMGAttachments
3, Rifles
3, RifleAmmo
3, RifleAttachments
20, CivilianClothing
11, CivilianBackpacks
5, CivilianVests
20, CivilianHeadgear
10, CivilianItems
10, Chemlights
10, RoadFlares
1, Restraints

///////////////////////////////////////////////////////////////////////////////
// Kiosks, Supermarkets etc.
///////////////////////////////////////////////////////////////////////////////
> Shop
30, Trash
15, Food
15, Drinks
10, Pistols
2, PistolAmmo
1, PistolAttachments
4, Shotguns
1, ShotgunAmmo
5, SMG
1, SMGAmmo
1, SMGAttachments
5, CivilianBackpacks
1, CivilianClothing
3, CivilianHeadgear
1, CivilianVests
7, CivilianItems
5, Chemlights
5, RoadFlares
4, SmokeGrenades
3, IndustrialItems
3, Restraints
3, MedicalItems

///////////////////////////////////////////////////////////////////////////////
// Construction Sites, Warehouses, Research etc.
///////////////////////////////////////////////////////////////////////////////
> Industrial
30, Trash
40, IndustrialItems
25, Vehicle
15, RoadFlares
5, Restraints

///////////////////////////////////////////////////////////////////////////////
// Factories
///////////////////////////////////////////////////////////////////////////////
> Factories
10, Electronics
40, Trash
50, IndustrialItems

///////////////////////////////////////////////////////////////////////////////
// Fuel Stations, Garages, Workshops etc.
///////////////////////////////////////////////////////////////////////////////
> VehicleService
30, Trash
25, IndustrialItems
40, Vehicle
15, RoadFlares
5, Restraints

///////////////////////////////////////////////////////////////////////////////
// Towers, Barracks, Hangars etc.
///////////////////////////////////////////////////////////////////////////////
> Military
100, Trash
4, CivilianItems
4, GuerillaItems
3, HEGrenades
3, UGLFlares
3, UGLSmokes
3, HandGrenades
3, SmokeGrenades
2, Restraints
2, MedicalItems
5, GuerillaClothing
5, MilitaryClothing
4, GuerillaBackpacks
3, MilitaryBackpacks
3, GuerillaVests
3, MilitaryVests
3, DLCVests
3, GuerillaHeadgear
3, MilitaryHeadgear
1, Ghillies
1, DLCGhillies
1, Rebreathers
5, Rifles
3, RifleAmmo
3, RifleAttachments
4, LMG
2, LMGAmmo
3, Snipers
2, SniperAmmo
2, SniperAttachments
3, DLCRifles
2, DLCAmmo
2, DLCOptics
2, DLCSupressor
2, Bipods
5, Explosives

///////////////////////////////////////////////////////////////////////////////
// Hospital, Medevac etc. (Does not spawn on Altis!)
///////////////////////////////////////////////////////////////////////////////
> Medical
30, Trash
70, MedicalItems

///////////////////////////////////////////////////////////////////////////////
// Light Houses + Life Guard Towers + Castles
///////////////////////////////////////////////////////////////////////////////
> Tourist
10, MilitaryBackpacks
10, MilitaryHeadgear
5, Ghillies
5, DLCGhillies
20, Snipers
2, SniperAmmo
2, SniperAttachments
20, DLCRifles
2, DLCAmmo
2, DLCOptics
2, DLCSupressor
4, CivilianItems
4, HandGrenades
4, Restraints
4, MedicalItems
4, Explosives

///////////////////////////////////////////////////////////////////////////////
// Ghost Hotel Buildings
///////////////////////////////////////////////////////////////////////////////
> Radiation
10, MilitaryBackpacks
10, MilitaryHeadgear
5, Ghillies
5, DLCGhillies
30, Snipers
2, SniperAmmo
2, SniperAttachments
30, DLCRifles
2, DLCAmmo
2, DLCOptics
2, DLCSupressor
4, HandGrenades
4, Restraints
4, MedicalItems
10, Explosives
4, EpicWeapons
