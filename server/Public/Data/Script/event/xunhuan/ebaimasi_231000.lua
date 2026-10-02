--¸±±¾ÈÎÎñ
--Ë®ÀÎ

--************************************************************************
--MisDescBegin

--½Å±¾ºÅ
x231000_g_ScriptId = 231000

--¸±±¾Ãû³Æ
x231000_g_CopySceneName="ThuÖ lao"

--ÈÎÎñºÅ
x231000_g_MissionId = 4012

--ÉÏÒ»¸öÈÎÎñµÄID
x231000_g_MissionIdPre = 4011

--Ä¿±êNPC
x231000_g_Name = "Dß½ng Tranh"

--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x231000_g_IfMissionElite = 1

--ÈÎÎñµÈ¼¶
x231000_g_MissionLevel = 10000

--ÈÎÎñ¹éÀà
x231000_g_MissionKind = 1

--ÈÎÎñÎÄ±¾ÃèÊö
x231000_g_MissionName="ThuÖ lao"
x231000_g_MissionInfo="Trong thuÖ lao có 10 tên PhÕm Nhân Ğ¥u Møc vô cùng hung hãn, chï c¥n giªt sÕch chúng, thì có th¬ tr¸ phøc t¤t cä các phÕm nhân khác. "  --ÈÎÎñÃèÊö
x231000_g_MissionTarget="Giªt chªt 10 tên PhÕm Nhân Ğ¥u Møc"	--ÈÎÎñÄ¿±ê
x231000_g_ContinueInfo="Các hÕ ğã giªt chªt 10 tên PhÕm Nhân Ğ¥u Møc chßa ?"	--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x231000_g_MissionComplete="R¯t cuµc ThuÖ lao ğã ğßşc giæ væng, sau này chúng ta tuy®t ğ¯i không ğßşc l½ là"	--Íê³ÉÈÎÎñnpcËµ»°µÄ»°

--ÈÎÎñ½±Àø
x231000_g_MoneyBonus=5000

--********ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈİ£¬ÓÃÓÚÔÚÈÎÎñÁĞ±íÖĞ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö******
--Ñ­»·ÈÎÎñµÄÊı¾İË÷Òı£¬ÀïÃæ´æ×ÅÒÑ×öµÄ»·Êı MD_SHUILAO_HUAN
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
--MissionRound =
--**********************************ÒÔÉÏÊÇ¶¯Ì¬****************************
--½ÇÉ«Mission±äÁ¿ËµÃ÷
x231000_g_IsMissionOkFail	= 0	--0ºÅ£ºµ±Ç°ÈÎÎñÊÇ·ñÍê³É(0Î´Íê³É£»1Íê³É)
x231000_g_MissionRound		= 5	--Define MD_BAIMASI_HUAN from ScriptGlobal.lua
x231000_g_DemandKill			= { {id=367,num=10} }
x231000_g_Param_killcount	= 1	--1ºÅ£ºÉ±ËÀÈÎÎñ¹ÖµÄÊıÁ¿
x231000_g_Param_sceneid		= 2	--2ºÅ£ºµ±Ç°¸±±¾ÈÎÎñµÄ³¡¾°ºÅ
x231000_g_Param_teamid		= 3	--3ºÅ£º½Ó¸±±¾ÈÎÎñÊ±ºòµÄ¶ÓÎéºÅ
x231000_g_Param_time			= 4	--4ºÅ£ºÍê³É¸±±¾ËùÓÃÊ±¼ä(µ¥Î»£ºÃë)
--6ºÅ£º¾ßÌå¸±±¾ÊÂ¼ş½Å±¾Õ¼ÓÃ
--7ºÅ£º¾ßÌå¸±±¾ÊÂ¼ş½Å±¾Õ¼ÓÃ
--MisDescEnd
--************************************************************************

