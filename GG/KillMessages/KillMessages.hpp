class KM_RscStructuredText 
{
    deletable = 0;
    fade = 0;
    access = 0;
    type = 13;
    idc = -1;
    style = 0;
    colorText[] = {1, 1, 1, 1};
    class Attributes 
    {
        font = "OrbitronLight";
        color = "#ffffff";
        colorLink = "#D09B43";
        align = "Center";
        shadow = 1;
    };
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    shadow = 1;
};
class KillMessages
{
	idd = -1;
	duration = 7;
	onload = "uiNamespace setVariable ['KillMessages',_this select 0];";
	onunload = "uiNamespace setVariable ['KillMessages',displayNull];";
	class controls
	{
		class RscText_1000: KM_RscStructuredText
		{
			idc = 1000;
			text = "";
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.0 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.07 * safezoneH;
		};
	};
};


class XG_killBoard_RscText
{
	access = 0;
	type = 0;
	idc = -1;
	style = 0x02;
	colorBackground[] = {0.19,0.23,0.24,0.6};
	colorText[] = {1,1,1,1};
	font = "OrbitronLight";
	sizeEx = 0.032;
	h = 0.05;
	text = "";
};
class XG_killBoard_RscFrame
{
	access = 0;
	type = 0;
	idc = -1;
	style = 64;
	shadow = 0;
	colorBackground[] = {0.19,0.23,0.24,0.6};
	colorText[] = {1,1,1,1};
	font = "OrbitronLight";
	sizeEx = 0.03;
	text = "";
};
class XG_killBoard_RscListBox
{
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	text = "";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	rowHeight = 0;
	style = 0x02 + 0x20;
	font = "OrbitronLight";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	color[] = {1,1,1,1};
	colorActive[] = {1,0,0,1};
	colorShadow[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	period = 0;
	blinkingPeriod = 0;
	colorBackground[] = {0.19,0.23,0.24,0.6};
	maxHistoryDelay = 1.0;
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	colorTextRight[] = {1,1,1,1};
	colorSelectRight[] = {0,0,0,1};
	colorSelect2Right[] = {0,0,0,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	soundSelect[] = {"\A3\ui_f\data\sound\RscListBox\soundSelect",0.09,1};
	class ListScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		shadow = 0;
		scrollSpeed = 0.06;
		autoScrollEnabled = 0;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};
};
class XG_killBoard_RscButton
{
	access = 0;
	type = 1;
	style = 2;
	x = 0;
	y = 0;
	w = 0.055589;
	h = 0.039216;
	shadow = 0;
	font = "OrbitronLight";
	sizeEx = 0.03;
	colorText[] = {1,1,1,.9};
	colorDisabled[] = {0.4,0.4,0.4,0};
	colorBackground[] = {0.19,0.23,0.24,0.6};
	colorBackgroundDisabled[] = {0,0,0,0.4};
	colorBackgroundActive[] = {0,0,0,0.4};
	colorFocused[] = {0,0,0,0.4};
	colorShadow[] = {0.023529,0,0.0313725,0};
	colorBorder[] = {0.023529,0,0.0313725,1};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0.0;
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
};
class XG_killBoard_RscPicture
{
	access = 0;
	type = 0;
	style = 1;
	shadow = 0;
	font = "OrbitronLight";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.6};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
class XG_killBoard
{
	idd = -1;
	duration = -1;
	onload = "uiNamespace setvariable ['XG_killBoard',(_this select 0)]";
	onunload = "uiNamespace setvariable ['XG_killBoard',displayNull]";
	class controls
	{
		class RscPicture_1799: XG_killBoard_RscPicture
		{
			idc = 1799;
			text = "";
			x = 0.27 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.452812 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class RscFrame_1800: XG_killBoard_RscFrame
		{
			idc = 1800;
			x = 0.270313 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.452812 * safezoneW;
			h = 0.7 * safezoneH;
		};
		class RscListbox_1500: XG_killBoard_RscListBox
		{
			idc = 1500;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.439687 * safezoneW;
			h = 0.532 * safezoneH;
		};
		class RscButton_1600: XG_killBoard_RscButton
		{
			idc = 1600;
			text = "Close";
			x = 0.650937 * safezoneW + safezoneX;
			y = 0.78 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.056 * safezoneH;
			action="closedialog 0";
		};
		class RscText_1000: XG_killBoard_RscText
		{
			idc = 1000;
			text = "XG Kill Board";
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.178 * safezoneH + safezoneY;
			w = 0.439687 * safezoneW;
			h = 0.042 * safezoneH;
		};
	};
};