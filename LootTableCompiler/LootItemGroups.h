/*//////////////////////////////////////////////////////////////////////////////
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
	> <Group Name>
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
	chance to spawn a Tomato.
*/
	
/*
	Item Groups
*/


> Food
3, Exile_Item_CookingPot
5, Exile_Item_CanOpener
5, Exile_Item_Matches
2, Exile_Item_EMRE						// 75% Hunger
3, Exile_Item_GloriousKnakworst			// 60% Hunger
6, Exile_Item_Surstromming				// 55% Hunger
7, Exile_Item_SausageGravy				// 50% Hunger
7, Exile_Item_ChristmasTinner			// 40% Hunger
5, Exile_Item_MacasCheese				// 40% Hunger
6, Exile_Item_BBQSandwich				// 40% Hunger
8, Exile_Item_CatFood					// 40% Hunger
8, Exile_Item_Dogfood					// 30% Hunger
5, Exile_Item_BeefParts					// 30% Hunger
5, Exile_Item_Cheathas					// 30% Hunger
5, Exile_Item_DsNuts					// 30% Hunger
5, Exile_Item_Noodles					// 25% Hunger
2, Exile_Item_CockONut					// 20% Hunger
4, Exile_Item_SeedAstics				// 20% Hunger
4, Exile_Item_Raisins					// 15% Hunger
3, Exile_Item_Moobar					// 10% Hunger
2, Exile_Item_InstantCoffee			//  5% Hunger

> Drinks
5, Exile_Item_PowerDrink					// +95% Thirst
25, Exile_Item_PlasticBottleFreshWater		// +80% Thirst
3, Exile_Item_Beer							// +75% Thirst
17, Exile_Item_EnergyDrink					// +75% Thirst
20, Exile_Item_MountainDupe					// +50% Thirst, spawns always twice!	
20, Exile_Item_ChocolateMilk				// +35% Thirst
10, Exile_Item_PlasticBottleDirtyWater		// +10% Thirst

> Pistols 
7, hgun_ACPC2_F			// ACP-C2 .45
9, hgun_P07_F				// P07 9 mm
9, hgun_Rook40_F			// Rook-40 9 mm
7, hgun_Pistol_heavy_01_F	// 4-five .45
6, hgun_Pistol_heavy_02_F	// Zubr .45
9, hgun_Pistol_Signal_F	// Starter Pistol
8, Exile_Weapon_Colt1911   // Colt 1911
9, Exile_Weapon_Makarov	// Makarov
9, Exile_Weapon_Taurus		// Taurus
//2, Exile_Weapon_TaurusGold	// Taurus (Gold)
9, hgun_Pistol_01_F		// PM 9 mm
9, hgun_P07_khk_F			// P07 9 mm (Khaki)
7, hlc_smg_mp5k 			//MP5K


> PistolAmmo
7, 11Rnd_45ACP_Mag				// 4-five
7, 16Rnd_9x21_Mag				// PDW2000, P07, ROOK-40
8, 30Rnd_9x21_Mag				// Sting, PDW2000, P07, ROOK-40
7, 6Rnd_45ACP_Cylinder			// Zubr
5, 6Rnd_GreenSignal_F			// Starter Pistol
5, 6Rnd_RedSignal_F				// Starter Pistol 
7, 9Rnd_45ACP_Mag				// ACP-C2
7, Exile_Magazine_7Rnd_45ACP	// Colt 1911
10, Exile_Magazine_8Rnd_9x18	// Makarov
10, Exile_Magazine_6Rnd_45ACP	// Taurus
10, 10Rnd_9x21_Mag				// PM 9 mm
7, hlc_30Rnd_9x19_B_MP5
5, hlc_30Rnd_9x19_GD_MP5
5, hlc_30Rnd_9x19_SD_MP5

> PistolAttachments
36, muzzle_snds_L
36, muzzle_snds_acp
14, optic_Yorris		// No one needs this crap
14, optic_MRD

> Shotguns
1, Exile_Weapon_M1014	//M1014

> ShotgunAmmo
1, Exile_Magazine_8Rnd_74Slug		//M1014

> SMG
6, SMG_01_F		// Vermin SMG .45 ACP
8, SMG_02_F		// Sting 9 mm
7, SMG_05_F		// Protector 9mm
7, hgun_PDW2000_F	// PDW2000 9 mm
5, hlc_smg_mp510
8, hlc_smg_mp5a2
8, hlc_smg_mp5a3
8, hlc_smg_mp5a4
5, hlc_smg_mp5k_PDW
5, hlc_smg_mp5n
5, hlc_smg_9mmar
5, hlc_smg_mp5sd5
5, hlc_smg_mp5sd6
3, hlc_rifle_augpara
3, hlc_rifle_augpara_b
3, hlc_rifle_augpara_t
3, hlc_rifle_auga2para
3, hlc_rifle_auga2para_b
3, hlc_rifle_auga2para_t

> SMGAmmo
7, 30Rnd_45ACP_Mag_SMG_01					// Vermin SMG
7, 30Rnd_45ACP_Mag_SMG_01_Tracer_Green		// Vermin SMG
10, 30Rnd_9x21_Mag_SMG_02					// Sting, Protector
8, 30Rnd_9x21_Mag_SMG_02_Tracer_Red        // Sting, Protector
8, 30Rnd_9x21_Mag_SMG_02_Tracer_Yellow     // Sting, Protector
8, 30Rnd_9x21_Mag_SMG_02_Tracer_Green      // Sting, Protector
11, hlc_30Rnd_10mm_B_MP5
11, hlc_30Rnd_10mm_JHP_MP5
9, hlc_25Rnd_9x19mm_JHP_AUG
9, hlc_25Rnd_9x19mm_M882_AUG
8, hlc_25Rnd_9x19mm_subsonic_AUG

> SMGAttachments
10, optic_Holosight_smg
10, optic_Holosight_smg_blk_F
20, optic_ACO_grn_smg
20, optic_Aco_smg
20, optic_ACO_grn
20, optic_Aco


> LightRifles
10, arifle_SDAR_F			// SDAR 5.56 mm
10, arifle_TRG21_F			// TRG-21 5.56 mm
10, arifle_TRG20_F			// TRG-20 5.56 mm
7, arifle_TRG21_GL_F		// TRG-21 EGLM 5.56 mm
10, arifle_Mk20_F			// Mk20 5.56 mm
10, arifle_Mk20C_F			// Mk20C 5.56 mm
7, arifle_Mk20_GL_F			// Mk20 EGLM 5.56 mm	
10, arifle_CTAR_blk_F            // CAR-95 5.8 mm (Black)
10, arifle_CTAR_hex_F			// CAR-95 5.8 mm (Hex)
10, arifle_CTAR_ghex_F			// CAR-95 5.8 mm (Green Hex)
7, arifle_CTAR_GL_blk_F         // CAR-95 GL 5.8 mm (Black)
10, arifle_CTARS_blk_F           // CAR-95-1 5.8mm (Black)
10, arifle_CTARS_ghex_F			// CAR-95-1 5.8mm (Green Hex)
10, arifle_CTARS_hex_F			// CAR-95-1 5.8mm (Hex)
10, arifle_SPAR_01_blk_F         // SPAR-16 5.56 mm (Black)
10, arifle_SPAR_01_khk_F         // SPAR-16 5.56 mm (Khaki)
10, arifle_SPAR_01_snd_F         // SPAR-16 5.56 mm (Sand)
7, arifle_SPAR_01_GL_blk_F      // SPAR-16 GL 5.56 mm (Black)
7, arifle_SPAR_01_GL_khk_F      // SPAR-16 GL 5.56 mm (Khaki)
7, arifle_SPAR_01_GL_snd_F      // SPAR-16 GL 5.56 mm (Sand)
10, arifle_SPAR_02_blk_F         // SPAR-16S 5.56 mm (Black)
10, arifle_SPAR_02_khk_F         // SPAR-16S 5.56 mm (Khaki)
10, arifle_SPAR_02_snd_F         // SPAR-16S 5.56 mm (Sand)
10, Exile_Weapon_AK107	
7, Exile_Weapon_AK107_GL	
7, Exile_Weapon_AK74_GL
10, Exile_Weapon_AK74
10, Exile_Weapon_AK47				
3, Exile_Weapon_AKS_Gold
10, Exile_Weapon_LeeEnfield
10, Exile_Weapon_CZ550
10, hlc_rifle_aug
10, hlc_rifle_auga1carb
10, hlc_rifle_auga2
10, hlc_rifle_auga2carb
10, hlc_rifle_auga2lsw
10, hlc_rifle_auga3
10, hlc_rifle_auga3_gl
10, hlc_rifle_aughbar
10, hlc_rifle_augsr
10, hlc_rifle_augsrcarb
10, hlc_rifle_augsrhbar
10, hlc_rifle_ak12
7, hlc_rifle_ak12gl
10, hlc_rifle_ak47
10, hlc_rifle_ak74
10, hlc_rifle_ak74_mtk
10, hlc_rifle_ak74m
7, hlc_rifle_ak74m_gl
10, hlc_rifle_ak74m_mtk
10, hlc_rifle_akm
10, hlc_rifle_akm_mtk
10, hlc_rifle_akmgl
10, hlc_rifle_aks74
7, hlc_rifle_aks74_gl
10, hlc_rifle_aks74_mtk
10, hlc_rifle_aks74u
10, hlc_rifle_aks74u_mtk
10, hlc_rifle_aku12
10, hlc_rifle_rk62
10, hlc_rifle_aek971
10, hlc_rifle_aek971_mtk
10, hlc_rifle_g36a1
10, hlc_rifle_g36a1ag36
10, hlc_rifle_g36c
10, hlc_rifle_g36cmlic
10, hlc_rifle_g36ctac
10, hlc_rifle_g36cv
10, hlc_rifle_g36e1
10, hlc_rifle_g36e1ag36
10, hlc_rifle_g36ka1
10, hlc_rifle_g36ke1
10, hlc_rifle_g36kmlic
10, hlc_rifle_g36ktac
10, hlc_rifle_g36kv
10, hlc_rifle_g36mliag36
10, hlc_rifle_g36mlic
10, hlc_rifle_g36tac
10, hlc_rifle_g36v
8, hlc_rifle_g36vag36
10, hlc_rifle_slr
10, hlc_rifle_slr107u
10, hlc_rifle_slr107u_mtk
10, hlc_rifle_slrchopmod
10, hlc_rifle_stg58f
10, hlc_rifle_stgw57


