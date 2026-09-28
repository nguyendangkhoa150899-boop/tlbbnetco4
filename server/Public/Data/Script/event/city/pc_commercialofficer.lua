--Thành ph¯ NPC
--ÉÌÒµ¹ÙÔ±

x805017_g_scriptId = 805017
x805017_g_BuildingID12 = 9

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x805017_g_eventList = { 600017 }

-- ÈÎÎñ¼¯ÊÂ¼þ ID ÁÐ±í,ÕâÀàÊÂ¼þ°üº¬×ÓÊÂ¼þ
x805017_g_eventSetList = { 600017 }

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x805017_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	local PlayerName = GetName( sceneId, selfId )

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "    Ta t× trß¾c t¾i nay coi Ðào Chu Công là tôn sß, con ðß¶ng buôn bán, hai huynh ð® ta có th¬ cùng nhau nghiên cÑu" )
			for i, eventId in x805017_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805017_g_scriptId, "C¯ng hiªn ði¬m #GThß½ng Nghi®p", 6, 7413 )
			AddNumText( sceneId, x805017_g_scriptId, "Gi¾i thi®u nhi®m vø th¸ t§p", 11, 1 )
			AddNumText( sceneId, x805017_g_scriptId, "Quän lý vòng thß½ng nghi®p", 6, 3 )
			AddNumText( sceneId, x805017_g_scriptId, "Gi¾i thi®u th¸ phß¶ng", 11, 2 )
			--life Ìí¼ÓCái này ½¨ÖþÎïtoÕ ðµ ÏàÓ¦Éú»î¼¼ÄÜÑ¡Ïî
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805017_g_scriptId,x805017_g_BuildingID12,888)
		else
			AddText( sceneId, "    Không phäi là ngß¶i cüa bang ta, suy nghî cüa h÷ ch¡c ch¡n phäi ð£c bi®t, thß½ng trß¶ng nhß chiªn trß¶ng, ta t¯t nh¤t không nên nhi«u l¶i vçn là h½n" )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x805017_OnDefaultEvent( sceneId, selfId, targetId )
	x805017_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- ÅÐ¶ÏÄ³cáiÊÂ¼þÐúng·ñ¿ÉÒÔÍ¨¹ý´Ë NPC Ö´ÐÐ
--**********************************
function x805017_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805017_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805017_g_eventSetList do
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
function x805017_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805017_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	--life ´¦ÀíCái này ½¨ÖþÎïtoÕ ðµ ÏàÓ¦Éú»î¼¼ÄÜÑ¡Ïî
	elseif eventId ~= x805017_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805017_g_scriptId, x805017_g_BuildingID12 )
		return
	end
	if GetNumText() == 7413 then
		BeginEvent(sceneId)
			AddText( sceneId, "Ngß½i th§t sñ mu¯n dùng ði¬m c¯ng hiªn ð¬ gia tång ðµ Thß½ng Nghi®p cüa bang hµi?" )
			AddNumText( sceneId, x805017_g_scriptId, "Ðúng, ta ðã sÇn sàng!", 6, 74131 )
			AddNumText( sceneId, x805017_g_scriptId, "Hüy...", 6, 74130 )
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
		end
		BeginEvent(sceneId)
			AddText( sceneId, "Ta xin thay m£t m÷i ngß¶i ða tÕ ngß½i." )
			AddText( sceneId, "Ngß½i quä th§t r¤t hào phóng, ðúng là mµt ð¤ng anh tài." )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		CityChangeAttr(sceneId,selfId,GUILD_COM_LEVEL,10)
		CityChangeAttr(sceneId,selfId,GUILD_CONTRIB_POINT,-10)
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
		local PlayerName = GetName(sceneId,selfId)
		local Str = format("@*;SrvMsg;GLD:#{_INFOUSR%s}#Y hªt lòng cho bang hµi, mang 10 ði¬m c¯ng hiªn ðªn ð¬ gia tång #GThß½ng Nghi®p#Y, th§t ðáng ngßÞng mµ!", PlayerName)
		BroadMsgByChatPipe(sceneId,selfId,Str,6)
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Market_Mission_Help}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_JiFang}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 3 then
		BeginEvent(sceneId)
			AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life Ìí¼ÓCái này ½¨ÖþÎïtoÕ ðµ ÏàÓ¦Éú»î¼¼ÄÜÑ¡Ïî
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805017_g_BuildingID12 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x805017_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805017_NotifyFailTips( sceneId, selfId, "Ngß½i hi®n không th¬ nh§n nhi®m vø này" )
		elseif ret == -2 then
			x805017_NotifyFailTips( sceneId, selfId, "Không th¬ tiªp nh§n nhi«u nhi®m vø" )
		end

		return
	end
end

--**********************************
--¾Ü¾ø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x805017_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805017_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x805017_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x805017_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x805017_OnDie( sceneId, selfId, killerId )
end

function x805017_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
