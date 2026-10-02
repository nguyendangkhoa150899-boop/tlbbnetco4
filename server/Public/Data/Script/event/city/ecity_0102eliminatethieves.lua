--¸±±¾ÈÎÎñ
--ÏûÃğÔÚ¿ó³¡µ·ÂÒµÄĞ¡Ôô

--************************************************************************
--MisDescBegin

--½Å±¾ºÅ
x600004_g_ScriptId = 600004

--ÈÎÎñºÅ
x600004_g_MissionId = 1105

--Ä¿±êNPC
x600004_g_Name = "Mã ºng Hùng"

--ÈÎÎñµÈ¼¶
x600004_g_MissionLevel = 10000

--ÈÎÎñ¹éÀà
x600004_g_MissionKind = 50

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x600004_g_IfMissionElite = 0

--********ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈİ£¬ÓÃÓÚÔÚÈÎÎñÁĞ±íÖĞ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö******
--½ÇÉ«Mission±äÁ¿ËµÃ÷
x600004_g_IsMissionOkFail			=0	--0 ÈÎÎñÍê³É±ê¼Ç
x600004_g_MissionParam_SubId		=1	--1 ×ÓÈÎÎñ½Å±¾ºÅ´æ·ÅÎ»ÖÃ
x600004_g_MissionParam_KillNumber	=2	--2 ĞèÒªÏûÃğµÄ¹ÖÎïÊıÁ¿
x600004_g_Param_sceneid				=3	--3ºÅ£ºµ±Ç°¸±±¾ÈÎÎñµÄ³¡¾°ºÅ
x600004_g_Param_teamid				=4	--4ºÅ£º½Ó¸±±¾ÈÎÎñÊ±ºòµÄ¶ÓÎéºÅ
x600004_g_Param_killcount			=5	--5ºÅ£ºÉ±ËÀÈÎÎñ¹ÖµÄÊıÁ¿
x600004_g_Param_time				=6	--6ºÅ£ºÍê³É¸±±¾ËùÓÃÊ±¼ä(µ¥Î»£ºÃë)
--6ºÅ£ºÎ´ÓÃ
--7ºÅ£ºÎ´ÓÃ

--Ñ­»·ÈÎÎñµÄÊı¾İË÷Òı£¬ÀïÃæ´æ×ÅÒÑ×öµÄ»·Êı
x600004_g_MissionRound = 38
--**********************************ÒÔÉÏÊÇ¶¯Ì¬****************************

--ÈÎÎñÎÄ±¾ÃèÊö
x600004_g_MissionName = "Nhi®m vø công trình"
x600004_g_MissionInfo = ""													--ÈÎÎñÃèÊö
x600004_g_MissionTarget = "    Di®t bö t¤t cä trµm c¡p n±i loÕn."						--ÈÎÎñÄ¿±ê
x600004_g_ContinueInfo = "    Nhi®m vø cüa các hÕ vçn chßa hoàn thành à?"						--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x600004_g_SubmitInfo = "    Sñ tình tiªn tri¬n nhß thª nào r°i?"								--Íê³ÉÎ´Ìá½»Ê±µÄnpc¶Ô»°
x600004_g_MissionComplete = "    Làm t¯t l¡m, r¤t t¯t r¤t t¯t."						--Íê³ÉÈÎÎñnpcËµ»°µÄ»°

x600004_g_Parameter_Kill_CountRandom = { { id = 300473, numNeeded = 2, numKilled = 5 } }

-- Í¨ÓÃ³ÇÊĞÈÎÎñ½Å±¾
x600004_g_CityMissionScript = 600001
x600004_g_EngineeringScript = 600002

--ÈÎÎñ½±Àø

--MisDescEnd
--************************************************************************

--¸±±¾Ãû³Æ
x600004_g_CopySceneName = "Khoáng trß¶ng"

x600004_g_CopySceneType = FUBEN_MINE	--¸±±¾ÀàĞÍ£¬¶¨ÒåÔÚScriptGlobal.luaÀïÃæ

