--ÖÓLinh

-- Script ID
x119002_g_scriptId = 119002

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x119002_g_eventList={200003, 200081}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x119002_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		-- ¸ù¾ÝÈÎÎñtoÕ ðµ Íê³ÉÇé¿ö,»ØÓÐ²»Í¬toÕ ðµ ¶Ô°×
		if IsMissionHaveDone(sceneId,selfId,3) == 1 then
			AddText(sceneId,"#{JQ_WJG_Y_007}")
		else
			AddText(sceneId,"#{JQ_WJG_Y_006}")
		end
		
		for i, eventId in x119002_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x119002_OnDefaultEvent( sceneId, selfId,targetId )
	x119002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x119002_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x119002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x119002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119002_g_eventList do
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
--¾Ü¾ø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x119002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x119002_g_eventList do
		if missionScriptId == findId then
			x119002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x119002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x119002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x119002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x119002_OnDie( sceneId, selfId, killerId )
end
