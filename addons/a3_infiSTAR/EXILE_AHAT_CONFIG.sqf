/*
	File: EXILE_AHAT_CONFIG.sqf
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
	
	ON LINUX YOU NEED THIS PARAMETER: -profiles
*/

/*
	"_passwordAdmin" is passwordAdmin - in your servers config.cfg, needed for servercommands from client
*/
_passwordAdmin = 'penis123';



/* "_OPEN_ADMIN_MENU_KEY": Key to open the menu (google DIK_KeyCodes (0x3B is F1))   */
_OPEN_ADMIN_MENU_KEY = 0x3B;
_HIDE_FROM_PLAYERS = true;	// So no normal can see it :)!

/* What ESCAPE Menu shows */
_ESCMNUTOP = '[GG] Ghostz Gamerz';
_ESCMNUBOT = 'www.GHOSTZGAMERZ.com';
_BRIEFING_MSG = true;	/* use mission briefing message: if   "_BRIEFING_MSG = false;"   then the message will be replaced by infiSTAR */

/* shows RESTART IN X MINS */
_USE_RESTART_TIMER = true;	/* true or false */
_RESTART_TIME_IN_M = 180;		/* restart time in minutes */
_SHOW_TIMER_IN_MIN = [1,2,3,5,10];	/* minutes before restart, when message is shown */

/* The following 3 options can be disabled by putting the value to -1. For example "_TGV = -1;" */
/* Terrain Grid Value   */ _TGV = 12.5;		/* 50, 25, 12.5  */	/* if set to 50 grass will be very low for better client FPS.. default is 25 ~35 is good performance and grass :) */
/* ViewDistance Value   */ _VDV = 1500;
/* ObjectViewDistance   */ _VOV = 1500;

/* "_LogAdminActions": Sends actions done by each admin to the server to log it to the .txt file and .rpt file + sends it back to all other admins. */
_LogAdminActions = true;	/* true or false */
_enableIngameLogs = true;	/* true or false */

/* "_startAsNormal": if you add admin UIDs in here as well, they will start as almost "normal" player instead of with admin menu and such. */
_startAsNormal =
[
	'0','0','0'
];

_adminUIDandAccess =
[
	[
		['76561198021389971','76561198078201908','76561198153784743','76561198195305425','76561198115492831'],	// Head admin/Owner
		[
			'Teleport On Map Click','Teleport - Target To Me','Teleport - Me To Target','Teleport In Facing Direction (10m steps)',
			'spectating','AdminConsole','Delete Vehicle','FlyUp','ShowGear',
			'HealSelf','HealRepairNear','AdminLog','Freeze Target','UnFreeze Target',
			'==== Loadouts ====','==== Vehicles ====','==== Base Deleter ====','Items spawn menu',
			'Remove Gear','Heal','Restore','Move In My Vehicle','Move In Target Vehicle','Eject','Eject Crew',
			'Kill','Explode','Force Disconnect','Kick (Silent)','Kick (Announce)','Ban (Silent)','Ban (Announce)',
			'infiSTAR Player ESP','infiSTAR Dead ESP','infiSTAR AI ESP',
			'infiSTAR MapIcons','Vehicle Marker','DeadPlayer Marker',
			'God Mode','Vehicle God Mode','Lower Terrain','Vehboost','UnlimAmmo','noRecoil','FastFire','Stealth / Invisible',
			'Disable Announces','Mass Message','Spawn Support-Box1','Spawn Support-Box2','Spawn Support-Box3',
			'Spawn Ammo','Login as Arma Admin','BIS FreeRoam Cam (works with ESP)','FreeRoam Cam (does not work with ESP)',
			'Request Steam Name','showinfo',
			'+500 Money','+1000 Money','+2000 Money','+10000 Money','-500 Money','-1000 Money','-2000 Money','-10000 Money',
			'+500 Respect','+5000 Respect','-500 Respect','-5000 Respect'
		]
	],
	[
		['76561198084864687','76561198129049369','76561198067566966','76561198163835069','76561198001066546','76561198196195669','76561198084154973','76561198257149369','76561198042335279'],	// Admins
		[
			'Teleport On Map Click','Teleport - Target To Me','Teleport - Me To Target','Teleport In Facing Direction (10m steps)',
			'spectating','Delete Vehicle','FlyUp','ShowGear',
			'HealSelf','HealRepairNear','Freeze Target','UnFreeze Target',
			'==== Loadouts ====','==== Vehicles ====','==== Base Deleter ====','Items spawn menu',
			'Remove Gear','Heal','Restore','Move In My Vehicle','Move In Target Vehicle','Eject','Eject Crew',
			'Kill','Explode','Force Disconnect','Kick (Announce)','Ban (Announce)',
			'infiSTAR Player ESP','infiSTAR Dead ESP','infiSTAR AI ESP',
			'infiSTAR MapIcons','Vehicle Marker','DeadPlayer Marker',
			'God Mode','Vehicle God Mode','Lower Terrain','UnlimAmmo','noRecoil','FastFire','Stealth / Invisible',
			'Disable Announces','Mass Message','Spawn Support-Box1','Spawn Support-Box2','Spawn Support-Box3',
			'Spawn Ammo',
			'Request Steam Name','showinfo',
			'+500 Money','+1000 Money','+2000 Money','+10000 Money','-500 Money','-1000 Money','-2000 Money','-10000 Money',
			'+500 Respect','+5000 Respect','-500 Respect','-5000 Respect'
		]
	],
	[
		['76561197984308134','76561198144994529','76561198037365948','76561198126348047','76561198066303734','76561198227881216','76561197960289679','76561198029881052'],	// Mods
		[
			'spectating','ShowGear',
			'Freeze Target','UnFreeze Target',
			'Remove Gear','Heal','Restore',
			'Kill','Kick (Announce)',
			'infiSTAR MapIcons','Vehicle Marker','DeadPlayer Marker',
			'Request Steam Name','showinfo',
			'+500 Money','+1000 Money','+2000 Money','+10000 Money','-500 Money','-1000 Money','-2000 Money','-10000 Money',
			'+500 Respect','+5000 Respect','-500 Respect','-5000 Respect'
		]
	]
];
/* ********************************************************************************* */
/*            many checks should be set to true instead of false.                    */
/* ********************************************************************************* */
_LVC = true;	/* Local Vehicle Check */
_UAT = true;	/* Anti Teleport */
_CMC = true;	/* Check for custom CommandingMenus */
_KCM = true;	/* Just close ALL CommandingMenus */
_CAP = false;	/* Check Actions Plr - will announce: xxx possible scroll menu hack */


