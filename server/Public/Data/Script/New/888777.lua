--平凡的人生
--**********************************
--事件交互入口
--**********************************
x888777_g_ScriptId = 888777
function x888777_OnDefaultEvent( sceneId, selfId,targetId )

end
function x888777_OnEventRequest( sceneId, selfId, targetId, eventId )
end
function x888777_Tip(sceneId, selfId,str)
	BeginEvent( sceneId )
		AddText( sceneId,str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
function x888777_OnSceneTimer(sceneId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanCount ==0 then --里面没人就返回
	return	
	end
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		x888777_DoAutoGetExpLogicc( sceneId, nHumanId )
	end
end
function x888777_DoAutoGetExpLogicc( sceneId, selfId )

end

function x888777_OnScenePlayerEnter(sceneId, playerId)
SetUnitCampID(sceneId, playerId, playerId, LuaFnGetMenPai(sceneId, playerId)+ 10)
end
function x888777_OnDie(sceneId, selfId, killerId)

end
function x888777_OnInitScene(sceneId, selfId)

end




function x888777_Tuan_Duis(sceneId, selfId,tepa,tagauid,beishenq) --团处理事件  300是 建立 400 是申请
if tepa ==400 then	
staren = LuaFnGuid2ObjId( sceneId,tagauid)
ZJtaren = LuaFnGuid2ObjId( sceneId,beishenq)
if GetUnitCampID(sceneId, staren, staren) == -1 then 
 x888777_Tip(sceneId, selfId,"对方没开启团队")
return 0	
end
if GetUnitCampID(sceneId, ZJtaren, ZJtaren) ~= -1 then 
 x888777_Tip(sceneId, selfId,"你自己有团了")
return 0		
end	
if GetUnitCampID(sceneId, staren, staren) ~= -1 then
BeginUICommand(sceneId)
UICommand_AddInt(sceneId, tagauid);
UICommand_AddInt(sceneId, beishenq);
UICommand_AddString(sceneId, GetName(sceneId, selfId ).."申请到你的团中...");
EndUICommand(sceneId)
DispatchUICommand(sceneId,staren, 20151102) --这个借口废弃
return
end
end

  if tepa ==300 then
    if GetTeamSize( sceneId, selfId )	<7 then
	 x888777_Tip(sceneId, selfId,"转换团队最少需要7个人")
	 return 0
    end
	
		--是否都在附近....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
	 x888777_Tip(sceneId, selfId,"有队员不再附近")	
		return 0
	end
	
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	for i=0, NearTeamSize-1 do
	local PlayerId = GetNearTeamMember( sceneId, selfId, i )
	local nTeamId = GetTeamId(sceneId, PlayerId)
	local nCampID = nTeamId + 500
	SetUnitCampID(sceneId, PlayerId, PlayerId, nCampID)
	x888777_Tip(sceneId, PlayerId,"转团成功")	
	SetMissionData( sceneId, PlayerId, XIEZI_TUANDUI,nCampID)
	end
end	
	------------------------------
	
	
	
	
	
	
	
	


end
function x888777_Tuan_Dux_s(sceneId,selfId,uido,tagauid,beishenq)
staren = LuaFnGuid2ObjId( sceneId,tagauid)
ZJtaren = LuaFnGuid2ObjId( sceneId,beishenq)	

if uido == 50 then
local idd =GetUnitCampID(sceneId, staren, staren)
SetUnitCampID(sceneId, ZJtaren, ZJtaren, idd)
x888777_Tip(sceneId, ZJtaren,"成功申请到"..GetName(sceneId, staren ).."团中")
x888777_Tip(sceneId, staren,GetName(sceneId, ZJtaren).."申请到你的团队")	
--------------同意
SetMissionData( sceneId, selfId, XIEZI_TUANDUI,idd)
end	
if uido == 60 then
x888777_Tip(sceneId, ZJtaren,GetName(sceneId, staren ).."拒绝你你的请求")
end


end


function x888777_Tuan_Dux_LK(sceneId,selfId)  --退了
local idd = GetUnitCampID(sceneId, selfId, selfId)	
if idd 	< 0 then
		x888777_Tip(sceneId, selfId,"你没有团了")
	return
end	
SetUnitCampID(sceneId, selfId, selfId,-1)		
x888777_Tip(sceneId, selfId,"成功脱离团队")	
return
end	 


function x888777_Tuan_Dux_SSX(sceneId,selfId)  --退了
local idd = GetUnitCampID(sceneId, selfId, selfId)	
if idd 	< 0 then
		x888777_Tip(sceneId, selfId,"你还没有团队")
	return
end		
----------------
srtingiuis = GetName( sceneId, selfId)
local ida = GetMissionData( sceneId, selfId, XIEZI_TUANDUI)
BeginUICommand(sceneId)
UICommand_AddInt(sceneId, idd);	
UICommand_AddInt(sceneId, ida);	
UICommand_AddString(sceneId, srtingiuis.."#r");
EndUICommand(sceneId)
DispatchUICommand(sceneId,selfId, 20151027) --这个借口废弃	
end

function x888777_GetSameCampCount(sceneId)
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	local Humanlistid = {}
	local nCount = 0
	local Humanlist = {}
	local nHumanNum = 0
	for i=0, nHumanCount-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if GetUnitCampID(sceneId, nHumanId, nHumanId)  >0 then
			Humanlistid[nCount] = GetUnitCampID(sceneId, nHumanId, nHumanId)
			nCount = nCount+1
			Humanlist[nHumanNum] =GetName( sceneId, nHumanId )
     		nHumanNum = nHumanNum + 1
		end
		
	end
	return Humanlist{},Humanlistid {}
end
