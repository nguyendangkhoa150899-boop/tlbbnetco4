-- ³ÇÊÐÄÚÕþÖ®½¨ÉèÈÎÎñÖ÷ÊÂ¼þ½Å±¾
-- ½Å±¾ºÅ
x600035_g_ScriptId = 600035

-- ÈÎÎñºÅ
x600035_g_MissionId = 1111

-- ÈÎÎñÄ¿±ênpc
x600035_g_Name = "Tr¸nh Vô Danh"

-- ÈÎÎñÎÄ±¾ÃèÊö
x600035_g_MissionName = "Xây dñng nhi®m vø"
x600035_g_MissionInfo = "Nµi chính thành th¸ - Nhi®m vø xây dñng"			--ÈÎÎñÃèÊö
x600035_g_NoMissionInfo = "    Trong bang hình nhß không có xây dñng cái gì. "	--²»ÔÚ½¨ÉèÊ±ÌáÊ¾
x600035_g_MissionTarget = "Hoàn thành nhi®m vø bang hµi ÐÕi Chü Quän"		--ÈÎÎñÄ¿±ê
x600035_g_ContinueInfo = "    Nhi®m vø cüa các hÕ vçn chßa hoàn thành à?"	--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x600035_g_MissionComplete = "Cám ½n các hÕ nhi«u"				--Íê³ÉÈÎÎñnpcËµµÄ»°

x600035_g_MissionParam_SubId = 1

-- Í¨ÓÃ³ÇÊÐÈÎÎñ½Å±¾
x600035_g_CityMissionScript = 600001

-- ×ÓÈÎÎñ±í
x600035_g_SubMissionScriptList = { 600036, 600038, 600039 }

-- ÈÎÎñ½±Àø
x600035_g_ItemAwardIndexOffset = 29						-- ÎïÆ·½±ÀøËùÔÚ±í¸ñÖÐµÄÁÐÆ«ÒÆ
x600035_g_MissionRound = MD_CITY_CONSTRUCT_ROUND		-- ³ÇÊÐÄÚÕþ½¨ÉèÈÎÎñ
x600035_g_MissionAbandonTime = MD_CITY_CONSTRUCT_TIME	-- ³ÇÊÐÄÚÕþ½¨ÉèÈÎÎñ·ÅÆúÈÎÎñµÄÊ±¼ä
x600035_g_ContribType = GUILD_CONTRIB_POINT				-- °ï»á¹±Ï×¶È
x600035_g_CityProcess = 0								-- 0:½¨Éè£¬1:ÑÐ¾¿

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x600035_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾
	if GetName( sceneId, targetId ) ~= x600035_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if CityInBuildingLevelUp( sceneId, selfId, sceneId ) ~= 1 then
		x600035_NotifyFailBox( sceneId, selfId, targetId, x600035_g_NoMissionInfo )
		return
	end

	local rand = random( getn(x600035_g_SubMissionScriptList) )
	CallScriptFunction( x600035_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600035_g_MissionId, x600035_g_SubMissionScriptList[rand] )
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x600035_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600035_g_Name then								--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	--Èç¹ûÒÑ½ÓÈÎÎñ»òÂú×ãÈÎÎñ½ÓÊÕÌõ¼þ,ÔòÁÐ³öÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600035_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600035_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600035_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600035_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600035_g_ScriptId, x600035_g_MissionName,4,-1 )
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ£¬Ò²¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x600035_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600035_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600035_g_MissionId, x600035_g_MissionAbandonTime )
	return ret
end

--**********************************
--½ÓÊÜ£¬½ö¹©×ÓÈÎÎñµ÷ÓÃÉèÖÃ¹«¹²²ÎÊý
--**********************************
function x600035_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600035_g_Name then								--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	CallScriptFunction( x600035_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600035_g_MissionId, x600035_g_MissionRound )
end

--**********************************
--·ÅÆú£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x600035_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600035_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600035_g_MissionId, x600035_g_MissionAbandonTime, x600035_g_MissionRound )
end

--**********************************
--¼ÌÐø
--**********************************
function x600035_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x600035_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600035_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600035_g_MissionId )
	return ret
end

--**********************************
--Ìá½»£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x600035_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600035_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600035_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600035_g_MissionId, x600035_g_MissionRound )

		-- Éý¼¶½¨Öþ
		CityIncProgress( sceneId, selfId, sceneId, x600035_g_CityProcess )

		-- ¾­Ñé½±Àø
		local ExpBonus = CallScriptFunction( x600035_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600035_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- °ï»á¹±Ï×¶È½±Àø
		local ContribBonus = CallScriptFunction( x600035_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600035_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, x600035_g_ContribType, ContribBonus )
		end

		-- ÎïÆ·½±Àø
		CallScriptFunction( x600035_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600035_g_MissionRound, x600035_g_ItemAwardIndexOffset )

		-- Í³¼ÆÐÅÏ¢
		LuaFnAuditQuest(sceneId, selfId, x600035_g_MissionName)
	end
end

--**********************************
-- ÅÐ¶ÏÄ³¸öÊÂ¼þºÅÊÇ·ñ´æÔÚÓÚµ±Ç°ÊÂ¼þÁÐ±í
--**********************************
function x600035_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600035_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x600035_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