/*  Check Global Markers */ _CGM = true;	/* true or false */	/* you may need to disable this check for A.I. Missions - or whitelist the used Markers in the _aLocalM Array beneath */
/*  Check Local Markers  */ _CLM = true;	/* true or false */	/* false if you do not want LocalMarker to be checked. */
/*  Use _aLocalM array   */ _UMW = true;	/* true or false */	/* use allowed marker array from below (for example AltisLife uses house_ and others in there) or A.I. Missions */
/* _aLocalM: if '_CLM' && _UMW - this array of names will be allowed */
_aLocalM = ["DMS_MissionMarkerCircle","DMS_MissionMarkerDot"];


/* Use IDD White-List ? */ _UDW = true;	/* true or false */
/* _allowedIDDs: Insert IDDs here to prevent them from being closed! */
_allowedIDDs = [
	0,4,5,6,8,12,18,24,46,49,54,55,63,70,131,160,174,602,999,
	24001,24002,24004,24005,24006,24007,24008,24009,24010,24011,24012,24013,24014,24015,20016,20017,20018,20019,20020,20021
];

/* _badIDDsToKick: Forbidden Idds that will get you Kicked by the AH */
_badIDDsToKick = [-1337,133];

/* _badIDDsToClose: Forbidden Idds that will get closed by the AH */
_badIDDsToClose =
[
	2,3,7,17,19,25,26,27,28,29,30,31,32,37,40,41,43,44,45,51,52,53,74,85,
	106,126,127,132,146,147,150,151,152,153,154,159,162,164,262,
	314,632,1320,2121,148,163,129,169,157
];



/*  Use BadFile check    */ _UBF = true;	/* true or false */	/* Scriptscan pops up with message: "Done! badcontent.sqf not found" */
/* _blacklistedFileArray: The AntiHack will test if the client has one of these files in his Arma3 folder. You have to put the extensions in allowedPreprocessFileExtensions in your servers config.cfg (only if _UBF = true;) */
_blacklistedFileArray =
[
	'MixedScript.sqf','justtrolling.sqf','A3AH.sqf','hackfr.sqf','derp.sqf','run.sqf',
	'1.sqf','3.sqf','qa.sqf','gknova61_money.sqf','invi.sqf','Krypto.sqf','Dta\mhm.sqf','Newscroll.sqf',
	'test\jude\3dollar\blub.sqf','lel.sqf','_src\Load.sqf','scripts\jmepoch.sqf','Det\Test.sqf','test\mhm.sqf',
	'Jowin.sqf','FreundeMod\altea.sqf','dracau18scripts.sqf','CraftLourens.sqf','My Menu Collection\Wookie\mongoose.sqf',
	'menu\menuext.sqf','LystoArma3\Lystic.sqf','LystoArma3\antiantihax.sqf','rouvenk.sqf','chub\start.sqf','Whippy\playerTools.sqf',
	'rouven33.sqf','Addons\temp.sqf','hihi.sqf','test.sqf','\Life41337\init.sqf','swagre.sqf','huki.sqf','y.sqf',
	'Dta\nom.sqf','AnalFuckMeOnATable.sqf','JH\Action.sqf','V4Run.sqf','_src\test.sqf','ScriptName.sqf','999999999999999999999999999.sqf',
	'RommelV1\Rexecv1.sqf','abra.sqf','jmepochV2.sqf','FuryV3.sqf','69.sqf','_src\menu1.sqf','_src\keybinds.sqf','porno.sqf',
	'RhynoV1\RJZSexecutev4.sqf','RJZSexecv4.sqf','ArmA2OA_Extars\BB_menu_BB.sqf','LystoArma3\start.sqf','ammobox.sqf','temp.sqf',
	'v102.sqf','jestersMENU\jester@start.sqf','uc.sqf','FireTide.sqf','test\lol.sqf','lol.sqf','corn.sqf',
	'debug_console.dll','debug_consolee.dll','tbb4malloc_bi.dll','Xenos.exe','Xenos64.exe','fraps.dll','youtube.dll','_CommonRedist\DirectX\Config.cab',
	'DirectX\Config.cab','G-e-F_Menu\StartGeF.dta','Bonus\Soundtrack\Win\12_Wins.dta','_CommonRedist\DirectX\Jun2010\Apr2005_d3dx9_24_x64.cab',
	'Bonus\Soundtrack\clickSound.ogg','G-e-F_Menu\G-e-F_HackConfig.ini','Launcher\kernel_x86.dll','DLL\DatMalloc.dll','\G-e-F_HackConfig.ini',
	'Dta\Screens.bin','ArmA2OA_Extras\ben_ex.sqf','RyanV1\Keybindiezz.sqf','ArmaX.sqf','insanity.sqf','FinizMenuzV2\confuser.sqf','dummy.sqf',
	'temp.sqf','ExileDebug.sqf'
];

