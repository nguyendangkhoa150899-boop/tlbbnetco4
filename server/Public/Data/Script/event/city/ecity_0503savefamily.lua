--¸±±¾ÈÎÎñ
--¾ÈÔ®ÃÅÅÉ´óÄÑ

--************************************************************************
--MisDescBegin

--½Å±¾ºÅ
x600026_g_ScriptId = 600026

--ÈÎÎñºÅ
x600026_g_MissionId = 1110

--Ä¿±êNPC
x600026_g_Name = "Ğông Phù Dung"

--ÈÎÎñµÈ¼¶
x600026_g_MissionLevel = 10000

--ÈÎÎñ¹éÀà
x600026_g_MissionKind = 50

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x600026_g_IfMissionElite = 0

--********ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈİ£¬ÓÃÓÚÔÚÈÎÎñÁĞ±íÖĞ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö******
--½ÇÉ«Mission±äÁ¿ËµÃ÷

x600026_g_IsMissionOkFail			=0	--0 ÈÎÎñÍê³É±ê¼Ç
x600026_g_MissionParam_SubId		=1	--1 ×ÓÈÎÎñ½Å±¾ºÅ´æ·ÅÎ»ÖÃ
x600026_g_Param_sceneid				=2	--2 µ±Ç°¸±±¾ÈÎÎñµÄ³¡¾°ºÅ
x600026_g_MissionParam_Phase		=3	--3 ½×¶ÎºÅ ´ËºÅÓÃÓÚÇø·Öµ±Ç°ÈÎÎñUIµÄÃèÊöĞÅÏ¢
x600026_g_MissionParam_MasterId		=4	--4 ÃÅÅÉÕÆÃÅµÄNPCIdºÅ
x600026_g_MissionParam_MenpaiIndex	=5	--5 Ä³ÃÅÅÉµÄË÷Òı£¬·Ö±ğÓÃÓÚ²éÕÒ×Ö·û´®ÁĞ±íÖĞÄ³ÃÅÅÉµÄÃû³Æ[¿Í»§¶Ë]ÒÔ¼°ÈÎÎñÓëÃÅÅÉÏà¹ØµÄĞÅÏ¢[·şÎñÆ÷¶Ë]

--Ñ­»·ÈÎÎñµÄÊı¾İË÷Òı£¬ÀïÃæ´æ×ÅÒÑ×öµÄ»·Êı
x600026_g_MissionRound = 55
--**********************************ÒÔÉÏÊÇ¶¯Ì¬****************************

--ÈÎÎñÎÄ±¾ÃèÊö
x600026_g_MissionName = "Nhi®m vø khuªch trß½ng"
x600026_g_MissionInfo = ""													--ÈÎÎñÃèÊö
x600026_g_MissionTarget = "%f"												--ÈÎÎñÄ¿±ê
x600026_g_ContinueInfo = "    Nhi®m vø cüa các hÕ vçn chßa hoàn thành à?"						--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x600026_g_SubmitInfo = "    Sñ tình tiªn tri¬n nhß thª nào r°i?"								--Íê³ÉÎ´Ìá½»Ê±µÄnpc¶Ô»°
x600026_g_MissionComplete = "    R¤t t¯t, L¥n hành ğµng giang h° này ai ai cûng biªt, không h± danh bang ta ğÕi ğÑc ğÕi nghîa. "	--Íê³ÉÈÎÎñnpcËµ»°µÄ»°

x600026_g_StrForePart = 3

--ÓÃÀ´±£´æ×Ö·û´®¸ñÊ½»¯µÄÊı¾İ
x600026_g_FormatList = {
	"",
	"    Tìm %1n ğ¬ cÑu vi®n cho ğÕi nÕn cüa môn phái này",
	"    Hµ t¯ng %2s ğ® tØ ra khöi khu c¤m ğ¸a",
}

x600026_g_StrList = {
	[0] = "Thiªu Lâm",
	[1] = "Minh Giáo",
	[2] = "Cái Bang",
	[3] = "Võ Ğang",
	[4] = "Nga My",
	[5] = "Thiên Long Tñ",
	[6] = "Tinh Túc",
	[7] = "Thiên S½n",
	[8] = "Tiêu Dao",
}

