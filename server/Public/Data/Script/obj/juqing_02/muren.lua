--Íò½Ù¹ÈÄ¾ÈËÊØÎÀ

-- Script ID
x118001_g_scriptId = 118001

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x118001_g_eventList={}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x118001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_WJG_B_002}")
		AddNumText(sceneId, x118001_g_scriptId,"Ðßa ta vào trong",9,0);
		AddNumText(sceneId, x118001_g_scriptId,"Ðßa ta t¾i ÐÕi Lý",9,1);

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x118001_OnDefaultEvent( sceneId, selfId,targetId )
	x118001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x118001_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, sceneId,104,77)
	elseif GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,74,53)
	end
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x118001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118001_g_eventList do
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
function x118001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x118001_g_eventList do
		if missionScriptId == findId then
			x118001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x118001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x118001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x118001_OnDie( sceneId, selfId, killerId )
end