> MediumRifles
10, arifle_Katiba_F			// Katiba 6.5 mm
7, arifle_Katiba_GL_F		// Katiba GL 6.5 mm
10, arifle_MXC_F				// MXC 6.5 mm
10, arifle_MXC_Black_F		// MXC 6.5 mm (Black)
10, arifle_MX_Black_F		// MX 6.5 mm (Black)
7, arifle_MX_GL_Black_F		// MX 3GL 6.5 mm (Black)
10, arifle_MX_F				// MX 6.5 mm
7, arifle_MX_GL_F			// MX 3GL 6.5 mm
10, arifle_MXM_F				// MXM 6.5 mm
10, arifle_MXM_Black_F		// MXM 6.5 mm (Black)
10, arifle_MX_khk_F   			// MX 6.5 mm (Khaki)
7, arifle_MX_GL_khk_F			// MX 3GL 6.5 mm (Khaki)
10, arifle_MXC_khk_F  			// MXC 6.5 mm (Khaki)
10, arifle_MXM_khk_F  			// MXM 6.5 mm (Khaki)
10, arifle_AK12_F          		// AK-12 7.62 mm
7, arifle_AK12_GL_F             // AK-12 GL 7.62 mm
10, arifle_AKM_F                 // AKM 7.62 mm
8, arifle_AKM_FL_F              // AKM 7.62 mm
10, arifle_AKS_F                 // AKS
10, arifle_ARX_blk_F             // Type 115 6.5 mm (Black)
10, arifle_ARX_ghex_F            // Type 115 6.5 mm (Green Hex)
10, arifle_ARX_hex_F             // Type 115 6.5 mm (Hex)
10, arifle_SPAR_03_blk_F         // SPAR-17 7.62 mm (Black)
10, arifle_SPAR_03_khk_F         // SPAR-17 7.62 mm (Khaki)
10, arifle_SPAR_03_snd_F         // SPAR-17 7.62 mm (Sand)
10, Exile_Weapon_DMR		
10, Exile_Weapon_VSSVintorez
8, hlc_rifle_rpk
8, hlc_rifle_RPK12
8, hlc_rifle_rpk74n
8, hlc_rifle_mg36
10, hlc_rifle_g3a3
8, hlc_rifle_g3a3ris
10, hlc_rifle_g3a3v
10, hlc_rifle_g3ka4
7, hlc_rifle_g3ka4_gl
10, hlc_rifle_l1a1slr
10, hlc_rifle_lar
10, hlc_rifle_m4
7, hlc_rifle_m4m203
8, hlc_rifle_osw_gl
10, hlc_rifle_ru556
10, hlc_rifle_ru5562
10, hlc_rifle_samr
10, hlc_rifle_samr2
10, hlc_rifle_sig5104
10, hlc_rifle_stgw57_commando
10, hlc_rifle_stgw57_ris



> HeavyRifles
10, Exile_Weapon_SVD
8, Exile_Weapon_SVDCamo
10, hlc_rifle_hk33a2
8, hlc_rifle_hk33a2ris
10, hlc_rifle_hk51
10, hlc_rifle_hk53
10, hlc_rifle_hk53ras
10, hlc_rifle_amt
10, hlc_rifle_bcmjack
8, hlc_rifle_bushmaster300
10, hlc_rifle_c1a1
10, hlc_rifle_colt727
8, hlc_rifle_colt727_gl
10, hlc_rifle_cqbr
10, hlc_rifle_fal5000
10, hlc_rifle_fal5000rail
10, hlc_rifle_fal5061
10, hlc_rifle_fal5061rail
10, hlc_rifle_falosw
7, hlc_rifle_honeybadger
7, hlc_rifle_vendimus