x600026_g_MenpaiInfo = {
	[0] = { Name = "Thiªu Lâm",		NpcId = 1700008,	CopySceneName = "Tháp Lâm",		Type = FUBEN_TALIN1,		    Map = "tongrenxiang_2.nav",		Exit = "tongrenxiang_2_area.ini",	Monster = "tongrenxiang_2_monster_%d.ini", 	EntrancePos = { x = 28, z = 52 },	BackPos = { x = 38, z = 97 }, },
	[1] = { Name = "Minh Giáo",		NpcId = 1700009,	CopySceneName = "Quang Minh ğµng",	Type = FUBEN_GUANGMINGDONG1,	Map = "guangmingdong_2.nav",	Exit = "guangmingdong_2_area.ini",	Monster = "guangmingdong_2_monster_%d.ini", EntrancePos = { x = 19, z = 42 },	BackPos = { x = 98, z = 57 }, },
	[2] = { Name = "Cái Bang",		NpcId = 1700010,	CopySceneName = "H¥m rßşu",		Type = FUBEN_JIUJIAO1,			Map = "jiujiao_2.nav",			Exit = "jiujiao_2_area.ini",		Monster = "jiujiao_2_monster_%d.ini", 		EntrancePos = { x = 45, z = 47 },	BackPos = { x = 91, z = 99 }, },
	[3] = { Name = "Võ Ğang",		NpcId = 1700011,	CopySceneName = "Linh Tính Phong",	Type = FUBEN_LINGXINGFENG1,		Map = "lingxingfeng_2.nav",		Exit = "lingxingfeng_2_area.ini",	Monster = "lingxingfeng_2_monster_%d.ini", 	EntrancePos = { x = 42, z = 46 },	BackPos = { x = 77, z = 86 }, },
	[4] = { Name = "Nga My",		NpcId = 1700012,	CopySceneName = "Ğào Hoa Tr§n",	Type = FUBEN_TAOHUAZHEN1,		Map = "taohuazhen_2.nav",		Exit = "taohuazhen_2_area.ini",		Monster = "taohuazhen_2_monster_%d.ini", 	EntrancePos = { x = 26, z = 46 },	BackPos = { x = 96, z = 73 }, },
	[5] = { Name = "Thiên Long Tñ",	NpcId = 1700013,	CopySceneName = "Chân tháp",		Type = FUBEN_TADI1,				Map = "tadi_2.nav",				Exit = "tadi_2_area.ini",			Monster = "tadi_2_monster_%d.ini", 			EntrancePos = { x = 45, z = 48 },	BackPos = { x = 96, z = 67 }, },
	[6] = { Name = "Tinh Túc",		NpcId = 1700014,	CopySceneName = "Ngû Th¥n Ğµng",	Type = FUBEN_WUSHENDONG1,		Map = "wushendong_2.nav",		Exit = "wushendong_2_area.ini",		Monster = "wushendong_2_monster_%d.ini", 	EntrancePos = { x = 14, z = 40 },	BackPos = { x = 142, z = 56 }, },
	[7] = { Name = "Thiên S½n",		NpcId = 1700015,	CopySceneName = "Chiªt Mai Phong",	Type = FUBEN_ZHEMEIFENG1,		Map = "zhemeifeng_2.nav",		Exit = "zhemeifeng_2_area.ini",		Monster = "zhemeifeng_2_monster_%d.ini", 	EntrancePos = { x = 29, z = 49 },	BackPos = { x = 90, z = 45 }, },
	[8] = { Name = "Tiêu Dao",		NpcId = 1700016,	CopySceneName = "C¯c ğ¸a",		Type = FUBEN_GUDI1,				Map = "gudi_2.nav",				Exit = "gudi_2_area.ini",			Monster = "gudi_2_monster_%d.ini", 			EntrancePos = { x = 42, z = 47 },	BackPos = { x = 124, z = 145 }, },
}

-- Í¨ÓÃ³ÇÊĞÈÎÎñ½Å±¾
x600026_g_CityMissionScript = 600001
x600026_g_ExpandScript = 600023