x231000_g_CopySceneType=FUBEN_SHUILAO	--¸±±¾ÀàĞÍ£¬¶¨ÒåÔÚScriptGlobal.luaÀïÃæ
x231000_g_LimitMembers=1			--¿ÉÒÔ½ø¸±±¾µÄ×îĞ¡¶ÓÎéÈËÊı
x231000_g_TickTime=5				--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x231000_g_LimitTotalHoldTime=360	--¸±±¾¿ÉÒÔ´æ»îµÄÊ±¼ä£¨µ¥Î»£º´ÎÊı£©,Èç¹û´ËÊ±¼äµ½ÁË£¬ÔòÈÎÎñ½«»áÊ§°Ü
x231000_g_LimitTimeSuccess=500		--¸±±¾Ê±¼äÏŞÖÆ£¨µ¥Î»£º´ÎÊı£©£¬Èç¹û´ËÊ±¼äµ½ÁË£¬ÈÎÎñÍê³É
x231000_g_CloseTick=6				--¸±±¾¹Ø±ÕÇ°µ¹¼ÆÊ±£¨µ¥Î»£º´ÎÊı£©
x231000_g_NoUserTime=300			--¸±±¾ÖĞÃ»ÓĞÈËºó¿ÉÒÔ¼ÌĞø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x231000_g_Fuben_X=95				--½øÈë¸±±¾µÄÎ»ÖÃX
x231000_g_Fuben_Z=89				--½øÈë¸±±¾µÄÎ»ÖÃZ
x231000_g_Back_X=234				--Ô´³¡¾°Î»ÖÃX
x231000_g_Back_Z=69					--Ô´³¡¾°Î»ÖÃZ
x231000_g_NeedMonsterGroupID=1		--ĞèÒªÉ±ËÀµÄBossµÄGroupID
x231000_g_TotalNeedKillBoss=10		--ĞèÒªÉ±ËÀBossÊıÁ¿

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x231000_OnDefaultEvent( sceneId, selfId, targetId )

	if GetName( sceneId, targetId ) ~= x231000_g_Name then						--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if IsHaveMission( sceneId, selfId, x231000_g_MissionId ) > 0 then			--Èç¹ûÍæ¼ÒÒÑ¾­½ÓÁËÕâ¸öÈÎÎñ
		local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionId )
		local bDone = x231000_CheckSubmit( sceneId, selfId )
		if bDone == 0 then												--ÈÎÎñÎ´Íê³É
			BeginEvent( sceneId )
				AddText( sceneId, x231000_g_MissionName )
				AddText( sceneId, "Chu¦n b¸ xong chßa?" )
			EndEvent( )
			DispatchMissionInfo( sceneId, selfId, targetId, x231000_g_ScriptId, x231000_g_MissionId )
		elseif bDone == 1 then											--ÈÎÎñÒÑ¾­Íê³É
			BeginEvent( sceneId )
				AddText( sceneId, x231000_g_MissionName )
				AddText( sceneId, x231000_g_ContinueInfo )
				AddMoneyBonus( sceneId, x231000_g_MoneyBonus )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x231000_g_ScriptId, x231000_g_MissionId, bDone )
		end
--elseif x231000_CheckAccept( sceneId, selfId ) > 0 then						--Ã»ÓĞÈÎÎñ£¬Âú×ãÈÎÎñ½ÓÊÕÌõ¼ş
	else
		--·¢ËÍÈÎÎñ½ÓÊÜÊ±ÏÔÊ¾µÄĞÅÏ¢
		BeginEvent( sceneId )
			AddText( sceneId, x231000_g_MissionName )
			AddText( sceneId, x231000_g_MissionInfo )
			AddText( sceneId, "Møc tiêu nhi®m vø: " )
			AddText( sceneId, x231000_g_MissionTarget )
			AddText( sceneId, " " )
			AddMoneyBonus( sceneId, x231000_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x231000_g_ScriptId, x231000_g_MissionId )
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x231000_OnEnumerate( sceneId, selfId, targetId )
	--Èç¹ûÒÑ½Ó´ËÈÎÎñ»òÕßÂú×ãÈÎÎñ½ÓÊÕÌõ¼ş
