-- ¸±±¾ÈÎÎñ
-- ¾ÍµØÕý·¨

--************************************************************************
--MisDescBegin

--½Å±¾ºÅ
x228903_g_ScriptId = 228903

--ÈÎÎñºÅ
x228903_g_MissionId = 947

-- Ç°ÐøÈÎÎñ
x228903_g_PreMissionId = 946

-- Ä¿±ê NPC
x228903_g_Position_X = 262
x228903_g_Position_Z = 46
x228903_g_SceneID = 18
x228903_g_AccomplishNPC_Name = "Chüng Thª Hoành"

--Ä¿±êNPC
x228903_g_Name = "Chüng Thª Hoành"

--ÈÎÎñµÈ¼¶
x228903_g_MissionLevel = 30

--ÈÎÎñ¹éÀà
x228903_g_MissionKind = 28

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x228903_g_IfMissionElite = 0

--********ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈÝ£¬ÓÃÓÚÔÚÈÎÎñÁÐ±íÖÐ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö******
--½ÇÉ«Mission±äÁ¿ËµÃ÷
x228903_g_IsMissionOkFail			=0	--0 ÈÎÎñÍê³É±ê¼Ç
x228903_g_DemandKill				= { { id = 540, num = 1 }, { id = 541, num = 4 } }		--±äÁ¿µÚ1Î»
x228903_g_Param_QinNumber			=1	--1 ÐèÒªÉ±ËÀÇØ²®¹âÊýÁ¿
x228903_g_Param_LubaNumber			=2	--2 ÐèÒªÏûÃðµÄÇØ¼ÒÕ¯Â·°ÔÊýÁ¿
x228903_g_MonsterList				= { [x228903_g_Param_QinNumber] = { "ÇØ²®¹â", 1 }, [x228903_g_Param_LubaNumber] = { "ÇØ¼ÒÕ¯Â·°Ô", 4 } }
x228903_g_Param_sceneid				=3	--3ºÅ£ºµ±Ç°¸±±¾ÈÎÎñµÄ³¡¾°ºÅ
x228903_g_Param_teamid				=4	--4ºÅ£º½Ó¸±±¾ÈÎÎñÊ±ºòµÄ¶ÓÎéºÅ

--**********************************ÒÔÉÏÊÇ¶¯Ì¬****************************

--ÈÎÎñÎÄ±¾ÃèÊö
x228903_g_MissionName = "l§p tÑc thø lý"
x228903_g_MissionInfo = "#{TIANSHAN_SKILL_03}"													--ÈÎÎñÃèÊö
x228903_g_MissionTarget = "    #G NhÕn Môn Quan#W#R Chüng Thª Hoành #W#{_INFOAIM263,46,18, Chüng Thª Hoành} mu¯n các hÕ · phü Thái Thú NhÕn Môn Quan giªt chªt T¥n Bá Quang và 4 tên T¥n Gia TrÕi Lµ Bá."		--ÈÎÎñÄ¿±ê
x228903_g_ContinueInfo = "#{TIANSHAN_SKILL_04}"								--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x228903_g_MissionComplete = "#{TIANSHAN_SKILL_05}"							--Íê³ÉÈÎÎñnpcËµ»°µÄ»°


--ÈÎÎñ½±Àø
x228903_g_MoneyBonus = 1000
x228903_g_exp = 2000

--MisDescEnd
--************************************************************************

x228903_g_TransScript = 400900

--¸±±¾Ãû³Æ
x228903_g_CopySceneName = "Phü Thái Thú NhÕn Môn Quan"

x228903_g_CopySceneType = FUBEN_YMGTAISHOUFU	--¸±±¾ÀàÐÍ£¬¶¨ÒåÔÚScriptGlobal.luaÀïÃæ