--ÈÎÎñ½±Àø

--MisDescEnd
--************************************************************************


x600026_g_TickTime = 5					--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x600026_g_CloseTick = 3					--¸±±¾¹Ø±ÕÇ°µ¹¼ÆÊ±£¨µ¥Î»£º´ÎÊı£©
x600026_g_NoUserTime = 120				--¸±±¾ÖĞÃ»ÓĞÈËºó¿ÉÒÔ¼ÌĞø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©

x600026_g_ProtegeGroup = 2				-- ±»»¤ËÍµÄ NPC Group
x600026_g_PatrolId = 0					-- NPC Ñ²ÂßÂ·¾¶

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x600026_OnDefaultEvent( sceneId, selfId, targetId )
--	if GetName( sceneId, targetId ) ~= x600026_g_Name then		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
--		return
--	end

	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) > 0 then
		local bDone = x600026_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600026_g_SubmitInfo
		else
			strText = x600026_g_ContinueInfo
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )

		if bDone == 0 and GetMissionParam( sceneId, selfId, misIndex, x600026_g_IsMissionOkFail ) ~= 2 then		--ÈÎÎñÎ´Íê³É
			if GetNumText() == 1 then	-- ÕâÀïÊÇµã»÷ÃÅÅÉÕÆÃÅ
				x600026_AcceptEnterCopyScene( sceneId, selfId )
				return

--				BeginEvent( sceneId )
--					AddText( sceneId, x600026_g_MissionName )
--					AskEnterCopyScene( sceneId, selfId )
--				EndEvent( )
--				DispatchEventList( sceneId, selfId, targetId )
			end

			if GetNumText() == 2 then	-- ÕâÀïÊÇµã»÷±»¾ÈÔ®µÜ×Ó
				x600026_StartPatrol( sceneId, selfId, targetId )
				return
			end
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600026_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600026_g_ScriptId, x600026_g_MissionId, bDone )

	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x600026_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600026_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600026_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x600026_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600026_g_Name then		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

   --Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) > 0 then
		AddNumText( sceneId, x600026_g_ScriptId, x600026_g_MissionName,3,-1 )
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x600026_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600026_g_ExpandScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--½ÓÊÜ
--**********************************
function x600026_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) == 0 then					--Ã»ÓĞÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		if GetLevel( sceneId, selfId ) < 40 then
			CallScriptFunction( x600026_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Không ğü ğÆng c¤p" )
			return
		end

		--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
		AddMission( sceneId, selfId, x600026_g_MissionId, x600026_g_ScriptId, 0, 0, 0 )	-- kill¡¢area¡¢item
		if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) <= 0 then
			return
		end

		SetMissionEvent( sceneId, selfId, x600026_g_MissionId, 4 ) -- ×¢²á x600026_OnLockedTarget ÊÂ¼ş
		CallScriptFunction( x600026_g_ExpandScript, "OnAccept", sceneId, selfId, targetId, x600026_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )

		-- Ëæ»úÒ»¸öÃÅÅÉ
		local MenpaiIndex = random( 0, getn(x600026_g_MenpaiInfo) )
		local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
		if not MenpaiInfo then
			x600026_NotifyFailTips( sceneId, selfId, "Sai sót nghiêm tr÷ng!" )
			return
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_MissionParam_Phase, 1 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_MissionParam_MasterId, MenpaiInfo.NpcId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_MissionParam_MenpaiIndex, MenpaiIndex )

		local _, strNpcName, strNpcSceneDesc, nPosX, nPosZ = GetNpcInfoByNpcId(sceneId, MenpaiInfo.NpcId )

		--ÏÔÊ¾ÄÚÈİ¸æËßÍæ¼ÒÒÑ¾­½ÓÊÜÁËÈÎÎñ
		BeginEvent( sceneId )
			AddText( sceneId, x600026_g_MissionName )
			local missionInfo = format( "    %s g£p nÕn, ra l®nh cho các hÕ c¤p t¯c tìm %s %s (%d, %d) ğ¬ cÑu vi®n, nh¢m dß½ng uy danh cho b±n bang.",
				MenpaiInfo.Name, strNpcSceneDesc, strNpcName, nPosX, nPosZ )

			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    Các hÕ ğã nh§n " .. x600026_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--µ±Ëø¶¨Ò»¸ö¶ÔÏó
