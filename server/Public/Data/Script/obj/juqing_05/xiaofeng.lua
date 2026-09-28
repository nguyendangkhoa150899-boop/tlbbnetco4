--ÇÇ·å

-- Script ID
x113001_g_scriptId = 113001

-- Danh sách sñ ki®n ð¬ g÷i ra
x113001_g_eventList={200021, 200026}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x113001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_JXZ_Y_001}")
	for i, eventId in x113001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x113001_OnDefaultEvent( sceneId, selfId,targetId )
	x113001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®n b§c 1
--**********************************
function x113001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x113001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Accept
--**********************************
function x113001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x113001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
-- On Mission Refuse
--**********************************
function x113001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x113001_g_eventList do
		if missionScriptId == findId then
			x113001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Continue
--**********************************
function x113001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x113001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Submit
--**********************************
function x113001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x113001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x113001_OnDie( sceneId, selfId, killerId )
end
