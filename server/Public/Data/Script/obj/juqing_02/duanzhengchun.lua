--Íò½Ù¹È ¶ÎÕý´¾

-- Script ID
x118002_g_scriptId = 118002

-- Danh sách sñ ki®n ð¬ g÷i ra
x118002_g_eventList={200002, 200006, 200007}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x118002_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)

	if IsMissionHaveDone(sceneId,selfId,7) == 1 then
		AddText(sceneId,"#{JQ_WJG_B_007}")
	else
		AddText(sceneId,"#{JQ_WJG_B_006}")
	end

	for i, eventId in x118002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x118002_OnDefaultEvent( sceneId, selfId,targetId )
	x118002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®n b§c 1
--**********************************
function x118002_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x118002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Accept
--**********************************
function x118002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118002_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId,targetId  )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,targetId )
			end
			return
		end
	end
end

--**********************************
-- On Mission Refuse
--**********************************
function x118002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x118002_g_eventList do
		if missionScriptId == findId then
			x118002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Continue
--**********************************
function x118002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
-- On Mission Submit
--**********************************
function x118002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x118002_OnDie( sceneId, selfId, killerId )
end