--**********************************
function x600026_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) < 1 then
		return		-- Ã»ÓĞ¸ÃÈÎÎñ
	end
	
	-- Èç¹ûµ±Ç°µÄNpcÊÇ¸±±¾ÖĞµÄNpc£¬ÄÇÃ´£¬²»ÄÜÔÙ½øÈë¸±±¾ÁË
	--if LuaFnGetSceneType(sceneId) == 1  then
	--	return
	--end
	
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )
	local MenpaiIndex = GetMissionParam( sceneId, selfId, misIndex, x600026_g_MissionParam_MenpaiIndex )
	local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
	if not MenpaiInfo then
		x600026_NotifyFailTips( sceneId, selfId, "Sai sót nghiêm tr÷ng!" )
		return
	end

	local _, strNpcName, _noUse1, _noUse2, _noUse3, _noUse4, nSceneId = GetNpcInfoByNpcId( sceneId, MenpaiInfo.NpcId )	

	if ( GetName( sceneId, objId ) == strNpcName and  nSceneId == sceneId ) then							-- ÕÆÃÅ
		local missionInfo = format( "    Mµt ğám ngß¶i không rõ thân ph§n xâm phÕm vào vùng c¤m ğ¸a, vây hãm ğ® tØ cüa môn phái chúng ta, ğ« ngh¸ cÑu vi®n môn phái chúng ta" )

		TAddText( sceneId, missionInfo )
		TAddNumText( sceneId, x600026_g_ScriptId, "Vào vùng c¤m ğ¸a", 10, 1, x600026_g_ScriptId )
		return
	end

--	--ÊÇ·ñÊÇ¸±±¾
--	local sceneType = LuaFnGetSceneType( sceneId )
--	if sceneType ~= 1 then
--		return
--	end

	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype == MenpaiInfo.Type then
		local GroupID = GetMonsterGroupID( sceneId, objId )
		-- ÒòÎªÑ²Âß NPC ±»µãÖĞÒÔºó²»»áÔÙ´ÎÏìÓ¦µã»÷ÊÂ¼ş£¬ËùÒÔÕâÀï²»×÷¶îÍâ´¦Àí
		if GroupID == x600026_g_ProtegeGroup then
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = "Næ hi®p"
			else
				rank = " các hÕ"
			end

			local missionInfo = format( "    Ğa tÕ %s cÑu vi®n tß½ng trş, ğÕi nghîa cüa quı bang ğªn chªt cûng không quên", rank )

			TAddText( sceneId, missionInfo )
			TAddNumText( sceneId, x600026_g_ScriptId, "Hãy theo tÕi hÕ phá vây", 10, 2, x600026_g_ScriptId )
			return
		end
	end
end

--**********************************
--Íæ¼ÒÍ¬Òâ½øÈë¸±±¾
--**********************************
function x600026_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) > 0 then					--ÓĞÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )

		-- ÕâÀï²»°ÑÍæ¼Ò´«µ½ÉÏÒ»¸ö³¡¾°£¬ÒòÎª»¤ËÍÈÎÎñÖĞ£¬Íæ¼ÒÒ»µ©Àë¿ª³¡¾°
		-- ±»»¤ËÍµÄ NPC ¿ÉÄÜËÀÍö£¬Ò²¿ÉÄÜ×ßµ½ÖÕµã£¬Ò²¿ÉÄÜ¸±±¾ÒÑ¾­ÉèÖÃÎª¹Ø±Õ±ê¼Ç
		-- ¶¼¿ÉÄÜµ¼ÖÂÍæ¼ÒÎŞÒâÒåµÃ½øÈë£¬ËùÒÔÒ»µ©Í¬Òâ½øÈë¸±±¾£¬Ò»ÂÉ½øÈëĞÂ¸±±¾

		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_IsMissionOkFail, 0 )	--½«ÈÎÎñµÄµÚ0ºÅÊı¾İÉèÖÃÎª0,±íÊ¾Î´Íê³ÉµÄÈÎÎñ
		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_Param_sceneid, -1 )		--½«ÈÎÎñµÄµÚ2ºÅÊı¾İÉèÖÃÎª-1, ÓÃÓÚ±£´æ¸±±¾µÄ³¡¾°ºÅ
		x600026_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--¿ªÊ¼½øÈë»¤ËÍ¹ı³Ì
