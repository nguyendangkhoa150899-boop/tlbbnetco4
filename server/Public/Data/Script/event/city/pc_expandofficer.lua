--Thành ph¯ NPC
--Ð£³¡

x805013_g_scriptId = 805013
x805013_g_BuildingID7 = 15

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x805013_g_eventList = {600046, 600023}-- zchw add 600046 °ïÅÉÊÕ¼¯

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í2 Îª°ïÅÉÊÕ¼¯ÌØÉè zchw 
x805013_g_eventList2 = {600047, 600048, 600049}

-- ÈÎÎñ¼¯ÊÂ¼þ ID ÁÐ±í,ÕâÀàÊÂ¼þ°üº¬×ÓÊÂ¼þ
x805013_g_eventSetList = { 600023 } 

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x805013_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "    Ð¸a v¸ và danh tiªng cüa bang ta trên giang h° do ta ðäm nhi®m, có ý kiªn gì hay cÑ nêu ra." )
			for i, eventId in x805013_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805013_g_scriptId, "C¯ng hiªn ði¬m #GKhuªch Trß½ng", 6, 7413 )
			AddNumText( sceneId, x805013_g_scriptId, "V« nhi®m vø khuªch trß½ng", 11, 1 )
			AddNumText( sceneId, x805013_g_scriptId, "Gi¾i thi®u v« trß¶ng", 11, 2 )
			AddNumText( sceneId, x805013_g_scriptId, "Phß½ng pháp chª tÕo công trình", 7, 3 )
			AddNumText( sceneId, x805013_g_scriptId, "TÕo ðÕi c¶ cho bang hµi", 6, 4 )
			AddNumText( sceneId, x805013_g_scriptId, "Tu luy®n phòng ngñ", 6, 5 )
			AddNumText( sceneId, x805013_g_scriptId, "Xây dñng tháp kiªm cao c¤p", 6, 6 )
		else
			AddText( sceneId, "    Ðây là ð¸a ði¬m quan tr÷ng cüa trß¶ng, tr× ð® tØ b±n bang, không ai ðßþc xem trµm · ðây" )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x805013_OnDefaultEvent( sceneId, selfId, targetId )
	x805013_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- ÅÐ¶ÏÄ³cáiÊÂ¼þÐúng·ñ¿ÉÒÔÍ¨¹ý´Ë NPC Ö´ÐÐ
--**********************************
function x805013_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805013_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805013_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐmµt Ïî
--**********************************
function x805013_OnEventRequest( sceneId, selfId, targetId, eventId )

	if x805013_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end
	if GetNumText() == 7413 then
		BeginEvent(sceneId)
			AddText( sceneId, "Ngß½i th§t sñ mu¯n dùng ði¬m c¯ng hiªn ð¬ gia tång ðµ Khuªch Trß½ng cüa bang hµi?" )
			AddNumText( sceneId, x805013_g_scriptId, "Ðúng, ta ðã sÇn sàng!", 6, 74131 )
			AddNumText( sceneId, x805013_g_scriptId, "Hüy...", 6, 74130 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
	if GetNumText() == 74130 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
	if GetNumText() == 74131 then
		if CityGetAttr(sceneId, selfId, 6) <= 9 then
			BeginEvent(sceneId)
				AddText( sceneId, "Ði¬m c¯ng hiªn cüa ngß½i vçn chßa ðü 10, hãy mau ðóng góp thêm cho bang hµi." )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
			BeginEvent(sceneId)
				AddText( sceneId, "Ta xin thay m£t m÷i ngß¶i ða tÕ ngß½i." )
				AddText( sceneId, "Ngß½i quä th§t r¤t hào phóng, ðúng là mµt ð¤ng anh tài." )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			CityChangeAttr(sceneId,selfId,GUILD_CONTRIB_POINT,-10)
			CityChangeAttr(sceneId,selfId,GUILD_AMBI_LEVEL,10)
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
			local PlayerName = GetName(sceneId,selfId)
			local Str = format("@*;SrvMsg;GLD:#{_INFOUSR%s}#Y hªt lòng cho bang hµi, mang 10 ði¬m c¯ng hiªn ðªn ð¬ gia tång #GKhuªch Trß½ng#Y, th§t ðáng ngßÞng mµ!", PlayerName)
			BroadMsgByChatPipe(sceneId,selfId,Str,6)
		end
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Expand_Mission_Help}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_JiaoChang}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 3 then
		BeginEvent(sceneId)
		AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
		AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 5 then
		BeginEvent(sceneId)
		AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 6 then
		BeginEvent(sceneId)
		AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x805013_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, eventId in x805013_g_eventList2 do
		if missionScriptId == eventId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			return
		end
	end
	if x805013_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805013_NotifyFailTips( sceneId, selfId, "Ngß½i hi®n không th¬ nh§n nhi®m vø này" )
		elseif ret == -2 then
			x805013_NotifyFailTips( sceneId, selfId, "Không th¬ tiªp nh§n nhi«u nhi®m vø" )
		end

		return
	end
end

--**********************************
--¾Ü¾ø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x805013_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805013_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805013_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x805013_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805013_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x805013_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, eventId in x805013_g_eventList2 do
		if missionScriptId == eventId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		end
	end
	
	if x805013_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x805013_OnDie( sceneId, selfId, killerId )
end

function x805013_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