/* _blacklistedVariables: The AntiHack will check if one of these variables is existing for the client */
_blacklistedVariables =
[
	'arsenalOpened','BIS_fnc_arsenal_fullArsenal','n912','TBMKnlist','PLAY','ALTISLIFENEXT3','SOMEONE_dsfnsjf',
	'FND_fnc_subs','setcash','Dummy_Ghost','entf','check_loaded','LY_Menu','AndysClosed','GOLDENS_GLOBAL_SHIT_YEAH','Fanatic_Main_Bereich',
	'showcommandingMenu','disableUserInput','local','forEach','nearEntities','round','onEachFrame','a','imgoingnukeyou','fnc_usec_damageHandler',
	'Status_BB','TZ_BB_A3','TZ_BB_KB_Hint','TZ_BB_BindHandler','AH_BRAZZERS_TZ_BB','kamakazi_lystic','fuckfest','LYSTIC_MENU_LOADED','D_AMEZ_COA',
	'Intro','Repair','Heal','T3le','TNK','I_like_turtles','BIGM','GMod','E3p','Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTARS',
	'lel','vars','PSwap','toLower_new','BCast','thfile','tlmadminrq','infiSTARBLACK','carepkg','scrollAim','BlurExec','sbpc','CALLRE',
	'quake','menu_run','ZedProtect','actid1','vehicles1','MapClicked','MapClickedPosX','MouseUpEvent','scrollPlayerlist','keypress_xxx','D_AMEZ_COA',
	'envi','G_A_N_G_S_T_A','ZoombiesCar','timebypass','returnString_z','isori','tangrowth27','PVAH_AdminRequest','AH_OFF_LOL','b','infiSTAR_fillRE',
	'qwak','infoe','font','title_dialog','sexymenu_adds_Star','boolean_1','initre337','skype_option','bleh','magnetomortal','sbp',
	'PV_IAdminMenuCode','PVAH_WriteLogRequest','skype_img','Lhacks','Lpic','LtToTheRacker','Lexstr','take1','Called','epochExec','sdgff4535hfgvcxghn',
	'adadawer24_1337','fsdddInfectLOL','W_O_O_K_I_E_Car_RE','kW_O_O_K_I_E_Go_Fast','epchDeleted','lystobindkeys','lystoKeypress','fnc_usec_unconscious',
	'toggle_1','shiftMenu','dbClicked','b_loop','re_loop','v_bowen','bowen','melee_startAttack','asdasdasd','antihax2','PV_AdminMenuCode','AdminLoadOK',
	'AdminLoadOKAY','PV_TMPBAN','T_o_g_g_l_e_BB','fixMenu','PV_AdminMenuCodee','AdminPlayer','PVAH_AdminRequestVariable','epochBackpack','JME_Red',
	'JME_MENU_Sub','JME_menu_title','JME_Sub','JME_OPTIONS','god','heal','grass','fatguybeingchasedbyalion','night','day','infammo','nvg','thermal',
	'Keybinds','fredtargetkill','loopfredtpyoutome','epochTp','AdminLst','BB_Pr0_Esp','BBProEsp','epochMapMP','CALLRESVR','EPOCH_spawnVehicle_PVS',
	'adminlite','adminlitez','antihacklite','bp','inSub','scroll_m_init_star','markerCount','zombies','startmenu_star','LystoDone','MOD_EPOCH',
	'Admin_Lite_Menu','admingod','adminESPicons','fnc_MapIcons_infiSTAR','adminadd','shnext','infiSTAR_fill_Weapons',
	'adminZedshld','adminAntiAggro','admin_vehicleboost','admin_low_terrain','admin_debug','admincrate','exstr','nlist','PV_AdminMainCode','TPCOUNTER',
	'PVDZ_Hangender','fn_filter','vehiList','Remexec_Bitch','zeus_star','igodokxtt','tmmenu','AntihackScrollwheel','survcam','infiniteammo','PVAH_AHTEMPBAN',
	'lalf','toggle','iammox','telep','dayzlogin3','dayzlogin4','changeBITCHinstantly','antiAggro_zeds','BigFuckinBullets','abcdefGEH','adminicons',
	'fn_esp','aW5maVNUQVI_re_1','passcheck','isInSub','qodmotmizngoasdommy','ozpswhyx','xdistance','wiglegsuckscock','diz_is_real__i_n_f_i_S_T_A_R',
	'pic','veh','unitList','list_wrecked','addgun','ESP','BIS_fnc_3dCredits_n','dayzforce_save','ViLayer','blackhawk_sex','activeITEMlist','items1',
	'adgnafgnasfnadfgnafgn','Metallica_infiSTAR_hax_toggled','activeITEMlistanzahl','xyzaa','iBeFlying','rem','DAYZ_CA1_Lollipops','HMDIR','vehC',
	'HDIR','carg0d','init_Fncvwr_menu_star','altstate','black1ist','ARGT_JUMP','ARGT_KEYDOWN','ARGT_JUMP_w','ARGT_JUMP_a','bpmenu','color_black',
	'p','fffffffffff','markPos','pos','TentS','VL','MV','monky','qopfkqpofqk','monkytp','pbx','nametagThread','spawnmenu','sceptile15','sandshrew',
	'mk2','i','j','v','fuckmegrandma','mehatingjews','TTT5OptionNR','zombieDistanceScreen','cargodz','R3m0te_RATSifni','wepmenu','admin_d0','RAINBOWREMEXECVEH',
	'omgwtfbbq','namePlayer','thingtoattachto','HaxSmokeOn','testIndex','g0d','spawnvehicles_star','kill_all_star','sCode','dklilawedve','peter_so_fly_CUS',
	'selecteditem','moptions','delaymenu','gluemenu','g0dmode','cargod','infiSTAR_fillHax','itemmenu','gmadmin','fapEsp','mapclick','VAGINA_secret',
	'spawnweapons1','abcd','skinmenu','playericons','changebackpack','keymenu','godall','theKeyControl','infiSTAR_FILLPLAYER','whitelist','pfEpochTele',
	'custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst','DEV_ConsoleOpen','executeglobal','cursoresp','Asdf','planeGroup',
	'teepee','spwnwpn','musekeys','dontAddToTheArray','morphtoanimals','aesp','LOKI_GUI_Key_Color','Monky_initMenu','tMenu','recon','curPos',
	'playerDistanceScreen','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC','pathtoscrdir','Bowen_RANDSTR','ProDayz','idonteven','walrein820','RandomEx',
	'TAG_onKeyDown','changestats','derp123','heel','rangelol','unitsmenu','xZombieBait','plrshldblckls','ARGT_JUMP_s','ARGT_JUMP_d','globalplaya','ALL_MAGS_TO_SEARCH',
	'shnmenu','xtags','pm','lmzsjgnas','vm','bowonkys','glueallnigga','hotkeymenu','Monky_hax_toggled','espfnc','playeresp','zany','dfgjafafsafccccasd',
	'atext','boost','nd','vspeed','Ug8YtyGyvguGF','inv','rspwn','pList','loldami','T','bowonky','aimbott','Admin_Layout','markeresp','allMrk','MakeRandomSpace',
	'helpmenu','godlol','rustlinginit','qofjqpofq','invall','initarr','reinit','byebyezombies','admin_toggled','fn_ProcessDiaryLink','ALexc','DAYZ_CREATEVEHICLE',
	'Monky_funcs_inited','FUK_da_target','damihakeplz','damikeyz_veryhawt','mapopt','hangender','slag','jizz','kkk','ebay_har','sceptile279','TargetPlayer',
	'tell_me_more_infiSTAR','airborne_spawn_vehicle_infiSTAR','sxy_list_stored','advert_SSH','antiantiantiantih4x','Flare8','Flare7','SuperAdmin_MENU',
	'bl4ck1ist','keybinds','actualunit','mark_player','unitList_vec','yo2','actualunit_vec','typeVec','mark','r_menu','hfghfg','vhnlist','work','Intro',
	'yo3','q','yo4','k','cTargetPos','cpbLoops','cpLoopsDelay','Flare','Flare1','Flare2','Flare3','Flare4','Flare5','Flare6','kanghaskhan','palkia',
	'eExec_commmand','cockasdashdioh','fsdandposanpsdaon','antiloop','anti','spawn_explosion_target_ebay','whatisthis4','ratingloop_star','epochRemoteNukeAll',
	'PVAH_admin_rq','PVAH_writelog_rq','sandslash','muk','pidgeotto','charmeleon','pidgey','lapras','LYST1C_UB3R_L33T_Item','MathItem','fapLayer','cooldown',
	'raichu','infiSTAR_chewSTAR_dayz_1','infi_STAR_output','infi_STAR_code_stored','keybindings','keypress','menu_toggle_on','dayz_godmode','aiUnit',
	'MENUTITLE','wierdo','runHack','Dwarden','poalmgoasmzxuhnotx','ealxogmniaxhj','firstrun','ohhpz','fn_genStrFront','shazbot1','cip','Armor1','GMod',
	'kickable','stop','possible','friendlies','hacks','main','mapscanrad','maphalf','DelaySelected','SelectDelay','GlobalSleep','vehD','ALL_WEPS_TO_SEARCH',
	'jopamenu','ggggg','tlm','Listw','toggle_keyEH','infammoON','pu','chute','dayzforce_savex','PVDZ_AdminMenuCode','PVDZ_SUPER_AdminList','DarkwrathBackpack',
	'PVDZ_hackerLog','BP_OnPlayerLogin','material','mapEnabled','markerThread','addedPlayers','playershield','spawnitems1','sceptile27','Proceed_BB',
	'ESPEnabled','wpnbox','fnc_temp','MMYmenu_stored','VMmenu_stored','LVMmenu_stored','BIS_MPF_ServerPersistentCallsArray','PV_CHECK','admin_animate1',
	'patharray','ZobieDistanceStat','infiSTARBOTxxx','keyspressed','fT','tpTarget','HumanityVal','yanma','absol','SimpleMapHackCount','keyp',
	'aggron','magazines_spawn','weapons_spawn','backpack_spawn','backpackitem_spawn','keybindings_exec','keypress_exec','MajorHageAssFuckinfBulletsDude',
	'Wannahaveexplosivesforbullets','TheTargetedFuckingPlayerDude','haHaFuckAntiHakcsManIbypasDatShit','aintNoAntiHackCatchMyVars','objMYPlayer',
	'Awwwinvisibilty','vehiclebro','wtfyisthisshithere','terrainchangintime','Stats','menu','ssdfsdhsdfh','onisinfiniteammobra','youwantgodmodebro',
	'yothefuckingplayerishere','Namey','sendmsg12','jkh','DELETE_THIS','move_forward','leftAndRight','forwardAndBackward','upAndDown','distanceFromGround',
	'hoverPos','bulletcamon','cheatlist','espOn','removegrass','timeday','infammo','norekoil','nocollide','esp2ez','fastwalk','entupautowalk',
	'BensWalker','dropnear','executer','killme','magnetmenu','loadmain','magnet','loadMenu','refreshPlayers','ALREADYRAN','players','BigBenBackpack',
	'sendMessage','newMessage','W34p0ns','amm0','Att4chm3nt','F0od_Dr1nk','M3d1c4l','T0ol_it3ms','B4ckp4cks','It3m5','Cl0th1ng','walkloc','nwaf','cherno',
	'cherno_resident','cherno_resident_2','dubky','oaks','swaf','swmb','getX','PlayerShowDistance','M_e_n_u_2','colorme','keybindloop','Tractor_Time',
	'murkrow','noctowl','isExecuted','piloswine','AddPlayersToMap','markers','miltank','GearAdd','GearRemove','Malvsm','Malcars','malfly','keyForward',
	'PermDialogSelected','TempDialogSelected','AdminDialogList','pfKeygen','pfScanUnits','pfPickPlayer','pfshnext','pfnlist','pfselecteditem','pfshnmenu',
	'pfPlayerMonitor','pfPlayersToMonitor','pfShowPlayerMonitor','pfPlayerMonitorMutex','marker','JJJJ_MMMM___EEEEEEE_INIT_MENU','E_X_T_A_S_Y_Init_Menu',
	'monkaiinsalt','monkaiin','part88','adminKeybinds','PV_DevUIDs','fapEspGroup','Repair','RepairIT','rainbowTarget','rainbowTarget1','rainbowTarget2',
	'rainbowTarget3','letmeknow','VehicleMenue','Menue_Vehicle','my_anus_hurtz','life_no_injection','Tonic_has_a_gaping_vagina','teletoplr','telet',
	'ygurv1f2','BIGM','E3p','fnc_PVAH_AdminReq','infiSTAR_MAIN_CODE','MAIN_CODE_INJECTED','D34DXH34RT_E5P','Arsenal','Jme_Is_God','B0X_CANN0N_T0GGLE',
	'PL4YER_CANN0N_T0GGLE','aim','HOLY_FUCK_FDKFHSDJFHSDKJ_vehicles_m','lazy_ILHA_is_lazy','POOP_Item','die_menu_esp_v1','XXMMWW_main_menu','MM_150',
	'BIS_tracedShooter','JME_HAS_A_GIANT_DONG','nuke_vars','nukepos','fuckfest','fuckfestv2','FAG_NEON','Deverts_keyp','jfkdfjdfjdsfjdsfjkjflfjdlfjdlfjru_keyp',
	'eroticTxt','asdadaio9d0ua298d2a0dza2','trap','boomgoats','morphme','morph','blfor','blfor2','blfor3','rdfor','rdfor2','rdfor3','napa','civ',
	'Detected_Remote_Execution','keybindz','PEDO_IS_FUKED','MAINON','PLAYERON','PLAYEROFFNEXT1','PLAYERNEXT2','ALTISLIFEON','ALTISLIFEOFFNEXT1','ALTISLIFENEXT2',
	'ALTISLIFEOFFNEXT2','ALTISLIFENEXT3','FUNMENUON','FUNMENUOFFNEXT1','FUNMENUNEXT2','FUNMENUOFFNEXT2','FUNMENUNEXT3','MAINOFF','PLAYEROFF','ALTISLIFEOFF',
	'FUNMENUOFF','H4X_Miriweth_Menu_Click_Hax','IrEcOCMmeNEnd_God_MODE','TTTT_IIII___TTTTTTT_REPGAs','EC_GOD_TOGGLE','admin_d0_server','PedoMazing_Friends',
	'ly5t1c','JJMMEE_Swagger','Bobsp','Speed_Hack_cus','pList_star_peter_cus','RGB','neo_throwing','Blue_I_Color_LP','box','bombs','InfiSTAR_RUNNING_AH_on_Player',
	'Orange_I_Color_LP','Menu_I_On_Color_LP','Menu_I_Off_Color_LP','Speed_Hack_cus','cus_SPEED_DOWN','pnc','SpyglassFakeTrigger','infammook','input_text',
	'Tit_Choppertimer','GLASS911_Executer_for_menu','E5P','ThirtySix_Unlim_Ammo','ThirtySix_God','JJMMEE_INIT_MENU','menuheader','life_fnc_sessionUpdateCalled',
	'blu_t_color_LP','FAG_RedSoldiers','titles_n_shit','eXecutorr','menu_headers','player_list','refresh_players','fn_loadMap','weapon_list','vehicle_list','get_display',
	'create_display','CTRL_BTN_LIST','execMapFunc','mapFunc','OPEN_LISTS','init_menu','biggies_white_tex','Abraxas_Unl_Life','Abraxas_Life','waitFor','Mystic_ESP',
	'biggies_menu_open','scriptex3cuter','rym3nucl0s3','eses_alis','PersonWhomMadeThisCorroded_Menu','Flo_Simon_KillPopUp','keybindz2','text_colour','key_combos_ftw',
	'PlayerInfiniteAmmo','Im_a_Variable','aaaa','OMFG_MENU','N_6','RscCombo_2100_mini','RscListbox_1501_mini','andy_suicide','life_nukeposition',
	'JxMxE_hide','JME_Keybinds','JME_has_yet_to_fuck_this_shit','JME_deleteC','JME_Tele','JME_ANAL_PLOW','JME_M_E_N_U_initMenu','JME_M_E_N_U_hax_toggled','W_O_O_K_I_E_FUD_Pro_RE','W_O_O_K_I_E_FUD_Car_RE','W_O_O_K_I_E_FUD_Car_RE',
	'JxMxE_Veh_M','JxMxE_LifeCash500k','W_O_O_K_I_E_FUD_FuckUp_GunStore','W_O_O_K_I_E_FUD_M_E_N_U_initMenu','W_O_O_K_I_E_FuckUp_GunStore_a','JME_KillCursor','JME_OPTIONS','JME_M_E_N_U_fill_TROLLmenu','ASSPLUNGE','FOXBYPASS','POLICE_IN_HELICOPTA',
	'JxMxE_EBRP','W_O_O_K_I_E_M_E_N_U_funcs_inited','Menu_Init_Lol','E_X_T_A_S_Y_Atm','W_O_O_K_I_E_Pro_RE','W_O_O_K_I_E_Debug_Mon','W_O_O_K_I_E_Debug_1337','Veh_S_P_A_W_N_Shitt','sfsefse','tw4etinitMenu','tw4etgetControl',
	'JxMxEsp','JxMxE_GOD','JxMxE_Heal','efr4243234','sdfwesrfwesf233','sdgff4535hfgvcxghn','adadawer24_1337','lkjhgfuyhgfd','E_X_T_A_S_Y_M_E_N_U_funcs_inited','dayz_serverObjectMonitor','fsfgdggdzgfd','fsdddInfectLOL','Wookie_List',
	'JxMxE_TP','Wookie_Pro_RE','Wookie_Car_RE','Wookie_Debug_Mon','faze_funcs_inited','advertising_banner_infiSTAR','atext_star_xa','Monky_hax_dbclick','qopfkqpofqk','debug_star_colorful','AntiAntiAntiAntiHax','antiantiantiantih4x',
	'JxMxE_Infect','hub','scrollinit','gfYJV','Lystic_LMAOOOOOOOOOOOOOOOOOOO','Lystic_Re','Lysto_Lyst','E_X_T_A_S_Y_Keybinds','Menulocations','Lystic_Init','scroll_m_init_star','exstr1','pathtoscrdir3','Monky_funcs_inited',
	'JxMxE_secret','Monky_initMenu','player_zombieCheck','E_X_T_A_S_Y_Recoil','godlol','playericons','abcdefGEH','wierdo','go_invisible_infiSTAR','serverObjectMonitor','enamearr','initarr3','locdb','sCode','infAmmoIndex',
	'nukeDONEstar','Wookie_List','Wookie_Pro_RE','FUCKTONIC','E_X_T_A_S_Y_FuckUp_GunStore_a','E_X_T_A_S_Y_Cash_1k_t','E_X_T_A_S_Y_Cash_a','E_X_T_A_S_Y_LicenseDrive','E_X_T_A_S_Y_Menu_LOOOOOOOOOL','Metallica_vehicleg0dv3_infiSTAR',
	'JJJJ_MMMM___EEEEEEE_INIT_MENU','JJJJ_MMMM___EEEEEEE_GAPER','JJJJ_MMMM___EEEEEEE_SMOKExWEEDxEVERYDAY_BUM_RAPE','JJJJ_MMMM___EEEEEEE_OPTIONS','JJJJ_MMMM___EEEEEEE_M_E_N_U_fill_Target','E3p',
	'Jesus_MODE','ESP','MissileStrike','AL_Liscenses','NoIllegal','NoWeight','m0nkyaatp_sadksadxa','m0nkyaatp_RANDSTR','myvar23','player_adminlevel','TNK','I_like_turtles',
	'BIGM','Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTARS','Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTAR1','GMod','No_No_No_Tonic_likes_A_Big_Fat_Sheep_Cock_Right_in_the_bum_G0d_Mode',
	'Sload','aKFerm','aKMMenu','aKTitans','aKLikeaG0d','riasgremory_G0d_Mode','aKCarG0d','riasgremory_Car_Jesus','aKE5p','riasgremory_isseilol','aKPMark','l33tMapESPLunsear',
	'riasgremory_Noobs','riasgremory_Bitches','riasgremory_Map_Markers','aKUnMmo','jenesuispasuncheateur_unamo','aKVoit','Loljesaispasquoiecriremdr','isseigremory','gremorysama','aKTaCu','aKCardetroy','aKGetKey','aKKillcursor',
	'aKNoEscort','aKEscort','aKtroll','aKTPall','aKUnrestrain','aKNoEscortMe','aKNoTaze','aKJailplayer','aKLisense','riasgremory_titans_shit_reold','Tonic_merde','jaimepaslepoisin_HLEAL','TTTT_IIII___TTTTTTT_RAP_FR','TTTT_IIII___TTTTTTT_REPGA',
	'TTTT_IIII___TTTTTTT_REPGAs','jaimepaslepoisin_HLEAL','Root_Main4','Root_Pistol4','Root_Rifle4','Root_Machinegun4','Root_Sniper4','Root_Launcher4','Root_Attachement4',
	'VAR56401668319_secret','myPubVar','XXMMWW_boxquad','Init_Menu_Fury','A3RANDVARrpv1tpv','fnc_nestf','XXMMWW_keybinds','smissles','wooden_velo','vabox','bis_fnc_camera_target','bulshaaaatyB3','spoodydshakfhkfuntimehappydsa_dummysmenu',
	'LIFE_fnc_callMeADummy','spoodydshakfhkfuntimehappydsa_localdummy','O_fnc_RE','O_fnc_Modus','O_fnc_ArmA','mainCreate','check_load','already_load','init_main'
];


