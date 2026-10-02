--¸±±¾ÈÎÎñ
--¸Ï×ßÁ÷Ã¥¶ñ°Ô

--************************************************************************
--MisDescBegin

--½Å±¾ºÅ
x600019_g_ScriptId = 600019

--ÈÎÎñºÅ
x600019_g_MissionId = 1108

--Ä¿±êNPC
x600019_g_Name = "Mµc D¸ch"

--ÈÎÎñµÈ¼¶
x600019_g_MissionLevel = 10000

--ÈÎÎñ¹éÀà
x600019_g_MissionKind = 50

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x600019_g_IfMissionElite = 0

--********ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈİ£¬ÓÃÓÚÔÚÈÎÎñÁĞ±íÖĞ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö******
--½ÇÉ«Mission±äÁ¿ËµÃ÷
x600019_g_IsMissionOkFail			=0	--0 ÈÎÎñÍê³É±ê¼Ç
x600019_g_MissionParam_SubId		=1	--1 ×ÓÈÎÎñ½Å±¾ºÅ´æ·ÅÎ»ÖÃ
x600019_g_MissionParam_KillNumber	=2	--2 ĞèÒªÏûÃğµÄ¹ÖÎïÊıÁ¿
x600019_g_Param_sceneid				=3	--3ºÅ£ºµ±Ç°¸±±¾ÈÎÎñµÄ³¡¾°ºÅ
x600019_g_Param_teamid				=4	--4ºÅ£º½Ó¸±±¾ÈÎÎñÊ±ºòµÄ¶ÓÎéºÅ
x600019_g_Param_killcount			=5	--5ºÅ£ºÉ±ËÀÈÎÎñ¹ÖµÄÊıÁ¿
x600019_g_Param_time				=6	--6ºÅ£ºÍê³É¸±±¾ËùÓÃÊ±¼ä(µ¥Î»£ºÃë)
--6ºÅ£ºÎ´ÓÃ
--7ºÅ£ºÎ´ÓÃ

--Ñ­»·ÈÎÎñµÄÊı¾İË÷Òı£¬ÀïÃæ´æ×ÅÒÑ×öµÄ»·Êı
x600019_g_MissionRound = 44
--**********************************ÒÔÉÏÊÇ¶¯Ì¬****************************

--ÈÎÎñÎÄ±¾ÃèÊö
x600019_g_MissionName = "Nhi®m vø thß½ng nghi®p"
x600019_g_MissionInfo = ""													--ÈÎÎñÃèÊö
x600019_g_MissionTarget = "    Nói chuy®n v¾i Mµc D¸ch, ğ¬ ông ta ğßa các hÕ ği ra chş, phäi giáo hu¤n lû ác bá Ñc hiªp thß½ng nhân trong thành th¸. "		--ÈÎÎñÄ¿±ê
x600019_g_ContinueInfo = "    Nhi®m vø cüa các hÕ vçn chßa hoàn thành à?"						--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x600019_g_SubmitInfo = "    Sñ tình tiªn tri¬n nhß thª nào r°i?"								--Íê³ÉÎ´Ìá½»Ê±µÄnpc¶Ô»°
x600019_g_MissionComplete = "    Làm t¯t l¡m, r¤t t¯t r¤t t¯t. "						--Íê³ÉÈÎÎñnpcËµ»°µÄ»°

x600019_g_Parameter_Kill_CountRandom = { { id = 300474, numNeeded = 2, numKilled = 5 } }

-- Í¨ÓÃ³ÇÊĞÈÎÎñ½Å±¾
x600019_g_CityMissionScript = 600001
x600019_g_MarketScript = 600017

--ÈÎÎñ½±Àø

--MisDescEnd
--************************************************************************

x600019_g_TransScript = 400900

--¸±±¾Ãû³Æ
x600019_g_CopySceneName = "Chş phiên"

x600019_g_CopySceneType = FUBEN_CHUCKOUTVILLAIN	--¸±±¾ÀàĞÍ£¬¶¨ÒåÔÚScriptGlobal.luaÀïÃæ