--if IsHaveMission( sceneId, selfId, x231000_g_MissionId ) > 0 or x231000_CheckAccept( sceneId, selfId ) > 0 then
	if IsHaveMission( sceneId, selfId, x231000_g_MissionIdPre ) == 0 then
		x231000_MsgBox( sceneId, selfId, targetId, "  ĞÕi sß Trí Thanh cüa BÕch Mã Tñ ğang ğşi ngß½i!" )
		return
	else
		local	misIndex	= GetMissionIndexByID( sceneId, selfId, x231000_g_MissionIdPre )
		if GetMissionParam( sceneId, selfId, misIndex, x231000_g_IsMissionOkFail ) == 1 then
			x231000_MsgBox( sceneId, selfId, targetId, "  Ngß½i có th¬ quay v« BÕch Mã Tñ tìm ĞÕi sß Trí Thanh lînh t£ng thß·ng!" )
			return
		end
	end
	
	AddNumText( sceneId, x231000_g_ScriptId, x231000_g_MissionName,4,-1 )
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x231000_CheckAccept( sceneId, selfId )
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x231000_NotifyFailTips( sceneId, selfId, "Các hÕ phäi gia nh§p vào mµt ğµi ngû" )
		return 0
	end

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x231000_NotifyFailTips( sceneId, selfId, "Ngß¶i không phäi là nhóm trß·ng" )
		return 0
	end

	--È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊıÁ¿£¨°üÀ¨×Ô¼º£©
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x231000_NotifyFailTips( sceneId, selfId, "Ngß½i có nhóm viên không · g¥n ğây" )
		return 0
	end

	if nearteammembercount < x231000_g_LimitMembers then
		x231000_NotifyFailTips( sceneId, selfId, "S¯ ngß¶i trong ğµi ngû cüa các hÕ không ğü" )
		return 0
	end

	--¼ì²âĞ¡¶ÓÖĞÊÇ·ñÓĞÈËÈÎÎñ¼ÇÂ¼ÒÑÂú, ¶ÓÓÑÊÇ·ñÒÑ¾­½Ó¹ı´ËÈÎÎñ
	local member
	local i
	local misIndex

	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, selfId, i )

		if IsHaveMission( sceneId, member, x231000_g_MissionIdPre ) <= 0 then
			x231000_NotifyFailTips( sceneId, selfId, "Trong nhóm có ngß¶i chßa nh§n nhi®m vø BÕch Mã Tñ" )
			return 0
		end

		misIndex = GetMissionIndexByID( sceneId, member, x231000_g_MissionIdPre )
		if GetMissionParam( sceneId, member, misIndex, 6 ) ~= 1 then
			x231000_NotifyFailTips( sceneId, selfId, "Trong nhóm có ngß¶i ğã nhi®m vø BÕch Mã Tñ" )
			return 0
		end

		if GetMissionParam( sceneId, member, misIndex, x231000_g_IsMissionOkFail ) == 1 then
			x231000_NotifyFailTips( sceneId, selfId, "Trong nhóm có ngß¶i ğã Hoàn t¤t nhi®m vø này" )
			return 0
		end

		if GetMissionCount( sceneId, member ) >= 20 then						--¶ÓÓÑÉíÉÏÈÎÎñÊıÁ¿ÊÇ·ñ´ïµ½ÉÏÏŞ20¸ö
			x231000_NotifyFailTips( sceneId, selfId, "Ghi chép nhi®m vø cüa ngß¶i trong ğµi ngû ğã ğ¥y" )
			return 0
		end

		if IsHaveMission( sceneId, member, x231000_g_MissionId ) > 0 then
			--¶ÓÓÑÊÇ·ñÒÑ¾­½Ó¹ı´ËÈÎÎñ»òÕßÁíÍâÒ»¸öÈÎÎñ
			x231000_NotifyFailTips( sceneId, selfId, "Trong ğµi ğã có ngß¶i nh§n nhi®m vø này" )
			return 0
		end
	end

	return 1
end

