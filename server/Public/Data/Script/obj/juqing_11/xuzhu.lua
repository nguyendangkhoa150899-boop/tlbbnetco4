--115001

-- Hß Trúc 115001

-- Script ID
x115001_g_scriptId = 115001

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x115001_g_eventList={200051, 200052}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x115001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_YPT_Y_001}")
	for i, eventId in x115001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x115001_OnDefaultEvent( sceneId, selfId,targetId )
	x115001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x115001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x115001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x115001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x115001_g_eventList do
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
--¾Ü¾ø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x115001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x115001_g_eventList do
		if missionScriptId == findId then
			x115001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x115001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x115001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x115001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x115001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( findId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x115001_OnDie( sceneId, selfId, killerId )
end
