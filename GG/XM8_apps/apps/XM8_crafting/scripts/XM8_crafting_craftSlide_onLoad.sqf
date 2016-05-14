/*	XM8 crafting app by
	
	-Script description-
*/

disableSerialization;
private ["_getNextIDC","_pW","_pH","_display","_slides","_unloadScript","_error","_thisSlide","_makeButton",
"_getControl","_makePicture","_makeStructuredText","_makeList","_makeCombo","_RecipeCategories","_CategoryConfig","_RecipeCategory","_catCombo"];

_makeButton = {
	params ["_parent","_idc","_position","_action","_text","_tooltip"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscButtonMenu",_idc,_parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetText _text;
	_ctrl ctrlSetEventHandler ["ButtonClick",_action];
	_ctrl ctrlSetTooltip _tooltip;
	_ctrl ctrlCommit 0;
	_ctrl;
};
_getNextIDC = {
	params ["_key"];
	private ["_slideClassName","_baseIDC","_result","_map"];
	_slideClassName = "craftSlide";
	_map = XM8_crafting_craftSlideIDCmap;
	_baseIDC = getNumber (missionConfigFile >> "CfgXM8" >> _slideClassName >> "controlID");
	_result = _baseIDC + (_map pushBack _key);
	_result;
};
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
_makePicture = {
	params ["_parent","_idc","_position","_picture","_color","_enable","_keepAspect","_tooltip"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate [(if (_keepAspect) then {"RscPictureKeepAspect"} else {"RscPicture"}), _idc, _parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetText _picture;
	_ctrl ctrlSetTextColor _color;
	_ctrl ctrlEnable _enable;
	_ctrl ctrlSetTooltip _tooltip;
	_ctrl ctrlCommit 0;
	_ctrl;
};
_makeStructuredText = {
	params ["_parent","_idc","_position","_text","_font","_size","_color","_align","_shadow"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscStructuredText", _idc, _parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetStructuredText (parseText format ["<t shadow='%6' font='%5' align='%4' size='%2' color='%3'>%1</t>", _text,_size,_color, _align,_font,_shadow]);
	_ctrl ctrlEnable false;
	_ctrl ctrlCommit 0;
	_ctrl;
};
_makeList = {
	params ["_parent","_idc","_position","_actionOnSelChanged","_tooltip"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscExileItemListBox",_idc,_parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetEventHandler ["LBSelChanged",_actionOnSelChanged];
	_ctrl ctrlSetTooltip _tooltip;
	_ctrl ctrlCommit 0;
	_ctrl;
};
_makeCombo = {
	params ["_parent","_idc","_position","_actionOnSelChanged","_tooltip"];
	private ["_ctrl"];
	_ctrl = _display ctrlCreate ["RscCombo",_idc,_parent];
	_ctrl ctrlSetPosition _position;
	_ctrl ctrlSetEventHandler ["LBSelChanged",_actionOnSelChanged];
	_ctrl ctrlSetTooltip _tooltip;
	_ctrl ctrlCommit 0;
	_ctrl;
};

_pW = 0.025;
_pH = 0.04;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
if (isNull _display) exitWith {_error = "Error loading XM8 Empty app, display is null"; systemChat _error; diag_log _error;};
_slides = _display displayCtrl 4007;
if (isNull _slides) exitWith {_error = "Error loading XM8 Empty app, slides control is null"; systemChat _error; diag_log _error;};

_unloadScript = '
	
';
_display displayAddEventHandler ["unload",_unloadScript];

XM8_crafting_craftSlideIDCmap = [];

_thisSlide = _display ctrlCreate ["RscExileXM8Slide",("craftSlide" call _getNextIDC),_slides];
[_thisSlide,("backButton" call _getNextIDC),[24.7*_pW,2.5*_pH,8.3*_pW,1*_pH],'["sideApps", 1] call ExileClient_gui_xm8_slide;',"GO BACK",""] call _makeButton;

/* 
	0.075 is width offset for controls if they are added in to slide
	0.08 is height offset for controls if they are added in to slide
	-from exile configs-
	class Slides : RscExileXM8Slide {
		idc = 4007;
		x = 3 * (0.025) + (0);
		y = 2 * (0.04) + (0);
*/
[_thisSlide, ("componentsList" call _getNextIDC), [0.4*_pW,4*_pH,15.2*_pW,7*_pH], "call XM8_crafting_componentsLoad", ""] call _makeList;
[_thisSlide, ("recipeList" call _getNextIDC), [16.2*_pW,4*_pH,16.8*_pW,14.25*_pH], "", ""] call _makeList;
[_thisSlide, ("craftButton" call _getNextIDC),[16.2*_pW,2.5*_pH,8.3*_pW,1*_pH],"SelectedRecipe call ExileClient_gui_crafting_show","Craft",""] call _makeButton;
[_thisSlide, ("categoriesCombo" call _getNextIDC), [0.4*_pW,2.5*_pH,15.2*_pW,1*_pH], "call XM8_crafting_recipeLoad", ""] call _makeCombo;
[
	_thisSlide, ("text" call _getNextIDC), [0.4*_pW,1.5*_pH,15.2*_pW,1*_pH], 
	"[GG] Recipes","PuristaMedium",1,"#FFFFFFFF","left",0
] call _makeStructuredText;
[
	_thisSlide, ("pic" call _getNextIDC), [0.4*_pW,11.5*_pH,15.2*_pW,7*_pH],"\exile_assets\texture\mod\icon.paa",
	[1,1,1,1], false, true, ""
] call _makePicture;

_RecipeCategories = [];
for '_j' from 0 to (count (missionConfigFile >> "CfgCraftingRecipes"))-1 do {
	_CategoryConfig = (missionConfigFile >> "CfgCraftingRecipes") select _j;
	_RecipeCategory = getText(_CategoryConfig >> "category");	
	if!(_RecipeCategory in _RecipeCategories)then{_RecipeCategories pushBack _RecipeCategory;};		
	_RecipeCategory = "Uncategorized";
	if!(_RecipeCategory in _RecipeCategories)then{_RecipeCategories pushBack _RecipeCategory;};
};
_catCombo = "categoriesCombo" call _getControl;
{
	_catCombo lbAdd Format["%1",_x];
	_catCombo lbSetData [_forEachIndex,_x];	
} foreach _RecipeCategories;
lbSort _catCombo;
