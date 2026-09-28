--Õäçç¸±±¾ÈÎÎñnpc

--½Å±¾ºÅ
x402001_g_scriptId = 402001


--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x402001_g_eventList={401001}

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x402001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	
		AddNumText( sceneId, x402001_g_scriptId, "Gi¾i thi®u thª c¶", 11, 10 )
		AddNumText( sceneId, x402001_g_scriptId, "R¶i khöi phòng nghï", 9, 11 )
		AddNumText( sceneId, x402001_g_scriptId, "Làm sao nh§n nhi«u kinh nghi®m trong KÏ Cuµc", 11, 512 )

		for i, findId in x402001_g_eventList do
			CallScriptFunction( x402001_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x402001_OnDefaultEvent( sceneId, selfId,targetId )
	x402001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x402001_OnEventRequest( sceneId, selfId, targetId, eventId )

	local Numtext = GetNumText()

	if Numtext == 10 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_063}" )	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif Numtext == 11 then
		BeginEvent(sceneId)	
			AddText( sceneId, "  Nªu nhß ðµi viên cüa các hÕ ð«u trong phòng nghï mà các hÕ ð½n thân r¶i khöi, h÷ s¨ vì lý lo này không th¬ tiªn vào KÏ Cuµc. Các hÕ mu¯n r¶i khöi không?" )
			AddNumText( sceneId, x402001_g_scriptId, "Duy®t", 8, 12 )
			AddNumText( sceneId, x402001_g_scriptId, "HuÖ", 8, 13 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif Numtext == 12 then
		if sceneId == 518 then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1,175,145)
		elseif sceneId == 193 then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,275,95)
		elseif sceneId == 418 or sceneId == 419 then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0,268,87)
		end
		return
	elseif Numtext == 13 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	elseif Numtext == 512 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{QJ_20080522_03}" )	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	for i, findId in x402001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x402001_OnDie( sceneId, selfId, killerId )
end