--**********************************
--½ÓÊÜ
--**********************************
function x231000_OnAccept( sceneId, selfId )

	local teamid = GetTeamId( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x231000_g_MissionId ) > 0 then					--ÒÑ¾­ÓĞÈÎÎñµÄ
		local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x231000_g_Param_sceneid )
		local saveteamid = GetMissionParam( sceneId, selfId, misIndex, x231000_g_Param_teamid )

		if copysceneid >= 0 and teamid == saveteamid then						--½ø¹ı¸±±¾
			--½«×Ô¼º´«ËÍµ½¸±±¾³¡¾°
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x231000_g_Fuben_X, x231000_g_Fuben_Z )
			else
				x231000_NotifyFailTips( sceneId, selfId, "Nhi®m vø th¤t bÕi, hãy bö ği và nh§n lÕi" )
				SetMissionByIndex( sceneId, selfId, misIndex, x231000_g_IsMissionOkFail, 2 )
			end

			return
		end
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	if x231000_CheckAccept( sceneId, selfId ) == 0 then									--ÅĞ¶Ï½ÓÊÕÌõ¼ş
		return
	end

	--È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊıÁ¿£¨°üÀ¨×Ô¼º£©
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	local member
	local i
	local misIndex
	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		--¸øÃ¿¸ö¶ÓÎé³ÉÔ±¼ÓÈëÈÎÎñ
		AddMission( sceneId, member, x231000_g_MissionId, x231000_g_ScriptId, 1, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, member, x231000_g_MissionId )

		SetMissionByIndex( sceneId, member, misIndex, x231000_g_IsMissionOkFail, 0 )	--½«ÈÎÎñµÄµÚ0ºÅÊı¾İÉèÖÃÎª0,±íÊ¾Î´Íê³ÉµÄÈÎÎñ
		SetMissionByIndex( sceneId, member, misIndex, x231000_g_Param_sceneid, -1 )		--½«ÈÎÎñµÄµÚ2ºÅÊı¾İÉèÖÃÎª-1, ÓÃÓÚ±£´æ¸±±¾µÄ³¡¾°ºÅ
		SetMissionByIndex( sceneId, member, misIndex, x231000_g_Param_teamid, teamid )	--½«ÈÎÎñµÄµÚ3ºÅÊı¾İ¶ÓÎéºÅ
	end

	x231000_MakeCopyScene( sceneId, selfId, nearteammembercount )
end

--**********************************
--·ÅÆú
--**********************************
function x231000_OnAbandon( sceneId, selfId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x231000_g_Param_sceneid )

	--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
	DelMission( sceneId, selfId, x231000_g_MissionId )

	if sceneId == copyscene then											--Èç¹ûÔÚ¸±±¾ÀïÉ¾³ıÈÎÎñ£¬ÔòÖ±½Ó´«ËÍ»Ø
		x231000_NotifyFailTips( sceneId, selfId, "Nhi®m vø th¤t bÕi!" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ
		NewWorld( sceneId, selfId, oldsceneId, x231000_g_Back_X, x231000_g_Back_Z )
	end
end

--**********************************
--´´½¨¸±±¾
--**********************************
function x231000_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	local mylevel = 0
	local i

	for	i=0, nearmembercount-1 do
		mems[i] = GetNearTeamMember( sceneId, selfId, i )
		mylevel = mylevel + GetLevel( sceneId, mems[i] )
	end

	mylevel = mylevel/nearmembercount

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, "shuilao.nav" )							--µØÍ¼ÊÇ±ØĞëÑ¡È¡µÄ£¬¶øÇÒ±ØĞëÔÚConfig/SceneInfo.iniÀïÅäÖÃºÃ
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x231000_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x231000_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x231000_g_CopySceneType )				--ÉèÖÃ¸±±¾Êı¾İ£¬ÕâÀï½«0ºÅË÷ÒıµÄÊı¾İÉèÖÃÎª999£¬ÓÃÓÚ±íÊ¾¸±±¾ºÅ999(Êı×Ö×Ô¶¨Òå)
	LuaFnSetCopySceneData_Param( sceneId, 1, x231000_g_ScriptId )					--½«1ºÅÊı¾İÉèÖÃÎª¸±±¾³¡¾°ÊÂ¼ş½Å±¾ºÅ
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--ÉèÖÃ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊı
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ, ³õÊ¼»¯
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾, 0¿ª·Å£¬1¹Ø±Õ
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--ÉèÖÃÀë¿ªµ¹¼ÆÊ±´ÎÊı
	LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	--±£´æ¶ÓÎéºÅ
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--É±ËÀBossµÄÊıÁ¿

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = floor( PlayerMaxLevel/10 ) * 10   -- [NetCo4 02/10] cu: iniLevel = PlayerMaxLevel (119) -> nap shuilao_monster_119.ini khong co -> khong tao duoc pho ban
	end

	LuaFnSetSceneLoad_Monster( sceneId, "shuilao_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --¼¶±ğ²î£¬CopyScene_LevelGap ÔÚ scene.lua ÖĞ¸³Öµ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--³õÊ¼»¯Íê³Éºóµ÷ÓÃ´´½¨¸±±¾º¯Êı
	if bRetSceneID > 0 then
		x231000_NotifyFailTips( sceneId, selfId, "D¸ch chuy¬n thành công!" )
	else
		x231000_NotifyFailTips( sceneId, selfId, "S¯ lßşng bän sao ğã ğªn gi¾i hÕn, ğ« ngh¸ lát næa thØ lÕi!" )

		--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
		for	i=0, nearmembercount-1 do
			DelMission( sceneId, mems[i], x231000_g_MissionId )
		end
	end

end

--**********************************
--¼ÌĞø
--**********************************
function x231000_OnContinue( sceneId, selfId, targetId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, x231000_g_Param_sceneid ) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "Xin chúc m×ng, ngß½i s¨ ğÕt ğßşc #{_MONEY"..x231000_g_MoneyBonus.."} t£ng thß·ng cho!" )
		EndEvent( sceneId )
		DispatchMissionContinueInfo( sceneId, selfId, targetId, x231000_g_ScriptId, x231000_g_MissionId )
	end
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x231000_CheckSubmit( sceneId, selfId, selectRadioId )
	--ÅĞ¶ÏÈÎÎñÊÇ·ñÒÑ¾­Íê³É
	local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionId )
	local	ret	= GetMissionParam( sceneId, selfId, misIndex, x231000_g_IsMissionOkFail )
	if ret == 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ìá½»
