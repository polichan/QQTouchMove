init("com.tencent.mqq",0);--设置QQ为脚本目标程序
touchDown(1, 375, 368); --在X=150;Y=550按下
for i =0,492,492 do ---使用for循环从起始点连续竖向移动到终止点
	touchMove(1, 375, 368+i);
	mSleep(150); --延迟为150
end
touchUp(1, 375, 860); --在X=375.Y=860抬起