--Thành ph¯ NPC
--¿Æ¼¼¹ÙÔ±

x805015_g_scriptId = 805015
x805015_g_BuildingID9 = 13

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x805015_g_eventList = { 600012 }

-- ÈÎÎñ¼¯ÊÂ¼þ ID ÁÐ±í,ÕâÀàÊÂ¼þ°üº¬×ÓÊÂ¼þ
x805015_g_eventSetList = { 600012 }

--Lînh ÌÌ½ðÃûÌûC¥n toÕ ðµ °ï¹± ði¬mÊý	--add by xindefeng
x805015_g_MingTieNeedBangGong = 50
--ÌÌ½ðÃûÌûID	--add by xindefeng
x805015_g_TangJinMingTieID = 30505205
--Ã¿´Î¿ÉÒÔLînh ÌÌ½ðÃûÌûÊýÁ¿
x805015_g_TangJinMingTieCount = 1

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x805015_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	
	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "    HÑng thú cüa Mãn Thành, ð«u t§p trung vào kÛ ngh® uyên thâm, chúng ta là huynh ð® cùng bang, có gì c¥n ta giúp, mau nói ði." )
			for i, eventId in x805015_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805015_g_scriptId, "C¯ng hiªn ði¬m #GKhoa H÷c", 6, 7413 )
			AddNumText( sceneId, x805015_g_scriptId, "Gi¾i thi®u nhi®m vø khoa h÷c kÛ thu§t", 11, 1 )
			--AddNumText( sceneId, x805015_g_scriptId, "SØa chæa danh xßng bang hµi", 6, 3 )	--Íõmµt ´¨ÒªÇó¸Éµô--del by xindefeng
			AddNumText( sceneId, x805015_g_scriptId, "Nghiên cÑu thß½ng ph¦m m¾i", 6, 4 )
			AddNumText( sceneId, x805015_g_scriptId, "Ðúc tßþng thành th¸", 6, 5 )
			AddNumText( sceneId, x805015_g_scriptId, "Sáng chª bang huy cho bang hµi", 6, 6 )
			AddNumText( sceneId, x805015_g_scriptId, "Gi¾i thi®u thß phòng", 11, 2 )
			AddNumText( sceneId, x805015_g_scriptId, "Lînh Nång Kim danh thiªp", 6, 20 )	--add by xindefeng
			AddNumText( sceneId, x805015_g_scriptId, "V« lînh bang hµi tñ ðính danh hi®u", 11, 22 )	--add by xindefeng
		
			--life Ìí¼ÓCái này ½¨ÖþÎïtoÕ ðµ ÏàÓ¦Éú»î¼¼ÄÜÑ¡Ïî
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805015_g_scriptId,x805015_g_BuildingID9,888)
		else
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = " cô nß½ng "
			elseif PlayerGender == 1 then
				rank = "Tiên sinh"
			else
				rank = "Xin höi"
			end

			AddText( sceneId, "    A!" .. rank .. "Không gi¯ng nhß ngß¶i trong b±n bang, ti¬u sinh không ti®n nói nhi«u cái ðó." )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x805015_OnDefaultEvent( sceneId, selfId, targetId )
	x805015_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- ÅÐ¶ÏÄ³cáiÊÂ¼þÐúng·ñ¿ÉÒÔÍ¨¹ý´Ë NPC Ö´ÐÐ