--**********************************
function x231000_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if GetName( sceneId, targetId ) ~= x231000_g_Name then								--ÅĞ¶Ï¸ÃnpcÊÇ·ñÊÇ¶ÔÓ¦ÈÎÎñµÄnpc
		return
	end

	if x231000_CheckSubmit( sceneId, selfId, selectRadioId ) > 0 then					--ÒÑ¾­Íê³ÉÈÎÎñÁË
		--local iHuan = GetMissionData( sceneId, selfId, 10 )					--È¡µÃ×Ü¹²×ö¹ıµÄ»·Êı
		--Ìí¼ÓÈÎÎñ½±Àø
		local money = x231000_g_MoneyBonus
		AddMoney( sceneId, selfId, money )
		BeginEvent( sceneId )
			AddText( sceneId, x231000_g_MissionComplete )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		--ÉèÖÃÈÎÎñÒÑ¾­±»Íê³É¹ı
		DelMission( sceneId, selfId, x231000_g_MissionId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionIdPre )	--µÃµ½ÈÎÎñµÄĞòÁĞºÅ
		SetMissionByIndex( sceneId, selfId, misIndex, x231000_g_IsMissionOkFail, 1 )	--¸ù¾İĞòÁĞºÅ°ÑÈÎÎñ±äÁ¿µÄµÚ1Î»ÖÃ1 (ÈÎÎñÍê³ÉÇé¿ö)
	end
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x231000_OnKillObject( sceneId, selfId, objdataId, objId )

	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--ÊÇ·ñÊÇËùĞèÒªµÄ¸±±¾
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x231000_g_CopySceneType then
		return
	end

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--Èç¹û¸±±¾ÒÑ¾­±»ÖÃ³É¹Ø±Õ×´Ì¬£¬ÔòÉ±¹ÖÎŞĞ§
		return
	end

	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊı
	local num = LuaFnGetCopyScene_HumanCount( sceneId )

	--È¡µÃÉ±ËÀ¹ÖÎïµÄGroupID,ÓÃÓÚÅĞ¶ÏÊÇ·ñÊÇËùĞèÒªÉ±µôµÄBoss
	local GroupID = GetMonsterGroupID( sceneId, objId )
	if GroupID ~= x231000_g_NeedMonsterGroupID then										--²»ÊÇËùĞèÒªµÄBoss
		return
	end

	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, 7 )			--É±ËÀBossµÄÊıÁ¿
	killedbossnumber = killedbossnumber + 1
	LuaFnSetCopySceneData_Param( sceneId, 7, killedbossnumber )					--ÉèÖÃÉ±ËÀBossµÄÊıÁ¿

	local i
	local misIndex
	local humanObjId
	--local killedcount

	if killedbossnumber < x231000_g_TotalNeedKillBoss then

		local strText = format( "Ğã giªt tµi phÕm: %d/%d", killedbossnumber, x231000_g_TotalNeedKillBoss )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )				--È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then					--²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷
				x231000_NotifyFailTips( sceneId, humanObjId, strText )

				misIndex = GetMissionIndexByID( sceneId, humanObjId, x231000_g_MissionId )					--È¡µÃÈÎÎñÊı¾İË÷ÒıÖµ
				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x231000_g_Param_killcount )	--È¡µÃÒÑ¾­É±ÁËµÄ¹ÖÎïÊı
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231000_g_Param_killcount, killedbossnumber )	--ÉèÖÃÈÎÎñÊı¾İ
			end
		end
	elseif killedbossnumber >= x231000_g_TotalNeedKillBoss then
		--ÉèÖÃÈÎÎñÍê³É±êÖ¾
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		--È¡µÃÒÑ¾­Ö´ĞĞµÄ¶¨Ê±´ÎÊı
		local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
		local strText = format( "Ğã giªt tµi phÕm: %d/%d", x231000_g_TotalNeedKillBoss, x231000_g_TotalNeedKillBoss )
		local strText2 = format( "Nhi®m vø hoàn thành, sau %d giây s¨ chuy¬n t¾i v¸ trí vào cØa", x231000_g_CloseTick * x231000_g_TickTime )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )									--È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then										--²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x231000_g_MissionId)					--È¡µÃÈÎÎñÊı¾İË÷ÒıÖµ

				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x231000_g_Param_killcount )	--È¡µÃÒÑ¾­É±ÁËµÄ¹ÖÎïÊı
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231000_g_Param_killcount, x231000_g_TotalNeedKillBoss )	--ÉèÖÃÈÎÎñÊı¾İ

				--½«ÈÎÎñµÄµÚ1ºÅÊı¾İÉèÖÃÎª1,±íÊ¾Íê³ÉµÄÈÎÎñ
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231000_g_IsMissionOkFail, 1 )					--ÉèÖÃÈÎÎñÊı¾İ
				--Íê³É¸±±¾ËùÓÃÊ±¼ä
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231000_g_Param_time, TickCount * x231000_g_TickTime )	--ÉèÖÃÈÎÎñÊı¾İ

				x231000_NotifyFailTips( sceneId, humanObjId, strText )
				x231000_NotifyFailTips( sceneId, humanObjId, strText2 )
			end
		end
	end
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x231000_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x231000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--¸±±¾ÊÂ¼ş
--**********************************
function x231000_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )				-- ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then											-- ÕÒ²»µ½¸ÃÍæ¼Ò
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then		-- ´¦ÓÚÎŞ·¨Ö´ĞĞÂß¼­µÄ×´Ì¬
		return
	end

	--È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊıÁ¿£¨°üÀ¨×Ô¼º£©
	local nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )

	if nearteammembercount < x231000_g_LimitMembers then
		x231000_NotifyFailTips( sceneId, leaderObjId, "S¯ ngß¶i trong ğµi ngû cüa các hÕ không ğü" )
		return
	end

	local member
	local misIndex
	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- ´¦ÓÚ¿ÉÒÔÖ´ĞĞÂß¼­µÄ×´Ì¬
			if IsHaveMission( sceneId, member, x231000_g_MissionId ) > 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x231000_g_MissionId )

				--½«ÈÎÎñµÄµÚ2ºÅÊı¾İÉèÖÃÎª¸±±¾µÄ³¡¾°ºÅ
				SetMissionByIndex( sceneId, member, misIndex, x231000_g_Param_sceneid, destsceneId )

				NewWorld( sceneId, member, destsceneId, x231000_g_Fuben_X, x231000_g_Fuben_Z )
			else
				x231000_NotifyFailTips( sceneId, member, "Các hÕ ğã không nh§n nhi®m vø này t× trß¾c" )
			end
		end
	end