x600004_g_CopySceneMap = "kuangchang.nav"
x600004_g_Exit = "kuangchang_area.ini"
x600004_g_LimitMembers = 1				--¿ÉÒÔ½ø¸±±¾µÄ×îĞ¡¶ÓÎéÈËÊı
x600004_g_TickTime = 5					--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x600004_g_LimitTotalHoldTime = 360		--¸±±¾¿ÉÒÔ´æ»îµÄÊ±¼ä£¨µ¥Î»£º´ÎÊı£©,Èç¹û´ËÊ±¼äµ½ÁË£¬ÔòÈÎÎñ½«»áÊ§°Ü
x600004_g_LimitTimeSuccess = 500		--¸±±¾Ê±¼äÏŞÖÆ£¨µ¥Î»£º´ÎÊı£©£¬Èç¹û´ËÊ±¼äµ½ÁË£¬ÈÎÎñÍê³É
x600004_g_CloseTick = 3					--¸±±¾¹Ø±ÕÇ°µ¹¼ÆÊ±£¨µ¥Î»£º´ÎÊı£©
x600004_g_NoUserTime = 300				--¸±±¾ÖĞÃ»ÓĞÈËºó¿ÉÒÔ¼ÌĞø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x600004_g_DeadTrans = 0					--ËÀÍö×ªÒÆÄ£Ê½£¬0£ºËÀÍöºó»¹¿ÉÒÔ¼ÌĞøÔÚ¸±±¾£¬1£ºËÀÍöºó±»Ç¿ÖÆÒÆ³ö¸±±¾
x600004_g_Fuben_X = 17					--½øÈë¸±±¾µÄÎ»ÖÃX
x600004_g_Fuben_Z = 15					--½øÈë¸±±¾µÄÎ»ÖÃZ
x600004_g_Back_X = 66					--Ô´³¡¾°Î»ÖÃX
x600004_g_Back_Z = 56					--Ô´³¡¾°Î»ÖÃZ

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x600004_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600004_g_Name then		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600004_g_MissionId ) > 0 then
		local bDone = x600004_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600004_g_SubmitInfo
		else
			strText = x600004_g_ContinueInfo
		end

		if bDone == 0 then												--ÈÎÎñÎ´Íê³É
			if GetNumText() == 1 then
				x600004_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x600004_g_MissionName )
					x600004_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		elseif bDone == 1 then											--ÈÎÎñÒÑ¾­Íê³É
			BeginEvent( sceneId )
				AddText( sceneId, x600004_g_MissionName )
				AddText( sceneId, strText )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x600004_g_ScriptId, x600004_g_MissionId, bDone )
		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x600004_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600004_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600004_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x600004_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600004_g_Name then		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

   --Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600004_g_MissionId ) > 0 then
		AddNumText( sceneId, x600004_g_ScriptId, x600004_g_MissionName,3,-1 )
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x600004_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600004_g_EngineeringScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--Ñ¯ÎÊÍæ¼ÒÊÇ·ñÒª½øÈë¸±±¾
--**********************************
function x600004_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600004_g_MissionId ) <= 0 then	-- Ã»ÓĞÈÎÎñ
		return
	end

	local missionInfo
	if random(2) == 1 then
		missionInfo = format( "    Trong h¥m mö · thành ph¯, có mµt nhóm cß¾p ğang ğªn n±i loÕn, c¥n các hÕ ği ğªn ğó ğu±i chúng" )
	else
		missionInfo = format( "    Có mµt nhóm cß¾p vô duyên vô c¾ ğªn gây r¯i · h¥m mö, trông ch¶ vào các hÕ cä ğ¤y" )
	end

	AddText( sceneId, missionInfo )
	AddText( sceneId, "#{M_MUBIAO}" )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600004_g_MissionId )
	local KillNumber = GetMissionParam( sceneId, selfId, misIndex, x600004_g_MissionParam_KillNumber )
	AddText( sceneId, "    Trong h¥m mö giªt chªt  " .. KillNumber .. "  tên cß¾p n±i loÕn" )
	AddNumText( sceneId, x600004_g_ScriptId, "Ra vào h¥m mö", 10, 1 )
end

