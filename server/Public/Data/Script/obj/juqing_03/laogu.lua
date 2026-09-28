--ÀÏ¹Ë

-- Script ID
x114004_g_scriptId = 114004

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x114004_g_eventList={}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x114004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{JQ_YZW_Y_004}")
		AddNumText(sceneId, x114004_g_scriptId,"Ðßa ta t¾i Tô Châu",9,1);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x114004_OnDefaultEvent( sceneId, selfId,targetId )
	x114004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x114004_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1, 83, 268)
	end
	
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x114004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x114004_g_eventList do
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
function x114004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x114004_g_eventList do
		if missionScriptId == findId then
			x114004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x114004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x114004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x114004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x114004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x114004_OnDie( sceneId, selfId, killerId )
end