--**********************************
function x805015_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805015_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805015_g_eventSetList do
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
function x805015_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805015_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	--life ´¦ÀíCái này ½¨ÖþÎïtoÕ ðµ ÏàÓ¦Éú»î¼¼ÄÜÑ¡Ïî
	elseif eventId ~= x805015_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805015_g_scriptId, x805015_g_BuildingID9 )
		return
	end
	if GetNumText() == 7413 then
		BeginEvent(sceneId)
			AddText( sceneId, "Ngß½i th§t sñ mu¯n dùng ði¬m c¯ng hiªn ð¬ gia tång ðµ Khoa H÷c cüa bang hµi?" )
			AddNumText( sceneId, x805015_g_scriptId, "Ðúng, ta ðã sÇn sàng!", 6, 74131 )
			AddNumText( sceneId, x805015_g_scriptId, "Hüy...", 6, 74130 )
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
		CityChangeAttr(sceneId,selfId,GUILD_TECH_LEVEL,10)
		CityChangeAttr(sceneId,selfId,GUILD_CONTRIB_POINT,-10)
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
		local PlayerName = GetName(sceneId,selfId)
		local Str = format("@*;SrvMsg;GLD:#{_INFOUSR%s}#Y hªt lòng cho bang hµi, mang 10 ði¬m c¯ng hiªn ðªn ð¬ gia tång #GKhoa H÷c#Y, th§t ðáng ngßÞng mµ!", PlayerName)
		BroadMsgByChatPipe(sceneId,selfId,Str,6)
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Tec_Mission_Help}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_ShuFang}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	--elseif GetNumText() == 3 then--Íõmµt ´¨ÒªÇó¸Éµô--del by xindefeng
	--	BeginEvent(sceneId)
	--	AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )		
	--	EndEvent(sceneId)
	--	DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
		AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 5 then
		BeginEvent(sceneId)
		AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 6 then
		BeginEvent(sceneId)
		AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 20 then																--Lînh ÌÌ½ðÃûÌû	--add by xindefeng
		-- ¼ÓÈëÈ·ÈÏÒ³Ãæ			add by WTT
		BeginEvent(sceneId)
			-- Lînh ÌÌ½ðÃûÌûC¥n ÏûºÄ50 ði¬m°ï»á¹±Ï×¶È.ÄãXác nh§nÒªLînh Âð?
			AddText( sceneId, "#{TJMT_090213_01}" )
			--Xác nh§n¶mµt »°´Å¥
			AddNumText(sceneId, x805015_g_scriptId, "Ðúng, ta xác nh§n", 6, 201)				
			--Tr· v«ÉÏmµt Ò³°´Å¥
			AddNumText(sceneId, x805015_g_scriptId, "Không, t× bö", 6, 202)		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 201 then																-- È·ÈÏLînh ÌÌ½ðÃûÌû		add by WTT
		x805015_GetTangJinMinTie(sceneId, selfId, targetId)

	elseif GetNumText() == 202 then																-- ·ÅÆúLînh ÌÌ½ðÃûÌû		add by WTT
		BeginEvent( sceneId )
			x805015_OnDefaultEvent( sceneId, selfId, targetId )				-- Tr· v«ÉÏmµt Ò³
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 22 then	--¹ØÓÚLînh °ï»á×Ô¶¨Òå³ÆºÅ	--add by xindefeng
		BeginEvent(sceneId)
			AddText( sceneId, "#{TangJinMingTie_Help}")
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life Ìí¼ÓCái này ½¨ÖþÎïtoÕ ðµ ÏàÓ¦Éú»î¼¼ÄÜÑ¡Ïî
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805015_g_BuildingID9 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x805015_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805015_NotifyFailTips( sceneId, selfId, "Ngß½i hi®n không th¬ nh§n nhi®m vø này" )
		elseif ret == -2 then
			x805015_NotifyFailTips( sceneId, selfId, "Không th¬ tiªp nh§n nhi«u nhi®m vø" )
		end

		return
	end
end

--**********************************
--¾Ü¾ø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x805015_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805015_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x805015_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x805015_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x805015_OnDie( sceneId, selfId, killerId )
end

function x805015_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--Lînh ÌÌ½ðÃûÌû	--add by xindefeng
--**********************************
function x805015_GetTangJinMinTie(sceneId, selfId, targetId)
	--¼ì²â°ï¹±
	local szMsg = nil
	local nBangGongPoint = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT)	--»ñÈ¡°ï¹±ÊýÁ¿
  if nBangGongPoint < x805015_g_MingTieNeedBangGong then
  	szMsg = format("    Ði¬m c¯ng hiªn không ðü #G%d#W. Không th¬ ð±i ðßþc danh hi®u này.", x805015_g_MingTieNeedBangGong)
  	x805015_NotifyFailTips( sceneId, selfId, szMsg)
  	return
  end
  	
  --¼ì²â±³°üÐúng·ñÓÐµØ·½
	if (LuaFnGetPropertyBagSpace( sceneId, selfId ) < x805015_g_TangJinMingTieCount) then
		--ÐÑÄ¿ÌáÊ¾"¿Õ¼ä²»×ã"
		x805015_NotifyFailTips(sceneId, selfId, "#{YRJ_BagFullTip}")
		return
	end	
	
	--Ìõ¼þÍ¨¹ý
	
	--É¾³ý°ï¹±
  local ret = CityChangeAttr(sceneId, selfId, 6, -x805015_g_MingTieNeedBangGong)
	if not ret or ret ~= 1 then		
		x805015_NotifyFailTips(sceneId, selfId, "    Không th¬ kh¤u tr× Bang c¯ng!")	--ÐÑÄ¿ÌáÊ¾"ÎÞ·¨É¾³ý°ï¹±"
		return
	end
	
	--·¢·Åmµt cái"ÌÌ½ðÃûÌû"
	BeginAddItem(sceneId)
		AddItem(sceneId, x805015_g_TangJinMingTieID, x805015_g_TangJinMingTieCount)
	EndAddItem(sceneId, selfId)
	AddItemListToHuman(sceneId, selfId)--¼ÓÎïÆ·¸øÍæ¼Ò
	
	--ÍêÊÂÁË,ÐÂ½çÃæ:ÄúÊÕºÃ:)
	BeginEvent( sceneId )
		AddText( sceneId, "    Ðây là #GThi®p vàng#W, c¥m l¤y và sØ døng t¯t!" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
