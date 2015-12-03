myBuildings = [["Land_HouseV_1I4","Land_i_Stone_HouseSmall_V3_F",270],
               ["Land_HouseV_1T","Land_i_House_Big_02_V3_F",0],
               ["Land_HouseV_2T2","Land_i_Stone_HouseBig_V2_F",0],               
               ["Land_HouseV2_01A","Land_i_House_Big_01_V1_F",270],
               ["Land_HouseV2_01B","Land_i_House_Big_01_V1_F",270],         
               ["Land_HouseBlock_C2","Land_i_Shop_02_V1_F",-270],
               ["Land_HouseBlock_C5","Land_i_Shop_02_V3_F",-270],
               ["Land_Shed_W4","Land_Slum_House01_F",270],
               ["Land_Shed_W02","Land_Hut06",170],             
               ["Land_HouseBlock_A3","Land_i_House_Big_01_V1_F",270],
               ["Land_HouseBlock_B5","Land_i_Shop_02_V2_F",90], 
               ["Land_HouseBlock_B3","Land_Slum_House03_F",0],      
               ["Land_HouseBlock_B4","Land_i_House_Small_01_V3_F",0],   
               ["Land_HouseBlock_A1","Land_i_House_Small_01_V2_F",0],                  
               ["Land_HouseBlock_C4","Land_Kiosk_gyros_F",-270],    
               ["Land_HouseBlock_C3","Land_d_House_Big_01_V1_F",0],                
               ["Land_HouseBlock_B6","Land_Unfinished_Building_01_F",0],    
               ["Land_Ind_Pec_03a","Land_Factory_Main_F",0],    
               ["Land_a_stationhouse","Land_MilOffices_V1_F",0],
               ["Land_HouseV_3I2","Land_i_Stone_HouseBig_V3_dam_F",0],                      
               ["Land_Shed_M03","",90],
               ["Land_Shed_W03","Land_Hut06",270],
               ["Land_Shed_M02","Misc_Cargo1Bo_civil",0],
               ["Land_HouseV_1L1","Land_i_Stone_HouseBig_V2_dam_F",0],
               ["Land_HouseV_1I1","Land_i_Stone_HouseBig_V1_dam_F",0],
               ["Land_Misc_WaterStation","Land_FuelStation_Build_F",180],
               ["Land_Church_02a","Land_Chapel_V2_F",0],    
               ["Land_HouseV_2L","Land_i_Stone_Shed_V3_F",0],
               ["Land_HouseV_3I1","Land_i_Shop_02_V3_F",0], 
               ["Land_HouseV_2I","Land_Chapel_V1_F",90],
               ["Land_Mil_House","Land_i_Barracks_V1_F",0],     
               ["Land_Mil_Barracks","Land_Mil_Barracks_i",0],           
               ["Land_Mil_Barracks_L","Land_Cargo_HQ_V3_F",0],  
               ["Land_Mil_ControlTower","Land_Airport_Tower_F",0],                 
               ["Land_TEC","",0],       
               ["Land_SignB_GovPolice","",0],
               ["Land_SignB_Pub_CZ3","",0],
               ["Land_SignB_PostOffice","",0],
               ["Land_Sign_Bar_RU","",0],
               ["Land_SignB_Pub_RU3","",0],
               ["Land_SignB_Pub_CZ2","",0],
               ["Land_SignB_Gov","",0],
               ["Land_SignB_Hotel_CZ2","",0]
               
               
               ];       

for "_i" from 0 to(count myBuildings-1) do {

    _CurrentBuilding     = (myBuildings select _i) select 0;
    _ReplacementBuilding = (myBuildings select _i) select 1;    
    _DirectionOffset     = (myBuildings select _i) select 2;    
    

    {
        hideObject  _x;
    
        _myReplacement = createVehicle [_ReplacementBuilding, getPosATL _x, [], 0, "CAN_COLLIDE"];
        _myReplacement setDir (getdir _x) + _DirectionOffset;
        _myReplacement setPosATL (getPosATL _x) ;
        _myReplacement enableSimulationGlobal false;
    } forEach nearestObjects [markerpos "center", [_CurrentBuilding], 20000];


};