--**********************************
function x600026_StartPatrol( sceneId, selfId, targetId )
	local flag = LuaFnGetCopySceneData_Param( sceneId, 8 )
	if flag == 1 then															-- ÒÑ¾­¿ªÊ¼»¤ËÍ
		return
	end

	local GroupID = GetMonsterGroupID( sceneId, targetId )
	if GroupID == x600026_g_ProtegeGroup then
		--Æô¶¯¸ÃÈÎÎñµÄÈÎÎñÊ±ÖÓÆ÷
		StartMissionTimer( sceneId, selfId, x600026_g_MissionId )
		SetMissionEvent( sceneId, selfId, x600026_g_MissionId, 5 )
		SetPatrolId( sceneId, targetId, x600026_g_PatrolId )							-- ÉèÖÃÑ²ÂßÂ·¾¶
		LuaFnSetCopySceneData_Param( sceneId, 8, 1 )							--±êÊ¾ÒÑ¾­¿ªÊ¼»¤ËÍ
		SetUnitReputationID( sceneId, selfId, targetId, GetUnitReputationID( sceneId, selfId, selfId ) )
		SetMonsterFightWithNpcFlag( sceneId, targetId, 1 )				-- ´ò¿ªÔÊĞí¹ÖÎïºÍ¹ÖÎïÕ½¶·µÄ±ê¼Ç
		-- GetMonsterFightWithNpcFlag
	end
end

--**********************************
--´´½¨¸±±¾
--**********************************
function x600026_MakeCopyScene( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )
	local MenpaiIndex = GetMissionParam( sceneId, selfId, misIndex, x600026_g_MissionParam_MenpaiIndex )
	local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
	if not MenpaiInfo then
		x600026_NotifyFailTips( sceneId, selfId, "Sai sót nghiêm tr÷ng!" )
		return
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, MenpaiInfo.Map )						--µØÍ¼ÊÇ±ØĞëÑ¡È¡µÄ£¬¶øÇÒ±ØĞëÔÚConfig/SceneInfo.iniÀïÅäÖÃºÃ
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600026_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600026_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, MenpaiInfo.Type )				--ÉèÖÃ¸±±¾Êı¾İ£¬ÕâÀï½«0ºÅË÷ÒıµÄÊı¾İÉèÖÃÎª999£¬ÓÃÓÚ±íÊ¾¸±±¾ºÅ999(Êı×Ö×Ô¶¨Òå)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600026_g_ScriptId )					--½«1ºÅÊı¾İÉèÖÃÎª¸±±¾³¡¾°ÊÂ¼ş½Å±¾ºÅ
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--ÉèÖÃ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊı
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ, ³õÊ¼»¯
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾, 0¿ª·Å£¬1¹Ø±Õ
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--ÉèÖÃÀë¿ªµ¹¼ÆÊ±´ÎÊı
	LuaFnSetCopySceneData_Param( sceneId, 6, 0 )							--µã»÷±»»¤ËÍÕßµÄ´ÎÊı
	LuaFnSetCopySceneData_Param( sceneId, 7, MenpaiIndex )					--±êÊ¾ÕâÊÇµÚ¼¸¸ö³¡¾°
	LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							--±êÊ¾ÊÇ·ñÒÑ¾­¿ªÊ¼»¤ËÍ

	local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127

	local mylevel = GetLevel( sceneId, selfId )
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, MenpaiInfo.Exit )
	LuaFnSetSceneLoad_Monster( sceneId, format( MenpaiInfo.Monster, iniLevel ) )

	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, mylevel - iniLevel ) --¼¶±ğ²î£¬CopyScene_LevelGap ÔÚ scene.lua ÖĞ¸³Öµ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--³õÊ¼»¯Íê³Éºóµ÷ÓÃ´´½¨¸±±¾º¯Êı
	if bRetSceneID > 0 then
		x600026_NotifyFailTips( sceneId, selfId, "D¸ch chuy¬n thành công!" )
	else
		x600026_NotifyFailTips( sceneId, selfId, "S¯ lßşng bän sao ğã ğªn gi¾i hÕn, ğ« ngh¸ lát næa thØ lÕi!" )
	end

