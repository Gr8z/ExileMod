/**
 * config
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
class CfgPatches
{
	class exile_server_config
	{
		requiredVersion = 0.1;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
	};
};


class CfgBuildings
{
	#include "CfgBuildings.h"
	///////////////////////////////////////////////////////////////////////////
	// Castles & Lighthouses & Life Guard Towers
	///////////////////////////////////////////////////////////////////////////
	class Land_LifeguardTower_01_F
	{
		table = "Tourist";
		positions[] = {{-0.498047, -0.222656, 1.13312}};
	};

	class Land_LightHouse_F
	{
		table = "Tourist";
		positions[] = {{-5.74805, 11.0859, -3.75002}, {0.789063, -2.94336, -11.0953}, {1.07813, -2.83008, 5.39755}};
	};

	class Land_Castle_01_tower_F
	{
		table = "Tourist";
		positions[] = {{-1.66602, 0.603516, 7.94255}, {-1.99023, -1.70508, -1.0866}, {-2.14453, 2.73633, -3.95897}, {0.164063, 1.33203, -9.47995}, {1.14844, -1.18359, 7.94255}, {2.06641, 2.66992, -6.67494}, {2.15039, -1.89063, 1.70487}, {2.27344, 2.70703, 4.42336}};
	};

	class Land_TentHangar_V1_F
	{
		table = "Military";
		positions[] = {{-8.1582, -2.20703, -4.08853}, {-8.1582, 6.85547, -4.08853}, {-8.52734, -7.57227, -4.08853}, {7.76953, -7.64453, -4.08853}, {8.16016, 1.89453, -4.08853}, {8.57617, 7.48438, -4.08853}};
	};

	class Land_Hangar_F
	{
		table = "Military";
		positions[] = {{-11.6641, 20.9063, -5.38129}, {-12.1133, 9.19336, -5.38129}, {-12.1543, -3.90625, -5.38129}, {-12.1816, -16.8906, -5.38129}, {1.75, 20.9688, -5.38129}, {11.3711, -19.2734, -5.38129}, {12.0469, -5.7168, -5.38129}, {12.7305, 6.83203, -5.38129}, {13.7285, 18.1602, -5.38129}};
	};

	class Land_Cargo_House_V1_F
	{
		table = "Military";
		positions[] = {{-1.38281, 3.12109, 0.040287}, {1.24805, 2.54102, 0.0402873}};
	};

	class Land_Cargo_House_V3_F
	{
		table = "Military";
		positions[] = {{-2.0918, 1.58984, -0.0957484}, {1.11914, 3.17969, 0.0402873}};
	};

	class Land_Cargo_HQ_V2_F
	{
		table = "Military";
		positions[] = {{-1.25586, 1.48828, -0.747442}, {-1.50391, -2.52148, -3.27229}, {-1.50391, 2.67773, -3.27229}, {-1.9043, -4.61133, -0.747442}, {5.35156, 1.64648, -0.747442}, {5.5332, 3.30859, -3.27229}};
	};

	class Land_Cargo_HQ_V3_F
	{
		table = "Military";
		positions[] = {{-1.56641, -2.93164, -0.747444}, {-1.81641, -4.90234, -3.27229}, {-1.89648, 0.654297, -3.27229}, {4.65234, 2.41602, -3.27229}, {5.24805, 1.60742, -0.747444}};
	};

	class Land_i_Barracks_V2_F
	{
		table = "Military";
		positions[] = {{-0.505859, 3.2168, 0.605521}, {-0.601563, 3.07617, 3.9395}, {-11.0234, -2.65625, 0.60552}, {-11.1328, -3.58398, 3.9395}, {-12.377, 0.271484, 3.9395}, {-2.39453, -3.92773, 0.605342}, {-5.09766, -4.89844, 3.93943}, {-8.69922, 3.24414, 3.9395}, {-9.12695, 3.73047, 0.60552}, {10.3711, 3.51367, 0.605521}, {10.6484, 2.85156, 3.9395}, {13.0684, -3.30469, 0.605521}, {13.1934, -3.42383, 3.9395}, {3.28711, -3.98633, 0.605521}, {3.4707, -3.55469, 3.9395}, {6.22852, 3.50391, 3.9395}, {6.39258, 3.05664, 0.605521}};
	};

	class Land_i_Barracks_V1_F
	{
		table = "Military";
		positions[] = {{-0.464844, 3.49219, 0.605521}, {-0.476563, 3.95703, 3.9395}, {-10.4844, -3.32422, 3.9395}, {-11.1055, -2.92188, 0.605521}, {-12.3066, 0.222656, 0.605521}, {-2.29688, -4.23828, 0.605283}, {-3.89648, -4.80078, 3.93923}, {-8.66992, 3.86328, 0.605521}, {-9.03516, 3.31055, 3.9395}, {10.3301, 2.77734, 0.605521}, {10.4023, 3.18945, 3.9395}, {13.0352, -3.23438, 3.9395}, {13.1738, -3.31055, 0.605521}, {3.57227, -3.49414, 0.605522}, {3.61133, -2.98047, 3.9395}, {6.38281, 3.41992, 0.60552}, {6.4082, 2.87695, 3.9395}};
	};

	class Land_Cargo_Patrol_V2_F 
	{
		table = "Military";
		positions[] = {{-1.01953, -1.0918, -0.55952}, {1.82031, -0.695313, -0.55952}};
	};

	class Land_Cargo_Tower_V1_F 
	{
		table = "Military";
		positions[] = {{-3.54785, -3.01758, 2.47987},{-3.15625, -0.837891, 5.00472},{-2.0498, -3.29883, -0.120125},{4.55957, 4.39258, -0.120125},{-4.42383, 2.45117, -0.120125},{-2.87598, 2.20898, -4.2958},{-2.88281, 4.14258, 5.00472},{0.235352, -1.19727, 5.07987},{3.58105, 4.11719, 2.47988},{1.27441, 3.17773, -8.24333},{2.50488, 0.0625, 5.00472}};
	};

	class Land_Cargo_Tower_V1_No1_F
	{
		table = "Military";
		positions[] = {{-2.4668, -4.10156, 5.00471}, {-2.7168, 1.0625, -0.120123}, {-2.83984, -2.95313, 2.47987}, {-3.06641, -2.66992, -0.120123}, {-3.12109, 2.42773, -4.2958}, {-3.16211, 4.51563, 5.00471}, {1.26367, 2.49609, -8.24333}, {2.25195, 4.30664, -0.120123}, {3.34766, 3.33203, 2.47987}, {3.66797, 1.8457, 5.00471}};
	};

	class Land_Cargo_Tower_V1_No2_F 
	{
		table = "Military";
		positions[] = {{-2.71289, 3.0957, -0.120123}, {-2.83203, 5.06445, 5.00472}, {-3.48633, 2.28906, -4.2958}, {-3.64844, -2.87891, 2.47988}, {-3.77344, -3.32617, 5.00472}, {-3.80664, -1.75977, -0.120123}, {0.0625, -0.287109, 5.07988}, {1.58984, -2.11523, -0.120123}, {2.13672, 2.20703, -8.24332}, {3.57422, 4.22461, 2.47988}, {3.75, 1.31055, 5.00472}, {4.98633, 3.90625, -0.120123}};
	};

	class Land_Cargo_Tower_V1_No3_F 
	{
		table = "Military";
		positions[] = {{-0.214844, -0.460938, 5.07988}, {-2.33203, -2.96094, -0.120119}, {-2.89648, -4.0625, 5.00472}, {-3.08008, -2.8125, 2.47988}, {-3.28711, 2.60352, -4.2958}, {-3.61328, 4.44141, 5.00472}, {-4.01758, 1.86133, -0.120119}, {1.54688, 2.61133, -8.24332}, {3.52734, 3.8418, 2.47988}, {3.5332, -0.386719, 5.00472}, {4.88477, 4.18945, -0.120119}};
	};

	class Land_Cargo_Tower_V1_No4_F 
	{
		table = "Military";
		positions[] = {{-2.68555, -3.07031, -0.120119}, {-2.93359, -4.27148, 5.00472}, {-3.22461, 4.84375, 5.00472}, {-3.6543, 1.57227, -4.2958}, {-3.70508, -3.0332, 2.47988}, {-4.26367, 0.980469, -0.120119}, {2.1543, 2.08789, -8.24332}, {3.46289, 2.25781, 2.47988}, {3.62305, 2.16797, 5.00472}, {5.10156, 4.20898, -0.120119}};
	};

	class Land_Cargo_Tower_V1_No5_F
	{
		table = "Military";
		positions[] = {{-2.25781, -2.77344, -0.120119}, {-2.375, -4.45508, 5.00472}, {-2.41602, 5.18164, 5.00472}, {-2.94922, 2.4082, -4.2958}, {-3.89648, -2.7832, 2.47988}, {-4.03906, 1.43945, -0.120119}, {0.0410156, -0.8125, 5.07988}, {1.62305, 2.55664, -8.24332}, {2.97461, -0.335938, 5.00472}, {3.90039, 3.68555, 2.47988}, {4.80859, 3.57422, -0.120117}};
	};

	class Land_Cargo_Tower_V1_No6_F
	{
		table = "Military";
		positions[] = {{-1.6875, -2.5918, -0.120119}, {-3.16992, -3.74219, 5.00472}, {-3.41797, 1.87305, -0.120119}, {-3.49805, 2.06836, -4.2958}, {-3.81055, 4.59766, 5.00472}, {-3.92969, -2.12109, 2.47988}, {1.92578, 2.27344, -8.24332}, {3.50195, 2.76563, 2.47988}, {3.64258, 0.0078125, 5.00472}, {5.19141, 4.45117, -0.120119}};
	};

	class Land_Cargo_Tower_V1_No7_F
	{
		table = "Military";
		positions[] = {{-2.59766, -3.14063, -0.120119}, {-2.7832, 1.94531, -4.2958}, {-2.83203, 1.58594, -0.120119}, {-3.20508, 4.62891, 5.00472}, {-3.29883, -2.90234, 5.00472}, {-3.87891, -3.11914, 2.47988}, {0.228516, -1.05273, 5.07988}, {1.65234, 2.58594, -8.24332}, {3.40039, 3.05859, 2.47988}, {4.18164, 0.246094, 5.00472}, {4.42578, 3.99805, -0.120119}};
	};

	class Land_Cargo_Tower_V2_F 
	{
		table = "Military";
		positions[] = {{4.29492, 3.70508, -0.120117}, {-2.5293, -3.10742, 2.47988}, {-2.6543, 2.01172, -4.2958}, {-2.66797, -3.4707, 5.00472}, {-2.67773, 4.97461, 5.00472}, {-3.06836, 1.80273, -0.120117}, {-3.25586, -3.56445, -0.120117}, {0.611328, 0.0214844, 5.07988}, {2.46094, 1.92383, -8.24332}, {2.61328, -0.296875, 2.47988}, {3.07422, 4.14063, 2.47988}, {3.50195, 1.22656, 5.00472}};
	};

	class Land_Cargo_Tower_V3_F
	{
		table = "Military";
		positions[] = {{-1.59375, -2.7168, -0.120119}, {-2.40039, 2.39648, -4.2958}, {-3.24023, -3.17773, 5.00472}, {-3.51367, 4.57617, 5.00472}, {-3.70703, -3.60547, 2.47988}, {-4.54883, 2.47266, -0.120119}, {0.142578, -0.179688, 5.07988}, {2.2793, 2.25391, -8.24332}, {3.87109, 3.3418, 2.47988}, {4.22656, 0.390625, 5.00472}, {5.05469, 4.16406, -0.120119}};
	};

	class Land_MilOffices_V1_F
	{
		table = "Military";
		positions[] = {{-11.6309, -5.04492, -2.86675}, {-15.1172, 9.07617, -2.86675}, {-15.123, 2.19336, -2.86675}, {-15.5938, -4.07227, -2.86675}, {-3.46484, -3.22266, -2.86675}, {-4.10352, 9.33398, -2.86675}, {-7.09766, -2.95898, -2.86675}, {-8.6582, 9.02344, -2.86675}, {0.794922, -3.08594, -2.86675}, {1.45703, 8.60156, -2.86675}, {13.9258, 0.492188, -2.86675}, {15.3613, 8.10742, -2.86675}, {8.54883, 8.01563, -2.86675}, {8.61133, -4.3125, -2.86675}, {8.68359, -1.73438, -2.86675}};
	};

	class Land_Radar_F
	{
		table = "Military";
		positions[] = {{-10.1797, -9.80859, -6.00412}, {-9.61719, 10.4219, -6.00412}, {11.6211, 1.06641, -6.00412}, {2.81445, 12.2578, -7.78305}};
	};

	class Land_Medevac_HQ_V1_F
	{
		table = "Medical";
		positions[] = {{-0.896484, 2.24219, -3.26622}, {-1.45898, -3.75391, -3.26622}, {-1.54297, 1.05469, -0.741375}, {5.17578, 2.66992, -3.26622}, {5.6875, 1.63477, -0.741374}};
	};

	class Land_CarService_F
	{
		table = "VehicleService";
		positions[] = {{-0.964844, 1.77148, -1.25606}, {-3.15625, 7.39844, -1.25606}, {-4.54688, 4, -1.25606}, {0.492188, 2.8457, -1.25606}, {3.50781, -0.113281, -1.25606}, {3.74414, 6.12891, -1.25606}};
	};

	class Land_Chapel_Small_V2_F 
	{
		table = "CivillianLowerClass";
		positions[] = {{0.556641, -0.966797, -0.867857}, {3.54297, 0.486328, -0.867857}};
	};

	class Land_Church_01_V1_F
	{
		table = "CivillianLowerClass";
		positions[] = {{-4.36719, -5.81055, -5.46942}, {-4.46875, -2.23633, -5.74363}, {-4.54492, 1.57422, -5.74363}, {-4.8125, 5.58789, -5.49442}, {3.00781, -5.92969, -6.44017}, {4.19141, 5.77148, -6.44865}};
	};

	class Land_i_Windmill01_F 
	{
		table = "CivillianLowerClass";
		positions[] = {{-0.585938, 0.908203, -3.53162}};
	};

	class Land_d_Windmill01_F 
	{
		table = "CivillianLowerClass";
		positions[] = {{-0.935547, 0.259766, -2.2985}, {-1.65039, 0.365234, 0.947132}};
	};

	class Land_i_Stone_HouseSmall_V3_F
	{
		table = "CivillianLowerClass";
		positions[] = {{-2.68945, 2.05664, -0.628867}, {-7.74023, 3.45313, -0.615288}, {3.60938, 1.61328, -0.609982}, {6.83984, 3.07227, -0.595582}};
	};

	class Land_i_Stone_Shed_V1_F
	{
		table = "CivillianLowerClass";
		positions[] = {{-2.63867, 1.96484, -0.100502}, {1.19141, 2.16992, -0.100502}};
	};

	class Land_i_House_Small_02_V2_F
	{
		table = "CivillianUpperClass";
		positions[] = {{-1.29688, 1.06641, -0.704727}, {-1.56836, -1.83789, -0.710279}, {2.85352, -1.52148, -0.704572}, {2.88086, 1.76367, -0.702332}, {5.21289, 0.935547, -0.701534}};
	};

	class Land_Kiosk_gyros_F 
	{
		table = "Shop";
		positions[] = {{-1.20898, -1.07813, -1.97606}, {1.26758, -0.128906, -1.97606}};
	};

	class Land_bo_A_GeneralStore_01 {
		table = "Shop";
		positions[] = {{11.8149,1.27979,-1.20155},{5.10449,1.61377,-1.20155},{1.70215,3.4292,-1.20155},{-0.771973,2.04102,-1.20155},{-3.59473,-6.04688,-1.20155},{-2.38428,-5.82202,-1.20155},{10.5171,-6.46729,-1.20155},{12.8472,-4.97754,-1.20155},{8.63623,-3.65381,-1.20155},{-3.22852,-10.0454,-1.21081}};
	};	

	class Land_bo_Barn_W_01 {
		table = "CivillianUpperClass";
		positions[] = {{-4.45776,14.2153,-2.71607},{4.34277,-6.15088,-2.57279}};
	};	

	class Land_bo_Barn_W_02 {
		table = "CivillianLowerClass";
		positions[] = {{3.16504,5.56543,-2.31409},{3.35938,-0.152344,-2.31305},{2.53613,-5.89453,-2.30957},{-2.94629,-5.01367,-2.31006},{-2.84375,0.212891,-2.31183},{-5.63281,4.8291,-2.31363}};
	};

	class Land_bo_Farm_Cowshed_a {
		table = "CivillianLowerClass";
		positions[] = {{-1.06836,-5.92163,-3.08763},{1.69043,-4.91089,-3.08763},{5.8833,-6.15381,-3.08763},{8.83984,-5.60278,-3.08763},{9.74023,-2.48657,-3.08763},{2.88428,-2.34546,-3.08763},{7.88037,2.94214,-3.08763}};
	};

	class Land_bo_Farm_Cowshed_b {
		table = "CivillianLowerClass";
		positions[] = {{-3.26782,2.71875,-3.0311},{5.41699,-2.57813,-3.04111}};
	};

	class Land_bo_Farm_Cowshed_c {
		table = "CivillianLowerClass";
		positions[] = {{0.625,-2.61133,-3.06583}};
	};

	class Land_bo_Hlidac_budka {
		table = "CivillianLowerClass";
		positions[] = {{2.4209,2.16064,-0.783617}};
	};

	class Land_bo_HouseBlock_A1_1 {
		table = "CivillianUpperClass";
		positions[] = {{-3.52881,0.158936,-4.74365},{-3.56152,-2.33484,-4.73106}};
	};

	class Land_bo_HouseB_Tenement {
		table = "CivillianUpperClass";
		positions[] = {{2.39063,4.80322,-19.8245},{-10.2041,-0.48877,-20.3445},{4.65625,-2.125,-20.3445},{7.27734,11.5957,-20.8045},{-4.50854,5.10645,-19.8245},{5.11865,12.0298,-20.8045},{13.5625,12.1631,-20.8045}};
	};

	class Land_bo_HouseV2_01A {
		table = "CivillianUpperClass";
		positions[] = {{-3.53906,-3.29736,-5.55779},{-0.759766,-3.95068,-5.56563}};
	};

	class Land_bo_HouseV2_02_Interier {
		table = "CivillianUpperClass";
		positions[] = {{6.97412,1.26904,-5.53068},{4.21631,6.56396,-5.53068},{-5.94922,-1.28955,-5.53068},{-3.31494,6.44287,-5.53068}};
	};

	class Land_bo_HouseV2_04_Interier {
		table = "CivillianUpperClass";
		positions[] = {{-5.08826,3.13818,-5.73971},{7.37061,6.52881,-5.73873},{1.75281,3.70752,-5.73953},{-3.75183,7.1626,-5.73842},{0.292725,1.27441,-2.93809}};
	};

	class Land_bo_HouseV_1I1 {
		table = "CivillianLowerClass";
		positions[] = {{0.728516,-2.01514,-2.86235}};
	};	

	class Land_bo_HouseV_1I4 {
		table = "CivillianLowerClass";
		positions[] = {{0.222168,3.90839,-2.73031},{-1.82983,-1.81403,-2.76768}};
	};	

	class Land_bo_HouseV_1L2 {
		table = "CivillianLowerClass";
		positions[] = {{-2.58887,-4.8584,-0.789368},{-2.58887,-4.8584,-0.789368},{-2.37646,0.373047,-0.799377}};
	};

	class Land_bo_Panelak {
		table = "CivillianUpperClass";
		positions[] = {{2.00415,-1.33325,12.3769},{0.0378418,-1.23608,-10.8254}};
	};

	class Land_bo_Panelak2 {
		table = "CivillianUpperClass";
		positions[] = {{0.53833,2.0498,-1.29137},{4.87939,1.90234,5.46665},{4.71045,-3.02197,5.46665},{6.01514,-5.86133,5.46665},{3.8833,-4.72314,5.46665}};
	};

	class Land_bo_Shed_Ind02 {
		table = "Industrial";
		positions[] = {{3.39893,9.21875,-4.67596},{1.29541,0.227539,-4.67596},{-0.458984,11.6934,-1.28638},{-4.00879,-8.42773,-1.29721}};
	};

	class Land_bo_stodola_old_open {
		table = "CivillianUpperClass";
		positions[] = {{2.5437,-10.6599,2.96444},{-0.4021,-10.6228,2.96444},{-2.56641,-10.8538,-0.995487},{4.6665,3.45386,-5.08055},{-2.24414,10.396,-5.08055},{3.08691,9.24976,-5.08055},{-1.12744,10.5359,-0.993513},{-1.27563,10.6184,2.96444},{2.99268,10.7668,2.96444},{4.35425,-10.5923,-5.08055},{-2.47363,-5.49194,-5.08055}};
	};

	class Land_bo_stodola_open {
		table = "CivillianUpperClass";
		positions[] = {{-3.77881,6.2478,-4.11348},{1.59106,6.31494,-4.10928},{-3.94727,-1.95605,-4.15359},{-0.440918,-3.91187,-4.1938}};
	};

	class Land_bo_Dum_mesto2 {
		table = "CivillianUpperClass";
		positions[] = {{2.46582,7.10742,-4.34475},{2.87305,4.03906,-4.34475},{-3.56738,4.05078,-4.34475},{-2.49902,0.46875,-4.34475},{1.77734,-7.41797,-4.34475},{-3.24512,-7.69922,-4.34475},{-3.16113,-1.58984,-4.34475},{3.19531,1.64258,-0.945168},{-3.19141,7.76563,-0.944004},{-0.253906,4.78516,-0.944004},{-3.35645,-5.74414,-0.944004},{-1.70508,-7.22656,-0.944004},{1.21973,-1.07617,-0.944004}};
	};

	class Land_bo_Sara_domek_sedy {
		table = "CivillianLowerClass";
		positions[] = {{-1.76367,-1.11328,-2.14196},{-5.0127,3.01953,-2.14196},{5.41211,2.625,-2.14196},{4.86035,-0.738281,-2.14196}};
	};

	class Land_bo_Dum_rasovna {
		table = "CivillianLowerClass";
		positions[] = {{-1.271,3.38281,-2.69958},{3.14893,3.86255,-2.69958},{3.30957,-4.17871,-2.69958},{-0.936523,-1.97412,0.242605},{1.05518,3.77271,0.242605}};
	};	

	class Land_bo_Deutshe_mini {
		table = "CivillianLowerClass";
		positions[] = {{-4.34277,-2.54297,-2.74846},{-0.624023,-0.357422,-2.74846},{0.853516,1.04395,-2.74846},{-2.75781,2.44336,-2.74846}};
	};

	class Land_bo_A_Office01 {
		table = "Military";
		positions[] = { {-7.84912,6.3855,-4.528},{3.84424,3.27051,-4.528},{-0.0383301,3.51733,-4.528},{5.37695,5.63379,-4.528},{15.5393,-1.90015,-4.528},{13.8057,-2.3811,-4.528},{10.114,3.44849,-4.528},{10.3008,6.32495,-4.528},{1.71021,1.66675,-4.528},{1.58032,5.87671,-2.028},{-0.599854,7.08984,-2.028},{3.87769,6.84229,-2.028},{-7.6709,6.72485,-2.038},{-4.729,4.19556,-2.028},{-7.93091,3.2041,-2.038},{10.2354,-1.9187,-2.018},{6.9812,-4.30933,-2.038},{15.4075,6.03198,-2.038},{13.9285,3.40649,-2.038},{0.163086,3.43286,0.472002},{7.13892,3.64844,0.471998},{1.71973,-1.40967,6.72491},{-0.443359,0.61499,-2.028},{-5.22144,-3.69971,-2.028}};
	};

	class Land_bo_Shed_wooden {
		table = "Industrial";
		positions[] = {{1.26807,-0.361328,-1.29153},{-0.342773,1.0293,-1.29153}};
	};

	class Land_Wreck_HMMWV_F
	{
		table = "Military";
		positions[] = {{4.0293, -0.556641, -0.833923}, {2.08008, -2.91992, -0.816956}, {0.713867, -5.54102, -0.7911}, {4.27344, 2.7334, -0.831413}, {-5.53906, -0.682617, -0.757545}, {-4.62891, 3.81836, -0.818192}, {1.91211, 0.854492, -0.826019}, {-2.31934, -4.2959, -0.756771}, {5.00488, -5.05762, -0.853081}, {-2.9082, -1.99023, -0.773548}, {-3.7666, 1.06934, -0.796432}, {-1.55176, 3.86621, -0.827766}, {1.43848, 4.16211, -0.828751}, {0.566406, 6.57813, -0.832043}, {-5.15918, -4.12695, -0.707153}};
	};
	class Land_UWreck_Heli_Attack_02_F
	{
		table = "Military";
		positions[] = {{-1.17383, 8.0918, -2.79785}, {2.92285, -9.17188, -2.77692}, {3.7041, 0.40918, -2.84418}, {-0.260742, -9.69434, -2.67627}, {2.69434, 7.49609, -2.72632}, {1.69922, 10.1006, -2.71313}, {6.04102, 1.19434, -2.90607}, {4.15332, -3.63574, -2.86328}, {0.224609, 4.14941, -2.80768}, {-1.55957, 1.5957, -2.79156}, {-3.49121, 5.05664, -2.82739}, {2.37891, -5.42676, -2.78564}, {-4.07129, -2.78711, -2.71198}, {-1.16895, -6.24023, -2.71613}, {6.19141, -1.70313, -2.93707}, {2.27148, 3.82129, -2.76392}, {-0.84082, -0.824219, -2.7915}, {-4.71973, 1.80469, -2.78058}, {2.14648, -1.65723, -2.79163}};
	};
	class Land_Wreck_Heli_Attack_01_F
	{
		table = "Military";
		positions[] = {{4.70996, 0.0126953, -1.30374}, {6.44922, -0.716797, -1.34763}, {-4.12793, -1.82129, -1.21921}, {4.33301, -3.32129, -1.29483}, {-4.82617, -5.78906, -1.15488}, {5.58203, -6.82031, -1.32773}, {-1.6748, 2.70801, -1.03955}, {-4.12598, 8.37305, -1.3215}, {-3.43359, 1.23633, -1.25858}, {-3.50098, -9.40137, -1.09824}, {1.76855, 9.11621, -1.22073}, {-0.423828, -12.4766, -1.08585}, {3.20215, 1.78516, -1.25568}, {2.43164, -10.0293, -1.19006}, {4.36133, 4.94922, -1.25189}, {-0.0927734, 5.94727, -1.21329}};
	};

};

#include "CfgLootTables.hpp"

class CfgSettings
{
	///////////////////////////////////////////////////////////////////////
	// GARBAGE COLLECTOR
	///////////////////////////////////////////////////////////////////////
	class GarbageCollector
	{
		/*
			Remark: 
			In 0.9.35 and below, Exile has checked if a player was nearby and then delayed
			the deletion. This check has been removed to save server performance.

			Do NOT touch these if you are not 10000% sure what you do!	
		*/
		class Ingame 
		{
			// Dropped items without fissix
			class GroundWeaponHolder
			{
				lifeTime = 10;
				interval = 5;
			};

			// Dropped items with fissix
			class WeaponHolderSimulated
			{
				lifeTime = 10;
				interval = 5;
			};

			// Corpses and wrecks
			class AllDead 
			{
				lifeTime = 15;
				interval = 5;
			};

			// Loot spawned inside a building
			class Loot 
			{
				lifeTime = 8;
				interval = 1;
			};

			// Never touch this or you will break your sever!
			class Groups 
			{
				interval = 0.5;
			};
		};

		class Database 
		{
			// Remove all territories (and contructions + containers in it) that were not paid after X days
			territoryLifeTime = 10;

			// Remove all containers outside of territories that have not been used for X days
			// Example: Tents
			containerLifeTime = 7;

			// Remove all constructions outside of territories that are older than X days or not moved for X days 
			// Example: Work Benches
			constructionLifeTime = 2;

			// Remove all vehicles that were not moved/used for X days
			vehicleLifeTime = 5;
			
			// Set safe as abandoned
			abandonedTime = 7;

		};
	};

	///////////////////////////////////////////////////////////////////////
	// RESPECT, YO
	///////////////////////////////////////////////////////////////////////
	class Respect
	{
		/**
		* Defines the factor of respect you gain for every pop tab in revenue
		*
		* Default: Get 1 respect for every 10 pop tabs 
		*/
		tradingRespectFactor = 0.01;

		/**
		* Defines the amount of respect earned/lost for certain types of frags
		*/
		class Frags
		{
			bambi = -500;				// Bambi slayers
			friendlyFire = -1000;		// For party members
			standard = 100;				// Normal kill
			domination = 80;			// Keeps killing the same guy
			letItRain = 150;			// MG, also vehicle MGs
			humiliation = 300;			// Axe
			passenger = 400;			// Out of car/chopper/boat
			roadKill = 200;				// :)
			bigBird = 600;				// Roadkill, but with chopper/plane
			chuteGreaterChopper = 1000;	// Someone flies into chute and chopper/plane explodes	
		};

		class Handcuffs 
		{
			trapping = -50;					// A handcuffs B
			breakingFree = 100; 			// B broke free
			releasedByHero = 100; 			// C releases B
			releasedByHostageTaker = 50; 	// A releases B	
		};

		class Bonus
		{
			// Bonus per full 100m 
			per100mDistance = 25;

			// First blood after server restart
			firstBlood = 500;

			// If you kill someone while you are in your own territory
			homie = 20;

			// If you kill someone who is in his own territory
			raid = 20;

			/*
				Example with killstreak = 50

				Frag  Factor   Bonus	
				2    * 50      +100
				3    * 50      +150
				4    * 50      +200
				5    * 50      +250
			*/
			killStreak = 50;

			// Kills within this amount of seconds stack (default: 2 minutes)
			killStreakTimeout = 120;
		};
	};

	///////////////////////////////////////////////////////////////////////
	// KILLFEED MAN!
	///////////////////////////////////////////////////////////////////////

	class KillFeed
	{
		// Shows a kill feed for well kills
		showKillFeed = 1;
	};

	///////////////////////////////////////////////////////////////////////
	// PLAYER SPAWN CONFIGURATION
	///////////////////////////////////////////////////////////////////////
	class BambiSettings
	{
		/**
		 * Loadout of new bambi players
		 *
		 * (They will always spawn with a bambi overall - you cannot 
		 * change the loadout uniform)
		 */
		loadOut[] = 
		{
			"Exile_Item_CanOpener",
			"ItemCompass",
			"ItemMap",
			"Exile_Item_XM8",
			"ItemRadio",
			"Exile_Item_PlasticBottleFreshWater"
		};

		/**
		 * Enables or disables parachute spawning.
		 *
		 * 1 = On
		 * 0 = Off
		 */
		parachuteSpawning = 1;

		/**
		 * Enables or disables halo jumping. Only applies 
		 * if parachute spawning is enabled.
		 *
		 * Remember that if you enable halo jump, it is adviced
		 * to adjust the parachuteDropHeight to something around
		 * 1km or so.
		 *
		 * 1 = On
		 * 0 = Off
		 */
		haloJump = 0;

		/**
		 * Parachute drop height in meters. 
		 */
		parachuteDropHeight = 200;

		/**
		 * Number of minutes where a fresh spawned player remains in the
		 * bambi state. It will end the bambi state after this timeout
		 * expired or when they pick up their first weapon. Whatever
		 * happens first.
		 */
		protectionDuration = 5;

		/**
		 * Radius of spawn zones around the center of spawn zone markers.
		 */
		spawnZoneRadius = 500;

		/**
		 * These vehicles spawn on server restart close to spawn zones.
		 * They are non-persistent and will despawn on server restart.
		 * Basically they are just used to get away from the spawn zone
		 * faster.
		 *
		 * {Number of vehicles *per* spawn zone, vehicle class name}
		 */
		spawnZoneVehicles[] =
		{
			{5, "Exile_Bike_QuadBike_White"}
		};
	};

	///////////////////////////////////////////////////////////////////////
	// VEHICLE SPAWN CONFIGURATION
	///////////////////////////////////////////////////////////////////////

	class VehicleSpawn
	{
		/**
		* Grid Size for vehicle spawning,
		* smaller the number more vehicles,
		* you get the point
		*/
		vehiclesGridSize = 2200;

		/**
		* Vehicle ammount per grid
		* kinda self explanitory
		*/
		vehiclesGridAmount = 1;

		/**
		* Creates global markers for vehicle spawn tweeking,
		* after you are satisfied with vehicle ammount and spread set this to 0.
		*/
		vehiclesDebugMarkers = 0;

		/**
		* The server will apply random damage up to this value when spawning a vehicle.
		*/
		damageChance = 20; // 20% chance for a vehicle HITPOINT to be damaged
		maximumDamage = 0.9;

		// Stuff to spawn on water
		water[] = 
		{
			"Exile_Boat_MotorBoat_Police",
			"Exile_Boat_MotorBoat_Orange",
			"Exile_Boat_MotorBoat_White",
			"Exile_Boat_RubberDuck_CSAT",
			"Exile_Boat_RubberDuck_Digital",
			"Exile_Boat_RubberDuck_Orange",
			"Exile_Boat_RubberDuck_Blue",
			"Exile_Boat_RubberDuck_Black",
			"Exile_Boat_SDV_CSAT",
			"Exile_Boat_SDV_Digital",
			"Exile_Boat_SDV_Grey"
		};

		// Stuff to spawn on roads
		ground[] = 
		{
			"Exile_Bike_QuadBike_Blue",
			"Exile_Bike_QuadBike_Red",
			"Exile_Bike_QuadBike_White",
			"Exile_Bike_QuadBike_Nato",
			"Exile_Bike_QuadBike_Csat",
			"Exile_Bike_QuadBike_Fia",
			"Exile_Bike_QuadBike_Guerilla01",
			"Exile_Bike_QuadBike_Guerilla02",
			"Exile_Car_Volha_Blue",
			"Exile_Car_Volha_White",
			"Exile_Car_Lada_Green",
			"Exile_Car_Lada_Taxi",
			"Exile_Car_TowTractor_White",
			"Exile_Car_UAZ_Open_Green",
			"Exile_Car_UAZ_Green",
			"Exile_Car_LandRover_Ambulance_Desert",
			"Exile_Car_Tractor_Red",
			"Exile_Car_OldTractor_Red",
			"Exile_Car_Octavius_White"
		};

		/**
		 * Enables or disables nightvision optics on ALL vehicles
		 *
		 * 0 = off
		 * 1 = on
		 */
		nightVision = 1;

		/**
		 * Enables or disables thermal optics on ALL vehicles
		 *
		 * 0 = off
		 * 1 = on
		 */
		thermalVision = 0;

		/**
		 * Set this to 1 to unlock vehicles on server boot if they are in safe zones
		 *
		 * 0 = off
		 * 1 = on
		 */
		unlockInSafeZonesAfterRestart = 1;	
	};

	class Weather
	{
		/*
			You can define multiple "keyframes" for the weather to change. The server will pick
			a keyframe randomly to simulate the weather. It will change the weather-keyframes
			based on the following interval
		*/
		interval = 30;

		/*
			Add the keyframes here. The server will pick one random, so if you want one 
			weather type of be more dominant compared to others, add it multiple times
		*/
		keyframes[] = {"Sunny"}; 

		/*
			This is a keyframe. Look up the BIKI to get more details about the parameters

			Be sure to design the fog settings at a view distance of 1,600m as this is the
			limit in multiplayer by default

			https://community.bistudio.com/wiki/fogParams
			https://community.bistudio.com/wiki/overcast
			https://community.bistudio.com/wiki/setWaves
			https://community.bistudio.com/wiki/setWindStr
			https://community.bistudio.com/wiki/setGusts
			https://community.bistudio.com/wiki/setRain
			https://community.bistudio.com/wiki/setLightnings
			https://community.bistudio.com/wiki/setRainbow
		*/
		class Sunny
		{
			fogValue = 0.1;
			fogDecay = 0.2;
			fogBase = 0;
			overcast = 0.2;
			waves = 0.2;
			wind = 0.25;
			gusts = 0.1;
			rain = 0;
			lightnings = 0;
			rainbows = 0;
		};

		class Cloudy
		{
			fogValue = 0.2;
			fogDecay = 0.1;
			fogBase = 0;
			overcast = 0.4;
			waves = 0.4;
			wind = 0.25;
			gusts = 0.5;
			rain = 0.1;
			lightnings = 0.1;
			rainbows = 1;
		};

		class Thunderstorm
		{
			fogValue = 0.7;
			fogDecay = 0.2;
			fogBase = 0;
			overcast = 1;
			waves = 1;
			wind = 0.25;
			gusts = 0.5;
			rain = 1;
			lightnings = 1;
			rainbows = 0.5;
		};
	};

	class Time
	{
		// Uses Dedicated Server time as ingame Time
		useRealTime = 0;

		// Will overide RealTime
		useStaticTime = 1;

		// time in ARMA FORMAT << CONFIG
		// https://community.bistudio.com/wiki/setDate

		staticTime[] = {2015,08,22,06,00};
	};


	class RCON
	{
		/*
			Note that for this to work you need to have serverCommandPassowrd defined in config.cfg and BE enabled
		*/

		// This needs to match config.cfg serverCommandPassword
		serverPassword = "penis1234";

		// Autolocks server until its ready to accept players
		useAutoLock = 1;

		// Server will autoLock at that time before restart (minutes)
		restartAutoLock = 3;

		/*
			Number of hours and minutes of your restart period.

			Examples:

			{4, 0} = Every 4 hours
			{1, 30} = Every one and a half hour (who the hell would do this?)
		*/
		restartTimer[] = {2, 0};

		/*
			Kicks players before restart to prevent gear loss.
			We strongely recommend to use this!

			0 = off
			1 = on
		*/
		useAutoKick = 1;

		/*
			Number of minutes before the server kicks players that did
			not disconnect before the restart. Should at least be two
			minutes!
		*/
		kickTime = 2;

		/*
			Self-explanatory

			0 = off
			1 = on
		*/
		useRestartMessages = 0;

		/*
			Number of minutes before the restart to inform your players.

			Only use full minutes here. Value like 5.5 have not been tested.
		*/
		restartWarningTime[] = {15, 10, 5, 3}; 

		/* 
			If set to 1 server will execute '#shutdown',
			to try to shutdown the server
		*/

		useShutdown = 0;
	};

	class ServerSettings
	{
		/*
			Support for custom server FSM if wanted
		*/
		serverFSM = "exile_server\fsm\main.fsm";

		/*
			If this is enabled, Exile developers will spawn with a ton of pop tabs.
			We will have a hard time debugging things if you disable this.
		*/
		devFriendyMode = 0;

		devs[] = 
		{
			"0",
		};
	};

	class Events 
	{
		/*
			A list of events that are active
		*/
		enabledEvents[] = {"SupplyBox","AbandonedSafe"}; 

		class SupplyBox // DONT USE IT: WIP BROKEN
		{
			/*
				Drops a supply box on a parachute next to a random airport on the map.
				The box may contain items. The box can be transported to a territory
				and installed to become a normal storage container.
			*/
			type = "spawn";
			function = "ExileServer_system_event_supplyBox_start";
			minTime = 60; // minutes
			maxTime = 130; // minutes
			minimumPlayersOnline = 5;
			dropRadius = 500; // 500m around an airport (including the main airport on Altis!)
			dropAltitude = 150; // altitude of the drop
			markerTime = 10; // minutes

			/*
				These are different types of boxes can be dropped.
				You can specify the cargo a box should contain.
				The type of box is chosen randomly from the following list.
				Add a type multiple times to increase the chance of being used.
			*/
			types[] = {"Building","Weapons","Medical"};

			class BoxTypes
			{
				class Building 
				{
					items[] = 
					{
						{"Exile_Item_WoodWallKit",5},
						{"Exile_Item_WoodWallHalfKit",2},
						{"Exile_Item_WoodWindowKit",2},
						{"Exile_Item_WorkBenchKit",2},
						{"Exile_Item_WoodFloorPortKit",2},
						{"Exile_Item_WoodFloorKit",5},
						{"Exile_Item_WoodGateKit",1},
						{"Exile_Item_Flag",1},
						{"Exile_Item_SafeKit",1}
					};
				};

				class Medical 
				{
					items[] = 
					{
						{"Exile_Item_Defibrillator",1},
						{"Exile_Magazine_Battery",2},
						{"Exile_Item_InstaDoc",3},
						{"Exile_Item_Bandage",2},
						{"Exile_Item_Vishpirin",2},
						{"Exile_Item_Heatpack",2}
					};
				};

				class Weapons 
				{
					items[] = 
					{
						{"LMG_Zafir_F",1},
						{"MMG_01_hex_F",1},
						{"srifle_EBR_F",1},
						{"srifle_DMR_01_F",1},
						{"srifle_GM6_F",1},
						{"srifle_LRR_F",1},
						{"srifle_DMR_02_F",1},
						{"MMG_01_tan_F",1},
						{"srifle_DMR_03_F",1},
						{"srifle_DMR_03_khaki_F",1},
						{"srifle_DMR_03_tan_F",1},
						{"srifle_DMR_04_F",1},
						{"srifle_LRR_camo_F",1},
						{"CUP_lmg_M249_para",1},
						{"CUP_lmg_Mk48_des",1},
						{"CUP_lmg_Pecheneg",1},
						{"CUP_lmg_UK59",1},
						{"CUP_srifle_DMR",1},
						{"CUP_srifle_ksvk",1},
						{"CUP_srifle_M110",1},
						{"CUP_srifle_M14",1},
						{"CUP_srifle_M24_des",1},
						{"CUP_srifle_M24_wdl",1},
						{"CUP_srifle_SVD",1},
						{"CUP_srifle_SVD_des",1},
						{"CUP_srifle_VSSVintorez",1},
						{"CUP_srifle_CZ750",1},
						{"CUP_srifle_Mk12SPR",1},
						{"CUP_srifle_CZ550",1},
						{"CUP_srifle_LeeEnfield",1},
						{"CUP_srifle_M40A3",1}
					};
				};
			};
		};
		class AbandonedSafe
		{

			type = "spawn";
			function = "ExileServer_system_event_abandonedSafe_start";
			minTime = 60; // minutes
			maxTime = 120; // minutes
			minimumPlayersOnline = 0;
			markerTime = 15; // minutes
		};
	};
};