> RifleAmmo
10, 20Rnd_556x45_UW_mag						// SDAR
15, 30Rnd_556x45_Stanag						// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
15, 30Rnd_556x45_Stanag_green				// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
15, 30Rnd_556x45_Stanag_red					// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
10, 30Rnd_556x45_Stanag_Tracer_Green			// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
10, 30Rnd_556x45_Stanag_Tracer_Red			// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
10, 30Rnd_556x45_Stanag_Tracer_Yellow		// TRG-20, TRG-21/EGLM, Mk20/C/EGLM, SDAR, SPAR-16
10, 30Rnd_65x39_caseless_green				// Katiba, Type 115
10, 30Rnd_65x39_caseless_green_mag_Tracer	// Katiba, Type 115
10, 30Rnd_65x39_caseless_mag					// MX/C/M/SW/3GL
10, 30Rnd_65x39_caseless_mag_Tracer			// MX/C/M/SW/3GL
10, Exile_Magazine_10Rnd_303					// Lee-Enfield
10, Exile_Magazine_30Rnd_762x39_AK			// AK
10, Exile_Magazine_30Rnd_545x39_AK			// AK
10, Exile_Magazine_30Rnd_545x39_AK_Green		// AK
10, Exile_Magazine_30Rnd_545x39_AK_Red		// AK
10, Exile_Magazine_30Rnd_545x39_AK_White		// AK
10, Exile_Magazine_30Rnd_545x39_AK_Yellow	// AK
8, Exile_Magazine_20Rnd_762x51_DMR			// DMR
8, Exile_Magazine_20Rnd_762x51_DMR_Yellow	// DMR
8, Exile_Magazine_20Rnd_762x51_DMR_Red		// DMR
8, Exile_Magazine_20Rnd_762x51_DMR_Green	// DMR
8, Exile_Magazine_20Rnd_762x51_DMR_White	// DMR
10, Exile_Magazine_5Rnd_22LR					// CZ550
8, Exile_Magazine_10Rnd_762x54				// SVD
8, Exile_Magazine_20Rnd_9x39				// VSS
10, 30Rnd_762x39_Mag_F						// AK-12, AKM
10, 30Rnd_762x39_Mag_Green_F                 // AK-12, AKM
10, 30Rnd_762x39_Mag_Tracer_F                // AK-12, AKM
10, 30Rnd_762x39_Mag_Tracer_Green_F          // AK-12, AKM
10, 30Rnd_762x39_AK47_M						// AKS
10, 30Rnd_545x39_Mag_F						// AKS
10, 30Rnd_545x39_Mag_Green_F					// AKS
10, 30Rnd_545x39_Mag_Tracer_F				// AKS
10, 30Rnd_545x39_Mag_Tracer_Green_F			// AKS
8, 10Rnd_50BW_Mag_F							// Type 115
8, 30Rnd_580x42_Mag_F						// CAR-95
8, 30Rnd_580x42_Mag_Tracer_F				// CAR-95
8, 100Rnd_580x42_Mag_F						// CAR-95-1
8, 100Rnd_580x42_Mag_Tracer_F				// CAR-95-1
8, 150Rnd_556x45_Drum_Mag_F					// SPAR-16S 
8, 150Rnd_556x45_Drum_Mag_Tracer_F			// SPAR-16S 
8, 20Rnd_762x51_Mag							// SPAR-17
10, hlc_20Rnd_762x51_b_amt
10, hlc_20Rnd_762x51_B_fal
10, hlc_20rnd_762x51_b_G3
10, hlc_20Rnd_762x51_B_M14
10, hlc_20Rnd_762x51_barrier_fal
10, hlc_20rnd_762x51_barrier_G3
10, hlc_20Rnd_762x51_barrier_M14
10, hlc_20Rnd_762x51_bball_amt
10, hlc_20Rnd_762x51_mk316_amt
10, hlc_20Rnd_762x51_mk316_fal
10, hlc_20rnd_762x51_Mk316_G3
10, hlc_20Rnd_762x51_mk316_M14
10, hlc_20Rnd_762x51_S_fal
10, hlc_20rnd_762x51_S_G3
10, hlc_20Rnd_762x51_S_M14
10, hlc_20Rnd_762x51_T_amt
10, hlc_20Rnd_762x51_T_fal
10, hlc_20rnd_762x51_T_G3
10, hlc_20Rnd_762x51_T_M14
10, hlc_24Rnd_75x55_ap_stgw
10, hlc_24Rnd_75x55_B_stgw
10, hlc_24Rnd_75x55_T_stgw
10, hlc_30Rnd_545x39_B_AK
10, hlc_30Rnd_545x39_EP_ak
10, hlc_30Rnd_545x39_S_AK
10, hlc_30Rnd_545x39_t_ak
10, hlc_30Rnd_556x45_B_AUG
10, hlc_30rnd_556x45_b_HK33
10, hlc_30rnd_556x45_EPR
10, hlc_30rnd_556x45_EPR_G36
10, hlc_30rnd_556x45_EPR_HK33
10, hlc_30rnd_556x45_S
10, hlc_30rnd_556x45_SOST
10, hlc_30Rnd_556x45_SOST_AUG
10, hlc_30rnd_556x45_SOST_G36
10, hlc_30rnd_556x45_SOST_HK33
10, hlc_30rnd_556x45_SPR
10, hlc_30Rnd_556x45_SPR_AUG
10, hlc_30rnd_556x45_SPR_G36
10, hlc_30Rnd_556x45_T_AUG
10, hlc_30rnd_556x45_t_HK33
10, hlc_30rnd_556x45_Tracers_G36
10, hlc_30Rnd_762x39_b_ak
10, hlc_30rnd_762x39_s_ak
10, hlc_30Rnd_762x39_t_ak
10, hlc_40Rnd_556x45_B_AUG
10, hlc_40Rnd_556x45_SOST_AUG
10, hlc_40Rnd_556x45_SPR_AUG
10, hlc_45Rnd_545x39_t_rpk
10, hlc_45Rnd_762x39_m_rpk
10, hlc_45Rnd_762x39_t_rpk
10, hlc_50rnd_556x45_EPR
10, hlc_60Rnd_545x39_t_rpk
10, hlc_75Rnd_762x39_m_rpk
10, 29rnd_300blk_stanag
10,	29rnd_300blk_stanag_T
10,	29rnd_300blk_stanag_S
//8, Exile_Magazine_10Rnd_9x39				// VSS

> RifleAttachments
10, muzzle_snds_M
10, muzzle_snds_H
10, muzzle_snds_H_khk_F
10, muzzle_snds_H_snd_F
10, muzzle_snds_58_blk_F
10, muzzle_snds_m_khk_F
10, muzzle_snds_m_snd_F
10, muzzle_snds_58_wdm_F
10, muzzle_snds_65_TI_blk_F
10, muzzle_snds_65_TI_hex_F
10, muzzle_snds_65_TI_ghex_F
10, muzzle_snds_H_MG_blk_F
10, muzzle_snds_H_MG_khk_F
10, optic_Arco
10, optic_Arco_blk_F
10, optic_Arco_ghex_F
10, optic_Hamr
10, optic_Hamr_khk_F
10, optic_Holosight
10, optic_Holosight_blk_F
10, optic_Holosight_khk_F
5, acc_flashlight
10, acc_pointer_IR
10, optic_MRCO
8, optic_DMS
8, optic_DMS_ghex_F
10, optic_ERCO_blk_F
10, optic_ERCO_khk_F
10, optic_ERCO_snd_F
7, optic_NVS

10, HLC_Optic_1p29
10, hlc_optic_accupoint_g3
10, hlc_optic_artel_m14
10, HLC_Optic_G36Dualoptic15x
10, HLC_Optic_G36Dualoptic15x2d
10, HLC_Optic_G36dualoptic35x
10, HLC_Optic_G36dualoptic35x2d
10, HLC_Optic_G36Export15x
10, HLC_Optic_G36Export15x2d
10, HLC_Optic_G36Export35x
10, HLC_Optic_G36Export35x2d
10, hlc_optic_Kern
10, hlc_optic_Kern2d
10, hlc_optic_kobra
10, hlc_optic_LRT_m14
10, HLC_Optic_PSO1
10, hlc_optic_PVS4FAL
10, hlc_optic_PVS4G3
10, hlc_optic_PVS4M14
10, hlc_optic_suit
10, HLC_Optic_ZFSG1
10, hlc_muzzle_300blk_KAC
10, hlc_muzzle_545SUP_AK
10, hlc_muzzle_556NATO_KAC
10, hlc_muzzle_762SUP_AK
10, hlc_muzzle_Agendasix
10, hlc_muzzle_Agendasix10mm
10, hlc_muzzle_snds_a6AUG
10, hlc_muzzle_snds_AUG
10, hlc_muzzle_snds_fal
10, hlc_muzzle_snds_g3
10, hlc_muzzle_snds_HK33
10, hlc_muzzle_snds_M14
10, hlc_muzzle_Tundra
10, muzzle_hbadger
//1, optic_tws
//1, hlc_optic_goshawk

> LMG

8, LMG_Mk200_F				// Mk200 6.5 mm
8, LMG_Zafir_F				// Zafir 7.62 mm
10, Exile_Weapon_RPK
10, Exile_Weapon_PK
10, Exile_Weapon_PKP
10, LMG_03_F				//= LIM-85 5.56 mm
10, hlc_lmg_M249E2
10, hlc_lmg_m249para
8, hlc_lmg_M60
8, hlc_lmg_M60E4
10, hlc_lmg_minimi
10, hlc_lmg_minimi_railed
10, hlc_lmg_minimipara
8, hlc_lmg_mk48
10, hlc_m249_pip1
10, hlc_m249_pip2
10, hlc_m249_pip3
10, hlc_m249_pip4
8, hlc_m249_squantoon

> LMGAmmo
10, 100Rnd_65x39_caseless_mag			// MX SW
10, 100Rnd_65x39_caseless_mag_Tracer	// MX SW
10, 150Rnd_762x54_Box					// Zafir
10, 150Rnd_762x54_Box_Tracer			// Zafir
8, 130Rnd_338_Mag
10, 150Rnd_93x64_Mag
10, Exile_Magazine_45Rnd_545x39_RPK_Green
10, Exile_Magazine_75Rnd_545x39_RPK_Green
10, Exile_Magazine_100Rnd_762x54_PK_Green
10, 200Rnd_65x39_Belt					// Mk200
10, 200Rnd_65x39_Belt_Tracer_Green	// Mk200
10, 200Rnd_65x39_Belt_Tracer_Red		// Mk200
10, 200Rnd_65x39_Belt_Tracer_Yellow	// Mk200
10, 200Rnd_556x45_Box_F				// LIM-85 	
10, 200Rnd_556x45_Box_Red_F         // LIM-85	
10, 200Rnd_556x45_Box_Tracer_F      // LIM-85	
10, 200Rnd_556x45_Box_Tracer_Red_F  // LIM-85	
10, hlc_100Rnd_762x51_B_M60E4
10, hlc_100Rnd_762x51_Barrier_M60E4
10, hlc_100Rnd_762x51_M_M60E4
10, hlc_100Rnd_762x51_T_M60E4
10, hlc_200rnd_556x45_B_SAW
10, hlc_200rnd_556x45_M_SAW
10, hlc_200rnd_556x45_T_SAW

