/*

Coded and coverted by GR8
www.ghostzgamerz.com

*/

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