-- Ñ°ÕÒÒ©²ÝÑùÃçÈÎÎñ
--MisDescBegin
-- ½Å±¾ºÅ
x600018_g_ScriptId = 600018

--ÈÎÎñºÅ
x600018_g_MissionId = 1108

--ÈÎÎñÄ¿±ênpc
x600018_g_Name = "Mµc D¸ch"

--ÈÎÎñ¹éÀà
x600018_g_MissionKind = 50

--ÈÎÎñµÈ¼¶
x600018_g_MissionLevel = 10000

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x600018_g_IfMissionElite = 0

--ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈÝ£¬ÓÃÓÚÔÚÈÎÎñÁÐ±íÖÐ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö**********************
x600018_g_IsMissionOkFail = 0							-- ÈÎÎñÍê³É±ê¼Ç

--ÒÔÉÏÊÇ¶¯Ì¬**************************************************************

--ÈÎÎñ±äÁ¿µÚÒ»Î»ÓÃÀ´´æ´¢Ëæ»úµÃµ½µÄ½Å±¾ºÅ

--ÈÎÎñÎÄ±¾ÃèÊö
x600018_g_MissionName = "Nhi®m vø thß½ng nghi®p"
x600018_g_MissionInfo = ""			--ÈÎÎñÃèÊö
x600018_g_MissionTarget = "    Tìm kiªm %i, ðßa cho bang hµi thành th¸ Mµc D¸ch (46, 91). "	--ÈÎÎñÄ¿±ê
x600018_g_ContinueInfo = "    Nhi®m vø cüa các hÕ vçn chßa hoàn thành à?"					--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x600018_g_SubmitInfo = "    Sñ tình tiªn tri¬n nhß thª nào r°i?"							--Íê³ÉÎ´Ìá½»Ê±µÄnpc¶Ô»°
x600018_g_MissionComplete = "    Làm t¯t l¡m, r¤t t¯t r¤t t¯t. "					--Íê³ÉÈÎÎñnpcËµ»°µÄ»°

x600018_g_Parameter_Item_IDRandom = { { id = 5, num = 1 } }

x600018_g_StrForePart = 5
x600018_g_Offset = 14													-- Suppose to 14, ±íÀïµÚ¼¸¸öÎïÆ·ÁÐµÄÆ«ÒÆÁ¿

x600018_g_MissionRound = 44

-- Í¨ÓÃ³ÇÊÐÈÎÎñ½Å±¾
x600018_g_CityMissionScript = 600001
x600018_g_MarketScript = 600017

--ÈÎÎñ½±Àø

--MisDescEnd
--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x600018_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾
	if GetName( sceneId, targetId ) ~= x600018_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600018_g_MissionId ) > 0 then
		--·¢ËÍÈÎÎñÐèÇóµÄÐÅÏ¢
		local bDone = x600018_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600018_g_SubmitInfo
		else
			strText = x600018_g_ContinueInfo
		end

		--·¢ËÍÈÎÎñÐèÇóµÄÐÅÏ¢
		BeginEvent( sceneId )
			AddText( sceneId, x600018_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600018_g_ScriptId, x600018_g_MissionId, bDone )
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x600018_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600018_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600018_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x600018_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600018_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

   --Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600018_g_MissionId ) > 0 then
		AddNumText( sceneId, x600018_g_ScriptId, x600018_g_MissionName,3,-1 )
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x600018_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600018_g_MarketScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--¸ù¾ÝÏàÓ¦½¨ÖþµÃµ½¶ÔÓ¦MissionItem_HashTable.txtÖÐµÄµ¥ÔªË÷Òý
--**********************************
function x600018_GetMissionItemIndex( sceneId, selfId )
	local nBuildingLevel = CityGetBuildingLevel( sceneId, selfId, sceneId, CITY_BUILDING_JIFANG )
	local nPos

	if nBuildingLevel == 0 then								-- 1
		nPos = x600018_g_Offset
	elseif nBuildingLevel == 1 then							-- 2
		nPos = x600018_g_Offset + 1
	elseif nBuildingLevel == 2 then							-- 3
		nPos = x600018_g_Offset + 2
	elseif nBuildingLevel == 3 then							-- 4
		nPos = x600018_g_Offset + 3
	else													-- 5
		nPos = 159
	end

	return nPos
