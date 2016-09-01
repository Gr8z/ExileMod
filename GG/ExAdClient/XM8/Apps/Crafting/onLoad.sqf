params["_display","_slide","_idc"];

_pW = 0.025;
_pH = 0.04;

_slideClass = "GG_Craft";

[_display,_slide,([_slideClass,"backButton"] call ExAd_fnc_getNextIDC),[24.7*_pW,2.5*_pH,8.3*_pW,1*_pH],'["extraApps", 1] call ExileClient_gui_xm8_slide;',"GO BACK"] call ExAd_fnc_createButton;

[_display,_slide,([_slideClass,"componentsList"] call ExAd_fnc_getNextIDC),[0.4*_pW,4*_pH,15.2*_pW,7*_pH],"call Crafting_fnc_componentsLoad"] call ExAd_fnc_createList;
[_display,_slide,([_slideClass,"recipeList"] call ExAd_fnc_getNextIDC),[16.2*_pW,4*_pH,16.8*_pW,14.25*_pH],""] call ExAd_fnc_createList;

[_display,_slide,([_slideClass,"craftButton"] call ExAd_fnc_getNextIDC),[16.2*_pW,2.5*_pH,8.3*_pW,1*_pH],'SelectedRecipe call ExileClient_gui_crafting_show',"Craft"] call ExAd_fnc_createButton;

[_display,_slide,([_slideClass,"categoriesCombo"] call ExAd_fnc_getNextIDC),[0.4*_pW,2.5*_pH,15.2*_pW,1*_pH],"call Crafting_fnc_recipeLoad",""] call ExAd_fnc_createCombo;

[_display,_newParent,([_slideClass,"text"] call ExAd_fnc_getNextIDC),[0.4*_pW,1.5*_pH,15.2*_pW,1*_pH],"[GG] Recipes","PuristaMedium",1,"#ffffff","left",0] call ExAd_fnc_createStructuredText;

[_display,_slide,([_slideClass,"pic"] call ExAd_fnc_getNextIDC),[0.4*_pW,11.5*_pH,15.2*_pW,7*_pH],"\exile_assets\texture\mod\icon.paa",[1,1,1,1],false,true,""] call ExAd_fnc_createPicture;

true