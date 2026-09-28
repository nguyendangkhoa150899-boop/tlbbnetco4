--±£»¤°ïÅÉ×¤µØ
--ÆÕÍ¨

--½Å±¾ºÅ
x805043_g_ScriptId	= 805043

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x805043_g_EventList	= { 805042 }


--½ÓÈ¡ÈÎÎñtoÕ ðµ ×îµÍµÈc¤p
x805043_g_minLevel			= 20

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x805043_UpdateEventList( sceneId, selfId, targetId )

		CallScriptFunction( x805043_g_EventList[1], "OnEnumerate", sceneId, selfId, targetId )
	
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x805043_OnDefaultEvent( sceneId, selfId, targetId )
	x805043_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐmµt Ïî
--**********************************
function x805043_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x805043_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x805043_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x805043_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--¾Ü¾ø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x805043_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--¾Ü¾øÖ®ºó,ÒªTr· v«NPCtoÕ ðµ ÊÂ¼þÁÐ±í
	for i, findId in x805043_g_EventList do
		if missionScriptId == findId then
			x805043_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x805043_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x805043_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x805043_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x805043_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x805043_OnDie( sceneId, selfId, killerId )
end
