-- ³ÇÊÐÄÚÕþÖ®ÑÐ¾¿ÈÎÎñÖ÷ÊÂ¼þ½Å±¾
-- ½Å±¾ºÅ
x600040_g_ScriptId = 600040

-- ÈÎÎñºÅ
x600040_g_MissionId = 1113

-- ÈÎÎñÄ¿±ênpc
x600040_g_Name = "Tr¸nh Vô Danh"

-- ÈÎÎñÎÄ±¾ÃèÊö
x600040_g_MissionName = "Nghiên cÑu nhi®m vø"
x600040_g_MissionInfo = "Nµi chính thành th¸ - nhi®m vø nghiên cÑu"			--ÈÎÎñÃèÊö
x600040_g_NoMissionInfo = "    Trong bang hình nhß không có nghiên cÑu cái gì. "	--²»ÔÚÑÐ¾¿Ê±ÌáÊ¾
x600040_g_MissionTarget = "Hoàn thành nhi®m vø bang hµi ÐÕi Chü Quän"		--ÈÎÎñÄ¿±ê
x600040_g_ContinueInfo = "    Nhi®m vø cüa các hÕ vçn chßa hoàn thành à?"	--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x600040_g_MissionComplete = "Cám ½n các hÕ nhi«u"				--Íê³ÉÈÎÎñnpcËµµÄ»°

x600040_g_MissionParam_SubId = 1

-- Í¨ÓÃ³ÇÊÐÈÎÎñ½Å±¾
x600040_g_CityMissionScript = 600001

-- ×ÓÈÎÎñ±í
x600040_g_SubMissionScriptList = { 600041, 600042, 600043 }

-- ÈÎÎñ½±Àø
x600040_g_ItemAwardIndexOffset = 30						-- ÎïÆ·½±ÀøËùÔÚ±í¸ñÖÐµÄÁÐÆ«ÒÆ
x600040_g_MissionRound = MD_CITY_RESEARCH_ROUND			-- ³ÇÊÐÄÚÕþÑÐ¾¿ÈÎÎñ
x600040_g_MissionAbandonTime = MD_CITY_RESEARCH_TIME	-- ³ÇÊÐÄÚÕþÑÐ¾¿ÈÎÎñ·ÅÆúÈÎÎñµÄÊ±¼ä
x600040_g_ContribType = GUILD_CONTRIB_POINT				-- °ï»á¹±Ï×¶È
x600040_g_CityProcess = 1								-- 0:ÑÐ¾¿£¬1:ÑÐ¾¿

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x600040_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾
	if GetName( sceneId, targetId ) ~= x600040_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if CityInBuildingResearch( sceneId, selfId, sceneId ) ~= 1 then
		x600040_NotifyFailBox( sceneId, selfId, targetId, x600040_g_NoMissionInfo )
		return
	end

	local rand = random( getn(x600040_g_SubMissionScriptList) )
	CallScriptFunction( x600040_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600040_g_MissionId, x600040_g_SubMissionScriptList[rand] )
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x600040_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600040_g_Name then								--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	--Èç¹ûÒÑ½ÓÈÎÎñ»òÂú×ãÈÎÎñ½ÓÊÕÌõ¼þ,ÔòÁÐ³öÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600040_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600040_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600040_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600040_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600040_g_ScriptId, x600040_g_MissionName,4,-1 )
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ£¬Ò²¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x600040_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600040_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600040_g_MissionId, x600040_g_MissionAbandonTime )
	return ret
end

--**********************************
--½ÓÊÜ£¬½ö¹©×ÓÈÎÎñµ÷ÓÃÉèÖÃ¹«¹²²ÎÊý
--**********************************
function x600040_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600040_g_Name then								--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	CallScriptFunction( x600040_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600040_g_MissionId, x600040_g_MissionRound )
end

--**********************************
--·ÅÆú£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x600040_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600040_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600040_g_MissionId, x600040_g_MissionAbandonTime, x600040_g_MissionRound )
end

--**********************************
--¼ÌÐø
--**********************************
function x600040_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x600040_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600040_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600040_g_MissionId )
	return ret
end

--**********************************
--Ìá½»£¬½ö¹©×ÓÈÎÎñµ÷ÓÃ
--**********************************
function x600040_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600040_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600040_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600040_g_MissionId, x600040_g_MissionRound )

		-- Éý¼¶ÑÐ¾¿
		CityIncProgress( sceneId, selfId, sceneId, x600040_g_CityProcess )

		-- ¾­Ñé½±Àø
		local ExpBonus = CallScriptFunction( x600040_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600040_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- °ï»á¹±Ï×¶È½±Àø
		local ContribBonus = CallScriptFunction( x600040_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600040_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, x600040_g_ContribType, ContribBonus )
		end

		-- ÎïÆ·½±Àø
		CallScriptFunction( x600040_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600040_g_MissionRound, x600040_g_ItemAwardIndexOffset )

		-- Í³¼ÆÐÅÏ¢
		LuaFnAuditQuest(sceneId, selfId, x600040_g_MissionName)
	end
end

--**********************************
-- ÅÐ¶ÏÄ³¸öÊÂ¼þºÅÊÇ·ñ´æÔÚÓÚµ±Ç°ÊÂ¼þÁÐ±í
--**********************************
function x600040_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600040_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x600040_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
