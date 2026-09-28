
--作者 By UK QQ 2269169441  
x889103_g_scriptId = 889103
x889103_g_ItemID = {}
x889103_g_ItemID[1] = {5,{38000187},1,0}             --爱心玩具
x889103_g_ItemID[2] = {35,{30008121,30008122,30008122},3,0}   --彻地符
x889103_g_ItemID[3] = {60,{30309048,30309041,30309040},0,1}   --青蛙，毛驴，山羊
x889103_g_ItemID[4] = {60,{10157001},0,1}                     --龙纹
x889103_g_ItemID[5] = {60,{20307001,20307103},2,0}        --染发剂、通用发型图
x889103_g_ItemID[6] = {60,{38001100,38001091},2,0}                    --豪侠证明、崔天铁
x889103_g_ItemID[7] = {60,{30311015},1,0}                    --秘籍：九阴真经
x889103_g_ItemID[8] = {60,{10157001,10157001},2,0}        --两个龙纹
x889103_g_ItemID[9] = {60,{20310188,20310189},2,0}        --重楼之阳、天地明珠
x889103_g_ItemID[10] = {60,{38406001,38512001},2,0}        --真元紫血、橙命中
function x889103_TakeGift(sceneId,selfId,g_State1)
if g_State1 == nil or g_State1 < 0 or g_State1 > 10 then
return
end
if sceneId == 77 then
x889103_MsgBox( sceneId, selfId, "地府中不能领取奖励" )
       return
    end
	   
misslicunum = GetMissionData( sceneId, selfId, MD_GETLIJI_LIWUNOT)
if g_State1 ~= misslicunum + 1 or x889103_g_ItemID[misslicunum+1] == nil then
return
end
if misslicunum >= 10 then
x889103_MsgBox( sceneId, selfId, "您已经领取完所有奖励了" )
x889103_EndUI( sceneId, selfId )
return
end	 
local misslicunum3 = GetMissionData( sceneId, selfId, MD_MISS_TIME)
local yutimenum = LuaFnGetCurrentTime() - misslicunum3
if misslicunum3 < 1 or yutimenum <  x889103_g_ItemID[misslicunum+1][1]*60 then
x889103_MsgBox( sceneId, selfId, "警告非法领奖,还没到领奖时间" )
return
end
if LuaFnGetMaterialBagSpace(sceneId, selfId) < x889103_g_ItemID[misslicunum+1][4]  then
x889103_MsgBox( sceneId, selfId, "物品栏要"..x889103_g_ItemID[misslicunum+1][4].."个空格，请确认" )
return
end
if LuaFnGetPropertyBagSpace(sceneId, selfId) < x889103_g_ItemID[misslicunum+1][3]  then
x889103_MsgBox( sceneId, selfId, "道具栏要"..x889103_g_ItemID[misslicunum+1][3].."个空格，请确认" )
return
end
for i = 1,getn(x889103_g_ItemID[misslicunum+1][2]) do
bagpos01 = TryRecieveItem( sceneId, selfId, x889103_g_ItemID[misslicunum+1][2][i], 1 )
if bagpos01 >= 0 then
LuaFnItemBind( sceneId, selfId, bagpos01 )
   x889103_MsgBox( sceneId, selfId, "恭喜您成功领取【#{_ITEM"..x889103_g_ItemID[misslicunum+1][2][i].."}】，请查看背包" )--蝎子加入
end
end
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
SetMissionData( sceneId, selfId, MD_GETLIJI_LIWUNOT, misslicunum+1 )
SetMissionData( sceneId, selfId, MD_MISS_TIME, LuaFnGetCurrentTime())
misslicunum = GetMissionData( sceneId, selfId, MD_GETLIJI_LIWUNOT)
if misslicunum >= 10 then
x889103_MsgBox( sceneId, selfId, "您已经领取完所有奖励了" )
x889103_EndUI( sceneId, selfId )
else
BeginUICommand(sceneId)
UICommand_AddInt(sceneId,misslicunum+1);
UICommand_AddInt( sceneId,x889103_g_ItemID[misslicunum+1][1])
UICommand_AddInt( sceneId,0)
EndUICommand(sceneId )
DispatchUICommand(sceneId,selfId, 889103  )
end
end


function x889103_EndUI( sceneId, selfId )
BeginUICommand(sceneId)
UICommand_AddInt(sceneId,0);
UICommand_AddInt( sceneId,0)
UICommand_AddInt( sceneId,1)
EndUICommand(sceneId )
DispatchUICommand(sceneId,selfId, 889103  )
end
function x889103_LonGameUse( sceneId, selfId )
local misslicunum = GetMissionData( sceneId, selfId, MD_GETLIJI_LIWUNOT)
if misslicunum == nil or misslicunum < 0 or misslicunum > 9 then
return
end
BeginUICommand(sceneId)
UICommand_AddInt(sceneId,misslicunum+1);
SetMissionData( sceneId, selfId, MD_MISS_TIME, LuaFnGetCurrentTime())
UICommand_AddInt( sceneId,x889103_g_ItemID[misslicunum+1][1])
UICommand_AddInt( sceneId,1)
EndUICommand(sceneId )
DispatchUICommand(sceneId,selfId, 889103)
end
--**********************************
--消息提示自己
--**********************************
function x889103_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


