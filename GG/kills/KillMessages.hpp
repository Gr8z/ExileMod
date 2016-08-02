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
