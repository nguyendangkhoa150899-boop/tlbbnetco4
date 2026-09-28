--Ëï°ËÒ¯

--½Å±¾ºÅ
x002032_g_scriptId = 002032


x002032_g_DuanWuJieDay	= {start = 20090528, stop1 = 20090604, level = 30}
--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x002032_g_eventList={210210,210211,210212,210246,808130,808124,889050}--del 889050,889061 ÇØ»ÊÕ½Éñ»î¶¯

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x002032_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " Cô Nß½ng"
	else
		PlayerSex = " Thiªu Hi®p"
	end
	AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0014}")
	for i, eventId in x002032_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	x002032_Help_Duanwujie( sceneId, selfId, targetId )--¶ËÎç½Ú»î¶¯£¬ÒÔºóÈ¥µô	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x002032_OnDefaultEvent( sceneId, selfId,targetId )
	x002032_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x002032_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002032_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	x002032_SubHelp_Duanwujie( sceneId, selfId, targetId )--¶ËÎç½Ú»î¶¯£¬ÒÔºóÈ¥µô	
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x002032_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002032_g_eventList do
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
function x002032_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			x002032_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x002032_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x002032_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x002032_OnDie( sceneId, selfId, killerId )
end
--¶ËÎç½Ú»î¶¯µÄ°ïÖú£¨»î¶¯¹ýºóÓ¦È¥µô£©
--**********************************
function x002032_Help_Duanwujie( sceneId, selfId, targetId )
	local curDayTime = GetTime2Day()
	if curDayTime >= x002032_g_DuanWuJieDay.start and curDayTime <= x002032_g_DuanWuJieDay.stop1 then
			AddNumText(sceneId, x002032_g_scriptId, "#{DWJ_090511_02}", 11, 5500)										
	end
end

--**********************************
--¶ËÎç½Ú»î¶¯×Ó»î¶¯µÄ°ïÖú£¨»î¶¯¹ýºóÓ¦È¥µô£©
--**********************************
function x002032_SubHelp_Duanwujie( sceneId, selfId, targetId )
	local numText = GetNumText();
	
	if numText == 5500 then
	 	BeginEvent(sceneId)
			AddText(sceneId, "#{DWJ_090511_03}")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
	end
end
