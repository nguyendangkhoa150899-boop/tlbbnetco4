-- ËÍÕä°æµÄÊé¼®
--MisDescBegin
-- ½Å±¾ºÅ
x600015_g_ScriptId = 600015

--ÈÎÎñºÅ
x600015_g_MissionId = 1107

--ÈÎÎñÄ¿±ênpc
x600015_g_Name = "Hµi H÷a"

--ÈÎÎñ¹éÀà
x600015_g_MissionKind = 50

--ÈÎÎñµÈ¼¶
x600015_g_MissionLevel = 10000

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x600015_g_IfMissionElite = 0

--ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈÝ£¬ÓÃÓÚÔÚÈÎÎñÁÐ±íÖÐ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö**********************
x600015_g_IsMissionOkFail = 0							-- ÈÎÎñÍê³É±ê¼Ç

--ÒÔÉÏÊÇ¶¯Ì¬**************************************************************

--ÈÎÎñ±äÁ¿µÚÒ»Î»ÓÃÀ´´æ´¢Ëæ»úµÃµ½µÄ½Å±¾ºÅ

--ÈÎÎñÎÄ±¾ÃèÊö
x600015_g_MissionName = "Nhi®m vø kÛ thu§t"
x600015_g_MissionInfo = "    Hôm nay ta mu¯n có %s, tìm lÕi ðây giúp ta!"			--ÈÎÎñÃèÊö
x600015_g_MissionTarget = "    Ðem %i ðßa cho %n"							--ÈÎÎñÄ¿±ê
x600015_g_ContinueInfo = "    Nhi®m vø cüa các hÕ vçn chßa hoàn thành à?"					--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x600015_g_SubmitInfo = "    Sñ tình tiªn tri¬n nhß thª nào r°i?"							--Íê³ÉÎ´Ìá½»Ê±µÄnpc¶Ô»°
x600015_g_MissionComplete = "    Làm t¯t l¡m, r¤t t¯t r¤t t¯t. "					--Íê³ÉÈÎÎñnpcËµ»°µÄ»°

x600015_g_StrForePart = 5
x600015_g_ItemOffset = 20												-- Suppose to 20, ±íÀïµÚ¼¸¸öÎïÆ·ÁÐµÄÆ«ÒÆÁ¿
x600015_g_NPCOffset = 16												-- Suppose to 16, ±íÀïµÚ¼¸ÁÐ NPC µÄÆ«ÒÆÁ¿
x600015_g_NPCOffsetEx	= 249 										--±íÀïµÚ¼¸ÁÐ NPC µÄÆ«ÒÆÁ¿À©³ä modi:lby20071126
x600015_g_MissionRound = 42

-- Í¨ÓÃ³ÇÊÐÈÎÎñ½Å±¾
x600015_g_CityMissionScript = 600001
x600015_g_SciTechScript = 600012

--ÈÎÎñ½±Àø

--MisDescEnd

x600015_g_Pronoun = {}
x600015_g_Pronoun[0] = "muµi ¤y"
x600015_g_Pronoun[1] = "huynh ¤y"

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x600015_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾
	if GetName( sceneId, targetId ) ~= x600015_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600015_g_MissionId ) > 0 then
		--·¢ËÍÈÎÎñÐèÇóµÄÐÅÏ¢
		local bDone = x600015_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600015_g_SubmitInfo
		else
			strText = x600015_g_ContinueInfo
		end

		--·¢ËÍÈÎÎñÐèÇóµÄÐÅÏ¢
		BeginEvent( sceneId )
			AddText( sceneId, x600015_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600015_g_ScriptId, x600015_g_MissionId, bDone )
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x600015_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600015_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600015_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x600015_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600015_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

   --Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600015_g_MissionId ) > 0 then
		AddNumText( sceneId, x600015_g_ScriptId, x600015_g_MissionName,3,-1 )
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x600015_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600015_g_SciTechScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--¸ù¾ÝÍæ¼ÒµÈ¼¶µÃµ½¶ÔÓ¦MissionItem_HashTable.txtÖÐµÄµ¥ÔªË÷Òý
--**********************************
function x600015_GetMissionItemIndex( sceneId, selfId )
	return x600015_g_ItemOffset
end

