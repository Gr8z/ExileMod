class RscExileStatusBar
{
        idd = -1;
        duration = 10e10;
        onLoad = "uiNamespace setVariable ['RscExileStatusBar', _this select 0];";
        fadein = 0;
        fadeout = 0;
        movingEnable = 0;
        objects[] = {};
 
        class controlsBackground
        {
                class statusBarImage
                {
                        idc = 55557;
                        type = 0;
                        style = 48;
                        x = safezoneX + 0.3 * safezoneW;
                        y = safezoneY + 0.946 * safezoneH;
                        w = safezoneW * 0.42 ;
                        h = safezoneH * 0.05;
                        colorText[] = {1, 1, 1, 1};
                        colorBackground[]={0,0,0,0};
                        sizeEx = 0.4;
                        font = "OrbitronLight";
                        text = "GG\images\StatusBarBackground.paa";
                        class Attributes
                        {
                                align="center";
                                color = "#ffffff";
                                font = "OrbitronLight";
                        };
                };
        };
 
        class controls
        {
                class statusBarText
                {
                        idc = 55554;
                        x = safezoneX + 0 * safezoneW;
                        y = safezoneY + 0.965 * safezoneH;
                        w = safezoneW * 1;
                        h = safezoneH * 1;
                        shadow = 2;
                        font = "OrbitronLight";
                        size = 0.03;
                        type = 13;
                        style = 2;
                        text = "";
                        align="center";
                        class Attributes
                        {
                                align="center";
                                color = "#ffffff";
                                font = "OrbitronLight";
                        };
                };
        };
};