CRAFTING_APP__CODE = {

	Crafting_fnc_componentsLoad = {

		private ["_display","_getControl","_equippedMagazines","_SelectedRecipeCtrl","_recipeList","_components","_Tools","_requiredInteractionModelGroup",
		"_requiresOcean","_requiresFire","_returnedItems","_Quantity","_Component","_ComponentDispName","_ComponentPicture","_equippedComponentQuantity","_lbsize",
		"_Tool","_ToolDispName","_ToolPicture","_equippedToolQuantity","_foundObject","_interactionModelGroupConfig","_RequiredDispName","_interactionModelGroupModels","_pic"];

		disableSerialization;

		_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

		_equippedMagazines = magazines player;
		_SelectedRecipeCtrl = [_display,"GG_Craft","componentsList"] call ExAd_fnc_getAppCtrl;
		_recipeList = [_display,"GG_Craft","recipeList"] call ExAd_fnc_getAppCtrl;
		_pic = [_display,"GG_Craft","pic"] call ExAd_fnc_getAppCtrl;
		SelectedRecipe 	= _SelectedRecipeCtrl lbData (lbCurSel _SelectedRecipeCtrl);

		_components 				   = getArray(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "components");
		_Tools 						   = getArray(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "tools");
		_requiredInteractionModelGroup = getText(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "requiredInteractionModelGroup");
		_requiresOcean 				   = getNumber(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "requiresOcean");
		_requiresFire 				   = getNumber(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "requiresFire");
		_returnedItems 				   = getArray(missionConfigFile >> "CfgCraftingRecipes" >> SelectedRecipe  >> "returnedItems");

		lbClear _recipeList;

		// * Populate Components *
		_recipeList lbAdd Format["====== COMPONENTS ======"];
		{
		_Quantity = _x select 0;
		_Component = _x select 1;

		_ComponentDispName = getText (configfile >> "CfgMagazines" >> _Component >> "displayName");
		_ComponentPicture  = getText (configfile >> "CfgMagazines" >> _Component >> "picture");			

		//Exile Code
		_equippedComponentQuantity = { _x == _Component} count _equippedMagazines;
		if (_equippedComponentQuantity < _Quantity ) then
		{
			_recipeList lbAdd Format["%3 - [%1/%2]",  _equippedComponentQuantity, _Quantity, _ComponentDispName];
			_lbsize = lbSize _recipeList;
			_recipeList lbSetColor [_lbsize-1, [0.918, 0, 0,1]];
		}
		else
		{ 
			_recipeList lbAdd Format["%3 - [%1/%2]",  _equippedComponentQuantity, _Quantity, _ComponentDispName];
			_lbsize = lbSize _recipeList;
			_recipeList lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
		};		



		_recipeList lbSetPicture [_forEachIndex+1,_ComponentPicture];
		_recipeList lbSetData [_forEachIndex+1,_Component];

		} forEach _components;


		//* Populate Tools *

		if (count _Tools > 0)  then { _recipeList lbAdd Format["====== TOOLS ======"]; };

		{	
		_Tool = _x;
		_ToolDispName = getText (configfile >> "CfgMagazines" >> _Tool >> "displayName");
		_ToolPicture  = getText (configfile >> "CfgMagazines" >> _Tool >> "picture");			

		//Exile Code
		_equippedToolQuantity = { _x == _Tool } count _equippedMagazines;
		if (_equippedToolQuantity == 0 ) then
		{
			_recipeList lbAdd Format["%1 - [MISSING]",_ToolDispName];
			_lbsize = lbSize _recipeList;
			_recipeList lbSetColor [_lbsize-1, [0.918, 0, 0,1]];			
		}
		else 
		{
			_recipeList lbAdd Format["%1 - [OK]",_ToolDispName];
			_lbsize = lbSize _recipeList;
			_recipeList lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
			
		};		

		_lbsize = lbSize _recipeList;
		_recipeList lbSetPicture [_lbsize-1,_ToolPicture];
		_recipeList lbSetData [_lbsize-1,_Tool];
		} forEach _Tools;	  

		// Populate Required 
		if (_requiredInteractionModelGroup != "" || _requiresOcean == 1 || _requiresFire == 1)  then { _recipeList lbAdd Format["====== REQUIRES ======"]; };

		// Populate Models
		if (_requiredInteractionModelGroup != "")  then 
		{
		_foundObject = false;

		_interactionModelGroupConfig = missionConfigFile >> "CfgInteractionModels" >> _requiredInteractionModelGroup;
		_RequiredDispName = getText(_interactionModelGroupConfig >> "name");
		_interactionModelGroupModels = getArray(_interactionModelGroupConfig >> "models");

		//Exile Code
		if ([ASLtoAGL (getPosASL player), 10, _interactionModelGroupModels] call ExileClient_util_model_isNearby) then
		{
			_recipeList lbAdd Format["%1 - [OK]",_RequiredDispName];
			_lbsize = lbSize _recipeList;
			_recipeList lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
			_foundObject = true;	
		}
		else 
		{
			if ( _interactionModelGroupModels call ExileClient_util_model_isLookingAt ) then
			{
				_recipeList lbAdd Format["%1 - [OK]",_RequiredDispName];
				_lbsize = lbSize _recipeList;
				_recipeList lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
				_foundObject = true;	
			};
		};
		if !(_foundObject) then
		{
			_recipeList lbAdd Format["%1 - [MISSING]",_RequiredDispName];
			_lbsize = lbSize _recipeList;
			_recipeList lbSetColor [_lbsize-1, [0.918, 0, 0,1]];				
		};

		_lbsize = lbSize _recipeList;
		_recipeList lbSetData [_lbsize-1,_requiredInteractionModelGroup];
		};

		//* Populate Ocean 
		if (_requiresOcean == 1)  then 
		{
			//Exile Code
			if !(surfaceIsWater getPos player) then 
			{
				_recipeList lbAdd Format["%1 - [MISSING]", "Ocean"];
				_lbsize = lbSize _recipeList;
				_recipeList lbSetColor [_lbsize-1, [0.918, 0, 0,1]];				
			}
			else 
			{
				_recipeList lbAdd Format["%1 - [OK]", "Ocean"];
				_lbsize = lbSize _recipeList;
				_recipeList lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];				
			};

		};	  

		// Populate Fire
		if (_requiresFire == 1)  then 
		{
			//Exile Code
			if !([player, 4] call ExileClient_util_world_isFireInRange) then 
			{
				_recipeList lbAdd Format["%1 - [MISSING]", "Fire"];
				_lbsize = lbSize _recipeList;
				_recipeList lbSetColor [_lbsize-1, [0.918, 0, 0,1]];				
			}
			else
			{
				_recipeList lbAdd Format["%1 - [OK]", "Fire"];
				_lbsize = lbSize _recipeList;
				_recipeList lbSetColor [_lbsize-1, [0.698, 0.925, 0,1]];			
			};			

		};	

		// Populate Returns 
		_recipeList lbAdd Format["====== RETURNS ======"];
		{
		_Quantity = _x select 0;
		_Component = _x select 1;

		_ComponentDispName = getText (configfile >> "CfgMagazines" >> _Component >> "displayName");
		_ComponentPicture  = getText (configfile >> "CfgMagazines" >> _Component >> "picture");

		_recipeList lbAdd Format["%2 - [%1]",  _Quantity, _ComponentDispName];

		_lbsize = lbSize _recipeList;
		_recipeList lbSetPicture [_lbsize-1,_ComponentPicture];

		_pic ctrlSetText _ComponentPicture;

		_recipeList lbSetData [_lbsize-1,_Component];
		(_display displayCtrl 5507) ctrlSetText _ComponentPicture;
		} forEach _returnedItems; 

	};

	Crafting_fnc_recipeLoad = {

		private ["_display","_compoList","_reciList","_CategoryCtrl","_SelectedCategory","_CategoryConfig","_pictureItemClassName","_RecipeCategory","_RecipeClass",
		"_currentRecipeName","_pictureItemConfig","_recipePicture","_lbsize"];

		disableSerialization;

		_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

		_compoList = [_display,"GG_Craft","componentsList"] call ExAd_fnc_getAppCtrl;
		_reciList = [_display,"GG_Craft","recipeList"] call ExAd_fnc_getAppCtrl;
		_pic = [_display,"GG_Craft","pic"] call ExAd_fnc_getAppCtrl;

		lbClear _compoList;
		lbClear _reciList;
		_pic ctrlSetText "\exile_assets\texture\mod\icon.paa";

		_CategoryCtrl = [_display,"GG_Craft","categoriesCombo"] call ExAd_fnc_getAppCtrl;
		_SelectedCategory 	= _CategoryCtrl lbData (lbCurSel _CategoryCtrl);

		for '_j' from 0 to (count (missionConfigFile >> "CfgCraftingRecipes"))-1 do
		{
			_CategoryConfig = (missionConfigFile >> "CfgCraftingRecipes") select _j;	
			_pictureItemClassName = getText(_CategoryConfig >> "pictureItem");
			_RecipeCategory = getText(_CategoryConfig >> "category");
			_RecipeClass = configName _CategoryConfig;	
			_currentRecipeName = getText(_CategoryConfig >> "name");	
			_pictureItemConfig = configFile >> "CfgMagazines" >> _pictureItemClassName;
			_recipePicture = getText(_pictureItemConfig >> "picture");	

			if (_RecipeCategory == _SelectedCategory) then
			{
				_lbsize = lbSize _compoList;
				_compoList lbAdd Format["%1",_currentRecipeName];
				_compoList lbSetPicture [_lbsize,_recipePicture];
				_compoList lbSetData [_lbsize,_RecipeClass];
			}
			else 
			{
				if (_SelectedCategory == "Uncategorised" && _RecipeCategory == "") then
				{
					_lbsize = lbSize _compoList;
					_compoList lbAdd Format["%1",_currentRecipeName];
					_compoList lbSetPicture [_lbsize,_recipePicture];
					_compoList lbSetData [_lbsize,_RecipeClass];
				};		
			};
				
		};
		lbSort _compoList;

	};
};
publicVariable 'CRAFTING_APP__CODE';

[] spawn {
	waitUntil{!isNil'FN_infiSTAR_S'};
	['',{
		if(!isNil'CRAFTING_APP_JIP_T')then{terminate CRAFTING_APP_JIP_T;CRAFTING_APP_JIP_T=nil;};
		CRAFTING_APP_JIP_T = [] spawn {
			waitUntil {!isNil 'CRAFTING_APP__CODE'};
			[] call CRAFTING_APP__CODE;
		};
	},-2,'CRAFTING_APP_JIP'] call FN_infiSTAR_S;
};
true