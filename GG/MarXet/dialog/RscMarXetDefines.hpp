class RscMarXetText
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] ={0,0,0,0};
	colorText[] ={1,1,1,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 0;
	colorShadow[] ={0,0,0,0.5};
	font = "OrbitronLight";
	SizeEx = "(((((safezoneW / safezoneH) min 0.9) / 1.2) / 25) * 1)";
	linespacing = 1;
	tooltipColorText[] ={1,1,1,1};
	tooltipColorBox[] ={1,1,1,1};
	tooltipColorShade[] ={0,0,0,0.65};
};
class RscMarXetStructuredText
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] ={1,1,1,1};
	class Attributes
	{
		font = "PuristaMedium";
		color = "#ffffff";
		colorLink = "#D09B43";
		align = "left";
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
class RscMarXetCombo
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 4;
	colorSelect[] ={0,0,0,1};
	colorText[] ={1,1,1,1};
	colorBackground[] ={0,0,0,1};
	colorScrollbar[] ={1,0,0,1};
	colorDisabled[] ={1,1,1,0.25};
	colorPicture[] ={1,1,1,1};
	colorPictureSelected[] ={1,1,1,1};
	colorPictureDisabled[] ={1,1,1,0.25};
	colorPictureRight[] ={1,1,1,1};
	colorPictureRightSelected[] ={1,1,1,1};
	colorPictureRightDisabled[] ={1,1,1,0.25};
	colorTextRight[] ={1,1,1,1};
	colorSelectRight[] ={0,0,0,1};
	colorSelect2Right[] ={0,0,0,1};
	tooltipColorText[] ={1,1,1,1};
	tooltipColorBox[] ={1,1,1,1};
	tooltipColorShade[] ={0,0,0,0.65};
	soundSelect[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundSelect",
		0.1,
		1
	};
	soundExpand[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundExpand",
		0.1,
		1
	};
	soundCollapse[] =
	{
		"\A3\ui_f\data\sound\RscCombo\soundCollapse",
		0.1,
		1
	};
	maxHistoryDelay = 1;
	class ComboScrollBar
	{
		color[] ={1,1,1,1};
	};
	style = "0x10 + 0x200";
	font = "PuristaMedium";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	colorSelectBackground[] ={1,1,1,0.7};
	arrowEmpty = "";
	arrowFull = "";
	wholeHeight = 0.45;
	colorActive[] ={1,0,0,1};
};
class RscMarXetListBox
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 5;
	rowHeight = 0;
	colorText[] ={1,1,1,1};
	colorDisabled[] ={1,1,1,0.25};
	colorScrollbar[] ={1,0,0,0};
	colorSelect[] ={0,0.698,0.804,1};
	colorSelect2[] ={0,0.698,0.804,1};
	colorSelectBackground[] ={1,1,1,0.3};
	colorSelectBackground2[] ={1,1,1,0.3};
	colorBackground[] ={0,0,0,0.3};
	soundSelect[] =
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.09,
		1
	};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	colorPicture[] ={0,0.698,0.804,1};
	colorPictureSelected[] ={1,1,1,1};
	colorPictureDisabled[] ={1,1,1,0.25};
	colorPictureRight[] ={1,1,1,1};
	colorPictureRightSelected[] ={1,1,1,1};
	colorPictureRightDisabled[] ={1,1,1,0.25};
	colorTextRight[] ={1,1,1,1};
	colorSelectRight[] ={0,00,1};
	colorSelect2Right[] ={0,0,0,1};
	tooltipColorText[] ={1,1,1,1};
	tooltipColorBox[] ={1,1,1,1};
	tooltipColorShade[] ={0,0,0,0.65};
	class ListScrollBar
	{
		color[] ={1,1,1,0.5};
		autoScrollEnabled = 1;
	};
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.3;
	style = 16;
	font = "OrbitronLight";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	colorShadow[] ={0,0,0,0.5};
	period = 1.2;
	maxHistoryDelay = 1;
};
class RscExileMarXetItemListBox: RscMarXetListBox
{
	sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1) / 1.2) / 25)";
	sizeEx2 = "0.8 * 			(			(			((safezoneW / safezoneH) min 1) / 1.2) / 25)";
	rowHeight = "2 * 			(			(			((safezoneW / safezoneH) min 1) / 1.2) / 25)";
	canDrag = 0;
	itemSpacing = 0.001;
	period = 1.2;
	shadow = 0;
	maxHistoryDelay = 1;
	fade = 0;
	deletable = 0;
	type = 5;
	style = 16;
	colorSelect[] = {0, 0, 0, 1};
	colorBackground[] = {0, 0, 0, 0.3};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorPicture[] = {1, 1, 1, 1};
	colorPictureDisabled[] = {1, 1, 1, 0.25};
	colorPictureRight[] = {1, 1, 1, 1};
	colorPictureRightDisabled[] = {1, 1, 1, 0.25};
	colorPictureSelected[] = {1, 1, 1, 1};
	colorScrollbar[] = {1, 0, 0, 0}; // yes, this is RED
	colorSelect2[] = {0, 0, 0, 1};
	colorSelect2Right[] = {0, 0, 0, 1};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
	colorSelectRight[] = {0, 0, 0, 1};
	colorShadow[] = {0, 0, 0, 0.5};
	colorText[] = {1, 1, 1, 1};
	colorTextRight[] = {1, 1, 1, 1};
	disabledCtrlColor[] = {1, 1, 1, 0.5};
	itemBackground[] = {1, 1, 1, 0.1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
	tooltipColorText[] = {1, 1, 1, 1};
	soundSelect[] =
	{
		"\A3\ui_f\data\sound\RscListbox\soundSelect",
		0.09,
		1
	};
	class ListScrollBar
	{
		color[] ={1,1,1,0.5};
		autoScrollEnabled = 1;
	};
	font = "OrbitronLight";
};
class RscMarXetButton
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 1;
	text = "";
	colorText[] ={1,1,1,1};
	colorDisabled[] ={1,1,1,0.25};
	colorBackground[] ={0,0,0,0.2};
	colorBackgroundDisabled[] ={0,0,0,0.5};
	colorBackgroundActive[] ={1,1,1,0.05};
	colorFocused[] ={1,1,1,0};
	colorShadow[] ={0,0,0,0};
	colorBorder[] ={0,0,0,1};
	soundEnter[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEnter",
		0.09,
		1
	};
	soundPush[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundPush",
		0.09,
		1
	};
	soundClick[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundClick",
		0.09,
		1
	};
	soundEscape[] =
	{
		"\A3\ui_f\data\sound\RscButton\soundEscape",
		0.09,
		1
	};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "OrbitronLight";
	sizeEx = "(((((safezoneW / safezoneH) min 1) / 1.2) / 25) * 1)";
	offsetX = 0;
	offsetY = 0;
	offsetPressedX = 0;
	offsetPressedY = 0;
	borderSize = 0;
};