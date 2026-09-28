-- 899994
-- ¸ßÌ«¹« ·ËÕ¯´«ËÍÈË

--kich ban goc hao
x899994_g_scriptId = 899994

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x899994_g_eventList={893063}--893063

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x899994_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{SJZ_100129_02}")
     --  AddText(sceneId,"#G#b phø bän chßa m·")
	AddNumText( sceneId, x899994_g_scriptId, "V« tÑ tuy®t trang",11 ,2  )
	AddNumText( sceneId, x899994_g_scriptId, "ta chï ði ngang qua thôi",0 ,9  )
	AddNumText( sceneId, x899994_g_scriptId, "#GPhø bän ðang Bäo trì...", 8, 0 )
	for i, eventId in x899994_g_eventList do
	--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Su kien lan nhau cua vao
--**********************************
function x899994_OnDefaultEvent( sceneId, selfId,targetId )
	x899994_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--Su kien liet biet lua chon hang nhat
--**********************************
function x899994_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 9 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	end	
	if GetNumText() == 2 then
	BeginEvent(sceneId)
	    AddText(sceneId,"''C¥m - kÏ - Thi - H÷a''... b¯n v¸ ðß¶ng chü cüa#G TÑ Tuy®t Trang#W n±i danh giang h° v¾i nhûng chiêu thÑc nghe tên ßu nhã mà ¦n tàng sát thß½ng cñc l¾n, nªt không có bän lînh võ công thâm h§u thì không cách nào ch¯ng ðÞ n±i!")
	    AddText(sceneId,"#r Ngß¶i ch½i#G C¤p 80#W tr· lên có th¬ tham gia!")
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
		return
	end
	local key = GetNumText()
	if key == 0 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
	for i, findId in x899994_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x899994_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x899994_g_eventList do
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
function x899994_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x899994_g_eventList do
		if missionScriptId == findId then
			x899994_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x899994_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x899994_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x899994_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x899994_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x899994_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- ¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x899994_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