x600019_g_CopySceneMap = "jishi.nav"
x600019_g_Exit = "jishi_area.ini"
x600019_g_TickTime = 5					--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x600019_g_LimitTotalHoldTime = 480		--¸±±¾¿ÉÒÔ´æ»îµÄÊ±¼ä£¨µ¥Î»£º´ÎÊı£©,Èç¹û´ËÊ±¼äµ½ÁË£¬ÔòÈÎÎñ½«»áÊ§°Ü
x600019_g_LimitTimeSuccess = 500		--¸±±¾Ê±¼äÏŞÖÆ£¨µ¥Î»£º´ÎÊı£©£¬Èç¹û´ËÊ±¼äµ½ÁË£¬ÈÎÎñÍê³É
x600019_g_CloseTick = 3					--¸±±¾¹Ø±ÕÇ°µ¹¼ÆÊ±£¨µ¥Î»£º´ÎÊı£©
x600019_g_NoUserTime = 10				--¸±±¾ÖĞÃ»ÓĞÈËºó¿ÉÒÔ¼ÌĞø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x600019_g_DeadTrans = 0					--ËÀÍö×ªÒÆÄ£Ê½£¬0£ºËÀÍöºó»¹¿ÉÒÔ¼ÌĞøÔÚ¸±±¾£¬1£ºËÀÍöºó±»Ç¿ÖÆÒÆ³ö¸±±¾
x600019_g_Fuben_X = 42					--½øÈë¸±±¾µÄÎ»ÖÃX
x600019_g_Fuben_Z = 47					--½øÈë¸±±¾µÄÎ»ÖÃZ
x600019_g_Back_X = 47					--Ô´³¡¾°Î»ÖÃX
x600019_g_Back_Z = 92					--Ô´³¡¾°Î»ÖÃZ
x600019_g_NeedMonsterGroupID = 1		--Boss µÄ×éºÅ
x600019_g_TotalNeedKillBoss=11			--ĞèÒªÉ±ËÀBossÊıÁ¿

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x600019_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600019_g_Name then		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	--Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600019_g_MissionId ) > 0 then
		local bDone = x600019_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600019_g_SubmitInfo
		else
			strText = x600019_g_ContinueInfo
		end

		if bDone == 0 then												--ÈÎÎñÎ´Íê³É
			if GetNumText() == 1 then
				x600019_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x600019_g_MissionName )
					x600019_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		elseif bDone == 1 then											--ÈÎÎñÒÑ¾­Íê³É
			BeginEvent( sceneId )
				AddText( sceneId, x600019_g_MissionName )
				AddText( sceneId, strText )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x600019_g_ScriptId, x600019_g_MissionId, bDone )
		end
	--Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	elseif x600019_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600019_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600019_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x600019_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600019_g_Name then		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

   --Èç¹ûÒÑ½Ó´ËÈÎÎñ
	if IsHaveMission( sceneId, selfId, x600019_g_MissionId ) > 0 then
		AddNumText( sceneId, x600019_g_ScriptId, x600019_g_MissionName,3,-1 )
	end
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x600019_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600019_g_MarketScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--Ñ¯ÎÊÍæ¼ÒÊÇ·ñÒª½øÈë¸±±¾
--**********************************
function x600019_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600019_g_MissionId ) <= 0 then	-- Ã»ÓĞÈÎÎñ
		return
	end

	local missionInfo
	if random(2) == 1 then
		missionInfo = format( "    Thành ph¯ này t× trß¾c t¾i nay an ninh tr§t tñ r¤t t¯t, nhßng g¥n ğây không biªt có b÷n lßu manh du thñc t× ğâu ğªn phäi trông ch¶ vào tay ngh« cüa các hÕ thôi" )
	else
		missionInfo = format( "    An ninh cüa chş là r¤t quan tr÷ng, các hÕ hãy ği lo vi®c này ği, nhìn th¤y b÷n lßu manh là giªt chªt hªt không tha" )
	end

	AddText( sceneId, missionInfo )
	AddText( sceneId, "#{M_MUBIAO}" )
	AddText( sceneId, "    Tiêu di®t t¤t cä b÷n lßu manh ác bá" )
	AddNumText( sceneId, x600019_g_ScriptId, "Ği vào chş", 10, 1 )
end