end

--**********************************
--¸±±¾ÊÂ¼ş
--**********************************
function x600026_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- ´¦ÓÚÎŞ·¨Ö´ĞĞÂß¼­µÄ×´Ì¬
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600026_g_MissionId ) > 0 then			--ÓĞÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600026_g_MissionId )
		local MenpaiIndex = GetMissionParam( sceneId, leaderObjId, misIndex, x600026_g_MissionParam_MenpaiIndex )
		local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
		if not MenpaiInfo then
			x600026_NotifyFailTips( sceneId, leaderObjId, "Sai sót nghiêm tr÷ng!" )
			return
		end

		--½«ÈÎÎñµÄµÚ2ºÅÊı¾İÉèÖÃÎª¸±±¾µÄ³¡¾°ºÅ
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600026_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, MenpaiInfo.EntrancePos.x, MenpaiInfo.EntrancePos.z )
	end
end

--**********************************
--ÓĞÍæ¼Ò½øÈë¸±±¾ÊÂ¼ş
--**********************************
function x600026_OnPlayerEnter( sceneId, selfId )
	local MenpaiIndex = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
	if not MenpaiInfo then
		x600026_NotifyFailTips( sceneId, selfId, "Sai sót nghiêm tr÷ng!" )
		return
	end

	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) == 0 then				-- Èç¹û½øÈë¸±±¾Ç°É¾³ıÈÎÎñ£¬ÔòÖ±½Ó´«ËÍ»Ø
		x600026_NotifyFailTips( sceneId, selfId, "Các hÕ ğã không nh§n nhi®m vø này t× trß¾c" )
		x600026_BackToCity( sceneId, selfId )
		return
	end
end