x228903_g_CopySceneMap = "yamen.nav"
x228903_g_Monster = "yamentianshanmis_monster.ini"
x228903_g_Exit = "yamentianshanmis_area.ini"
x228903_g_LimitMembers = 3				--¿ÉÒÔ½ø¸±±¾µÄ×îÐ¡¶ÓÎéÈËÊý
x228903_g_TickTime = 5					--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x228903_g_CloseTick = 3					--¸±±¾¹Ø±ÕÇ°µ¹¼ÆÊ±£¨µ¥Î»£º´ÎÊý£©
x228903_g_NoUserTime = 10				--¸±±¾ÖÐÃ»ÓÐÈËºó¿ÉÒÔ¼ÌÐø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x228903_g_Fuben_X = 32					--½øÈë¸±±¾µÄÎ»ÖÃX
x228903_g_Fuben_Z = 48					--½øÈë¸±±¾µÄÎ»ÖÃZ
x228903_g_Back_X = 259					--Ô´³¡¾°Î»ÖÃX
x228903_g_Back_Z = 49					--Ô´³¡¾°Î»ÖÃZ

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x228903_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		local bDone = x228903_CheckSubmit( sceneId, selfId )

		if bDone == 0 then												--ÈÎÎñÎ´Íê³É
			if GetNumText() == 1 then
				x228903_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x228903_g_MissionName )
					x228903_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		elseif bDone == 1 then											--ÈÎÎñÒÑ¾­Íê³É
			BeginEvent( sceneId )
				AddText( sceneId, x228903_g_MissionName )
				AddText( sceneId, x228903_g_ContinueInfo )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId, bDone )
		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼þ
	elseif x228903_CheckAccept( sceneId, selfId ) > 0 then
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄÐÅÏ¢
		BeginEvent( sceneId )
			AddText( sceneId, x228903_g_MissionName )
			AddText( sceneId, x228903_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, x228903_g_MissionTarget )
			AddText( sceneId, "#{M_SHOUHUO}#r" )
			AddMoneyBonus( sceneId, x228903_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId )
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x228903_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

   --Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		AddNumText( sceneId, x228903_g_ScriptId, x228903_g_CopySceneName, 3, -1 )
	elseif x228903_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x228903_g_ScriptId, x228903_g_MissionName, 3, -1 )
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x228903_CheckAccept( sceneId, selfId )
	if IsMissionHaveDone( sceneId, selfId, x228903_g_MissionId ) > 0 then
		return 0
	end

	if IsMissionHaveDone( sceneId, selfId, x228903_g_PreMissionId ) <= 0 then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		return 0
	end

	if GetLevel( sceneId, selfId ) < 30 then
		return 0
	end

	return 1
end

--**********************************
--Ñ¯ÎÊÍæ¼ÒÊÇ·ñÒª½øÈë¸±±¾
--**********************************
function x228903_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then	-- Ã»ÓÐÈÎÎñ
		return
	end

	AddText( sceneId, x228903_g_MissionInfo )
	AddText( sceneId, "#{M_MUBIAO}" )
	AddText( sceneId, x228903_g_MissionTarget )
	AddNumText( sceneId, x228903_g_ScriptId, x228903_g_CopySceneName, 10, 1 )
end

--**********************************
--½ÓÊÜ
--**********************************
function x228903_OnAccept( sceneId, selfId, targetId )
	if x228903_CheckAccept( sceneId, selfId ) == 1 then					--Ã»ÓÐÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁÐ±í
		AddMission( sceneId, selfId, x228903_g_MissionId, x228903_g_ScriptId, 1, 0, 0 )	-- kill¡¢area¡¢item
		if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then
			return
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )

		--ÏÔÊ¾ÄÚÈÝ¸æËßÍæ¼ÒÒÑ¾­½ÓÊÜÁËÈÎÎñ
		BeginEvent( sceneId )
			AddText( sceneId, x228903_g_MissionName )
			x228903_AskEnterCopyScene( sceneId, selfId )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		--ÏÔÊ¾ÄÚÈÝ¸æËßÍæ¼ÒÒÑ¾­½ÓÊÜÁËÈÎÎñ
		x228903_NotifyFailTips( sceneId, selfId, "Các hÕ ðã nh§n nhi®m vø: " .. x228903_g_MissionName )
		Msg2Player( sceneId, selfId, "#YTiªp nh§n nhi®m vø " .. x228903_g_MissionName, MSG2PLAYER_PARA )
	end
end

