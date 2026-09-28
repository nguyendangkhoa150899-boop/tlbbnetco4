--帮战领取奖励
--Author UK 
--脚本号
x600056_g_scriptId = 600056
x600056_g_MyKillNum = MD_MY_KILLNUM
x600056_g_OtherKillMyNum = MD_OTHER_KILLMYNUM 
x600056_g_HumanKillMax = MD_HUMAN_KILLMAXNUM
x600056_g_BanKillMax = MD_BAN_KILLMAXNUM
x600056_g_XianLiTable = {
    [2]				=	300,
    [3]	    =	300,
    [4]			    =	300,
    [5]				=	300,
    [6]			=	300,
    [7]					=	300,
    [8]      =	1000,
    [9]		    =	2000,
}
--**********************************
--
--**********************************
function x600056_OnDefaultEvent( sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText( sceneId, "全服争霸赛领取奖励" )
	AddText( sceneId, "杀人最多者奖励#Y2000W#W赠点" )
	AddText( sceneId, "胜利帮会，帮主、副帮主其它帮众奖励依次为#Y2000W#W、#Y1000W#W、#Y300W#W赠点" )
	AddNumText(sceneId,x600056_g_scriptId,"杀人最多者领取奖励",6,1) 
	AddNumText(sceneId,x600056_g_scriptId,"胜利帮会领取奖励",6,2)
	EndEvent(sceneId)
 	DispatchEventList(sceneId,selfId,targetId) 

 end

 
--**********************************
--
--**********************************
function x600056_OnEventRequest( sceneId, selfId, targetId, eventId)
local NowTime = GetDayTime()
local MYmiss1 = GetMissionData( sceneId, selfId, x600056_g_HumanKillMax)
local MYmiss2 = GetMissionData( sceneId, selfId, x600056_g_BanKillMax)
if GetNumText()== 1	then
if MYmiss1 ~= NowTime and MYmiss1 ~= 0 then
x600056_BoxTip( sceneId, selfId, targetId,"您奖励已过期")
return
end
if MYmiss1 == 0 then
x600056_BoxTip( sceneId, selfId, targetId,"您并没获得此奖励")
return
end
LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 49, 0 )
SetMissionData( sceneId, selfId, x600056_g_HumanKillMax,0)
ZengDian(sceneId,selfId,targetId,1,20000000)
local message = format("#W#{_INFOUSR%s}在全服争霸赛中英勇杀敌,给予#cFF00002000W#W赠点作为奖励", GetName(sceneId, selfId) );
if message ~= nil then
BroadMsgByChatPipe(sceneId, selfId, message, 4);
end
x600056_BoxTip( sceneId, selfId, targetId,"恭喜您，成功领取杀人最多者奖励！")
elseif GetNumText()== 2 then
if MYmiss2 ~= NowTime and MYmiss2 ~= 0 then
x600056_BoxTip( sceneId, selfId, targetId,"您奖励已过期")
return
end
if MYmiss2 == 0 then
x600056_BoxTip( sceneId, selfId, targetId,"您并没获得此奖励")
return
end
if x600056_g_XianLiTable[GetGuildPos(sceneId, selfId)] == nil then
x600056_BoxTip( sceneId, selfId, targetId,"您没有可领取的奖励")
return
end
LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 49, 0 )
SetMissionData( sceneId, selfId, x600056_g_BanKillMax,0)
ZengDian(sceneId,selfId,targetId,1,x600056_g_XianLiTable[GetGuildPos(sceneId, selfId)]*10000)
local message = format("#W#{_INFOUSR%s}领取了帮会优胜奖励，#cFF0000"..x600056_g_XianLiTable[GetGuildPos(sceneId, selfId)].."W#W赠点", GetName(sceneId, selfId) );
if message ~= nil then
BroadMsgByChatPipe(sceneId, selfId, message, 4);
end
x600056_BoxTip( sceneId, selfId, targetId,"领取胜利帮会奖励成功！")
end


end

--**********************************
--
--**********************************
function x600056_BoxTip( sceneId, selfId, targetId,txt)
	BeginEvent(sceneId)
    AddText( sceneId, txt )       
	EndEvent(sceneId)
 	DispatchEventList(sceneId,selfId,targetId) 
end