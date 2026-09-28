--城市NPC
--武具

x890059_g_scriptId=890059

x890059_g_DanrenFB_ComboList=
{
[1]={text="#{DRFB_130111_212}", tooltip="#{DRFB_130111_49}",rate=1,message="#{DRFB_130111_52}"},
[2]={text="#{DRFB_130111_213}", tooltip="#{DRFB_130111_50}",rate=2,message="#{DRFB_130111_53}"},
[3]={text="#{DRFB_130111_214}", tooltip="#{DRFB_130111_51}",rate=5,message="#{DRFB_130111_54}"},
[4]={text="#{DRFB_130111_220}", tooltip="#{DRFB_130111_222}",rate=10,message="#{DRFB_130111_249}"},
[5]={text="#{DRFB_130111_221}", tooltip="#{DRFB_130111_223}",rate=25,message="#{DRFB_130111_250}"},
}
--**********************************
--事件交互入口
--**********************************
function x890059_BeginChallenge( sceneId, selfId,targetId1,targetId2,targetId3,targetId4,targetId5,targetId6 )
------targetId1 = g_DanrenFB_NPC_objId*100 + g_DanrenFB_ComboList[g_DanrenFB_Award_Type].rate	
----x890060_CheckAccept( sceneId, selfId, targetId )
-----CallScriptFunction( 893063, "MakeCopyScene",sceneId, selfId,1)
if (not targetId1) or  (not targetId2) or  (not targetId3) or  (not targetId4) or  (not targetId5) or  (not targetId6) then
x890059_Tips( sceneId, selfId, "警告：请不要乱改补丁，您的帐号已经被记录！" )
return
end
local maxnnu = GetMissionData( sceneId, selfId, ZHOUTIANCEN )*5 + 5
if maxnnu > 25 then
maxnnu = 25
end
if targetId6 < 1 or targetId6 > maxnnu or targetId2 < 1 or targetId2 > maxnnu or targetId3 < 1 or targetId3 > maxnnu or targetId4 < 1 or targetId4 > maxnnu or targetId5 < 1 or targetId5 > maxnnu then
x890059_Tips( sceneId, selfId, "警告：请不要乱改补丁，您的帐号已经被记录！！" )
return
end
local  TZchensu = GetMissionData( sceneId, selfId, ZHOUTIANCEN )
local  GHchensu = mod(targetId1,100)
	 if TZchensu < 0 then
	 TZchensu = 0
	 elseif TZchensu > 4 then
	 TZchensu = 4
	 end
local missitem = 0	 
for i,item in x890059_g_DanrenFB_ComboList do	 
if item.rate == GHchensu then
missitem = i
end
end
if missitem == 0 then
x890059_Tips( sceneId, selfId, "警告：请不要乱改补丁，您的帐号已经被记录！！！" )
return
end
if GetTeamLeader(sceneId,selfId) ~= selfId or GetTeamSize(sceneId,selfId) ~= 1  then
x890059_Tips( sceneId, selfId, "你必须是队长，且是一个人的队伍才能进入" )
return
end

	 local  itemnumaa = LuaFnGetAvailableItemCount(sceneId, selfId, 38000527) 
	 local  itemnumaa1 =  LuaFnGetAvailableItemCount(sceneId, selfId, 38000527)
	 local  TZtimes = mod(GetMissionData( sceneId, selfId, WJMISS ),100)
	 local  TZchensu = GetMissionData( sceneId, selfId, ZHOUTIANCEN )
	 local  g_DanrenFB_LeftFreeTimes = 0
	 if TZchensu < 0 then
	 TZchensu = 0
	 elseif TZchensu > 4 then
	 TZchensu = 4
	 end
	      if TZtimes < x890059_g_DanrenFB_ComboList[TZchensu+1].rate then
	      g_DanrenFB_LeftFreeTimes = 1
	      else
	      g_DanrenFB_LeftFreeTimes = 0
	      end

local ticket = (x890059_g_DanrenFB_ComboList[missitem].rate - g_DanrenFB_LeftFreeTimes) * 10
local  ItemUseNum = GetMissionData( sceneId, selfId, ZHOUTIANITEM )
	 local cennustimes = (x890059_g_DanrenFB_ComboList[TZchensu+1].rate - TZtimes) + 25 -- ItemUseNum
         if cennustimes < 0 then	
         x890059_Tips( sceneId, selfId, "挑战次数已上限！！（温馨提示：提高挑战层数，可以获得更多挑战次数，你目前已经成功挑战"..GetMissionData( sceneId, selfId, ZHOUTIANCEN ).."层BOSS）" )
         return
         end
if itemnumaa + itemnumaa1 < ticket then
x890059_Tips( sceneId, selfId, "#{DRFB_130111_217}" )
return
end
local DELITEM = 0
local DELITEMNUM = 0
if itemnumaa >= ticket then
DELITEMNUM = LuaFnDelAvailableItem(sceneId,selfId,38000527,ticket)
DELITEM = 1
else
LuaFnDelAvailableItem(sceneId,selfId,38000527,itemnumaa)
end
if DELITEM == 0 then
DELITEMNUM = LuaFnDelAvailableItem(sceneId,selfId,38000527,ticket-itemnumaa)
end
if DELITEMNUM == 0 then
x890059_Tips( sceneId, selfId, "扣除物品失败，无法创建副本" )
return
end
local nearmembercount	= GetNearTeamCount( sceneId, selfId )
local cc =0
if GHchensu ==1 then 
	lastDayTime = GetMissionData( sceneId, selfId, WJMISSyy )
		local CurDayTime = GetDayTime()
	if CurDayTime > lastDayTime then
	cc =1
	end
if cc ~= 1 then 
x890059_Tips( sceneId, selfId, "每天只有一次基础次数" )	
	return
end		
SetMissionData( sceneId, selfId, WJMISSyy,GetDayTime() )	
	
end 	
CallScriptFunction( (890057), "MakeCopyScene", sceneId,selfId,nearmembercount,GetTeamLeader(sceneId,selfId),floor(ticket/10),targetId2,targetId3,targetId4,targetId5,targetId6) 
end

function x890059_Tips( sceneId, selfId, str )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

