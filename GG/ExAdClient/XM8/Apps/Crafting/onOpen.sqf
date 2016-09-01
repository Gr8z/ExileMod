private["_display"];

_display = uiNameSpace getVariable ["RscExileXM8", displayNull];

_RecipeCategories = [];
for '_j' from 0 to (count (missionConfigFile >> "CfgCraftingRecipes"))-1 do {
	_CategoryConfig = (missionConfigFile >> "CfgCraftingRecipes") select _j;
	_RecipeCategory = getText(_CategoryConfig >> "category");	
	if!(_RecipeCategory in _RecipeCategories)then{_RecipeCategories pushBack _RecipeCategory;};		
	_RecipeCategory = "Uncategorized";
	if!(_RecipeCategory in _RecipeCategories)then{_RecipeCategories pushBack _RecipeCategory;};
};
_catCombo = [_display,"GG_Craft","categoriesCombo"] call ExAd_fnc_getAppCtrl;
{
	_catCombo lbAdd Format["%1",_x];
	_catCombo lbSetData [_forEachIndex,_x];	
} foreach _RecipeCategories;
lbSort _catCombo;