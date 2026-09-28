--Íò½Ù¹È»ªºÍôÞ

-- Script ID
x118012_g_scriptId = 118012

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x118012_g_eventList={}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x118012_UpdateEventList( sceneId, selfId,targetId )
	
	--PrintStr("ddd")

	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_WJG_B_001}")
		AddNumText(sceneId, x118012_g_scriptId,"Ðßa ta ra cØa",9,-1);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x118012_OnDefaultEvent( sceneId, selfId,targetId )
	x118012_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x118012_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, sceneId,109,115)
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x118012_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118012_g_eventList do
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
function x118012_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x118012_g_eventList do
		if missionScriptId == findId then
			x118012_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x118012_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x118012_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x118012_OnDie( sceneId, selfId, killerId )
end