--**********************************
--½ÓÊÜ
--**********************************
function x600004_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600004_g_MissionId ) == 0 then					--Ã»ÓĞÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		if GetLevel( sceneId, selfId ) < 20 then
			CallScriptFunction( x600004_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Không ğü ğÆng c¤p" )
			return
		end

		--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
		AddMission( sceneId, selfId, x600004_g_MissionId, x600004_g_ScriptId, 1, 0, 0 )	-- kill¡¢area¡¢item
		if IsHaveMission( sceneId, selfId, x600004_g_MissionId ) <= 0 then
			return
		end

		CallScriptFunction( x600004_g_EngineeringScript, "OnAccept", sceneId, selfId, targetId, x600004_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600004_g_MissionId )
		local KillNumber = 9 + random(11)
		SetMissionByIndex( sceneId, selfId, misIndex, x600004_g_MissionParam_KillNumber, KillNumber )

		--ÏÔÊ¾ÄÚÈİ¸æËßÍæ¼ÒÒÑ¾­½ÓÊÜÁËÈÎÎñ
		BeginEvent( sceneId )
			AddText( sceneId, x600004_g_MissionName )
			x600004_AskEnterCopyScene( sceneId, selfId )
			AddText( sceneId, "#r    Các hÕ ğã nh§n " .. x600004_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--Íæ¼ÒÍ¬Òâ½øÈë¸±±¾
--**********************************
function x600004_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600004_g_MissionId ) > 0 then					--ÓĞÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600004_g_MissionId )
		
		--changed by xindefeng
		--¸±±¾ĞÂ»úÖÆ:ÎŞÂÛÊ²Ã´Ô­Òò,ÔÚÎ´Íê³ÉÈÎÎñ¶ø³ö¸±±¾,¸±±¾²»¶ÔÍæ¼ÒÉíÉÏµÄÈÎÎñ×öÈÎºÎ¸Ä¶¯(ÉèÖÃÊ§°Ü»òÕßÉ¾³ıÈÎÎñ),¶øÍæ¼ÒÔÙ½ø¸Ã¸±±¾Ê±,¶¼ÒªÖØĞÂ³õÊ¼»¯ÈÎÎñÊı¾İ,¶øÇÒ¸±±¾¶¼ÒªÖØĞÂ´´½¨
		--local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600004_g_Param_sceneid )

		--if copysceneid >= 0 then												--½ø¹ı¸±±¾
		--	--½«×Ô¼º´«ËÍµ½¸±±¾³¡¾°
		--	if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
		--		NewWorld( sceneId, selfId, copysceneid, x600004_g_Fuben_X, x600004_g_Fuben_Z )
		--		return
		--	end
		--end

		SetMissionByIndex( sceneId, selfId, misIndex, x600004_g_IsMissionOkFail, 0 )	--½«ÈÎÎñµÄµÚ0ºÅÊı¾İÉèÖÃÎª0,±íÊ¾Î´Íê³ÉµÄÈÎÎñ
		SetMissionByIndex( sceneId, selfId, misIndex, x600004_g_Param_sceneid, -1 )		--½«ÈÎÎñµÄµÚ3ºÅÊı¾İÉèÖÃÎª-1, ÓÃÓÚ±£´æ¸±±¾µÄ³¡¾°ºÅ
		
		--add by xindefeng
		SetMissionByIndex( sceneId, selfId, misIndex, x600004_g_Param_killcount, 0 )	--½«ÈÎÎñµÄµÚ5ºÅÊı¾İÉèÖÃÎª0, ÉèÖÃÍæ¼ÒÉ±ËÀ¹ÖÎïÊıÁ¿Îª0
		
		x600004_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--´´½¨¸±±¾
