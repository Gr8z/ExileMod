#include "RscPaintDefines.hpp"
class PaintDialog
{
	idd = 23000;
	onLoad = "uiNamespace setVariable ['PaintDialog', _this select 0];";
	onUnload = "uiNamespace setVariable ['PaintDialog', displayNull];";
	class controlsBackground
	{
		class background: RscPaintText
		{
			idc = -1;
			x = -1.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 43 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
			colorBackground[] = {0.01,0.05,0,0.5};
		};
	};
	class Controls
	{
		class RscPicture_White: RscPaintButton
		{
			idc = 1200;
			text = "";
			colorBackground[] ={1,1,1,1};
			colorFocused[] ={1,1,1,1};
			colorBackgroundActive[] ={1,1,1,0.6};
			x = -1 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
			tooltip = "White";
			action = "['White'] spawn GG_fnc_BasePaint_onButtonClick";
		};
		class RscPicture_Red: RscPaintButton
		{
			idc = 1201;
			text = "";
			colorBackground[] ={0.46,0.01,0,1};
			colorFocused[] ={0.46,0.01,0,1};
			colorBackgroundActive[] ={0.46,0.01,0,0.6};
			x = 5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
			tooltip = "Red";
			action = "['Red'] spawn GG_fnc_BasePaint_onButtonClick";
		};
		class RscPicture_Green: RscPaintButton
		{
			idc = 1202;
			text = "";
			colorBackground[] ={0,0.38,0.09,1};
			colorFocused[] ={0,0.38,0.09,1};
			colorBackgroundActive[] ={0,0.38,0.09,0.6};
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
			tooltip = "Green";
			action = "['Green'] spawn GG_fnc_BasePaint_onButtonClick";
		};
		class RscPicture_Blue: RscPaintButton
		{
			idc = 1203;
			text = "";
			colorBackground[] ={0,0.12,0.61,1};
			colorFocused[] ={0,0.12,0.61,1};
			colorBackgroundActive[] ={0,0.12,0.61,0.6};
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
			tooltip = "Blue";
			action = "['Blue'] spawn GG_fnc_BasePaint_onButtonClick";
		};
		class RscPicture_Yellow: RscPaintButton
		{
			idc = 1204;
			text = "";
			colorBackground[] ={0.85,0.83,0,1};
			colorFocused[] ={0.85,0.83,0,1};
			colorBackgroundActive[] ={0.85,0.83,0,0.6};
			x = 23 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
			tooltip = "Yellow";
			action = "['Yellow'] spawn GG_fnc_BasePaint_onButtonClick";
		};
		class RscPicture_Purple: RscPaintButton
		{
			idc = 1205;
			text = "";
			colorBackground[] ={0.31,0.05,0.33,1};
			colorFocused[] ={0.31,0.05,0.33,1};
			colorBackgroundActive[] ={0.31,0.05,0.33,0.6};
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
			tooltip = "Purple";
			action = "['Purple'] spawn GG_fnc_BasePaint_onButtonClick";
		};
		class RscPicture_Orange: RscPaintButton
		{
			idc = 1206;
			text = "";
			colorBackground[] ={0.91,0.61,0,1};
			colorFocused[] ={0.91,0.61,0,1};
			colorBackgroundActive[] ={0.91,0.61,0,0.6};
			x = 35 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
			tooltip = "Orange";
			action = "['Orange'] spawn GG_fnc_BasePaint_onButtonClick";
		};
	};
};