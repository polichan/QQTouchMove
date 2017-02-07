--一、源码声明
	--本脚本算法由 ChanYu （Chen Pengyu） 编写，版权所有，仿冒必究。

--二、脚本使用说明（要求越狱）
	--1、添加 Cydia 源：http://apt.touchsprite.com，安装触动精灵后注销。
	--2、将本脚本放置到 /User/Media/TouchSprite/lua 目录下，打开触动精灵并选择本脚本。
	--3、进入QQ，然后按音量键启动，运行过程中可以随时按音量键结束运行。 
    --该LUA脚本只适配iPhone6S(4.7寸)设备
----------------------------------------------
--以下内容不了解请勿修改，否则脚本很可能无法正常运行。
----------------------------------------------

--初始化搜索栏坐标
local Start_x = 200;
local Start_y = 176;
--初始化搜索栏调整后的坐标
local Adjust_x = 200;
local Adjust_y = 574;
--初始化一号手指执行时的各x,y坐标
local MoveSearch_x = 375;
local MoveSearch_y = 220;
local AddPixels = 942 ;
--初始化二号手指“刷一刷”动作坐标
local Go_x_2 =375;
local Go_y_2 =630;
local AddPixels_2 = 130 ;
--初始化红包出现颜色判断坐标以及关闭红包位置坐标
local Red_x =375;
local Red_y =620;
local Red_cancle_x =650;
local Red_cancle_y =300;
--初始化需求刷新次数,默认为800次。
local Need = 800;
init("com.tencent.mqq",0);--设置QQ为脚本目标进程
if getColor(Start_x, Start_y) == 0xEEEFF3 then --获取QQ搜索栏颜色
	touchDown(1,  MoveSearch_x, MoveSearch_y); --1号手指 
	touchMove(1, MoveSearch_x,  MoveSearch_y+AddPixels); --1号手指滑动到1142处，使界面完全下移到极限位置
	for times=1,Need,1 do 
	if getColor(Adjust_x, Adjust_y) == 0xEEEFF3 then --开始判断QQ界面是否正确
	--二号手指执行QQ刷一刷动作
	touchDown(2,Go_x_2,Go_y_2); --在X=375;Y=550按下
    touchMove(2,Go_x_2,Go_y_2+AddPixels_2); --移动到X=375;Y=760处
    mSleep(100); --延迟100毫秒
    touchUp(1,Go_x_2,Go_y_2+AddPixels_2);  --在X=375;Y=760处释放
	if getColor(Red_x,Red_y) == 0xC3304A then --判断红包是否出现
	touchDown(2, Red_cancle_x, Red_cancle_y);
	touchUp(2, Red_cancle_x, Red_cancle_y);
	end
else
	touchDown(1,  MoveSearch_x, MoveSearch_y); --1号手指 
	touchMove(1, MoveSearch_x,  MoveSearch_y+AddPixels); --1号手指滑动到1142处，使界面完全下移到极限位置
end
end
end