--Íõ cô nß½ng 

-- Script ID
x037002_g_ScriptId = 037002

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x037002_g_eventList={200015, 200016, 200085}

--**********************************
-- Danh sách sñ ki®n
--**********************************
function x037002_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_YZW_B_002}")
	for i, eventId in x037002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	--Èç¹ûÍê¼ÒÒÑ¾­Íê³ÉÁË Ö¸ ði¬mÈººÀÏ· 14,ÄÇÃ´¶àmµt cáiÑ¡Ïî
	if IsMissionHaveDone( sceneId, selfId, 14 ) > 0 then  --Íê¼ÒÈç¹ûÓÐCái này ÈÎÎñ
		if LuaFnGetCopySceneData_Param(sceneId, 10) == 0  then
			AddNumText( sceneId, x037002_g_ScriptId, "Chï Ði¬m Qu¥n Hào", 10, 999 )
		end
	end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x037002_OnDefaultEvent( sceneId, selfId,targetId )
	x037002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- Danh sách sñ ki®nÑ¡ÖÐmµt Ïî
--**********************************
function x037002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 999  then
		--¿ªÊ¼ ði¬mÃû
		LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		LuaFnSetCopySceneData_Param(sceneId, 11, GetGameTime(sceneId, selfId))
		LuaFnSetCopySceneData_Param(sceneId, 12, GetGameTime(sceneId, selfId))
		
		-- ði¬mÃûmµt µ©¿ªÊ¼,¾Í²»ÄÜÔÙÀ´mµt ´ÎÁË
		LuaFnSetCopySceneData_Param(sceneId, 25, 1)
		
		--¹Ø±Õ¿Í»§¶Ë½çÃæ
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,1000)

		return
	end
	
	for i, findId in x037002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x037002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x037002_g_eventList do
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
function x037002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			x037002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x037002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x037002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- On Die Event
--**********************************
function x037002_OnDie( sceneId, selfId, killerId )
end
