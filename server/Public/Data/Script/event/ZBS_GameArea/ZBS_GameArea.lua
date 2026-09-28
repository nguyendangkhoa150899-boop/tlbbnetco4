
--脚本号
x600053_g_scriptId = 600053
x600053_g_Relivepos = {}
x600053_g_Relivepos[1] = {95,64}
x600053_g_Relivepos[2] = {121,94}
x600053_g_Relivepos[3] = {95,119}
x600053_g_Relivepos[4] = {68,92}
x600053_g_Relivepos[5] = {106,81}
x600053_g_Relivepos[6] = {104,101}
x600053_g_Relivepos[7] = {86,101}
x600053_g_Relivepos[8] = {86,83}
x600053_g_Relivepos[9] = {95,92}
x600053_g_Relivepos[10] = {80,107}
x600053_g_OutScene, x600053_g_Outx, x600053_g_Outz = 0,89,185
--x600053_g_hudongtime = {78,79,80,81}
x600053_g_hudongtime = {15,16,17,18}
x600053_g_MyKillNum = MD_MY_KILLNUM
x600053_g_OtherKillMyNum = MD_OTHER_KILLMYNUM 
x600053_g_HumanKillMax = MD_HUMAN_KILLMAXNUM
x600053_g_BanKillMax = MD_BAN_KILLMAXNUM
--**********************************
-- OnTime
--**********************************
function x600053_GetTimer(sceneId)
local nQuarter = mod(GetQuarterTime(),100);
local isok,biaomin = 0,0

--if GetTodayWeek() == 1 or GetTodayWeek() == 3 or GetTodayWeek() == 5 then 
for i = 1,getn(x600053_g_hudongtime) do
if x600053_g_hudongtime[i] == nQuarter then
isok = i
break
end
--end

if nQuarter >= 10 and nQuarter <=77 then--8点到19点29分  32  77
biaomin = 1
end
end

return 1,1 -- isok,biaomin
end
--**********************************
-- OnTime
--**********************************
function x600053_OnSceneTimer(sceneId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanCount > 0 then
	for i=0, nHumanCount-1 do
	local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
	if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1  then	
		x600053_DoHanYuLogic( sceneId, nHumanId )
	end	
	end
	end

end

--**********************************
-- 
--**********************************
function x600053_DoHanYuLogic( sceneId, selfId )
if x600053_GetCheckList(sceneId, selfId) ~= 1 then
return
end

local BanHuiPos = x600053_GetCheckBanHuiPos(sceneId, selfId)
if BanHuiPos == -1 then
x600053_MsgBox( sceneId, selfId, "帮会场地已上限，必须离开" )
CallScriptFunction((400900), "TransferFunc",sceneId, selfId, x600053_g_OutScene, x600053_g_Outx, x600053_g_Outz)	
return
end

local str = "" --帮战风云榜：
if LuaFnGetCopySceneData_Param(sceneId,31) >= 1 then
local banhui,killernum
for i = 0,LuaFnGetCopySceneData_Param(sceneId,31)-1 do
banhui = mod(LuaFnGetCopySceneData_Param(sceneId,i),10000)
killernum = floor(LuaFnGetCopySceneData_Param(sceneId,i)/10000)
if i ~= LuaFnGetCopySceneData_Param(sceneId,31)-1 then
str=str.."#B["..banhui.."]号帮杀:#cFF0000"..killernum.."#B人,#r"

else
str=str.."#Y["..banhui.."]号帮杀:#cFF0000"..killernum.."#Y人#r"
aaa = banhui
ttt = killernum
end
end
end 


local HumanKillNum,HumanKillMaxName,BanKillNum,BanKillName =  x600053_GetNumAndName(sceneId, selfId)
str1 = ""
if HumanKillNum ~= 0 and HumanKillMaxName ~= "" then
str1 = "#ccc33cc个人榜首:#G"..HumanKillMaxName.."#Y杀#B"..HumanKillNum.."#G人#r"
end
if BanKillNum ~= 0 and BanKillName ~= "" then
str1 = str1 .."#B帮会榜首：#Y"..BanKillName.."#B杀：#cFF0000"..BanKillNum.."#B人#r"
end

BeginUICommand( sceneId )
UICommand_AddString(sceneId,str)
UICommand_AddString(sceneId,str1);	 	
EndUICommand( sceneId )
DispatchUICommand( sceneId, selfId, 89056178)
end

--**********************************
--
--**********************************
function x600053_OnPlayerEnter( sceneId, playerId )
        if x600053_GetCheckList(sceneId, playerId) ~= 1 then
		      return
	    end		  
	            local guildid 		= GetHumanGuildID(sceneId,playerId)  
				if LuaFnGetCopySceneData_Param(sceneId,31) >= 10 then
				return
				end
				local mybanhuiid = x600053_GetCheckBanHuiPos(sceneId, playerId)
                if mybanhuiid == -1 then
				LuaFnSetCopySceneData_Param(sceneId,LuaFnGetCopySceneData_Param(sceneId,31),guildid)
				LuaFnSetCopySceneData_Param(sceneId,31,LuaFnGetCopySceneData_Param(sceneId,31)+1)
				mybanhuiid = LuaFnGetCopySceneData_Param(sceneId,31)
                end		
 
                SetMissionData( sceneId, playerId, x600053_g_MyKillNum,0) 
                SetMissionData( sceneId, playerId, x600053_g_OtherKillMyNum,0)				
				RestoreHp( sceneId, playerId )
	            RestoreMp( sceneId, playerId )
	            RestoreRage( sceneId, playerId )
                LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 10091, 0)
	            LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 84, 0)
		        SetPvpAuthorizationFlagByID(sceneId, playerId, 2, 1) 
                SetUnitCampID(sceneId, playerId, playerId, guildid+10 )
                 local x = random(81,113)				
				  local y = random(77,106)
						
                SetPlayerDefaultReliveInfo( sceneId, playerId, "%50", "%50", "0",sceneId ,x , y )
       	   
          end