_UVC = false;	/* Use Vehicle Check(s) - recommended but I am not sure if all existing vehicles are already in this white-list below. "EXILE" ones are white-listed anyways */
_VehicleWhiteList =
[
	'Steerable_Parachute_F','I_UAV_01_F','B_HMG_01_high_F','O_HMG_01_F'
];
_ForbiddenVehicles =
[
	'B_Heli_Light_01_armed_F','B_Heli_Attack_01_F'
];


_UFI = true;	/* Use "_ForbiddenItems"/Item Check(s) */
_UIW = false;	/* if "_UIW = true;" then it checks if the items the individual player has are in "_ItemWhiteList" */
_ItemWhiteList =
[
	'AllowThisItem1','AllowThisItem2'
];
_ForbiddenItems =
[
	'autocannon_Base_F','autocannon_30mm','autocannon_35mm','autocannon_40mm_CTWS','autocannon_30mm_CTWS','Bomb_04_Plane_CAS_01_F',
	'Bomb_03_Plane_CAS_02_F','cannon_105mm','cannon_120mm','cannon_120mm_long','cannon_125mm','Cannon_30mm_Plane_CAS_02_F','gatling_20mm',
	'gatling_25mm','gatling_30mm','Gatling_30mm_Plane_CAS_01_F','GBU12BombLauncher','GMG_20mm','GMG_40mm','GMG_UGV_40mm','HMG_127_MBT',
	'HMG_127','HMG_127_APC','HMG_01','HMG_M2','HMG_NSVT','LMG_Minigun2','LMG_RCWS','LMG_M200','LMG_Minigun','LMG_Minigun_heli','LMG_coax',
	'Missile_AGM_02_Plane_CAS_01_F','Missile_AA_04_Plane_CAS_01_F','Missile_AA_03_Plane_CAS_02_F','Missile_AGM_01_Plane_CAS_02_F','missiles_DAGR',
	'missiles_DAR','missiles_ASRAAM','missiles_SCALPEL','missiles_titan','missiles_titan_static','missiles_Zephyr','Mk82BombLauncher','mortar_82mm',
	'mortar_155mm_AMOS','rockets_Skyfire','rockets_230mm_GAT','Rocket_04_HE_Plane_CAS_01_F','Rocket_04_AP_Plane_CAS_01_F','Rocket_03_HE_Plane_CAS_02_F',
	'Rocket_03_AP_Plane_CAS_02_F','Twin_Cannon_20mm'
];



