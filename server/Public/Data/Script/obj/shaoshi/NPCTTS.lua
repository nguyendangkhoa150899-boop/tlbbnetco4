--Ì«ºþ Àî¸Ù

--½Å±¾ºÅ
x002952_g_scriptId = 002952

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x002952_g_eventList={890063}	--210400, 210401, 210402, 210403, 210404 890063 --890063--890110,,

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x002952_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		local IsDone471 = IsMissionHaveDone(sceneId,selfId,471)	
		AddText( sceneId, " Cái Bang phát Thi®p Anh Hùng, m¶i các hào ki®t võ lâm Trung Nguyên t« tñu · Thiªu Lâm, Toàn Quán Thanh dñ ð¸nh lþi døng c½ hµi l¥n này khiªn cho Cái Bang gây áp lñc cho  Thiªu Lâm ð¬ tr· thành Võ Lâm Ð® Nh¤t, n¡m trong tay cä võ lâm Trung Nguyên;" )	
		AddText( sceneId, "không nhß mong mu¯n, sñ xu¤t hi®n cüa Tiêu Phong, ðã khiªn cho chuy®n này có biªn chuy¬n, · trên Thiªu Th¤t S½n" )	
		AddNumText( sceneId, x002952_g_scriptId, "#GPhø bän ðang Bäo trì...", 8, 0 )	
		AddNumText( sceneId, x002952_g_scriptId, "V« Thiªu Th¤t S½n",11 ,2  )
	    AddNumText( sceneId, x002952_g_scriptId, "ta chï ði ngang qua thôi",0 ,9  )
		for i, eventId in x002952_g_eventList do
		--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x002952_OnDefaultEvent( sceneId, selfId,targetId )
	x002952_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x002952_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 2 then
	BeginEvent(sceneId)
	    AddText(sceneId,"#{CJG_101231_222}")
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
	if GetNumText() == 9 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	end
	for i, findId in x002952_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x002952_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002952_g_eventList do
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
function x002952_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x002952_g_eventList do
		if missionScriptId == findId then
			x002952_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x002952_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002952_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x002952_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002952_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********