--**********************************
--ÓĞÍæ¼ÒÔÚ¸±±¾ÖĞËÀÍöÊÂ¼ş
--**********************************
function x600026_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--·ÅÆú
--**********************************
function x600026_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600026_g_Param_sceneid )

	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	CallScriptFunction( x600026_g_ExpandScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--Èç¹ûÔÚ¸±±¾ÀïÉ¾³ıÈÎÎñ£¬ÔòÖ±½Ó´«ËÍ»Ø
		x600026_NotifyFailTips( sceneId, selfId, "Nhi®m vø th¤t bÕi!" )
		x600026_BackToCity( sceneId, selfId )
	end
end

--**********************************
-- »Ø³Ç£¬Ö»ÓĞ³ÇÊĞÈÎÎñ¸±±¾¿ÉÒÔµ÷ÓÃ´Ë½Ó¿Ú
--**********************************
function x600026_BackToCity( sceneId, selfId )
	local MenpaiIndex = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
	if not MenpaiInfo then
		x600026_NotifyFailTips( sceneId, selfId, "Sai sót nghiêm tr÷ng!" )
		return
	end

	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	NewWorld( sceneId, selfId, oldsceneId, MenpaiInfo.BackPos.x, MenpaiInfo.BackPos.z )
end

--**********************************
--¼ÌĞø
--**********************************
function x600026_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600026_g_MissionName )
		AddText( sceneId, x600026_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600026_g_ScriptId, x600026_g_MissionId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x600026_CheckSubmit( sceneId, selfId, selectRadioId )
	--ÅĞ¶ÏÈÎÎñÊÇ·ñÒÑ¾­Íê³É
	local ret = CallScriptFunction( x600026_g_ExpandScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--Ìá½»
--**********************************
function x600026_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600026_g_Name then		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if x600026_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600026_g_ExpandScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x600026_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x600026_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x600026_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼ş
--**********************************
function x600026_OnCopySceneTimer( sceneId, nowTime )

	--¸±±¾Ê±ÖÓ¶ÁÈ¡¼°ÉèÖÃ
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--È¡µÃÒÑ¾­Ö´ĞĞµÄ¶¨Ê±´ÎÊı
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--ÉèÖÃĞÂµÄ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊı

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--ĞèÒªÀë¿ª
		--Àë¿ªµ¹¼ÆÊ±¼äµÄ¶ÁÈ¡ºÍÉèÖÃ
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x600026_g_CloseTick then										--µ¹¼ÆÊ±¼äµ½£¬´ó¼Ò¶¼³öÈ¥°É
			--½«µ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË´«ËÍ»ØÔ­À´½øÈëÊ±ºòµÄ³¡¾°
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600026_BackToCity( sceneId, mems[i] )
				end
			end
		else
			--Í¨Öªµ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË£¬³¡¾°¹Ø±Õµ¹¼ÆÊ±¼ä
			local strText = format( "Các hÕ s¨ r¶i khöi n½i này trong vòng %d giây næa", ( x600026_g_CloseTick - leaveTickCount ) * x600026_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600026_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

--**********************************
--¶¨Ê±ÊÂ¼ş
--**********************************
function x600026_OnTimer( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) < 1 then
		return		-- Ã»ÓĞ¸ÃÈÎÎñ
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )

	local MenpaiIndex = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
	if not MenpaiInfo then
		x600026_NotifyFailTips( sceneId, selfId, "Sai sót nghiêm tr÷ng!" )
		return
	end

	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		ResetMissionEvent( sceneId, selfId, x600026_g_MissionId, 5 )			-- ²»ÔÙ×ß´ËĞÄÌø
		return
	end

	--ÊÇ·ñÊÇËùĞèÒªµÄ¸±±¾
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype == MenpaiInfo.Type then
		local monstercount = GetMonsterCount( sceneId )
		local i, monsterId, GroupID

		for i = 0, monstercount - 1 do
			monsterId = GetMonsterObjID( sceneId, i )
			GroupID = GetMonsterGroupID( sceneId, monsterId )
			-- ÒòÎªÑ²Âß NPC ±»µãÖĞÒÔºó²»»áÔÙ´ÎÏìÓ¦µã»÷ÊÂ¼ş£¬ËùÒÔÕâÀï²»×÷¶îÍâ´¦Àí
			if GroupID == x600026_g_ProtegeGroup then
				local x, z = GetLastPatrolPoint( sceneId, 0 )
				local npcX, npcZ = GetWorldPos( sceneId, monsterId )

				if (x - npcX) * (x - npcX) + (z - npcZ) * (z - npcZ) < 4 then	-- ÀëÖÕµã²»µ½ 2 Ã×
					SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_IsMissionOkFail, 1 )
					ResetMissionEvent( sceneId, selfId, x600026_g_MissionId, 5 )		-- ²»ÔÙ×ß´ËĞÄÌø
					ResetMissionEvent( sceneId, selfId, x600026_g_MissionId, 4 )		-- ²»ÔÙÈÃµã»÷
					LuaFnDeleteMonster( sceneId, monsterId )
					LuaFnSetCopySceneData_Param( sceneId, 4, 1 )				-- ¸±±¾¹Ø±Õ±ê¼Ç
					x600026_NotifyFailTips( sceneId, selfId, "Nhi®m vø hoàn thành, hãy quay v« thành phøc m®nh" )
				end

				return
			end
		end

		-- ±»»¤ËÍµÄ NPC ËÀÍö
		x600026_NotifyFailTips( sceneId, selfId, "Nhi®m vø th¤t bÕi!" )
		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_IsMissionOkFail, 2 )	-- ÈÎÎñÊ§°Ü
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	end

	-- Àë¿ªÁË¸±±¾»òÕß±»»¤ËÍµÄ NPC ËÀÍö¶¼Í£Ö¹×ß¼ÆÊ±Æ÷
	ResetMissionEvent( sceneId, selfId, x600026_g_MissionId, 5 )						-- ²»ÔÙ×ß´ËĞÄÌø
end

function x600026_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
