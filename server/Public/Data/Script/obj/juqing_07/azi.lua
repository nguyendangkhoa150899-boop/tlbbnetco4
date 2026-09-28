-- °¢×Ï 121002

-- Script ID
x121002_g_scriptId = 121002

-- Danh sách sñ ki®n ð¬ g÷i ra
x121002_g_eventList={}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x121002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_CMS_Y_002}")
	for i, eventId in x121002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x121002_OnDefaultEvent( sceneId, selfId,targetId )
	x121002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®n b§c 1
--**********************************
function x121002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x121002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Accept
--**********************************
function x121002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x121002_g_eventList do
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
function x121002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x121002_g_eventList do
		if missionScriptId == findId then
			x121002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Continue
--**********************************
function x121002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x121002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Submit
--**********************************
function x121002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x121002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x121002_OnDie( sceneId, selfId, killerId )
end
