--038004

-- °ü²»Í¬ 038004

-- Script ID
x038004_g_scriptId = 038004

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x038004_g_eventList={}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x038004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_YPT_B_005}")
	AddNumText(sceneId, x038004_g_scriptId,"R¶i bö n½i này",9,999);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x038004_OnDefaultEvent( sceneId, selfId,targetId )
	x038004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x038004_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==999	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0,115,66)
	end
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x038004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x038004_g_eventList do
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
function x038004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x038004_g_eventList do
		if missionScriptId == findId then
			x038004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x038004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x038004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x038004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x038004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x038004_OnDie( sceneId, selfId, killerId )
end