--**********************************
--
--**********************************
function x600053_GetCheckBanHuiPos(sceneId, selfId)
local guildid 		= GetHumanGuildID(sceneId,selfId)  
local pos = -1
if LuaFnGetCopySceneData_Param(sceneId,31) > 0 then
for i = 0,LuaFnGetCopySceneData_Param(sceneId,31)-1 do
if mod(LuaFnGetCopySceneData_Param(sceneId,i),10000) == guildid then
pos = i
break
end
end
end
return pos
end		  
--**********************************
--
--**********************************
function x600053_GetCheckList(sceneId, selfId)
local sismyguildid 		= GetHumanGuildID(sceneId,selfId)
local GuildName = LuaFnGetGuildName(sceneId, selfId)
local nowtime = x600053_GetTimer(sceneId)
if sismyguildid == nil or sismyguildid == -1 or GuildName == nil or GuildName == "" then
x600053_MsgBox( sceneId, selfId, "没有帮会必须离开战场！！" )
CallScriptFunction((400900), "TransferFunc",sceneId, selfId, x600053_g_OutScene, x600053_g_Outx, x600053_g_Outz)	
return 0
end

local myHPmax = GetMaxHp(sceneId,selfId)
if myHPmax < 30000 then
x600053_MsgBox( sceneId, selfId,"血上限不足3W必须离开")
CallScriptFunction((400900), "TransferFunc",sceneId, selfId, x600053_g_OutScene, x600053_g_Outx, x600053_g_Outz)
return
end
local myLv = GetLevel(sceneId, selfId)
if myLv < 95 then
x600053_MsgBox( sceneId, selfId,"等级不足95级必须离开")
CallScriptFunction((400900), "TransferFunc",sceneId, selfId, x600053_g_OutScene, x600053_g_Outx, x600053_g_Outz)
return
end
if nowtime == 0 then
x600053_MsgBox( sceneId, selfId, "战场已关闭！" )
for i = 0,31 do
LuaFnSetCopySceneData_Param(sceneId,i,0)
end
local KillMaxNum,KillerName,KLMaxBan,KLMaxBanName = x600053_GetNumAndName(sceneId, selfId)
if KillerName ~= "" and KillMaxNum > 0 then
x600053_SetOneHuMan(sceneId,KillerName)
local message = format("#cff9966#{_INFOUSR%s}#W取得了本次#cff9966全国争霸赛杀人数第一#W，请在今天之内领完奖励，过期无效", KillerName );
if message ~= nil then
BroadMsgByChatPipe(sceneId, selfId, message, 4);
end 
end 
if KLMaxBanName ~= "" and KLMaxBan > 0 then
x600053_SetOneBanHui(sceneId,KLMaxBanName)
local message = format("#cff9966[%s]#W帮会取得了本次全#cff9966国争霸赛帮会第一#W，请在今天之内领完奖励，过期无效", KLMaxBanName );
if message ~= nil then
BroadMsgByChatPipe(sceneId, selfId, message, 4);
end 
end 
x600053_DelKillNumAndName(sceneId, selfId)
CallScriptFunction((400900), "TransferFunc",sceneId, selfId, x600053_g_OutScene, x600053_g_Outx, x600053_g_Outz)	
return 0
end


