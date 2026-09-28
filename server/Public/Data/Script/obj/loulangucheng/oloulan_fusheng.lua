--楼兰NPC....
--缥缈峰接引使....

--脚本号
x001167_g_ScriptId = 001167


--所拥有的事件ID列表
x001167_g_eventList={050000}
--**********************************
--事件列表
--**********************************
function x001167_UpdateEventList( sceneId, selfId,targetId )

	local CurDayTime = GetDayTime()
	local lastTime = GetMissionData( sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	if CurDayTime > lastDayTime then
	lastDayCount = 5
	end
	wc = 5 - lastDayCount
	if  wc <=0 then 
	wc =0 
	end	
	if lastDayCount >5 then 
		lastDayCount =5
	end	
	BeginEvent(sceneId)
	     local str = format("#W因天龙幻境实在过于凶险，所以即使是有缘之人每天也只能进去#G5次#W，每天的副本次数将在#G每天00:00#W重置。#r少侠你今天已接任务#G%s次#W，还可以再接任务#G%s次#W。",lastDayCount,wc)
			AddText(sceneId,str)
		--[[	AddText(sceneId,CurDayTime.."|"..lastDayTime)--]]
		AddNumText( sceneId, x001167_g_ScriptId, "关于试炼：天龙幻境",0 ,2  )
		for i, eventId in x001167_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001167_OnDefaultEvent( sceneId, selfId,targetId )
	x001167_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001167_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 2 then
	BeginEvent(sceneId)
	    AddText(sceneId,"#{TLHJ_120110_05}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	
	for i, findId in x001167_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnEventRequest",sceneId, selfId, targetId, GetNumText(),x001167_g_ScriptId )
		return
		end
	end
end