> Snipers
10, srifle_DMR_01_F			// Rahim 7.62 mm
8, srifle_EBR_F			// Mk18 ABR 7.62 mm
9, srifle_DMR_07_blk_F     // CMR-76 6.5 mm (Black)
9, srifle_DMR_07_hex_F     // CMR-76 6.5 mm (Hex)
9, srifle_DMR_07_ghex_F    // CMR-76 6.5 mm (Green Hex)
7, hlc_rifle_awcovert
7, hlc_rifle_awcovert_BL
7, hlc_rifle_awcovert_FDE
7, hlc_rifle_awmagnum
7, hlc_rifle_awmagnum_bl
6, hlc_rifle_awmagnum_bl_ghillie
7, hlc_rifle_awmagnum_fde
6, hlc_rifle_awmagnum_fde_ghillie
6, hlc_rifle_awmagnum_OD_ghillie
10, hlc_rifle_m1903a1
10, hlc_rifle_m1903a1_unertl
10, hlc_rifle_M1903A1OMR
10, hlc_rifle_m14
10, hlc_rifle_m14_bipod
10, hlc_rifle_m14_rail
10, hlc_rifle_m14dmr
10, hlc_rifle_m14sopmod
10, hlc_rifle_m21
8, hlc_rifle_g3sg1
6, hlc_rifle_PSG1A1_RIS
6, hlc_rifle_psg1

> SniperAmmo
3, 5Rnd_127x108_Mag		// GM6 Lynx
3, 7Rnd_408_Mag			// M320 LRR
10, 10Rnd_762x51_Mag		// Rahim
10, 20Rnd_762x51_Mag		// Mk18 ABR
1, 5Rnd_127x108_APDS_Mag	// GM6 Lynx 
10, 20Rnd_650x39_Cased_Mag_F	// CMR-76
10, hlc_5rnd_3006_1903
10, hlc_5rnd_300WM_AP_AWM
10, hlc_5rnd_300WM_BTSP_AWM
10, hlc_5rnd_300WM_FMJ_AWM
10, hlc_5rnd_300WM_mk248_AWM
10, hlc_5rnd_300WM_SBT_AWM
10, hlc_20Rnd_762x51_B_G3

> SniperAttachments
10, muzzle_snds_B
10, muzzle_snds_B_khk_F
10, muzzle_snds_B_snd_F
10, optic_DMS
10, optic_SOS
10, optic_SOS_khk_F
7, optic_LRPS
7, optic_LRPS_tna_F
7, optic_LRPS_ghex_F
8, hlc_muzzle_snds_HK33
8, hlc_muzzle_snds_G3
//1, optic_tws
//1, optic_tws_mg


> DLCRifles

7, srifle_DMR_02_camo_F			//MAR10
7, srifle_DMR_02_F				//MAR10
7, srifle_DMR_02_sniper_F		//MAR10
8, srifle_DMR_03_F				//MK1EMR
8, srifle_DMR_03_khaki_F		//MK1EMR
8, srifle_DMR_03_tan_F			//MK1EMR
8, srifle_DMR_03_woodland_F		//MK1EMR
7, srifle_DMR_04_F				//ASP1KIR
7, srifle_DMR_04_Tan_F			//ASP1KIR
7, srifle_DMR_05_blk_F			//CYRUS
7, srifle_DMR_05_hex_F			//CYRUS
7, srifle_DMR_05_tan_F			//CYRUS
8, srifle_DMR_06_camo_F			//Mk14
8, srifle_DMR_06_olive_F		//Mk14

> DLCAmmo

25, 10Rnd_338_Mag			//MAR10
25, 20Rnd_762x51_Mag		//MK1EMR
25, 10Rnd_127x54_Mag		//ASP1KIR
25, 10Rnd_93x64_DMR_05_Mag	//CYRUS

> DLCOptics
14, optic_AMS
14, optic_AMS_khk
14, optic_AMS_snd
14, optic_KHS_blk
14, optic_KHS_hex
14, optic_KHS_old
14, optic_KHS_tan

> DLCSupressor
40, muzzle_snds_338_black
40, muzzle_snds_338_green
40, muzzle_snds_338_sand
40, muzzle_snds_93mmg
40, muzzle_snds_93mmg_tan
40, muzzle_snds_B

> EpicWeapons
8, srifle_GM6_F			// GM6 Lynx 12.7 mm
10, srifle_LRR_F			// M320 LRR .408
9, srifle_LRR_tna_F    	// M320 LRR .408 (Tropic)
7, srifle_GM6_ghex_F   	// GM6 Lynx 12.7 mm (Green Hex)
10, MMG_01_hex_F				//Navid
10, MMG_01_tan_F				//Navid
9, MMG_02_black_F			//SPMG
9, MMG_02_camo_F			//SPMG
9, MMG_02_sand_F			//SPMG

> Bipods
17, bipod_03_F_oli
17, bipod_03_F_blk
17, bipod_02_F_tan
16, bipod_02_F_hex
17, bipod_02_F_blk
17, bipod_01_F_snd
16, bipod_01_F_mtp
17, bipod_01_F_blk

> HEGrenades
67, 1Rnd_HE_Grenade_shell
33, 3Rnd_HE_Grenade_shell

> UGLFlares
8, 3Rnd_UGL_FlareGreen_F
8, 3Rnd_UGL_FlareRed_F
8, 3Rnd_UGL_FlareWhite_F
8, 3Rnd_UGL_FlareYellow_F
17, UGL_FlareGreen_F
17, UGL_FlareRed_F
17, UGL_FlareWhite_F
17, UGL_FlareYellow_F

> UGLSmokes
10, 1Rnd_Smoke_Grenade_shell
10, 1Rnd_SmokeBlue_Grenade_shell
10, 1Rnd_SmokeGreen_Grenade_shell
10, 1Rnd_SmokeOrange_Grenade_shell
10, 1Rnd_SmokePurple_Grenade_shell
10, 1Rnd_SmokeRed_Grenade_shell
10, 1Rnd_SmokeYellow_Grenade_shell
4, 3Rnd_Smoke_Grenade_shell
4, 3Rnd_SmokeBlue_Grenade_shell
4, 3Rnd_SmokeGreen_Grenade_shell
4, 3Rnd_SmokeOrange_Grenade_shell
4, 3Rnd_SmokePurple_Grenade_shell
4, 3Rnd_SmokeRed_Grenade_shell
4, 3Rnd_SmokeYellow_Grenade_shell

> HandGrenades
50, HandGrenade
50, MiniGrenade

> Explosives
12, DemoCharge_Remote_Mag
12, IEDUrbanSmall_Remote_Mag
12, IEDLandSmall_Remote_Mag
15, ClaymoreDirectionalMine_Remote_Mag
15, MineDetector
15, APERSMine_Range_Mag
15, APERSBoundingMine_Range_Mag
15, APERSTripMine_Wire_Mag
4, SatchelCharge_Remote_Mag

///////////////////////////////////////////////////////////////////////////////
// Clothing & Gear
///////////////////////////////////////////////////////////////////////////////

> CivilianItems
30, ItemWatch
30, ItemRadio
15, ItemGPS
25, Binocular
35, ItemMap

