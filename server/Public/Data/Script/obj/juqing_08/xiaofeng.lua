--120001

-- ²ÔÃ£É½,Tiêu Phong

-- Script ID
x120001_g_scriptId = 120001

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x120001_g_eventList={200035, 200036}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x120001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_CMS_B_001}")
	
	-- Èç¹ûCái này Íæ¼ÒÍê³ÉÁË¡°ËÄÃæ³þ¸è,¡±
  if IsMissionHaveDone(sceneId,selfId,31) > 0 then
		AddNumText(sceneId,x120001_g_scriptId,"Kim Qua Ðãng Kh¤u Ngao Binh",10,123);
	end
	
	for i, eventId in x120001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x120001_OnDefaultEvent( sceneId, selfId,targetId )
	x120001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x120001_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 123   then
		-- M· ra ¾çÇé
		if LuaFnGetCopySceneData_Param(sceneId, 8) < 3  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 3)
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		end
		-- ¹Ø±ÕUI
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
		
	end

	for i, findId in x120001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x120001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--¾Ü¾ø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x120001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			x120001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x120001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x120001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x120001_OnDie( sceneId, selfId, killerId )
end
