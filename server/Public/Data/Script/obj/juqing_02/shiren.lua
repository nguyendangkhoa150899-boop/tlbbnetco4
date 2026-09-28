--Ê¯Í·ÈË

-- Script ID
x118015_g_scriptId = 118015

-- Danh sách sñ ki®n ð¬ g÷i ra
x118015_g_eventList={200008}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x118015_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		--´Ó3¾ä»°ÖÐËæ»úÑ¡Ôñ1¾ä
		local rand = random( 3 )
		if rand == 1  then
			AddText(sceneId,"#{JQ_WJG_B_003}")
		
		elseif rand == 2   then
			AddText(sceneId,"#{JQ_WJG_B_004}")
		
		elseif rand == 3   then
			AddText(sceneId,"#{JQ_WJG_B_005}")
		
		end
	for i, eventId in x118015_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x118015_OnDefaultEvent( sceneId, selfId,targetId )
	x118015_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®n b§c 1
--**********************************
function x118015_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x118015_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Accept
--**********************************
function x118015_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118015_g_eventList do
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
function x118015_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x118015_g_eventList do
		if missionScriptId == findId then
			x118015_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Continue
--**********************************
function x118015_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118015_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Submit
--**********************************
function x118015_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118015_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x118015_OnDie( sceneId, selfId, killerId )
end