> CivilianClothing
5, U_C_HunterBody_grn
7, U_C_Poloshirt_salmon
7, U_C_Poloshirt_tricolour
7, U_C_Poloshirt_stripped
7, U_C_Poloshirt_burgundy
7, U_C_Poloshirt_blue
6, U_C_Journalist
6, U_C_Scientist
5, U_I_C_Soldier_Bandit_1_F         // Bandit Clothes (Polo Shirt)
5, U_I_C_Soldier_Bandit_2_F         // Bandit Clothes (Skull)
5, U_I_C_Soldier_Bandit_3_F         // Bandit Clothes (Tee)
5, U_I_C_Soldier_Bandit_4_F         // Bandit Clothes (Checkered)
5, U_I_C_Soldier_Bandit_5_F         // Bandit Clothes (Tank Top)
5, U_C_man_sport_1_F                // Sport Clothes (Beach)
5, U_C_man_sport_2_F                // Sport Clothes (Orange)
5, U_C_man_sport_3_F                // Sport Clothes (Blue)
5, U_C_Man_casual_1_F               // Casual Clothes (Navy)
5, U_C_Man_casual_2_F               // Casual Clothes (Blue)
5, U_C_Man_casual_3_F               // Casual Clothes (Green)
5, U_C_Man_casual_4_F               // Summer Clothes (Sky)
5, U_C_Man_casual_5_F               // Summer Clothes (Yellow)
5, U_C_Man_casual_6_F               // Summer Clothes (Red)
5, TRYK_U_B_3CD_Delta_BDU
5, TRYK_U_B_3CD_Delta_BDUTshirt
5, TRYK_U_B_3CD_Ranger_BDU
5, TRYK_U_B_3CD_Ranger_BDUTshirt
5, TRYK_U_B_3CD_BLK_BDUTshirt
5, TRYK_U_B_3CD_BLK_BDUTshirt2
5, TRYK_U_B_ACU
5, TRYK_U_B_ACUTshirt
7, TRYK_U_B_MARPAT_Wood
7, TRYK_U_B_MARPAT_Wood_Tshirt
5, TRYK_U_B_MARPAT_Desert
5, TRYK_U_B_MARPAT_Desert_Tshirt
5, TRYK_U_B_MARPAT_Desert2
5, TRYK_U_B_MARPAT_Desert2_Tshirt
5, TRYK_U_B_fleece
5, TRYK_U_B_fleece_UCP
5, TRYK_U_B_UCP_PCUs
5, TRYK_U_B_GRY_PCUs
5, TRYK_U_B_Wood_PCUs
5, TRYK_U_B_PCUs
5, TRYK_U_B_UCP_PCUs_R
5, TRYK_U_B_GRY_PCUs_R
7, TRYK_U_B_Wood_PCUs_R
5, TRYK_U_B_PCUs_R
5, TRYK_U_B_PCUGs
5, TRYK_U_B_PCUODs
5, TRYK_U_B_PCUGs_gry
5, TRYK_U_B_PCUGs_BLK
5, TRYK_U_B_PCUGs_OD
5, TRYK_U_B_PCUGs_gry_R
5, TRYK_U_B_PCUGs_BLK_R
5, TRYK_U_B_PCUGs_OD_R
5, TRYK_U_Bts_GRYGRY_PCUs
5, TRYK_U_Bts_UCP_PCUs
5, TRYK_U_Bts_Wood_PCUs
5, TRYK_U_Bts_PCUs
5, TRYK_U_pad_j
5, TRYK_U_pad_j_blk
5, TRYK_U_pad_hood_Cl
5, TRYK_U_pad_hood_Cl_blk
5, TRYK_U_pad_hood_tan
5, TRYK_U_pad_hood_Blk
5, TRYK_U_pad_hood_CSATBlk
5, TRYK_U_pad_hood_Blod
7, TRYK_U_pad_hood_odBK
5, TRYK_U_pad_hood_BKT2
5, TRYK_hoodie_Blk
5, TRYK_hoodie_FR
7, TRYK_hoodie_Wood
5, TRYK_hoodie_3c
5, TRYK_T_camo_tan
5, TRYK_T_camo_3c
7, TRYK_T_camo_Wood
7, TRYK_T_camo_wood_marpat
5, TRYK_T_camo_Desert_marpat
5, TRYK_T_camo_3c_BG
5, TRYK_T_camo_Wood_BG
7, TRYK_T_camo_wood_marpat_BG
5, TRYK_T_camo_desert_marpat_BG
5, TRYK_T_PAD
5, TRYK_T_OD_PAD
5, TRYK_T_TAN_PAD
5, TRYK_T_BLK_PAD
5, TRYK_T_T2_PAD
5, TRYK_T_CSAT_PAD
5, TRYK_U_nohoodPcu_gry
5, TRYK_U_hood_nc
5, TRYK_U_hood_mc
5, TRYK_B_5
6, TRYK_DMARPAT_T
5, TRYK_C_AOR2_T
5, TRYK_U_B_Sage_T
7, TRYK_U_B_Wood_T
5, TRYK_U_B_BLTAN_T
5, TRYK_U_B_BLOD_T
5, TRYK_U_B_PCUHsW
5, TRYK_U_B_PCUHsW2
5, TRYK_U_B_PCUHsW3
5, TRYK_U_B_PCUHsW3nh
5, TRYK_U_B_PCUHsW4
5, TRYK_U_B_PCUHsW5
5, TRYK_U_B_PCUHsW6
4, TRYK_H_EARMUFF
4, TRYK_H_TACEARMUFF_H
4, TRYK_H_Bandana_H
4, TRYK_H_Bandana_wig
4, TRYK_H_Bandana_wig_g
4, TRYK_H_wig
4, TRYK_H_headset2
2, U_C_Driver_1
2, U_C_Driver_2
2, U_C_Driver_3
2, U_C_Driver_4
2, U_C_Driver_1_black
2, U_C_Driver_1_blue
2, U_C_Driver_1_green
2, U_C_Driver_1_red
2, U_C_Driver_1_white
2, U_C_Driver_1_yellow
2, U_C_Driver_1_orange
//6, U_C_Poor_1
//6, U_C_Poor_2
//6, U_C_Poor_shorts_1
//2, U_OrestesBody
//2, U_NikosBody
//2, U_NikosAgedBody

> CivilianBackpacks
9, B_OutdoorPack_blk
9, B_OutdoorPack_tan
9, B_OutdoorPack_blu
12, B_HuntingBackpack
7, B_AssaultPack_khk
7, B_AssaultPack_dgtl
7, B_AssaultPack_rgr
7, B_AssaultPack_sgg
7, B_AssaultPack_blk
7, B_AssaultPack_cbr
7, B_AssaultPack_mcamo
5, B_Kitbag_mcamo
5, B_Kitbag_sgg
5, B_Kitbag_cbr
7, B_AssaultPack_tna_F 

> CivilianVests
20, U_Rangemaster
30, V_Rangemaster_belt
25, V_Press_F
25, V_TacVest_blk_POLICE

> CivilianHeadgear
5, H_Bandanna_surfer
5, H_Beret_blk_POLICE
5, H_Cap_blk
5, H_Cap_blk_Raven
5, H_Cap_blu
5, H_Cap_grn
5, H_Cap_headphones
5, H_Cap_oli
6, H_Cap_press
6, H_Cap_red
6, H_Cap_tan
6, H_Hat_blue
6, H_Hat_brown
6, H_Hat_checker
6, H_Hat_grey
6, H_Hat_tan
6, H_StrawHat
6, H_StrawHat_dark
5, TRYK_Shemagh_shade_MESH
5, TRYK_Shemagh_shade_N
5, TRYK_Shemagh_shade_G_N
5, TRYK_Shemagh_shade_WH_N
5, TRYK_kio_balaclava_WH
5, TRYK_kio_balaclava_BLK
5, TRYK_kio_balaclavas
5, TRYK_kio_balaclava_BLK_ear
5, TRYK_kio_balaclava_ear
5, TRYK_kio_balaclava_ESS
5, TRYK_Shemagh
5, TRYK_Shemagh_mesh
5, TRYK_Shemagh_G
5, TRYK_Shemagh_WH
5, TRYK_Shemagh_shade
5, TRYK_Shemagh_shade_G
5, TRYK_Shemagh_shade_WH
5, TRYK_Shemagh_shade_MH
5, TRYK_Shemagh_ESS
5, TRYK_Shemagh_ESS_G
5, TRYK_Shemagh_ESS_WH
5, TRYK_Shemagh_EAR_TAN
5, TRYK_Shemagh_EAR_WH
5, TRYK_Beard
5, TRYK_Beard2
5, TRYK_Beard3
2, H_RacingHelmet_1_F
2, H_RacingHelmet_2_F
2, H_RacingHelmet_3_F
2, H_RacingHelmet_4_F
2, H_RacingHelmet_1_black_F
2, H_RacingHelmet_1_blue_F
2, H_RacingHelmet_1_green_F
2, H_RacingHelmet_1_red_F	
2, H_RacingHelmet_1_white_F
2, H_RacingHelmet_1_yellow_F
2, H_RacingHelmet_1_orange_F
//5, TRYK_Beard_BW
//5, TRYK_Beard_BK
//5, TRYK_Beard_Gr
//5, TRYK_Beard_BW2
//5, TRYK_Beard_BK2
//5, TRYK_Beard_Gr2
//5, TRYK_Beard_BW3
//5, TRYK_Beard_BK3
//5, TRYK_Beard_Gr3
//5, TRYK_Beard4
//5, TRYK_Beard_BW4
//5, TRYK_Beard_BK4