end

--**********************************
--ÓĞÍæ¼Ò½øÈë¸±±¾ÊÂ¼ş
--**********************************
function x231000_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x231000_g_MissionId ) == 0 then				--Èç¹û½øÈë¸±±¾Ç°É¾³ıÈÎÎñ£¬ÔòÖ±½Ó´«ËÍ»Ø
		x231000_NotifyFailTips( sceneId, selfId, "Các hÕ ğã không nh§n nhi®m vø này t× trß¾c" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ
		NewWorld( sceneId, selfId, oldsceneId, x231000_g_Back_X, x231000_g_Back_Z )
		return
	end

	--ÉèÖÃËÀÍöºó¸´»îµãÎ»ÖÃ
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x231000_g_Fuben_X, x231000_g_Fuben_Z )
end

--**********************************
--ÓĞÍæ¼ÒÔÚ¸±±¾ÖĞËÀÍöÊÂ¼ş
--**********************************
function x231000_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼ş
--**********************************
function x231000_OnCopySceneTimer( sceneId, nowTime )

	--¸±±¾Ê±ÖÓ¶ÁÈ¡¼°ÉèÖÃ
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--È¡µÃÒÑ¾­Ö´ĞĞµÄ¶¨Ê±´ÎÊı
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--ÉèÖÃĞÂµÄ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊı

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--ĞèÒªÀë¿ª
		--Àë¿ªµ¹¼ÆÊ±¼äµÄ¶ÁÈ¡ºÍÉèÖÃ
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount == x231000_g_CloseTick then										--µ¹¼ÆÊ±¼äµ½£¬´ó¼Ò¶¼³öÈ¥°É
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ

			--½«µ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË´«ËÍ»ØÔ­À´½øÈëÊ±ºòµÄ³¡¾°
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x231000_g_Back_X, x231000_g_Back_Z )
				end
			end
		elseif leaveTickCount < x231000_g_CloseTick then
			--Í¨Öªµ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË£¬³¡¾°¹Ø±Õµ¹¼ÆÊ±¼ä
			local strText = format( "Các hÕ s¨ r¶i khöi ğây sau %d giây!", (x231000_g_CloseTick-leaveTickCount) * x231000_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x231000_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x231000_g_LimitTimeSuccess then
		--´Ë´¦ÉèÖÃÓĞÊ±¼äÏŞÖÆµÄÈÎÎñÍê³É´¦Àí
		local misIndex
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x231000_NotifyFailTips( sceneId, mems[i], "Th¶i gian hoàn t¤t nhi®m vø ğã t¾i, hoàn thành!" )

				misIndex = GetMissionIndexByID( sceneId, mems[i], x231000_g_MissionId )		--È¡µÃÈÎÎñÊı¾İË÷ÒıÖµ
				--½«ÈÎÎñµÄµÚ1ºÅÊı¾İÉèÖÃÎª1,±íÊ¾Íê³ÉµÄÈÎÎñ
				SetMissionByIndex( sceneId, mems[i], misIndex, x231000_g_IsMissionOkFail, 1 )		--ÉèÖÃÈÎÎñÊı¾İ
				--Íê³É¸±±¾ËùÓÃÊ±¼ä
				SetMissionByIndex( sceneId, mems[i], misIndex, x231000_g_Param_time, TickCount * x231000_g_TickTime )	--ÉèÖÃÈÎÎñÊı¾İ
			end
		end

		--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == x231000_g_LimitTotalHoldTime then									--¸±±¾×ÜÊ±¼äÏŞÖÆµ½ÁË
		--´Ë´¦ÉèÖÃ¸±±¾ÈÎÎñÓĞÊ±¼äÏŞÖÆµÄÇé¿ö£¬µ±Ê±¼äµ½ºó´¦Àí...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				DelMission( sceneId, mems[i], x231000_g_MissionId )							--ÈÎÎñÊ§°Ü,É¾³ıÖ®
				x231000_NotifyFailTips( sceneId, mems[i], "Nhi®m vø th¤t bÕi, quá gi¶!" )
			end
		end

		--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--¶¨Ê±¼ì²é¶ÓÎé³ÉÔ±µÄ¶ÓÎéºÅ£¬Èç¹û²»·ûºÏ£¬ÔòÌß³ö¸±±¾
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					--È¡µÃ±£´æµÄ¶ÓÎéºÅ
		local oldsceneId

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and IsHaveMission( sceneId, mems[i], x231000_g_MissionId ) > 0 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					DelMission( sceneId, mems[i], x231000_g_MissionId )						--ÈÎÎñÊ§°Ü,É¾³ıÖ®
					x231000_NotifyFailTips( sceneId, mems[i], "Nhi®m vø th¤t bÕi, ngß½i không · trong ğúng nhóm!" )

					oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ
					NewWorld( sceneId, mems[i], oldsceneId, x231000_g_Back_X, x231000_g_Back_Z )
				end
			end
		end

	end
end

function x231000_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--¶Ô»°´°¿ÚĞÅÏ¢ÌáÊ¾
--**********************************
function x231000_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