--**********************************
function x600004_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600004_g_CopySceneMap )						--µØÍ¼ÊÇ±ØĞëÑ¡È¡µÄ£¬¶øÇÒ±ØĞëÔÚConfig/SceneInfo.iniÀïÅäÖÃºÃ
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600004_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600004_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600004_g_CopySceneType )				--ÉèÖÃ¸±±¾Êı¾İ£¬ÕâÀï½«0ºÅË÷ÒıµÄÊı¾İÉèÖÃÎª999£¬ÓÃÓÚ±íÊ¾¸±±¾ºÅ999(Êı×Ö×Ô¶¨Òå)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600004_g_ScriptId )					--½«1ºÅÊı¾İÉèÖÃÎª¸±±¾³¡¾°ÊÂ¼ş½Å±¾ºÅ
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--ÉèÖÃ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊı
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ, ³õÊ¼»¯
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾, 0¿ª·Å£¬1¹Ø±Õ
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--ÉèÖÃÀë¿ªµ¹¼ÆÊ±´ÎÊı
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--É±ËÀBossµÄÊıÁ¿

	local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127
	
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = floor( PlayerMaxLevel/10 ) * 10   -- [NetCo4 02/10] cu: iniLevel = PlayerMaxLevel (119) -> nap kuangchang_monster_119.ini khong co -> khong tao duoc pho ban
	end

	LuaFnSetSceneLoad_Area( sceneId, x600004_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "kuangchang_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --¼¶±ğ²î£¬CopyScene_LevelGap ÔÚ scene.lua ÖĞ¸³Öµ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--³õÊ¼»¯Íê³Éºóµ÷ÓÃ´´½¨¸±±¾º¯Êı
	if bRetSceneID > 0 then
		x600004_NotifyFailTips( sceneId, selfId, "D¸ch chuy¬n thành công!" )
	else
		x600004_NotifyFailTips( sceneId, selfId, "S¯ lßşng bän sao ğã ğªn gi¾i hÕn, ğ« ngh¸ lát næa thØ lÕi!" )
	end

end

--**********************************
--¸±±¾ÊÂ¼ş
--**********************************
function x600004_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- ´¦ÓÚÎŞ·¨Ö´ĞĞÂß¼­µÄ×´Ì¬
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600004_g_MissionId ) > 0 then			--ÓĞÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600004_g_MissionId )

		--½«ÈÎÎñµÄµÚ2ºÅÊı¾İÉèÖÃÎª¸±±¾µÄ³¡¾°ºÅ
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600004_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600004_g_Fuben_X, x600004_g_Fuben_Z )
	end
end