> GuerillaItems
25, Rangefinder
8, NVGoggles
8, O_NVGoggles_hex_F
8, O_NVGoggles_urb_F
8, O_NVGoggles_ghex_F
8, NVGoggles_tna_F
35, ItemCompass

> GuerillaClothing
10, U_IG_Guerilla1_1
10, U_IG_Guerilla2_1
10, U_IG_Guerilla2_2
10, U_IG_Guerilla2_3
10, U_IG_Guerilla3_1
10, U_IG_Guerilla3_2
8, U_IG_leader
8, U_I_G_resistanceLeader_F
10, U_I_C_Soldier_Para_1_F           // Paramilitary Garb (Tee)
10, U_I_C_Soldier_Para_2_F           // Paramilitary Garb (Jacket)
10, U_I_C_Soldier_Para_3_F           // Paramilitary Garb (Shirt)
10, U_I_C_Soldier_Para_4_F           // Paramilitary Garb (Tank Top)
10, U_I_C_Soldier_Para_5_F           // Paramilitary Garb (Shorts)
8, U_I_C_Soldier_Camo_F             // Syndikat Uniform

> GuerillaBackpacks
14, B_FieldPack_blk
14, B_FieldPack_ocamo
14, B_FieldPack_oucamo
14, B_FieldPack_cbr
10, B_Bergen_sgg
10, B_Bergen_mcamo
10, B_Bergen_rgr
10, B_Bergen_blk
11, B_FieldPack_ghex_F 
11, B_ViperHarness_base_F         
11, B_ViperHarness_blk_F          
11, B_ViperHarness_ghex_F         
11, B_ViperHarness_hex_F          
11, B_ViperHarness_khk_F          
11, B_ViperHarness_oli_F          
13, B_ViperLightHarness_base_F    
13, B_ViperLightHarness_blk_F     
13, B_ViperLightHarness_ghex_F    
13, B_ViperLightHarness_hex_F     
13, B_ViperLightHarness_khk_F     
13, B_ViperLightHarness_oli_F  

> GuerillaVests
7, V_BandollierB_khk
7, V_BandollierB_cbr
7, V_BandollierB_rgr
7, V_BandollierB_blk
7, V_BandollierB_oli
5, V_Chestrig_khk
5, V_Chestrig_rgr
5, V_Chestrig_blk
5, V_Chestrig_oli
7, V_HarnessO_brn
7, V_HarnessOGL_brn
7, V_HarnessO_gry
7, V_HarnessOGL_gry
7, V_HarnessOSpec_brn
7, V_HarnessOSpec_gry
3, V_I_G_resistanceLeader_F
5, V_PlateCarrier1_blk
5, V_PlateCarrier1_rgr
5, V_PlateCarrier2_rgr
5, V_PlateCarrier3_rgr
5, V_PlateCarrierIA1_dgtl
5, V_PlateCarrierIA2_dgtl

> GuerillaHeadgear
1, Exile_Headgear_GasMask
4, H_Booniehat_khk
4, H_Booniehat_indp
4, H_Booniehat_mcamo
4, H_Booniehat_grn
4, H_Booniehat_tan
4, H_Booniehat_dirty
4, H_Booniehat_dgtl
4, H_Booniehat_khk_hs
3, H_Bandanna_khk
3, H_Bandanna_khk_hs
3, H_Bandanna_cbr
3, H_Bandanna_sgg
3, H_Bandanna_gry
3, H_Bandanna_camo
3, H_Bandanna_mcamo
3, H_BandMask_blk
5, H_Beret_blk
5, H_Beret_red
5, H_Beret_grn
5, H_Beret_grn_SF
5, H_Beret_brn_SF
5, H_Beret_ocamo
5, H_Beret_02
5, H_Beret_Colonel
4, H_Beret_gen_F
3, H_Hat_camo
3, H_Cap_brn_SPECOPS
3, H_Cap_tan_specops_US
3, H_Cap_khaki_specops_UK
3, H_Watchcap_blk
3, H_Watchcap_khk
3, H_Watchcap_camo
3, H_Watchcap_sgg
3, H_TurbanO_blk
3, H_Shemag_khk
3, H_Shemag_tan
3, H_Shemag_olive
3, H_Shemag_olive_hs
3, H_ShemagOpen_khk
3, H_ShemagOpen_tan  
3, H_MilCap_tna_F             
3, H_MilCap_ghex_F 
3, H_Booniehat_tna_F   
3, H_MilCap_gen_F             
3, H_Cap_oli_Syndikat_F       
3, H_Cap_tan_Syndikat_F       
3, H_Cap_blk_Syndikat_F       
3, H_Cap_grn_Syndikat_F       
2, H_FakeHeadgear_Syndikat_F   