end

--**********************************
--½ÓÊÜ
--**********************************
function x600018_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600018_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600018_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Không ðü ðÆng c¤p" )
		return
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁÐ±í
	AddMission( sceneId, selfId, x600018_g_MissionId, x600018_g_ScriptId, 0, 0, 1 )	-- kill¡¢area¡¢item
	if IsHaveMission( sceneId, selfId, x600018_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600018_g_MarketScript, "OnAccept", sceneId, selfId, targetId, x600018_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600018_g_MissionId )
	local nitemId, strItemName, _ = GetOneMissionItem( x600018_GetMissionItemIndex( sceneId, selfId ) )

	SetMissionByIndex( sceneId, selfId, misIndex, x600018_g_StrForePart, nitemId )

	--ÏÔÊ¾ÄÚÈÝ¸æËßÍæ¼ÒÒÑ¾­½ÓÊÜÁËÈÎÎñ
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    Bän Thành ðang nghiên cÑu các loÕi thu¯c lá, hi®n còn ðang thiªu #Y%s#W, mong các hÕ có th¬ tìm giúp hµ ta", strItemName )
		else
			missionInfo = format( "    Nghe nói dßþc lñc cüa #Y%s#W r¤t mÕnh, chúng ta c¥n biªt nguyên nhân, mong các hÕ tìm giúp v«, ch¡c ch¡n s¨ có cäm tÕ", strItemName )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "#r    Các hÕ ðã nh§n " .. x600018_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	-- ¼ì²âÉíÉÏÊÇ·ñÒÑÓÐ´ËÎïÆ·
	if LuaFnGetAvailableItemCount( sceneId, selfId, nitemId ) > 0 then
		x600018_OnItemChanged( sceneId, selfId, nitemId )
	end
end

--**********************************
--·ÅÆú
--**********************************
function x600018_OnAbandon( sceneId, selfId )
	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
	CallScriptFunction( x600018_g_MarketScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--¼ÌÐø
--**********************************
function x600018_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600018_g_MissionName )
		AddText( sceneId, x600018_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600018_g_ScriptId, x600018_g_MissionId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x600018_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600018_g_MarketScript, "CheckSubmit", sceneId, selfId )

	if ret == 1 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600018_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600018_g_StrForePart )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum < 1 then
			ret = 0
		end
	end

	return ret
end

--**********************************
--Ìá½»
--**********************************
function x600018_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600018_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if x600018_CheckSubmit( sceneId, selfId ) == 1 then
		-- ¿Û¶«Î÷
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600018_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600018_g_StrForePart )
		local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then
			DelItem( sceneId, selfId, demandItemId, 1 )
		else											-- Ö»×÷ÎªÈÝ´í£¬ÀíÂÛÉÏ²»¿ÉÄÜ·¢Éú
			SetMissionByIndex( sceneId, selfId, misIndex, x600018_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600018_g_MarketScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x600018_OnKillObject( sceneId, selfId, objdataId, objId )	--²ÎÊýÒâË¼£º³¡¾°ºÅ¡¢Íæ¼ÒobjId¡¢¹ÖÎï±íÎ»ÖÃºÅ¡¢¹ÖÎïobjId
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x600018_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x600018_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600018_g_MissionId )

	local _, strItemName, _ = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600018_g_StrForePart )
	local _, strDemandItemName, _ = GetItemInfoByItemId( demandItemId )

	if strItemName == strDemandItemName then
		local nItemNum = GetItemCount( sceneId, selfId, itemdataId )
		local strText
		if nItemNum > 0 then
			strText = format( "Ðã có ðßþc %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600018_g_IsMissionOkFail, 1 )
		else
			strText = format( "M¤t ði %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600018_g_IsMissionOkFail, 0 )
		end

		CallScriptFunction( x600018_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
	end
end