--**********************************
--½ÓÊÜ
--**********************************
function x600019_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600019_g_MissionId ) == 0 then					--Ã»ÓĞÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		if GetLevel( sceneId, selfId ) < 40 then
			CallScriptFunction( x600019_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Không ğü ğÆng c¤p" )
			return
		end

		--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
		AddMission( sceneId, selfId, x600019_g_MissionId, x600019_g_ScriptId, 1, 0, 0 )	-- kill¡¢area¡¢item
		if IsHaveMission( sceneId, selfId, x600019_g_MissionId ) <= 0 then
			return
		end

		CallScriptFunction( x600019_g_MarketScript, "OnAccept", sceneId, selfId, targetId, x600019_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600019_g_MissionId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600019_g_MissionParam_KillNumber, x600019_g_TotalNeedKillBoss )

		--ÏÔÊ¾ÄÚÈİ¸æËßÍæ¼ÒÒÑ¾­½ÓÊÜÁËÈÎÎñ
		BeginEvent( sceneId )
			AddText( sceneId, x600019_g_MissionName )
			x600019_AskEnterCopyScene( sceneId, selfId )
			AddText( sceneId, "#r    Các hÕ ğã nh§n " .. x600019_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--Íæ¼ÒÍ¬Òâ½øÈë¸±±¾
--**********************************
function x600019_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600019_g_MissionId ) > 0 then					--ÓĞÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600019_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600019_g_Param_sceneid )

		--changed by xindefeng
		--¸±±¾ĞÂ»úÖÆ:ÎŞÂÛÊ²Ã´Ô­Òò,ÔÚÎ´Íê³ÉÈÎÎñ¶ø³ö¸±±¾,¸±±¾²»¶ÔÍæ¼ÒÉíÉÏµÄÈÎÎñ×öÈÎºÎ¸Ä¶¯(ÉèÖÃÊ§°Ü»òÕßÉ¾³ıÈÎÎñ),¶øÍæ¼ÒÔÙ½ø¸Ã¸±±¾Ê±,¶¼ÒªÖØĞÂ³õÊ¼»¯ÈÎÎñÊı¾İ,¶øÇÒ¸±±¾¶¼ÒªÖØĞÂ´´½¨		
		--if copysceneid > 0 then															--½ø¹ı¸±±¾
		--	-- Ö»ÒªÔÚÀïÃæÃ»ÓĞÍê³É£¬¾ÍËãÊ§°Ü£¬ĞèÒªÖØ×ö
		--	x600019_NotifyFailTips( sceneId, selfId, "ÈÎÎñÊ§°Ü£¬Çë·ÅÆúÖØĞÂ½ÓÈ¡" )
		--	return
		--end
		
		SetMissionByIndex( sceneId, selfId, misIndex, x600019_g_IsMissionOkFail, 0 )	--½«ÈÎÎñµÄµÚ0ºÅÊı¾İÉèÖÃÎª0,±íÊ¾Î´Íê³ÉµÄÈÎÎñ
		SetMissionByIndex( sceneId, selfId, misIndex, x600019_g_Param_sceneid, -1 )		--½«ÈÎÎñµÄµÚ3ºÅÊı¾İÉèÖÃÎª-1, ÓÃÓÚ±£´æ¸±±¾µÄ³¡¾°ºÅ
		
		--add by xindefeng
		SetMissionByIndex( sceneId, selfId, misIndex, x600019_g_Param_killcount, 0 )	--½«ÈÎÎñµÄµÚ5ºÅÊı¾İÉèÖÃÎª0, ÉèÖÃÍæ¼ÒÉ±ËÀ¹ÖÎïÊıÁ¿Îª0
		
		x600019_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--´´½¨¸±±¾