> MilitaryClothing
4, U_B_CTRG_1						// CTRG Combat Uniform (UBACS)
4, U_B_CTRG_2						// CTRG Combat Uniform (UBACS2)
4, U_B_CTRG_3						// CTRG Combat Uniform (Tee)
5, U_B_CombatUniform_mcam			// Combat Fatigues (MTP)
4, U_B_CombatUniform_mcam_tshirt	// Combat Fatigues (MTP) (Tee)
4, U_B_CombatUniform_mcam_vest		// Recon Fatigues (MTP)
4, U_B_CombatUniform_mcam_worn		// Worn Combat Fatigues (MTP)
4, U_B_SpecopsUniform_sgg			// Specop Fatigues (Sage)
3, U_O_OfficerUniform_ocamo			// Officer Fatigues (Hex)
3, U_I_OfficerUniform				// Combat Fatigues [AAF] (Tee)
4, U_I_CombatUniform				// Combat Fatigues [AAF]
4, U_I_CombatUniform_tshirt			// Combat Fatigues [AAF] (Tee)
4, U_I_CombatUniform_shortsleeve	// Combat Fatigues [AAF]
4, U_B_HeliPilotCoveralls			// Heli Pilot Coveralls
4, U_O_PilotCoveralls				// Pilot Coveralls [CSAT]
4, U_B_PilotCoveralls				// Pilot Coveralls [NATO]
4, U_I_pilotCoveralls				// Pilot Coveralls [AAF]
4, U_I_HeliPilotCoveralls			// Heli Pilot Coveralls
2, U_B_Wetsuit						// Wetsuit [NATO]
2, U_O_Wetsuit						// Wetsuit [CSAT]
2, U_I_Wetsuit						// Wetsuit [AAF]
2, U_O_CombatUniform_ocamo			// Heli Pilot Coveralls
4, U_O_CombatUniform_oucamo			// Fatigues (Urban) [CSAT]
4, U_O_SpecopsUniform_ocamo			// Recon Fatigues (Hex)
2, U_O_SpecopsUniform_blk			// Recon Fatigues (Black)
2, U_O_V_Soldier_Viper_F            // Special Purpose Suit (Green Hex)
2, U_O_V_Soldier_Viper_hex_F        // Special Purpose Suit (Hex)
5, U_B_T_Soldier_AR_F               // Combat Fatigues (Tropic, Tee)
5, U_B_T_Soldier_SL_F               // Recon Fatigues (Tropic)
5, U_B_CTRG_Soldier_F               // CTRG Stealth Uniform
5, U_B_CTRG_Soldier_2_F             // CTRG Stealth Uniform (Tee)
5, U_B_CTRG_Soldier_3_F             // CTRG Stealth Uniform (Rolled-up)
5, U_B_CTRG_Soldier_urb_1_F         // CTRG Urban Uniform
5, U_B_CTRG_Soldier_urb_2_F         // CTRG Urban Uniform (Tee)
5, U_B_CTRG_Soldier_urb_3_F         // CTRG Urban Uniform (Rolled-up)
5, U_B_GEN_Soldier_F                // Gendarmerie Uniform
5, U_B_GEN_Commander_F              // Gendarmerie Commander Uniform
5, U_O_T_Soldier_F                  // Fatigues (Green Hex) [CSAT]
5, U_O_T_Officer_F                  // Officer Fatigues (Green Hex) [CSAT]
5, TRYK_U_B_wh_tan_Rollup_CombatUniform
5, TRYK_U_B_wh_OD_Rollup_CombatUniform
5, TRYK_U_B_wh_blk_Rollup_CombatUniform
5, TRYK_U_B_BLK_tan_Rollup_CombatUniform
5, TRYK_U_B_BLK_OD_Rollup_CombatUniform
5, TRYK_U_B_NATO_UCP_GRY_CombatUniform
5, TRYK_U_B_NATO_UCP_GRY_R_CombatUniform
5, TRYK_U_B_NATO_UCP_CombatUniform
5, TRYK_U_B_NATO_UCP_R_CombatUniform
5, TRYK_U_B_NATO_OCP_c_BLK_CombatUniform
5, TRYK_U_B_NATO_OCP_BLK_c_R_CombatUniform
5, TRYK_U_B_NATO_OCP_BLK_CombatUniform
5, TRYK_U_B_NATO_OCP_BLK_R_CombatUniform
5, TRYK_U_B_NATO_OCPD_CombatUniform
5, TRYK_U_B_NATO_OCPD_R_CombatUniform
5, TRYK_U_B_NATO_OCP_CombatUniform
5, TRYK_U_B_NATO_OCP_R_CombatUniform
5, TRYK_U_B_AOR1_Rollup_CombatUniform
5, TRYK_U_B_AOR2_Rollup_CombatUniform
5, TRYK_U_B_MTP_CombatUniform
5, TRYK_U_B_MTP_R_CombatUniform
5, TRYK_U_B_MTP_BLK_CombatUniform
5, TRYK_U_B_MTP_BLK_R_CombatUniform
5, TRYK_U_B_Woodland
5, TRYK_U_B_Woodland_Tshirt
5, TRYK_U_B_WDL_GRY_CombatUniform
5, TRYK_U_B_WDL_GRY_R_CombatUniform
5, TRYK_U_B_ARO1_GR_CombatUniform
5, TRYK_U_B_ARO1_GR_R_CombatUniform
5, TRYK_U_B_ARO1_GRY_CombatUniform
5, TRYK_U_B_ARO1_GRY_R_CombatUniform
5, TRYK_U_B_ARO1_CombatUniform
5, TRYK_U_B_ARO1R_CombatUniform
5, TRYK_U_B_ARO1_BLK_CombatUniform
5, TRYK_U_B_ARO1_BLK_R_CombatUniform
5, TRYK_U_B_ARO1_CBR_CombatUniform
5, TRYK_U_B_ARO1_CBR_R_CombatUniform
5, TRYK_U_B_ARO2_CombatUniform
5, TRYK_U_B_ARO2R_CombatUniform
5, TRYK_U_B_AOR2_BLK_CombatUniform
5, TRYK_U_B_AOR2_BLK_R_CombatUniform
5, TRYK_U_B_AOR2_OD_CombatUniform
5, TRYK_U_B_AOR2_OD_R_CombatUniform
5, TRYK_U_B_AOR2_GRY_CombatUniform
5, TRYK_U_B_AOR2_GRY_R_CombatUniform
5, TRYK_U_B_Snow_CombatUniform
5, TRYK_U_B_Snowt
5, TRYK_HRP_UCP
5, TRYK_HRP_USMC
5, TRYK_HRP_khk
5, TRYK_U_B_OD_OD_CombatUniform
5, TRYK_U_B_OD_OD_R_CombatUniform
5, TRYK_U_B_TANTAN_CombatUniform
5, TRYK_U_B_TANTAN_R_CombatUniform
5, TRYK_U_B_BLKBLK_CombatUniform
5, TRYK_U_B_BLKBLK_R_CombatUniform
5, TRYK_U_B_GRYOCP_CombatUniform
5, TRYK_U_B_GRYOCP_R_CombatUniformTshirt
5, TRYK_U_B_TANOCP_CombatUniform
5, TRYK_U_B_TANOCP_R_CombatUniformTshirt
5, TRYK_U_B_BLKOCP_CombatUniform
5, TRYK_U_B_BLKOCP_R_CombatUniformTshirt
5, TRYK_U_B_BLKTAN_CombatUniform
5, TRYK_U_B_BLKTANR_CombatUniformTshirt
5, TRYK_U_B_ODTAN_CombatUniform
5, TRYK_U_B_ODTANR_CombatUniformTshirt
5, TRYK_U_B_GRTAN_CombatUniform
5, TRYK_U_B_GRTANR_CombatUniformTshirt
5, TRYK_U_B_wood_CombatUniform
5, TRYK_U_B_woodR_CombatUniformTshirt
5, TRYK_U_B_wood3c_CombatUniform
5, TRYK_U_B_wood3c_CombatUniformTshirt
5, TRYK_U_B_MARPAT_WOOD_CombatUniform
5, TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt
5, TRYK_U_B_WOOD_MARPAT_CombatUniform
5, TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt
5, TRYK_U_B_woodtan_CombatUniform
5, TRYK_U_B_woodtanR_CombatUniformTshirt
5, TRYK_U_B_JSDF_CombatUniform
5, TRYK_U_B_JSDF_CombatUniformTshirt

> MilitaryBackpacks
12, B_Carryall_ocamo
12, B_Carryall_oucamo
12, B_Carryall_mcamo
12, B_Carryall_oli
12, B_Carryall_khk
12, B_Carryall_cbr
12, B_Carryall_ghex_F  
5, B_Bergen_Base_F				
5, B_Bergen_mcamo_F              
5, B_Bergen_dgtl_F               
5, B_Bergen_hex_F                
5, B_Bergen_tna_F  
15, TRYK_B_AssaultPack_UCP
15, TRYK_B_AssaultPack_Type2camo
15, TRYK_B_AssaultPack_MARPAT_Desert
15, TRYK_B_AssaultPack_MARPAT_Wood
10, TRYK_B_Kitbag_Base
10, TRYK_B_Kitbag_blk
10, TRYK_B_Kitbag_aaf
10, TRYK_B_Carryall_blk
12, TRYK_B_Carryall_wood
12, TRYK_B_Carryall_JSDF
10, TRYK_B_Kitbag_Base_JSDF
15, TRYK_B_Coyotebackpack
15, TRYK_B_Coyotebackpack_OD
15, TRYK_B_Coyotebackpack_BLK
//20, TRYK_B_Coyotebackpack_WH
//20, TRYK_B_Carryall_wh

> MilitaryVests
10, V_PlateCarrier1_blk
10, V_PlateCarrier1_rgr
10, V_PlateCarrier2_rgr
10, V_PlateCarrier3_rgr
10, V_PlateCarrierGL_rgr
10, V_PlateCarrierIA1_dgtl
10, V_PlateCarrierIA2_dgtl
10, V_PlateCarrierIAGL_dgtl
10, V_PlateCarrierSpec_rgr
7, V_PlateCarrierL_CTRG
7, V_PlateCarrierH_CTRG