/*
	custom Box content:
	just an item like it is in the example with   'ItemMap'   will put the item once in the box.
	if an array is used like the   ['ItemGPS',5]   example, well I assume you could guess what it will do.
	
	You can just define as many as you want buy copy pasting one of the existing _SupportBoxXContents and changing it up.
	After doing that you have to add it into the _allSupportBoxes array (last entry can't have a , at the end or the array is broken!).
*/
_SupportBox1Content =
[
	['Exile_Item_Flag',1],['WorkBench',1],['Exile_Item_WoodDoorKit',1],['Exile_Item_Codelock',1],['Exile_Item_WoodFloorKit',4],['Exile_Item_WoodFloorPortKit',2],
	['Exile_Item_WoodWallKit',5],['Exile_Item_CampFireKit',1],['Exile_Item_SafeKit',1],['Exile_Item_Storagecratekit',2],['Exile_Melee_Axe',1],['Exile_Ammo_Swing',1],
	['Exile_Item_Matches',1],['Exile_Item_CookingPot',1]
];

_SupportBox2Content =
[
	['Exile_Item_Flag',1],['WorkBench',2],['Exile_Item_WoodDoorKit',2],['Exile_Item_WoodGateKit',2],['Exile_Item_Codelock',4],['Exile_Item_WoodFloorKit',18],['Exile_Item_WoodFloorPortKit',2],
	['Exile_Item_WoodWallKit',25],['Exile_Item_CampFireKit',2],['Exile_Item_SafeKit',3],['Exile_Item_Storagecratekit',4],['Exile_Item_WoodStairsKit',4],['Exile_Melee_Axe',2],['Exile_Ammo_Swing',1],
	['Exile_Item_Matches',2],['Exile_Item_CookingPot',2],['B_Carryall_oucamo',1]
];

