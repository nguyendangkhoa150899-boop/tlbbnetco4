-- 002096
-- ÄÂµº

--½Å±¾ºÅ
x002096_g_scriptId = 002096

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x002096_g_eventList={002939}



--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x002096_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Các hÕ mu¯n ð±i bäo v§t cüa ta ß? Các hÕ phäi chu¦n b¸ 1 túi #YTrân Thú Huy­n Hoá Ðan toái phiªn#W.");
		for i, eventId in x002096_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x002096_OnDefaultEvent( sceneId, selfId,targetId )
	x002096_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x002096_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002096_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x002096_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002096_g_eventList do
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
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x002096_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x002096_g_eventList do
		if missionScriptId == findId then
			x002096_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x002096_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002096_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x002096_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x002096_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x002096_OnDie( sceneId, selfId, killerId )
end

