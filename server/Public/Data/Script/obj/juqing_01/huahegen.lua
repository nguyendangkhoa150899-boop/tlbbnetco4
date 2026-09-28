--Íò½Ù¹È»ªºÍôÞ

-- Script ID
x119005_g_scriptId = 119005

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x119005_g_eventList={}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x119005_UpdateEventList( sceneId, selfId,targetId )
	
	--PrintStr("ddd")

	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_WJG_Y_001}")
		AddNumText(sceneId, x119005_g_scriptId,"Ðßa ta ra cØa",9,-1);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x119005_OnDefaultEvent( sceneId, selfId,targetId )
	x119005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x119005_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, sceneId,109,115)
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x119005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119005_g_eventList do
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
function x119005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x119005_g_eventList do
		if missionScriptId == findId then
			x119005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x119005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x119005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x119005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x119005_OnDie( sceneId, selfId, killerId )
end