--**********************************
function x600019_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600019_g_CopySceneMap )						--µØÍ¼ÊÇ±ØĞëÑ¡È¡µÄ£¬¶øÇÒ±ØĞëÔÚConfig/SceneInfo.iniÀïÅäÖÃºÃ
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600019_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600019_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600019_g_CopySceneType )				--ÉèÖÃ¸±±¾Êı¾İ£¬ÕâÀï½«0ºÅË÷ÒıµÄÊı¾İÉèÖÃÎª999£¬ÓÃÓÚ±íÊ¾¸±±¾ºÅ999(Êı×Ö×Ô¶¨Òå)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600019_g_ScriptId )					--½«1ºÅÊı¾İÉèÖÃÎª¸±±¾³¡¾°ÊÂ¼ş½Å±¾ºÅ
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
		iniLevel = floor( PlayerMaxLevel/10 ) * 10   -- [NetCo4 02/10] cu: iniLevel = PlayerMaxLevel (119) -> nap jishi_monster_119.ini khong co -> khong tao duoc pho ban
	end

	LuaFnSetSceneLoad_Area( sceneId, x600019_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "jishi_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --¼¶±ğ²î£¬CopyScene_LevelGap ÔÚ scene.lua ÖĞ¸³Öµ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--³õÊ¼»¯Íê³Éºóµ÷ÓÃ´´½¨¸±±¾º¯Êı
	if bRetSceneID > 0 then
		x600019_NotifyFailTips( sceneId, selfId, "D¸ch chuy¬n thành công!" )
	else
		x600019_NotifyFailTips( sceneId, selfId, "S¯ lßşng bän sao ğã ğªn gi¾i hÕn, ğ« ngh¸ lát næa thØ lÕi!" )
	end

end

--**********************************
--¸±±¾ÊÂ¼ş
--**********************************
function x600019_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsObjValid( sceneId, leaderObjId ) ~= 1 then					-- ´¦ÓÚÎŞ·¨Ö´ĞĞÂß¼­µÄ×´Ì¬
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600019_g_MissionId ) > 0 then			--ÓĞÈÎÎñ²Å¿ÉÒÔ×ßÕâÀï
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600019_g_MissionId )

		--½«ÈÎÎñµÄµÚ2ºÅÊı¾İÉèÖÃÎª¸±±¾µÄ³¡¾°ºÅ
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600019_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600019_g_Fuben_X, x600019_g_Fuben_Z )
	end
end

