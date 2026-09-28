--Ñà×ÓÎë ËÎ±ø Ã»ÓÐÊ²Ã´Êµ¼Ê¹¦ÄÜ

--½Å±¾ºÅ
x402262_g_scriptId = 402262

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x402262_g_eventList={}	

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x402262_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local nRand = random(4)
		local str = ""
		if nRand == 1  then
			str = "  Nghe nói l¥n này phän t£c m¶i t¾i tÑ ðÕi ác nhân ðªn ám sát Hô Diên Báo tß¾ng quân!"
		elseif nRand == 2 then
			str = "  Hô Diên Báo tß¾ng quân ðang g£p nguy hi¬m, m¶i các ngß½i chÕy nhanh ðªn kÏ hÕm ð¬ bäo v® h¡n!"
		elseif nRand == 3 then
			str = "  Hô Diên Báo tß¾ng quân là h± tß¾ng hiªm có cüa ÐÕi T¯ng, am hi¬m thüy chiªn, có h¡n · ðây ÐÕi T¯ng thüy quân s¨ t¤t th¡ng!"
		else
			str = "  Nªu ta có kinh công nh¤t ð¸nh cûng s¨ bay lên lá sen tiªn ðªn kÏ hÕm bäo v« Hô Diên Báo tß¾ng quân!"
		end
		
		AddText(sceneId, str)		    				
		for i, eventId in x402262_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x402262_OnDefaultEvent( sceneId, selfId,targetId )
	x402262_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x402262_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x402262_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x402262_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402262_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x402262_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x402262_g_eventList do
		if missionScriptId == findId then
			x402262_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x402262_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402262_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x402262_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402262_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x402262_OnDie( sceneId, selfId, killerId )

end