--**********************************
--¸ù¾ÝÍæ¼ÒµÈ¼¶µÃµ½¶ÔÓ¦MissionNPC_HashTable.txtÖÐµÄÑ¡ÔñÐÅÏ¢
--**********************************
function x600015_GetMissionNPCKey( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos

	if nPlayerLevel < 55 then									-- 40 ~ 54
		nPos = 0
	elseif nPlayerLevel < 70 then							-- 55 ~ 69
		nPos = 1
	elseif nPlayerLevel < 85 then							-- 70 ~ 84
		nPos = 2
	--else																		-- 85 ~ 100
	--	nPos = 3
	--end

	--return nPos + x600015_g_NPCOffset
	
	elseif	nPlayerLevel < 100 then					-- 85 ~ 99 Level
		nPos = 3
	elseif nPlayerLevel < 115 then					-- 100 ~ 114 Level	modi:lby20071126
		nPos = 0
	else 																		-- >=114 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600015_g_NPCOffset
	else
		return nPos + x600015_g_NPCOffsetEx
	end
	
end

--**********************************
--½ÓÊÜ
--**********************************
function x600015_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600015_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600015_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Không ðü ðÆng c¤p" )
		return
	end

	local nitemId, strItemName, _ = GetOneMissionItem( x600015_GetMissionItemIndex( sceneId, selfId ) )
	local pos = LuaFnTryRecieveItem( sceneId, selfId, nitemId, QUALITY_MUST_BE_CHANGE )
	if pos == -1 then
		CallScriptFunction( x600015_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Ch² tr¯ng trong tay näi không ðü" )
		return
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁÐ±í
	AddMission( sceneId, selfId, x600015_g_MissionId, x600015_g_ScriptId, 0, 0, 0 )	-- kill¡¢area¡¢item
	if IsHaveMission( sceneId, selfId, x600015_g_MissionId ) <= 0 then
		return
	end

	SetMissionEvent( sceneId, selfId, x600015_g_MissionId, 4 ) -- ×¢²á x600015_OnLockedTarget ÊÂ¼þ

	CallScriptFunction( x600015_g_SciTechScript, "OnAccept", sceneId, selfId, targetId, x600015_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600015_g_MissionId )
	local nNpcId, strNpcName, strNpcScene, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600015_GetMissionNPCKey( sceneId, selfId ) )

	SetMissionByIndex( sceneId, selfId, misIndex, x600015_g_StrForePart, nitemId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600015_g_StrForePart + 1, nNpcId )

	--ÏÔÊ¾ÄÚÈÝ¸æËßÍæ¼ÒÒÑ¾­½ÓÊÜÁËÈÎÎñ
	BeginEvent( sceneId )
		local missionInfo
		local rand = random(2)

		if rand == 1 then
			missionInfo = format( "    Bµ #Y%s#W này m¤y hôm trß¾c mßþn %s %s (%d, %d), các hÕ mang trä %s giúp ta",
				strItemName, strNpcScene, strNpcName, nPosX, nPosZ, x600015_g_Pronoun[nGender] )
		else
			missionInfo = format( "    %s %s (%d, %d) ð£t làm · ch² bän thành, #Y%s#W, nh¶ các hÕ giúp chuy¬n ði hµ ta.",
				strNpcScene, strNpcName, nPosX, nPosZ, strItemName )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    Các hÕ ðã nh§n nhi®m vø: " .. x600015_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--·ÅÆú
--**********************************
function x600015_OnAbandon( sceneId, selfId )
	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
	CallScriptFunction( x600015_g_SciTechScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--¼ÌÐø
--**********************************
function x600015_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600015_g_MissionName )
		AddText( sceneId, x600015_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600015_g_ScriptId, x600015_g_MissionId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x600015_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600015_g_SciTechScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--Ìá½»
--**********************************
function x600015_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600015_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if x600015_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600015_g_SciTechScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x600015_OnKillObject( sceneId, selfId, objdataId, objId )	--²ÎÊýÒâË¼£º³¡¾°ºÅ¡¢Íæ¼ÒobjId¡¢¹ÖÎï±íÎ»ÖÃºÅ¡¢¹ÖÎïobjId
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x600015_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x600015_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--µ±Ëø¶¨Ò»¸ö¶ÔÏó
--**********************************
function x600015_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600015_g_MissionId ) < 1 then
		return		-- Ã»ÓÐ¸ÃÈÎÎñ
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600015_g_MissionId )		--µÃµ½ÈÎÎñÔÚ20¸öÈÎÎñÖÐµÄÐòÁÐºÅ
	if GetMissionParam( sceneId, selfId, misIndex, x600015_g_IsMissionOkFail ) > 0 then
		return		-- ¸ÃÈÎÎñÒÑÍê³É
	end

	local nNpcId
	local strNpcName
	local PosX
	local PosZ

	nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600015_g_StrForePart + 1 )
	_, strNpcName, _, PosX, PosZ = GetNpcInfoByNpcId(sceneId, nNpcId )

	-- ÔÝÊ±²»±È½ÏÎ»ÖÃ
	if GetName( sceneId, objId ) == strNpcName then
		local nItemId
		nItemId = GetMissionParam( sceneId, selfId, misIndex, x600015_g_StrForePart )

		if DelItem( sceneId, selfId, nItemId, 1 ) == 1 then
			-- ÉèÖÃÈÎÎñÒÑ¾­Íê³É
			SetMissionByIndex( sceneId, selfId, misIndex, x600015_g_IsMissionOkFail, 1 )
			-- ½«¸ÃÈÎÎñ´Ó x600015_OnLockedTarget ÊÂ¼þÁÐ±íÖÐÇå³ý£¬¸ÃÈÎÎñ²»ÔÙ¹ØÐÄ´ËÀàÊÂ¼þ
			ResetMissionEvent( sceneId, selfId, x600015_g_MissionId, 4 )
			TAddText( sceneId, "    Quý bang ðúng là r¤t giæ chæ tín, xin chuy¬n l¶i höi thåm cüa ta t¾i ngài C¦u Tä" )
		end
	end
end