> MilitaryHeadgear
4, Exile_Headgear_GasMask
4, H_MilCap_ocamo
4, H_MilCap_mcamo
4, H_MilCap_oucamo
4, H_MilCap_blue
4, H_MilCap_rucamo
4, H_MilCap_dgtl
4, H_HelmetB
4, H_HelmetB_paint
4, H_HelmetB_light
4, H_HelmetB_plain_blk
3, H_HelmetSpecB
3, H_HelmetSpecB_paint1
3, H_HelmetSpecB_paint2
3, H_HelmetSpecB_blk
3, H_HelmetIA
4, H_HelmetIA_net
4, H_HelmetIA_camo
4, H_HelmetB_grass
4, H_HelmetB_snakeskin
4, H_HelmetB_desert
4, H_HelmetB_black
4, H_HelmetB_sand
4, H_HelmetB_light_grass
4, H_HelmetB_light_snakeskin
4, H_HelmetB_light_desert
4, H_HelmetB_light_black
4, H_HelmetB_light_sand
2, H_HelmetCrew_B
2, H_HelmetCrew_O
2, H_HelmetCrew_I
2, H_PilotHelmetFighter_B
2, H_PilotHelmetFighter_O
2, H_PilotHelmetFighter_I
2, H_PilotHelmetHeli_B
2, H_PilotHelmetHeli_O
2, H_PilotHelmetHeli_I
2, H_HelmetB_camo
2, H_CrewHelmetHeli_B
2, H_CrewHelmetHeli_O
2, H_CrewHelmetHeli_I
4, H_BandMask_khk
3, H_BandMask_reaper
2, H_BandMask_demon
3, H_HelmetO_oucamo
3, H_HelmetLeaderO_oucamo
3, H_HelmetSpecO_ocamo
3, H_HelmetSpecO_blk
3, H_HelmetO_ocamo
3, H_HelmetLeaderO_ocamo
2, H_HelmetO_ghex_F 
3, H_Helmet_Skate    
3, H_HelmetB_Enh_tna_F        
3, H_HelmetB_Light_tna_F 	  
3, H_HelmetB_tna_F   		 
2, H_HelmetSpecO_ghex_F       
3, H_HelmetLeaderO_ghex_F
3, H_HelmetCrew_O_ghex_F 
2, H_HelmetB_TI_tna_F   
4, TRYK_balaclava_BLACK_NV
4, TRYK_balaclava_NV
4, TRYK_balaclava_BLACK_EAR_NV
4, TRYK_balaclava_EAR_NV
4, TRYK_Shemagh_TAN_NV
4, TRYK_Shemagh_MESH_NV
4, TRYK_Shemagh_G_NV
4, TRYK_Shemagh_WH_NV
4, TRYK_Shemagh_EAR_NV
4, TRYK_Shemagh_EAR_G_NV
4, TRYK_Shemagh_EAR_WH_NV
4, TRYK_ShemaghESSTAN_NV
4, TRYK_ShemaghESSOD_NV
4, TRYK_ShemaghESSWH_NV
4, TRYK_Headphone_NV
4, TRYK_HRPIGEAR_NV
4, TRYK_Headset_NV
4, TRYK_TAC_boonie_SET_NV
4, TRYK_TAC_SET_NV_TAN
4, TRYK_TAC_SET_NV_OD
4, TRYK_TAC_SET_NV_WH
4, TRYK_TAC_SET_NV_MESH
4, TRYK_TAC_SET_NV_TAN_2
4, TRYK_TAC_SET_NV_OD_2
4, TRYK_TAC_SET_NV_WH_2
4, TRYK_TAC_SET_NV_MESH_2
4, TRYK_H_DELTAHELM_NV
4, TRYK_US_ESS_Glasses_NV
4, TRYK_US_ESS_Glasses_TAN_NV
4, TRYK_ESS_BLKTAN_NV
4, TRYK_ESS_BLKBLK_NV
3, TRYK_G_Shades_Black_NV
3, TRYK_G_Shades_Blue_NV
3, TRYK_G_bala_ess_NV
3, TRYK_bandana_NV
4, TRYK_SPgearG_NV
4, TRYK_SPgear_PHC1_NV
4, TRYK_SPgear_PHC2_NV
4, TRYK_G_bala_wh_NV
4, TRYK_ESS_wh_NV

> Ghillies
10, U_B_GhillieSuit			// Ghillie Suit [NATO]
10, U_O_GhillieSuit			// Ghillie Suit [CSAT]
10, U_I_GhillieSuit			// Ghillie Suit [AAF]
10, TRYK_H_ghillie_top_headless3
10, TRYK_H_ghillie_top_headless3glass
10, TRYK_H_ghillie_over
10, TRYK_H_ghillie_top
10, TRYK_H_ghillie_top_headless
10, TRYK_H_ghillie_over_green
10, TRYK_H_ghillie_top_green
10, TRYK_H_ghillie_top_headless_green

> DLCGhillies
12, U_B_FullGhillie_ard		
12, U_B_FullGhillie_lsh
12, U_B_FullGhillie_sard
12, U_O_FullGhillie_ard
12, U_O_FullGhillie_lsh
12, U_O_FullGhillie_sard
12, U_I_FullGhillie_ard
12, U_I_FullGhillie_lsh
12, U_I_FullGhillie_sard
7, U_B_T_Sniper_F                   // Ghillie Suit (Tropic) [NATO]
7, U_B_T_Soldier_F        			// Ghillie Suit (Tropic) [NATO]
7, U_B_T_FullGhillie_tna_F          // Full Ghillie (Jungle) [NATO]
7, U_O_T_Sniper_F                   // Ghillie Suit (Green Hex) [CSAT]
7, U_O_T_FullGhillie_tna_F          // Full Ghillie (Jungle) [CSAT]

> DLCVests
10, V_PlateCarrierGL_blk
10, V_PlateCarrierGL_mtp
10, V_PlateCarrierGL_rgr
10, V_PlateCarrierIAGL_dgtl
10, V_PlateCarrierIAGL_oli
10, V_PlateCarrierSpec_blk
10, V_PlateCarrierSpec_mtp
10, V_PlateCarrierSpec_rgr
8, V_TacChestrig_grn_F         
8, V_TacChestrig_oli_F         
8, V_TacChestrig_cbr_F         
7, V_PlateCarrier1_tna_F       
7, V_PlateCarrier2_tna_F       
8, V_PlateCarrierSpec_tna_F    
8, V_PlateCarrierGL_tna_F      
7, V_HarnessO_ghex_F           
7, V_HarnessOGL_ghex_F         
7, V_BandollierB_ghex_F        
9, V_TacVest_gen_F             
8, V_PlateCarrier1_rgr_noflag_F
8, V_PlateCarrier2_rgr_noflag_F

> Rebreathers
33, V_RebreatherB
33, V_RebreatherIR
34, V_RebreatherIA

> MedicalItems
30, Exile_Item_InstaDoc
20, Exile_Item_Bandage
50, Exile_Item_Vishpirin
//10, Exile_Item_Heatpack

> IndustrialItems
1, Exile_Item_ThermalScannerPro
1, Exile_Item_Knife
6, Exile_Item_Cement
5, Exile_Item_FloodLightKit
4, Exile_Item_PortableGeneratorKit
7, Exile_Item_CamoTentKit
6, Exile_Item_MetalBoard
4, Exile_Item_Foolbox
8, Exile_Item_Rope
6, Exile_Item_Sand
5, Exile_Item_Grinder
5, Exile_Item_MetalScrews
5, Exile_Melee_SledgeHammer
8, Exile_Item_ExtensionCord
8, Exile_Item_LightBulb
6, Exile_Item_WaterCanisterEmpty
8, Exile_Melee_Shovel
10, Exile_Item_JunkMetal
9, Exile_Item_Handsaw
8, Exile_Item_Pliers
8, Exile_Item_ScrewDriver
9, Exile_Melee_Axe
4, Exile_Item_CordlessScrewdriver

> Vehicle
35, Exile_Item_FuelCanisterFull
40, Exile_Item_FuelCanisterEmpty
25, Exile_Item_DuctTape


> Chemlights
25, Chemlight_blue
25, Chemlight_green
25, Chemlight_red
25, Chemlight_yellow

> RoadFlares
25, FlareGreen_F
25, FlareRed_F
25, FlareWhite_F
25, FlareYellow_F

> SmokeGrenades
14, SmokeShell
14, SmokeShellRed
14, SmokeShellGreen
14, SmokeShellYellow
14, SmokeShellPurple
15, SmokeShellBlue
15, SmokeShellOrange

> Restraints
100, Exile_Item_ZipTie

> Electronics
30, Exile_Item_Laptop
70, Exile_Item_BaseCameraKit

> Magazine01
100, Exile_Item_Magazine01
> Magazine02
100, Exile_Item_Magazine02
> Magazine03
100, Exile_Item_Magazine03
>Magazine04
100, Exile_Item_Magazine04

> Phoneknife
60, Exile_Item_MobilePhone
40, Exile_Item_Knife

> Unused
3, Exile_Item_FireExtinguisher
14, Exile_Item_Hammer
5, Exile_Item_Carwheel
5, Exile_Item_SleepingMat
5, Exile_Item_Defibrillator
5, Exile_Item_Wrench
20, Exile_Item_OilCanister