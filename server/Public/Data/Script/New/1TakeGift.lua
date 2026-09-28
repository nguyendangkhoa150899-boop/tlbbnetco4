
--×÷Õß By UK QQ 2269169441  
x889103_g_scriptId = 889103
x889103_g_ItemID = {}
x889103_g_ItemID[1] = {5,{30008014},1,0}             --ÐþÁéµ¤
x889103_g_ItemID[2] = {35,{20500003,20501003,20502003},3,0}   --Ò»¼¶¾«Ìú£¬ÃØÒø£¬ÃÞ²¼£¬
x889103_g_ItemID[3] = {60,{30505107,39999901,30309979},0,1}   --Ê±×°£¬×øÆï£¬±¦±¦
x889103_g_ItemID[4] = {60,{30505818},0,1}                     --Éñ·û1
x889103_g_ItemID[5] = {60,{30505818,30505818},2,0}        --Éñ·û1¡¢Éñ·û1
x889103_g_ItemID[6] = {60,{50501001,50501002},2,0}                    --ºì±¦Ê¯
x889103_g_ItemID[7] = {60,{50513004},1,0}                    --ÍõÄ¸ÏÉµ¤
x889103_g_ItemID[8] = {60,{10157001,10157001},2,0}        --Á½¸öÁúÎÆ
x889103_g_ItemID[9] = {60,{10156100,10156200},2,0}        --ÖØÂ¥Ö®Ñô¡¢ÌìµØÃ÷Öé
x889103_g_ItemID[10] = {60,{38000400,38000946},2,0}        --µñÎÆ¡¢Ò©»ê
function x889103_TakeGift(sceneId,selfId,g_State1)
if g_State1 == nil or g_State1 < 0 or g_State1 > 10 then
return
end
if sceneId == 77 then
x889103_MsgBox( sceneId, selfId, "· ð¸a phü không th¬ nh§n" )
       return
    end
	   
misslicunum = GetMissionData( sceneId, selfId, MD_GETLIJI_LIWUNOT)
if g_State1 ~= misslicunum + 1 or x889103_g_ItemID[misslicunum+1] == nil then
return
end
if misslicunum >= 10 then
x889103_MsgBox( sceneId, selfId, "BÕn ðã nh§n xong ph¥n thß·ng" )
x889103_EndUI( sceneId, selfId )
return
end	 
local misslicunum3 = GetMissionData( sceneId, selfId, MD_MISS_TIME)
local yutimenum = LuaFnGetCurrentTime() - misslicunum3
if misslicunum3 < 1 or yutimenum <  x889103_g_ItemID[misslicunum+1][1]*60 then
x889103_MsgBox( sceneId, selfId, "Chßa t¾i gi¶ nh§n, cÑ t× t×" )
return
end
if LuaFnGetMaterialBagSpace(sceneId, selfId) < x889103_g_ItemID[misslicunum+1][4]  then
x889103_MsgBox( sceneId, selfId, "Ô Nguyên li®u c¥n "..x889103_g_ItemID[misslicunum+1][4].." khoäng tr¯ng,m¶i ki¬m tra lÕi" )
return
end
if LuaFnGetPropertyBagSpace(sceneId, selfId) < x889103_g_ItemID[misslicunum+1][3]  then
x889103_MsgBox( sceneId, selfId, "Ô ðÕo cø c¥n "..x889103_g_ItemID[misslicunum+1][3].." khoäng tr¯ng,m¶i ki¬m tra lÕi" )
return
end
for i = 1,getn(x889103_g_ItemID[misslicunum+1][2]) do
bagpos01 = TryRecieveItem( sceneId, selfId, x889103_g_ItemID[misslicunum+1][2][i], 1 )
if bagpos01 >= 0 then
LuaFnItemBind( sceneId, selfId, bagpos01 )
   x889103_MsgBox( sceneId, selfId, "Chúc m×ng bÕn nh§n [#{_ITEM"..x889103_g_ItemID[misslicunum+1][2][i].."}] m¶i ki¬m tra tay näi" )--Ð«×Ó¼ÓÈë
end
end
LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
SetMissionData( sceneId, selfId, MD_GETLIJI_LIWUNOT, misslicunum+1 )
SetMissionData( sceneId, selfId, MD_MISS_TIME, LuaFnGetCurrentTime())
misslicunum = GetMissionData( sceneId, selfId, MD_GETLIJI_LIWUNOT)
if misslicunum >= 10 then
x889103_MsgBox( sceneId, selfId, "BÕn ðã nh§n ph¥n thß¶ng" )
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
--ÏûÏ¢ÌáÊ¾×Ô¼º
--**********************************
function x889103_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