--**********************************
--ÓĞÍæ¼Ò½øÈë¸±±¾ÊÂ¼ş
--**********************************
function x600019_OnPlayerEnter( sceneId, selfId )
	--add by xindefeng
	if IsHaveMission( sceneId, selfId, x600019_g_MissionId ) == 0 then				--Èç¹û½øÈë¸±±¾Ç°É¾³ıÈÎÎñ£¬ÔòÖ±½Ó´«ËÍ»Ø
		x600019_NotifyFailTips( sceneId, selfId, "Các hÕ ğã không nh§n nhi®m vø này t× trß¾c" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--È¡µÃ½øÈë¸±±¾Ê±ËùÔÚ³¡¾°ºÅ
		NewWorld( sceneId, selfId, oldsceneId, x600019_g_Back_X, x600019_g_Back_Z )
		return
	end
end

--**********************************
--ÓĞÍæ¼ÒÔÚ¸±±¾ÖĞËÀÍöÊÂ¼ş
--**********************************
function x600019_OnHumanDie( sceneId, selfId, killerId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( sceneId )

	-- ÈÎÎñÈËËÀÍö£¬ÈÎÎñÊ§°Ü£¬ÓÎÏ·½áÊø
	if leaderguid == LuaFnGetGUID( sceneId, selfId ) then
		x600019_OnAbandon( sceneId, selfId )
	end
end

--**********************************
--·ÅÆú
--**********************************
function x600019_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600019_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600019_g_Param_sceneid )

	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	CallScriptFunction( x600019_g_MarketScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--Èç¹ûÔÚ¸±±¾ÀïÉ¾³ıÈÎÎñ£¬ÔòÖ±½Ó´«ËÍ»Ø
		x600019_NotifyFailTips( sceneId, selfId, "ÈÎÎñÊ§°Ü" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ		
		NewWorld( sceneId, selfId, oldsceneId, x600019_g_Back_X, x600019_g_Back_Z )
	end
end

--**********************************
-- »Ø³Ç£¬Ö»ÓĞ³ÇÊĞÈÎÎñ¸±±¾¿ÉÒÔµ÷ÓÃ´Ë½Ó¿Ú
--**********************************
function x600019_BackToCity( sceneId, selfId )
	--changed by xindefeng
	--¸±±¾ĞÂ»úÖÆ:¼ûx600019_AcceptEnterCopyScene()
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--È¡µÃ½øÈë¸±±¾Ê±ËùÔÚ³¡¾°ºÅ
	CallScriptFunction( 400900, "TransferFunc", sceneId, selfId, oldsceneId, x600019_g_Back_X, x600019_g_Back_Z )	--´«ËÍ
	
	--LuaFnSetCopySceneData_Param( sceneId, 4, 1 )							-- ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾
end

--**********************************
--¼ÌĞø
--**********************************
function x600019_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600019_g_MissionName )
		AddText( sceneId, x600019_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600019_g_ScriptId, x600019_g_MissionId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x600019_CheckSubmit( sceneId, selfId, selectRadioId )
	--ÅĞ¶ÏÈÎÎñÊÇ·ñÒÑ¾­Íê³É
	local ret = CallScriptFunction( x600019_g_MarketScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--Ìá½»
--**********************************
function x600019_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600019_g_Name then		--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if x600019_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600019_g_MarketScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x600019_OnKillObject( sceneId, selfId, objdataId, objId )
	CallScriptFunction( 950001, "TB_GhiId", sceneId, objdataId, selfId )   -- [NetCo4 01/10] tui do giet boss (roimap.lua, chi ghi khi ID co trong danh sach)
	--ÊÇ·ñÊÇËùĞèÒªµÄ¸±±¾
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x600019_g_CopySceneType then
		return
	end

	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--Èç¹û¸±±¾ÒÑ¾­±»ÖÃ³É¹Ø±Õ×´Ì¬£¬ÔòÉ±¹ÖÎŞĞ§
		return
	end

	local monstercount = LuaFnGetCopySceneData_Param( sceneId, 7 )
	monstercount = monstercount + 1
	LuaFnSetCopySceneData_Param( sceneId, 7, monstercount )						--É±ËÀBossµÄÊıÁ¿

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600019_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600019_g_Param_killcount, monstercount )		--ÉèÖÃÉ±ËÀBossµÄÊıÁ¿

	local strText = format( "Giªt chªt Ác Bá: %d/%d", monstercount, x600019_g_TotalNeedKillBoss )
	x600019_NotifyFailTips( sceneId, selfId, strText )

	if monstercount >= x600019_g_TotalNeedKillBoss then
		SetMissionByIndex( sceneId, selfId, misIndex, x600019_g_IsMissionOkFail, 1 )			--ÉèÖÃÈÎÎñÍê³É
		x600019_NotifyFailTips( sceneId, selfId, "Ğã ğu±i b÷n du côn gây sñ · chş, nhi®m vø hoàn thành" )

		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )							-- ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾

		strText = format( "Sau %d phút s¨ chuy¬n ğªn v¸ trí cØa ra vào", x600019_g_CloseTick * x600019_g_TickTime )

		x600019_NotifyFailTips( sceneId, selfId, strText )
	end
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x600019_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x600019_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼ş
--**********************************
function x600019_OnCopySceneTimer( sceneId, nowTime )

	--¸±±¾Ê±ÖÓ¶ÁÈ¡¼°ÉèÖÃ
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--È¡µÃÒÑ¾­Ö´ĞĞµÄ¶¨Ê±´ÎÊı
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--ÉèÖÃĞÂµÄ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊı

	local i = 0

	-- ½« Boss ¼ÓÇ¿
	if TickCount == 1 then
		local monstercount = GetMonsterCount( sceneId )
		local monsterId
		for i = 0, monstercount - 1 do
			-- ÕÒµ½ Boss = monsterId
			monsterId = GetMonsterObjID( sceneId, i )
			local GroupID = GetMonsterGroupID( sceneId, monsterId )
			if GroupID == x600019_g_NeedMonsterGroupID then
				local flag = { 0, 0, 0 }
				local pAttack = 0													-- ÎïÀí¹¥»÷
				local pDefense = 0													-- ÎïÀí·ÀÓù
				local mDefense = 0													-- ÄÚ¹¦·ÀÓù
				local maxHP = 0														-- ÆøÑªÖµ
				if random(2) == 1 then
					flag[random(getn(flag))] = 1
				else
					flag = { 1, 1, 1 }
					flag[random(getn(flag))] = 0
				end

				if flag[1] ~= 0 then												-- ÎïÀí¹¥»÷
					pAttack = LuaFnGetBaseAttackPhysics( sceneId, monsterId )
					pAttack = floor( pAttack * ( 8 + random(4) ) / 100 )
					pAttack = pAttack + LuaFnGetLifeTimeAttrRefix_AttackPhysics( sceneId, monsterId )
					LuaFnSetLifeTimeAttrRefix_AttackPhysics( sceneId, monsterId, pAttack )
				end

				if flag[2] ~= 0 then												-- ÎïÀí·ÀÓù£¬ÄÚ¹¦·ÀÓù
					pDefense = LuaFnGetBaseDefencePhysics( sceneId, monsterId )
					pDefense = floor( pDefense * ( 8 + random(4) ) / 100 )
					pDefense = pDefense + LuaFnGetLifeTimeAttrRefix_DefencePhysics( sceneId, monsterId )
					LuaFnSetLifeTimeAttrRefix_DefencePhysics( sceneId, monsterId, pDefense )

					mDefense = LuaFnGetBaseDefenceMagic( sceneId, monsterId )
					mDefense = floor( mDefense * ( 8 + random(4) ) / 100 )
					mDefense = mDefense + LuaFnGetLifeTimeAttrRefix_DefenceMagic( sceneId, monsterId )
					LuaFnSetLifeTimeAttrRefix_DefenceMagic( sceneId, monsterId, mDefense )
				end

				if flag[3] ~= 0 then
					maxHP = LuaFnGetMaxBaseHp( sceneId, monsterId )
					maxHP = floor( maxHP * ( 8 + random(4) ) / 100 )
					maxHP = maxHP + LuaFnGetLifeTimeAttrRefix_MaxHP( sceneId, monsterId )
					LuaFnSetLifeTimeAttrRefix_MaxHP( sceneId, monsterId, maxHP )
					RestoreHp( sceneId, monsterId )
				end
			end
		end
	end

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )

	local leaderguid = LuaFnGetCopySceneData_TeamLeader( sceneId )

	local mems = {}
	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	-- Ã»ÓĞÈËµÄÊ±ºò¹Ø±Õ¸±±¾
	if leaveFlag == 1 then															--ĞèÒªÀë¿ª
		--Àë¿ªµ¹¼ÆÊ±¼äµÄ¶ÁÈ¡ºÍÉèÖÃ
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x600019_g_CloseTick then										--µ¹¼ÆÊ±¼äµ½£¬´ó¼Ò¶¼³öÈ¥°É
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ

			--½«µ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË´«ËÍ»ØÔ­À´½øÈëÊ±ºòµÄ³¡¾°
			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x600019_g_Back_X, x600019_g_Back_Z )
				end
			end
		else
			--Í¨Öªµ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË£¬³¡¾°¹Ø±Õµ¹¼ÆÊ±¼ä
			local strText = format( "Các hÕ s¨ r¶i khöi n½i này trong vòng %d giây næa", ( x600019_g_CloseTick - leaveTickCount ) * x600019_g_TickTime )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600019_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount >= x600019_g_LimitTotalHoldTime then									--¸±±¾×ÜÊ±¼äÏŞÖÆµ½ÁË
		--´Ë´¦ÉèÖÃ¸±±¾ÈÎÎñÓĞÊ±¼äÏŞÖÆµÄÇé¿ö£¬µ±Ê±¼äµ½ºó´¦Àí...
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		local strText = format( "Các hÕ s¨ r¶i khöi n½i này trong vòng %d giây næa", ( x600019_g_CloseTick - leaveTickCount ) * x600019_g_TickTime )

		for i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				if leaderguid == LuaFnGetGUID( sceneId, mems[i] ) then
					x600019_NotifyFailTips( sceneId, mems[i], "Th¶i hÕn ğã ğªn nhi®m vø th¤t bÕi" )
				end

				x600019_NotifyFailTips( sceneId, mems[i], strText )
			end
		end

		--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	end
end

function x600019_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