return 1
end
--**********************************
-- 
--**********************************
function x600053_SetOneHuMan(sceneId,MaxKillHuMan)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanCount > 0 then
	local MYName,nHumanId
	for i=0, nHumanCount-1 do
	nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
	MYName = GetName(sceneId, nHumanId);
	if MaxKillHuMan == MYName  then	
	SetMissionData( sceneId, nHumanId, x600053_g_HumanKillMax,GetDayTime())
    break	
	end	
	end
    end
end	
--**********************************
-- 
--**********************************
function x600053_SetOneBanHui(sceneId,MaxKillBan)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanCount > 0 then
	local MYBanName,nHumanId
	for i=0, nHumanCount-1 do
	nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
	MYBanName = LuaFnGetGuildName(sceneId, nHumanId);
	if MaxKillBan == MYBanName  then	
	SetMissionData( sceneId, nHumanId, x600053_g_BanKillMax,GetDayTime()) 
	end	
	end
    end
end
--**********************************
--
--**********************************
function x600053_DelKillNumAndName(sceneId, selfId)
if HumanKillnum ~= nil or HumanName ~= nil then
HumanKillnum = nil
HumanName = nil
end

if BanHuiKillNum ~= nil or MyBanHuiName ~= nil then
BanHuiKillNum = nil
MyBanHuiName = nil
end
end	
--**********************************
--
--**********************************
function x600053_GetNumAndName(sceneId, selfId)
if HumanKillnum ~= nil and HumanName ~= nil and BanHuiKillNum ~= nil and MyBanHuiName ~= nil then
return HumanKillnum,HumanName,BanHuiKillNum,MyBanHuiName
end
return 0,"",0,""
end  
--**********************************
--
--**********************************
function x600053_KillPlayer(sceneId, selfId, killerId)
local objType = GetCharacterType( sceneId, killerId )
if objType == 3 then
killerId = GetPetCreator(sceneId, killerId)
end
if x600053_GetCheckList(sceneId, killerId) ~= 1 then
return
end
local MyKillNum = GetMissionData( sceneId, killerId, x600053_g_MyKillNum)+1
local OtherKillMyNum = GetMissionData( sceneId, selfId, x600053_g_OtherKillMyNum)+1
SetMissionData( sceneId, killerId, x600053_g_MyKillNum,MyKillNum) 
SetMissionData( sceneId, selfId, x600053_g_OtherKillMyNum,OtherKillMyNum)
local killer = x600053_BanhuanKillPlayer(sceneId, killerId,0)
local selfer = x600053_BanhuanKillPlayer(sceneId, selfId,1)
x600053_BanHunAndHumanBaiHang(sceneId, killerId,MyKillNum,killer)
x600053_MsgBox( sceneId, killerId, "个人杀人总数："..MyKillNum.."人，帮会杀人总数:"..killer.."人")
x600053_MsgBox( sceneId, selfId, "个人被杀总数："..OtherKillMyNum.."人，帮会杀人总数:"..selfer.."人")
end
--**********************************
--
--**********************************
function x600053_BanhuanKillPlayer(sceneId, selfId,key)
local ishavemiss = x600053_GetCheckBanHuiPos(sceneId, selfId)
local killnum,mybanhun = 0,-1
if -1 ~= ishavemiss then
if key == 0 then
killnum = floor(LuaFnGetCopySceneData_Param(sceneId,ishavemiss)/10000)+1
mybanhun = mod(LuaFnGetCopySceneData_Param(sceneId,ishavemiss),10000)
LuaFnSetCopySceneData_Param(sceneId,ishavemiss,killnum*10000+mybanhun)
else
killnum = floor(LuaFnGetCopySceneData_Param(sceneId,ishavemiss)/10000)
mybanhun = mod(LuaFnGetCopySceneData_Param(sceneId,ishavemiss),10000)
end
end 
return killnum,mybanhun
end
--**********************************
--
--**********************************
function x600053_BanHunAndHumanBaiHang(sceneId, selfId,Mykillnum,MYBanHuiKillNum)
if HumanKillnum == nil or HumanName == nil then
HumanKillnum = Mykillnum
HumanName = GetName(sceneId, selfId)
else
if Mykillnum > HumanKillnum then
HumanKillnum = Mykillnum
HumanName = GetName(sceneId, selfId)
end
end

if BanHuiKillNum == nil or MyBanHuiName == nil then
BanHuiKillNum = MYBanHuiKillNum
MyBanHuiName = LuaFnGetGuildName(sceneId, selfId);
else
if MYBanHuiKillNum > BanHuiKillNum   then
BanHuiKillNum = MYBanHuiKillNum
MyBanHuiName = LuaFnGetGuildName(sceneId, selfId);
end
end

end 
--**********************************
--消息提示自己
--**********************************
function x600053_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end



