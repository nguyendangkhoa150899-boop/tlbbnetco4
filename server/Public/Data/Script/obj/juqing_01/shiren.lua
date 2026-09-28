--Íò½Ù¹ÈÊ¯¸Òµ±

-- Script ID
x119003_g_scriptId = 119003

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x119003_g_eventList={200004, 200003}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x119003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		--´Ó3¾ä»°ÖÐËæ»úÑ¡Ôñ1¾ä
		local rand = random( 3 )
		if rand == 1  then
			AddText(sceneId,"#{JQ_WJG_Y_003}")
		
		elseif rand == 2   then
			AddText(sceneId,"#{JQ_WJG_Y_004}")
		
		elseif rand == 3   then
			AddText(sceneId,"#{JQ_WJG_Y_005}")
		
		end
	for i, eventId in x119003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x119003_OnDefaultEvent( sceneId, selfId,targetId )
	x119003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x119003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x119003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x119003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId)
			end
			return
		end
	end
end

--**********************************
--¾Ü¾ø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x119003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x119003_g_eventList do
		if missionScriptId == findId then
			x119003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x119003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	
	for i, findId in x119003_g_eventList do
		if 200003 == findId then
			CallScriptFunction( 200003, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x119003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x119003_g_eventList do
		if 200003 == findId then
			CallScriptFunction( 200003, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x119003_OnDie( sceneId, selfId, killerId )
end