_SupportBox3Content =
[
	['Exile_Item_Flag',2],['WorkBench',3],['Exile_Item_WoodDoorKit',4],['Exile_Item_WoodGateKit',4],['Exile_Item_Codelock',8],['Exile_Item_WoodFloorKit',40],['Exile_Item_WoodFloorPortKit',4],
	['Exile_Item_WoodWallKit',30],['Exile_Item_CampFireKit',3],['Exile_Item_SafeKit',6],['Exile_Item_Storagecratekit',5],['Exile_Item_WoodStairsKit',8],['Exile_Melee_Axe',3],['Exile_Ammo_Swing',1],
	['Exile_Item_Matches',3],['Exile_Item_CookingPot',3],['B_Carryall_oucamo',1]
];

_SupportBox4Content =
[
	'ItemMap',['ItemGPS',5],'ItemWatch'
];

_allSupportBoxes = [
	_SupportBox1Content,
	_SupportBox2Content,
	_SupportBox3Content,
	_SupportBox4Content
];
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ********************************************************************************* */
/* ******************************DO NOT TOUCH BELOW********************************* */
_allSupportBoxesCount = count _allSupportBoxes;
if(!isNil 'infiSTAR_IS_RUN_ON_THIS_SERVER') exitWith {
	diag_log format['<infiSTAR.de> %1 - is already started %1 seconds ago..',time - infiSTAR_IS_RUN_ON_THIS_SERVER];
};
infiSTAR_IS_RUN_ON_THIS_SERVER = time;
/* ********************************************************************************* */
/* #223 */
/* ********************************************************************************* */
comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de - License: (CC)';
diag_log format['<infiSTAR.de> %1 - run.sqf - including AntiHack',time];
#include "EXILE_AH.sqf"
diag_log format['<infiSTAR.de> %1 - run.sqf - AntiHack included!',time];

diag_log format['<infiSTAR.de> %1 - run.sqf - including AdminTools',time];
#include "EXILE_AT.sqf"
diag_log format['<infiSTAR.de> %1 - run.sqf - AdminTools included!',time];
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright®© 2011 - 2015 All rights reserved.************** */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */