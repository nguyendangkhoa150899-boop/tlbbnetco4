-- ÂåÑô ÇÇ·å
-- 036008

-- Script ID
x036008_g_scriptId = 036008

-- Danh sách sñ ki®n ð¬ g÷i ra
x036008_g_eventList={200022, 200026}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x036008_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"#{JQ_JXZ_LY_001}")
		for i, eventId in x036008_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x036008_OnDefaultEvent( sceneId, selfId,targetId )
	x036008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®n b§c 1
--**********************************
function x036008_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x036008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Accept
--**********************************
function x036008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x036008_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId ,targetId)
			end
			return
		end
	end
end

--**********************************
-- On Mission Refuse
--**********************************
function x036008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x036008_g_eventList do
		if missionScriptId == findId then
			x036008_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Continue
--**********************************
function x036008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x036008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Submit
--**********************************
function x036008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x036008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x036008_OnDie( sceneId, selfId, killerId )
end
