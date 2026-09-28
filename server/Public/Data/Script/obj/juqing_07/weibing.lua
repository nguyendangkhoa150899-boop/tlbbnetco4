--²ÔÃ£ÉÏ ÎÀ±ø 121004

-- Script ID
x121004_g_scriptId = 121004

-- Danh sách sñ ki®n ð¬ g÷i ra
x121004_g_eventList={}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x121004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_CMS_Y_005}")
	for i, eventId in x121004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x121004_OnDefaultEvent( sceneId, selfId,targetId )
	x121004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®n b§c 1
--**********************************
function x121004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x121004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Accept
--**********************************
function x121004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x121004_g_eventList do
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
function x121004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x121004_g_eventList do
		if missionScriptId == findId then
			x121004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Continue
--**********************************
function x121004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x121004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Submit
--**********************************
function x121004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x121004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x121004_OnDie( sceneId, selfId, killerId )
end
