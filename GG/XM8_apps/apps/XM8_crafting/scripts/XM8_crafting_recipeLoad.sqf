/*	XM8 crafting app by
	
	-Script description-
*/

private ["_display","_getControl","_compoList","_CategoryCtrl","_SelectedCategory","_CategoryConfig","_pictureItemClassName","_RecipeCategory","_RecipeClass",
"_currentRecipeName","_pictureItemConfig","_recipePicture","_lbsize"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_getControl = {
	params ["_key"]; 
	private ["_ctrl","_idc","_index","_slideClassName"]; 
	_ctrl = controlNull;
	_slideClassName = "craftSlide";
	_map = XM8_crafting_craftSlideIDCmap;
	_index = _map find _key;
	if (_index != -1) then {
		_idc = ((getNumber (missionConfigFile >> "CfgXM8" >> _slideClassName >> "controlID")) + _index);
		_ctrl = _display displayCtrl _idc;
	};
	_ctrl;
};
_compoList = ("componentsList" call _getControl);
lbClear _compoList;
lbClear ("recipeList" call _getControl);
("pic" call _getControl) ctrlSetText "\exile_assets\texture\mod\icon.paa";

_CategoryCtrl = ("categoriesCombo" call _getControl);
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
	







