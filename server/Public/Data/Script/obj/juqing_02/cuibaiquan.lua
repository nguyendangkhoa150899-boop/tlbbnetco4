--´Þ°ÙÈª

-- Script ID
x118006_g_scriptId = 118006

-- Danh sách sñ ki®n ð¬ g÷i ra
x118006_g_eventList={}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x118006_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_WJG_B_012}")
	for i, eventId in x118006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x118006_OnDefaultEvent( sceneId, selfId,targetId )
	x118006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®n b§c 1
--**********************************
function x118006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x118006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Accept
--**********************************
function x118006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118006_g_eventList do
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
function x118006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x118006_g_eventList do
		if missionScriptId == findId then
			x118006_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Continue
--**********************************
function x118006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Submit
--**********************************
function x118006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x118006_OnDie( sceneId, selfId, killerId )
end
