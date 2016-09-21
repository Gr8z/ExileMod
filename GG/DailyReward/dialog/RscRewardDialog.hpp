#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class RscPicture;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscText;

class RewardsDialog
{
	idd = 22000;
	onLoad = "uiNamespace setVariable ['RewardsDialog', _this select 0];true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;";
	onUnload = "uiNamespace setVariable ['RewardsDialog', displayNull]; false call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;";
	class controlsBackground
	{
		class DialogBackground: RscText
		{
			idc = -1;
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};
		class DialogCation: RscText
		{
			idc = -1;
			text = "Daily Rewards";
			x = 10 * GUI_GRID_W + GUI_GRID_X;
			y = 4.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 20 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class InfoLabel: RscText
		{
			idc = -1;
			text = "Claim your dialy Reward from [GG] Ghostz Gamerz";
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
	class Controls
	{
		class CancelButton: RscButtonMenuCancel
		{
			idc = -1;
			action = "closeDialog 0";
			x = 23.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class ClaimButton: RscButtonMenuOK
		{
			idc = 1001;
			onMouseButtonClick = "";
			text = "Claim";
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.8};
		};
		class PictureReward: RscPicture
		{
			idc = 1002;
			text = "GG\images\reward\rewardsMain.paa";
			x = 11 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 18 * GUI_GRID_W;
			h = 8 * GUI_GRID_H;
		};
		class RewardLabel: RscText
		{
			idc = 1003;
			align = "center";
			text = "You have won 1000 pop tabs";
			x = 10.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 19 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};