--**********************************
--Íæ¼ÒÍ¬Òâ½øÈë¸±±¾
--**********************************
function x228903_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then					--ÓÐÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x228903_NotifyFailTips( sceneId, selfId, "Các hÕ phäi gia nh§p vào mµt ðµi ngû" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x228903_NotifyFailTips( sceneId, selfId, "Các hÕ buµc phäi là ðµi trß·ng" )
			return
		end

		--È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊýÁ¿£¨°üÀ¨×Ô¼º£©
		local nearteammembercount = GetNearTeamCount( sceneId, selfId )
		if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
			x228903_NotifyFailTips( sceneId, selfId, "Quân cüa các hÕ b¡t buµc phäi · g¥n m¾i có th¬ ðªn h² trþ" )
			return
		end

		if nearteammembercount < x228903_g_LimitMembers then
			x228903_NotifyFailTips( sceneId, selfId, "Ít nh¤t các hÕ phäi c¥n hai lính ðªn giúp các hÕ" )
			return
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x228903_g_IsMissionOkFail, 0 )	--½«ÈÎÎñµÄµÚ0ºÅÊý¾ÝÉèÖÃÎª0,±íÊ¾Î´Íê³ÉµÄÈÎÎñ
		SetMissionByIndex( sceneId, selfId, misIndex, x228903_g_Param_sceneid, -1 )		--½«ÈÎÎñµÄµÚ3ºÅÊý¾ÝÉèÖÃÎª-1, ÓÃÓÚ±£´æ¸±±¾µÄ³¡¾°ºÅ
		x228903_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--´´½¨¸±±¾
--**********************************
function x228903_MakeCopyScene( sceneId, selfId )
	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x228903_g_CopySceneMap )						--µØÍ¼ÊÇ±ØÐëÑ¡È¡µÄ£¬¶øÇÒ±ØÐëÔÚConfig/SceneInfo.iniÀïÅäÖÃºÃ
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x228903_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x228903_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x228903_g_CopySceneType )				--ÉèÖÃ¸±±¾Êý¾Ý£¬ÕâÀï½«0ºÅË÷ÒýµÄÊý¾ÝÉèÖÃÎª999£¬ÓÃÓÚ±íÊ¾¸±±¾ºÅ999(Êý×Ö×Ô¶¨Òå)
	LuaFnSetCopySceneData_Param( sceneId, 1, x228903_g_ScriptId )					--½«1ºÅÊý¾ÝÉèÖÃÎª¸±±¾³¡¾°ÊÂ¼þ½Å±¾ºÅ
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--ÉèÖÃ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊý
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ, ³õÊ¼»¯
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾, 0¿ª·Å£¬1¹Ø±Õ
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--ÉèÖÃÀë¿ªµ¹¼ÆÊ±´ÎÊý
	LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	--±£´æ¶ÓÎéºÅ
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--É±ËÀBossµÄÊýÁ¿
	LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							--É±ËÀÂ·°ÔµÄÊýÁ¿

	LuaFnSetSceneLoad_Area( sceneId, x228903_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, x228903_g_Monster )

	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, 0 )			--¼¶±ð²î£¬CopyScene_LevelGap ÔÚ scene.lua ÖÐ¸³Öµ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--³õÊ¼»¯Íê³Éºóµ÷ÓÃ´´½¨¸±±¾º¯Êý
	if bRetSceneID > 0 then
		x228903_NotifyFailTips( sceneId, selfId, "D¸ch chuy¬n thành công!" )
	else
		x228903_NotifyFailTips( sceneId, selfId, "S¯ lßþng bän sao ðã ðªn gi¾i hÕn, ð« ngh¸ lát næa thØ lÕi!" )
	end
end