--**********************************
--ÓĞÍæ¼Ò½øÈë¸±±¾ÊÂ¼ş
--**********************************
function x600004_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600004_g_MissionId ) == 0 then				--Èç¹û½øÈë¸±±¾Ç°É¾³ıÈÎÎñ£¬ÔòÖ±½Ó´«ËÍ»Ø
		x600004_NotifyFailTips( sceneId, selfId, "Các hÕ ğã không nh§n nhi®m vø này t× trß¾c" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--È¡µÃ½øÈë¸±±¾Ê±ËùÔÚ³¡¾°ºÅ
		NewWorld( sceneId, selfId, oldsceneId, x600004_g_Back_X, x600004_g_Back_Z )
		return
	end

	local monstercount = GetMonsterCount( sceneId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600004_g_MissionId )
	local KillNumber = GetMissionParam( sceneId, selfId, misIndex, x600004_g_MissionParam_KillNumber )

	-- ¸Éµô¶àÓàµÄ¹Ö
	if monstercount > KillNumber then
		local i
		for i = 0, monstercount - KillNumber - 1 do
			LuaFnDeleteMonster( sceneId, GetMonsterObjID( sceneId, i ) )
		end
	end
end

--**********************************
--ÓĞÍæ¼ÒÔÚ¸±±¾ÖĞËÀÍöÊÂ¼ş
--**********************************
function x600004_OnHumanDie( sceneId, selfId, killerId )
	if x600004_g_DeadTrans == 1 then														--ËÀÍöºóĞèÒª±»Ç¿ÖÆÌß³ö³¡¾°
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ
		NewWorld( sceneId, selfId, oldsceneId, x600004_g_Back_X, x600004_g_Back_Z )
	end
end

--**********************************
--·ÅÆú
--**********************************
function x600004_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600004_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600004_g_Param_sceneid )

	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	CallScriptFunction( x600004_g_EngineeringScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--Èç¹ûÔÚ¸±±¾ÀïÉ¾³ıÈÎÎñ£¬ÔòÖ±½Ó´«ËÍ»Ø
		x600004_NotifyFailTips( sceneId, selfId, "Nhi®m vø th¤t bÕi!" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ
		NewWorld( sceneId, selfId, oldsceneId, x600004_g_Back_X, x600004_g_Back_Z )
	end
end

--**********************************
-- »Ø³Ç£¬Ö»ÓĞ³ÇÊĞÈÎÎñ¸±±¾¿ÉÒÔµ÷ÓÃ´Ë½Ó¿Ú
--**********************************
function x600004_BackToCity( sceneId, selfId )
	--changed by xindefeng
	--¸±±¾ĞÂ»úÖÆ:¼ûx600004_AcceptEnterCopyScene()
	--CallScriptFunction( x600004_g_CityMissionScript, "BackToCity", sceneId, selfId, x600004_g_MissionId, x600004_g_Back_X, x600004_g_Back_Z )
	
	--±¾ÏëĞŞ¸Äx600004_g_CityMissionScriptµÄx600004_BackToCity()º¯Êı,µ«ÅÂÒıÓÃËüµÄ½Å±¾Ì«¶à,ËùÒÔ±¾½Å±¾²»ÒıÓÃ
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--È¡µÃ½øÈë¸±±¾Ê±ËùÔÚ³¡¾°ºÅ
	CallScriptFunction( 400900, "TransferFunc", sceneId, selfId, oldsceneId, x600004_g_Back_X, x600004_g_Back_Z )	--´«ËÍ
end

--**********************************
--¼ÌĞø
--**********************************
function x600004_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600004_g_MissionName )
		AddText( sceneId, x600004_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600004_g_ScriptId, x600004_g_MissionId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x600004_CheckSubmit( sceneId, selfId, selectRadioId )
	--ÅĞ¶ÏÈÎÎñÊÇ·ñÒÑ¾­Íê³É
	local ret = CallScriptFunction( x600004_g_EngineeringScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--Ìá½»
--**********************************
function x600004_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600004_g_Name then		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if x600004_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600004_g_EngineeringScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x600004_OnKillObject( sceneId, selfId, objdataId, objId )
	if IsHaveMission( sceneId, selfId, x600004_g_MissionId ) == 0 then
		return
	end

	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--ÊÇ·ñÊÇËùĞèÒªµÄ¸±±¾
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x600004_g_CopySceneType then
		return
	end

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--Èç¹û¸±±¾ÒÑ¾­±»ÖÃ³É¹Ø±Õ×´Ì¬£¬ÔòÉ±¹ÖÎŞĞ§
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600004_g_MissionId )
	local killedbossnumber = GetMissionParam( sceneId, selfId, misIndex, x600004_g_Param_killcount )	--É±ËÀBossµÄÊıÁ¿

	killedbossnumber = killedbossnumber + 1
	SetMissionByIndex( sceneId, selfId, misIndex, x600004_g_Param_killcount, killedbossnumber )	--ÉèÖÃÉ±ËÀBossµÄÊıÁ¿

	local KillNumber = GetMissionParam( sceneId, selfId, misIndex, x600004_g_MissionParam_KillNumber )

	local strText = format( "Ğã giªt chªt ğám cß¾p n±i loÕn: %d/%d", killedbossnumber, KillNumber )
	x600004_NotifyFailTips( sceneId, selfId, strText )

	if killedbossnumber >= KillNumber then
		--ÉèÖÃÈÎÎñÍê³É±êÖ¾
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		strText = format( "Hoàn t¤t nhi®m vø, trong vòng %d giây næa s¨ ğßa ğªn ch² ra vào", x600004_g_CloseTick * x600004_g_TickTime )
		x600004_NotifyFailTips( sceneId, selfId, strText )

		--½«ÈÎÎñµÄµÚ1ºÅÊı¾İÉèÖÃÎª1,±íÊ¾Íê³ÉµÄÈÎÎñ
		SetMissionByIndex( sceneId, selfId, misIndex, x600004_g_IsMissionOkFail, 1 )	--ÉèÖÃÈÎÎñÊı¾İ
	end
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x600004_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x600004_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼ş
--**********************************
function x600004_OnCopySceneTimer( sceneId, nowTime )

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

		if leaveTickCount >= x600004_g_CloseTick then										--µ¹¼ÆÊ±¼äµ½£¬´ó¼Ò¶¼³öÈ¥°É
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ

			--½«µ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË´«ËÍ»ØÔ­À´½øÈëÊ±ºòµÄ³¡¾°
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x600004_g_Back_X, x600004_g_Back_Z )
				end
			end
		else
			--Í¨Öªµ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË£¬³¡¾°¹Ø±Õµ¹¼ÆÊ±¼ä
			local strText = format( "Các hÕ s¨ r¶i khöi n½i này trong vòng %d giây næa", ( x600004_g_CloseTick - leaveTickCount ) * x600004_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600004_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

function x600004_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