--**********************************
--¸±±¾ÊÂ¼þ
--**********************************
function x228903_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsObjValid( sceneId, leaderObjId ) ~= 1 then			-- ´¦ÓÚÎÞ·¨Ö´ÐÐÂß¼­µÄ×´Ì¬
		return
	end

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0 then
		x228903_NotifyFailTips( sceneId, leaderObjId, "Các hÕ phäi gia nh§p vào mµt ðµi ngû" )
		return
	end

	if LuaFnIsTeamLeader( sceneId, leaderObjId ) == 0 then
		x228903_NotifyFailTips( sceneId, leaderObjId, "Các hÕ buµc phäi là ðµi trß·ng" )
		return
	end

	--È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊýÁ¿£¨°üÀ¨×Ô¼º£©
	local nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )
	if nearteammembercount < x228903_g_LimitMembers then
		x228903_NotifyFailTips( sceneId, leaderObjId, "S¯ ngß¶i trong ðµi ngû cüa các hÕ không ðü" )
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x228903_g_MissionId ) > 0 then			--ÓÐÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x228903_g_MissionId )

		--½«ÈÎÎñµÄµÚ2ºÅÊý¾ÝÉèÖÃÎª¸±±¾µÄ³¡¾°ºÅ
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x228903_g_Param_sceneid, destsceneId )

		local i = 0
		local member
		for i = 0, nearteammembercount - 1 do
			member = GetNearTeamMember( sceneId, leaderObjId, i )

			if LuaFnIsObjValid( sceneId, member ) == 1 then			-- ´¦ÓÚ¿ÉÒÔÖ´ÐÐÂß¼­µÄ×´Ì¬
				NewWorld( sceneId, member, destsceneId, x228903_g_Fuben_X, x228903_g_Fuben_Z )
			end
		end
	end
end

--**********************************
--ÓÐÍæ¼Ò½øÈë¸±±¾ÊÂ¼þ
--**********************************
function x228903_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--ÓÐÍæ¼ÒÔÚ¸±±¾ÖÐËÀÍöÊÂ¼þ
--**********************************
function x228903_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--·ÅÆú
--**********************************
function x228903_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then				--ÓÐÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x228903_g_Param_sceneid )

	--É¾³ýÍæ¼ÒÈÎÎñÁÐ±íÖÐ¶ÔÓ¦µÄÈÎÎñ
	DelMission( sceneId, selfId, x228903_g_MissionId )
	x228903_NotifyFailTips( sceneId, selfId, "Nhi®m vø th¤t bÕi" )
end

--**********************************
--¼ÌÐø
--**********************************
function x228903_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x228903_g_MissionName )
		AddText( sceneId, x228903_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x228903_CheckSubmit( sceneId, selfId, selectRadioId )
	--ÅÐ¶ÏÈÎÎñÊÇ·ñÒÑ¾­Íê³É
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228903_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )				-- µÃµ½ÈÎÎñµÄÐòÁÐºÅ
	bRet = GetMissionParam( sceneId, selfId, misIndex, x228903_g_IsMissionOkFail )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--Ìá½»
--**********************************
function x228903_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--ÅÐ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if x228903_CheckSubmit( sceneId, selfId ) == 1 then
		--Ìí¼ÓÈÎÎñ½±Àø
		AddMoney( sceneId, selfId, x228903_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x228903_g_exp )

		DelMission( sceneId, selfId, x228903_g_MissionId )
		--ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ý
		MissionCom( sceneId, selfId, x228903_g_MissionId )
		Msg2Player( sceneId, selfId, "#YHoàn thành nhi®m vø: " .. x228903_g_MissionName, MSG2PLAYER_PARA )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x228903_OnKillObject( sceneId, selfId, objdataId, objId )
	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--ÊÇ·ñÊÇËùÐèÒªµÄ¸±±¾
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x228903_g_CopySceneType then
		return
	end

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--Èç¹û¸±±¾ÒÑ¾­±»ÖÃ³É¹Ø±Õ×´Ì¬£¬ÔòÉ±¹ÖÎÞÐ§
		return
	end

	local paramIndex = 0
	local monsterName = GetMonsterNamebyDataId( objdataId )
	if monsterName == x228903_g_MonsterList[x228903_g_Param_QinNumber][1] then
		paramIndex = x228903_g_Param_QinNumber
	elseif monsterName == x228903_g_MonsterList[x228903_g_Param_LubaNumber][1] then
		paramIndex = x228903_g_Param_LubaNumber
	else
		return
	end

	local num = GetMonsterOwnerCount( sceneId, objId )
	local ownerid = -1
	local strText = "Ðã giªt chªt " .. monsterName .. ": %d/" .. x228903_g_MonsterList[paramIndex][2]
	local bFinished = 0

	for i = 0, num - 1 do
		ownerid = GetMonsterOwnerID( sceneId, objId, i )

		-- ¿´ÓÐÃ»ÓÐÕâ¸öÈÎÎñ
		if ownerid and ownerid > 0 and IsHaveMission( sceneId, ownerid, x228903_g_MissionId ) > 0 then
			local misIndex = GetMissionIndexByID( sceneId, ownerid, x228903_g_MissionId )
			local count = GetMissionParam( sceneId, ownerid, misIndex, paramIndex ) + 1
			SetMissionByIndex( sceneId, ownerid, misIndex, paramIndex, count )
			local strText1 = format( strText, count )
			x228903_NotifyFailTips( sceneId, ownerid, strText1 )

			if GetMissionParam( sceneId, ownerid, misIndex, x228903_g_Param_QinNumber ) >=
				x228903_g_MonsterList[x228903_g_Param_QinNumber][2] then
				if GetMissionParam( sceneId, ownerid, misIndex, x228903_g_Param_LubaNumber ) >=
					x228903_g_MonsterList[x228903_g_Param_LubaNumber][2] then
						SetMissionByIndex( sceneId, ownerid, misIndex, x228903_g_IsMissionOkFail, 1 )
						x228903_NotifyFailTips( sceneId, ownerid, "Nhi®m vø hoàn thành" )
						bFinished = 1
				end
			end
		end
	end

	if bFinished == 1 then
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
		local member
		strText = format( "Các hÕ s¨ r¶i khöi n½i này trong vòng %d giây næa", x228903_g_CloseTick * x228903_g_TickTime )

		for i = 0, membercount - 1 do
			member = LuaFnGetCopyScene_HumanObjId( sceneId, i )

			if LuaFnIsObjValid( sceneId, member ) == 1 then
				x228903_NotifyFailTips( sceneId, member, strText )
			end
		end
	end
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x228903_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x228903_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼þ
--**********************************
function x228903_OnCopySceneTimer( sceneId, nowTime )

	--¸±±¾Ê±ÖÓ¶ÁÈ¡¼°ÉèÖÃ
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--È¡µÃÒÑ¾­Ö´ÐÐµÄ¶¨Ê±´ÎÊý
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--ÉèÖÃÐÂµÄ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊý

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	-- Ã»ÓÐÈËµÄÊ±ºò¹Ø±Õ¸±±¾
	if leaveFlag == 1 then															--ÐèÒªÀë¿ª
		--Àë¿ªµ¹¼ÆÊ±¼äµÄ¶ÁÈ¡ºÍÉèÖÃ
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x228903_g_CloseTick then										--µ¹¼ÆÊ±¼äµ½£¬´ó¼Ò¶¼³öÈ¥°É
			--½«µ±Ç°¸±±¾³¡¾°ÀïµÄËùÓÐÈË´«ËÍ»ØÔ­À´½øÈëÊ±ºòµÄ³¡¾°
			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_OnEnterArea( sceneId, mems[i] )
				end
			end
		else
			--Í¨Öªµ±Ç°¸±±¾³¡¾°ÀïµÄËùÓÐÈË£¬³¡¾°¹Ø±Õµ¹¼ÆÊ±¼ä
			local strText = format( "Các hÕ s¨ r¶i khöi n½i này trong vòng %d giây næa", ( x228903_g_CloseTick - leaveTickCount ) * x228903_g_TickTime )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	else
		local monstercount = GetMonsterCount( sceneId )
		if monstercount <= 0 then
			--Í¨Öªµ±Ç°¸±±¾³¡¾°ÀïµÄËùÓÐÈË£¬³¡¾°¹Ø±Õµ¹¼ÆÊ±¼ä
			local strText = format( "Các hÕ s¨ r¶i khöi n½i này trong vòng %d giây næa", x228903_g_CloseTick * x228903_g_TickTime )
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_NotifyFailTips( sceneId, mems[i], strText )
				end
			end

			return
		end
	end
end

-- Íæ¼Ò½øÈë´«ËÍµã
function x228903_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x228903_g_TransScript, "TransferFunc", sceneId, selfId, x228903_g_SceneID, x228903_g_Back_X, x228903_g_Back_Z )
end

-- Íæ¼ÒÍ£ÁôÔÚ´«ËÍµã
function x228903_OnTimer( sceneId, selfId )
	return
end

-- Íæ¼ÒÀë¿ª´«ËÍµã
function x228903_OnLeaveArea( sceneId, selfId )
	return
end

function x228903_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
