--¸±±¾ÈÎÎñ
--ÄÁ³¡
--

--************************************************************************
--MisDescBegin
--½Å±¾ºÅ
x808043_g_ScriptId	= 808043
--¸±±¾Ãû³Æ
x808043_g_CopySceneName	= "ÌÆ¼Ò±¤"
--ÈÎÎñºÅ
x808043_g_MissionId			= 1250
--ÉÏÒ»¸öÈÎÎñµÄID
x808043_g_MissionIdPre	= 0
--Ä¿±êNPC
x808043_g_Name					= "ÍµÏ®ÃÅÅÉ"
--ÊÇ·ñÊÇ¾«Ó¢ÈÎÎñ
x808043_g_IfMissionElite= 1
--ÈÎÎñµÈ¼¶
x808043_g_MissionLevel	= 10000
--ÈÎÎñ¹éÀà
x808043_g_MissionKind		= 1
--ÈÎÎñÎÄ±¾ÃèÊö
x808043_g_MissionName			= "ÍµÏ®ÃÅÅÉ"
--ÈÎÎñÃèÊö
x808043_g_MissionInfo			= "  "
--ÈÎÎñÄ¿±ê
x808043_g_MissionTarget		= "  É±ËÀËùÓĞµÄ¹ÖÎï¼´¿ÉÍê³ÉÈÎÎñ¡£"
--Î´Íê³ÉÈÎÎñµÄnpc¶Ô»°
x808043_g_ContinueInfo		= "  "
--Íê³ÉÈÎÎñnpcËµ»°µÄ»°
x808043_g_MissionComplete	= "  "

--********ÏÂÃæ¼¸ÏîÊÇ¶¯Ì¬ÏÔÊ¾µÄÄÚÈİ£¬ÓÃÓÚÔÚÈÎÎñÁĞ±íÖĞ¶¯Ì¬ÏÔÊ¾ÈÎÎñÇé¿ö******
--Ñ­»·ÈÎÎñµÄÊı¾İË÷Òı£¬ÀïÃæ´æ×ÅÒÑ×öµÄ»·Êı MD_SHUILAO_HUAN
--ÈÎÎñÊÇ·ñÒÑ¾­Íê³É
--**********************************ÒÔÉÏÊÇ¶¯Ì¬****************************
--½ÇÉ«Mission±äÁ¿ËµÃ÷
x808043_g_Param_IsMissionOkFail	= 0						--0ºÅ£ºµ±Ç°ÈÎÎñÊÇ·ñÍê³É(0Î´Íê³É£»1Íê³É)
x808043_g_Param_killmonstercount	= 1					--1ºÅ£ºÉ±ËÀÈÎÎñĞ¡¹ÖµÄÊıÁ¿
x808043_g_Param_killbosscount	= 2							--2ºÅ£ºÉ±ËÀÈÎÎñboss¹ÖµÄÊıÁ¿
x808043_g_Param_sceneid		= 3									--3ºÅ£ºµ±Ç°¸±±¾ÈÎÎñµÄ³¡¾°ºÅ
x808043_g_Param_teamid		= 4									--4ºÅ£º½Ó¸±±¾ÈÎÎñÊ±ºòµÄ¶ÓÎéºÅ
x808043_g_Param_time			= 5									--5ºÅ£ºÍê³É¸±±¾ËùÓÃÊ±¼ä(µ¥Î»£ºÃë)
																							--6ºÅ£º¾ßÌå¸±±¾ÊÂ¼ş½Å±¾Õ¼ÓÃ
																							--7ºÅ£º¾ßÌå¸±±¾ÊÂ¼ş½Å±¾Õ¼ÓÃ
--MisDescEnd
--************************************************************************

x808043_g_CopySceneType			= FUBEN_TANGMEN1	--¸±±¾ÀàĞÍ£¬¶¨ÒåÔÚScriptGlobal.luaÀïÃæ
x808043_g_LimitMembers			= 3		--¿ÉÒÔ½ø¸±±¾µÄ×îĞ¡¶ÓÎéÈËÊı
x808043_g_TickTime					= 5		--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x808043_g_LimitTotalHoldTime= 360	--¸±±¾¿ÉÒÔ´æ»îµÄÊ±¼ä£¨µ¥Î»£º´ÎÊı£©,Èç¹û´ËÊ±¼äµ½ÁË£¬ÔòÈÎÎñ½«»áÊ§°Ü
x808043_g_LimitTimeSuccess	= 500	--¸±±¾Ê±¼äÏŞÖÆ£¨µ¥Î»£º´ÎÊı£©£¬Èç¹û´ËÊ±¼äµ½ÁË£¬ÈÎÎñÍê³É
x808043_g_CloseTick					= 6		--¸±±¾¹Ø±ÕÇ°µ¹¼ÆÊ±£¨µ¥Î»£º´ÎÊı£©
x808043_g_NoUserTime				= 300	--¸±±¾ÖĞÃ»ÓĞÈËºó¿ÉÒÔ¼ÌĞø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x808043_g_Fuben_X						= 121	--½øÈë¸±±¾µÄÎ»ÖÃX
x808043_g_Fuben_Z						= 68	--½øÈë¸±±¾µÄÎ»ÖÃZ
x808043_g_Back_X						= 130	--Ô´³¡¾°Î»ÖÃX
x808043_g_Back_Z						= 71	--Ô´³¡¾°Î»ÖÃZ
x808043_g_Totalkillmonstercount	= 30	--ĞèÒªÉ±ËÀmonsterÊıÁ¿
x808043_g_Totalkillbosscount	= 1	--ĞèÒªÉ±ËÀBossÊıÁ¿

--¸±±¾Êı¾İË÷Òı¶ÔÕÕ
x808043_g_keySD					= {}
x808043_g_keySD["typ"]	= 0		--ÉèÖÃ¸±±¾ÀàĞÍ
x808043_g_keySD["spt"]	= 1		--ÉèÖÃ¸±±¾³¡¾°ÊÂ¼ş½Å±¾ºÅ
x808043_g_keySD["tim"]	= 2		--ÉèÖÃ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊı
x808043_g_keySD["scn"]	= 3		--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ, ³õÊ¼»¯
x808043_g_keySD["cls"]	= 4		--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾, 0¿ª·Å£¬1¹Ø±Õ
x808043_g_keySD["dwn"]	= 5		--ÉèÖÃÀë¿ªµ¹¼ÆÊ±´ÎÊı
x808043_g_keySD["tem"]	= 6		--±£´æ¶ÓÎéºÅ
x808043_g_keySD["x"]	= 7			--ÈËÎïÔÚÈë¿Ú³¡¾°ÖĞµÄxÎ»ÖÃ
x808043_g_keySD["z"]	= 8			--ÈËÎïÔÚÈë¿Ú³¡¾°ÖĞµÄzÎ»ÖÃ
x808043_g_keySD["killedmonsternum"]	= 9		--É±ËÀà¶ÂŞµÄÊıÁ¿
x808043_g_keySD["killedbossnum"]	= 10		--É±ËÀBossµÄÊıÁ¿
x808043_g_keySD["mp"]	= 11		--¼ÇÂ¼µ±Ç°¸±±¾µÄ ÃÅÅÉ

--½ÓÈ¡ÈÎÎñµÄ×îµÍµÈ¼¶
x808043_g_minLevel			= 20
--ĞèÒªÅäÖÃĞ¡¹ÖÎï
x808043_g_typMonster		= 749	--Ë®¹íÌ½×Ó
--ÃÅÅÉid
x808043_g_MenPaiID		= MP_TANGMEN

x808043_g_NianNum = 5
x808043_g_NianPos = {
											{x=98  ,y=146 },
											{x=84  ,y=145 },
											{x=99  ,y=75  },
											{x=86  ,y=58  },
											{x=106 ,y=58  },
										}
--x808043_g_NianShou = {12200,12201,12202,12203,12204,12205,12206,12207,12208,12209,12210,12211}
--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x808043_OnDefaultEvent( sceneId, selfId, targetId )

	x808043_OnAccept( sceneId, selfId, targetId )


end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x808043_OnEnumerate( sceneId, selfId, targetId )

	--local	MenPaiID	=	GetMenPai(sceneId, selfId)
	--if(MenPaiID ~= x808043_g_MenPaiID) then
	--	x808043_NotifyTip( sceneId, selfId, "ÎÒÀ´ÊÇÕÒÌÆ¼Ò±¤Âé·³µÄ£¬Äã²»ÊÇÌÆ¼Ò±¤µÄµÜ×Ó£¬ÇëËÙËÙ×ß¿ª¡£" )
	--	return
	--end

	local	lev	= GetLevel( sceneId, selfId )
	if lev < x808043_g_minLevel then
	  x808043_NotifyTip( sceneId, selfId, "ÄãµÄµÈ¼¶Ì«µÍÁË£¬¸ù±¾²»¹»ÎÒ¿´µÄ£¬»¹ÊÇ20¼¶Ö®ºóÔÙÀ´ÕÒÎÒ°É¡£" )
		return
	end

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x808043_NotifyTip( sceneId, selfId, "ÇøÇøÒ»¸öÈË¾ÍÏëÀ´ÌôÕ½ÎÒ£¬ÎÒ¸ù±¾²»Ğ¼ÓëÄã¶¯ÊÖ¡£" )
		return
	end
	--PrintNum(3)

	if GetTeamSize( sceneId, selfId ) < x808043_g_LimitMembers then
	  x808043_NotifyTip( sceneId, selfId, "ÏëÒªÌôÕ½ÎÒÖÁÉÙÒ²µÃÉÏÀ´Èı¸ö°É£¬¾ÍÕâµãÈË£¿Ò²Ì«ÇÆ²»ÆğÎÒÁË¡£" )
	  return
	end
	--PrintNum(4)

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x808043_NotifyTip( sceneId, selfId, "ÏëÒªÌôÕ½ÎÒ£¿½ĞÄãÃÇµÄ¶Ó³¤À´°É¡£" )
		return
	end
	--PrintNum(5)

	-- È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊıÁ¿£¨°üÀ¨×Ô¼º£©
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x808043_NotifyTip( sceneId, selfId, "Äú¶ÓÎéÖĞÓĞ¶ÓÔ±²»ÔÚ¸½½ü£¬Çë¼¯ºÏºóÔÙÕÒÎÒËÍÄã½øÈë»î¶¯¡£" )
		return
	end
	
	local namenum = 0;
	local notifyString = "Äú¶ÓÎéÖĞÓĞ³ÉÔ±(";
	for i=0, nearteammembercount-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		local	lev	= GetLevel( sceneId, nPlayerId )
		local	nam	= GetName( sceneId, nPlayerId )
		
		if(lev<x808043_g_minLevel) then
			notifyString = notifyString..nam.." ";
			namenum = 1;
		end
	end
	notifyString = notifyString..")µÈ¼¶²»×ã¡£";	
	if(namenum>0) then
		x808043_NotifyTip( sceneId, selfId, notifyString )
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, "¼ÈÈ»ÄãÃÇ²»ÅÂËÀ£¬ÎÒÒ²¾ÍÃ»ÓĞ±ØÒªÁôÊ²Ã´ÇéÃæÁË£¬Ğ¡µÄÃÇ£¬¹ıÀ´¸øËûÃÇµãÀ÷º¦³¢³¢¡£" )
		AddNumText( sceneId, x808043_g_ScriptId, "ÄÑµÀÎÒ»¹ÅÂÄã²»³É¡­¡­" ,10 ,0)
  EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x808043_CheckAccept( sceneId, selfId )
	--local	MenPaiID	=	GetMenPai(sceneId, selfId)
	--if(MenPaiID ~= x808043_g_MenPaiID) then
	--	x808043_NotifyTip( sceneId, selfId, "ÎÒÀ´ÊÇÕÒÌÆ¼Ò±¤Âé·³µÄ£¬Äã²»ÊÇÌÆ¼Ò±¤µÄµÜ×Ó£¬ÇëËÙËÙ×ß¿ª¡£" )
	--	return 0;
	--end

	local	lev	= GetLevel( sceneId, selfId )
	if lev < x808043_g_minLevel then
	  x808043_NotifyTip( sceneId, selfId, "ÄãµÄµÈ¼¶Ì«µÍÁË£¬¸ù±¾²»¹»ÎÒ¿´µÄ£¬»¹ÊÇ20¼¶Ö®ºóÔÙÀ´ÕÒÎÒ°É¡£" )
		return 0
	end

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x808043_NotifyTip( sceneId, selfId, "ÇøÇøÒ»¸öÈË¾ÍÏëÀ´ÌôÕ½ÎÒ£¬ÎÒ¸ù±¾²»Ğ¼ÓëÄã¶¯ÊÖ¡£" )
		return 0
	end
	--PrintNum(3)

	if GetTeamSize( sceneId, selfId ) < x808043_g_LimitMembers then
	  x808043_NotifyTip( sceneId, selfId, "ÏëÒªÌôÕ½ÎÒÖÁÉÙÒ²µÃÉÏÀ´Èı¸ö°É£¬¾ÍÕâµãÈË£¿Ò²Ì«ÇÆ²»ÆğÎÒÁË¡£" )
	  return 0
	end
	--PrintNum(4)

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x808043_NotifyTip( sceneId, selfId, "ÏëÒªÌôÕ½ÎÒ£¿½ĞÄãÃÇµÄ¶Ó³¤À´°É¡£" )
		return 0
	end
	--PrintNum(5)

	-- È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊıÁ¿£¨°üÀ¨×Ô¼º£©
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x808043_NotifyTip( sceneId, selfId, "Äú¶ÓÎéÖĞÓĞ¶ÓÔ±²»ÔÚ¸½½ü£¬Çë¼¯ºÏºóÔÙÕÒÎÒËÍÄã½øÈë»î¶¯¡£" )
		return 0
	end
	
	local namenum = 0;
	local notifyString = "Äú¶ÓÎéÖĞÓĞ³ÉÔ±(";
	for i=0, nearteammembercount-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		local	lev	= GetLevel( sceneId, nPlayerId )
		local	nam	= GetName( sceneId, nPlayerId )
		
		if(lev<x808043_g_minLevel) then
			notifyString = notifyString..nam.." ";
			namenum = 1;
		end
	end
	notifyString = notifyString..")µÈ¼¶²»×ã¡£";	
	if(namenum>0) then
		x808043_NotifyTip( sceneId, selfId, notifyString )
		return 0
	end
	return 1
end

--**********************************
--½ÓÊÜ
--**********************************
function x808043_OnAccept( sceneId, selfId, targetId )
	if x808043_CheckAccept( sceneId, selfId ) == 0 then
		return
	end
	local teamid = GetTeamId( sceneId, selfId )

	--Èç¹ûÓĞÈÎÎñ£¬Ö±½Ó´«Èë¸±±¾
	if IsHaveMission( sceneId, selfId, x808043_g_MissionId ) > 0 then

		local misIndex = GetMissionIndexByID( sceneId, selfId, x808043_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x808043_g_Param_sceneid )
		local saveteamid = GetMissionParam( sceneId, selfId, misIndex, x808043_g_Param_teamid )
		--½ø¹ı¸±±¾
		if copysceneid >= 0 and teamid == saveteamid then
			--½«×Ô¼º´«ËÍµ½¸±±¾³¡¾°
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x808043_g_Fuben_X, x808043_g_Fuben_Z )
			else
				x808043_NotifyTip( sceneId, selfId, "ÈÎÎñÊ§°Ü£¬Çë·ÅÆúÖØĞÂ½ÓÈ¡" )
				SetMissionByIndex( sceneId, selfId, misIndex, x808043_g_Param_IsMissionOkFail, 2 )
				DelMission(sceneId, selfId, x808043_g_MissionId);
			end
			return
		end
	end

	--¼ÓÈëÈÎÎñµ½Íæ¼ÒÁĞ±í
	--È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊıÁ¿£¨°üÀ¨×Ô¼º£©
	local numMem	= GetNearTeamCount( sceneId, selfId )
	local member
	local i
	local misIndex
	for i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i );
		if IsMissionFull(sceneId, member) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, "¶ÓÎéÖĞÓĞÈËÈÎÎñÒÑÂú£¡");
			EndEvent()
			DispatchMissionTips(sceneId, selfId);
			return
		end
	end
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i )

		if IsHaveMission( sceneId, member, x808043_g_MissionId ) > 0 then
			--É¾µôÏÈ
			DelMission( sceneId, member, x808043_g_MissionId);
		end

		--¸øÃ¿¸ö¶ÓÎé³ÉÔ±¼ÓÈëÈÎÎñ
		if 0 ==  AddMission( sceneId, member, x808043_g_MissionId, x808043_g_ScriptId, 1, 0, 0 ) then
			return
		end

		misIndex = GetMissionIndexByID( sceneId, member, x808043_g_MissionId )
		--½«ÈÎÎñµÄµÚ0ºÅÊı¾İÉèÖÃÎª0,±íÊ¾Î´Íê³ÉµÄÈÎÎñ
		SetMissionByIndex( sceneId, member, misIndex, x808043_g_Param_IsMissionOkFail, 0 )
		--½«ÈÎÎñµÄµÚ2ºÅÊı¾İÉèÖÃÎª-1, ÓÃÓÚ±£´æ¸±±¾µÄ³¡¾°ºÅ
		SetMissionByIndex( sceneId, member, misIndex, x808043_g_Param_sceneid, -1 )
		--½«ÈÎÎñµÄµÚ3ºÅÊı¾İ¶ÓÎéºÅ
		SetMissionByIndex( sceneId, member, misIndex, x808043_g_Param_teamid, teamid )
	end
	x808043_MakeCopyScene( sceneId, selfId, numMem )
	LuaFnDeleteMonster( sceneId, targetId)
end

--**********************************
--·ÅÆú
--**********************************
function x808043_OnAbandon( sceneId, selfId )

	--²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	--´¦ÓÚÎŞ·¨Ö´ĞĞÂß¼­µÄ×´Ì¬
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	--²»ÊÇÔÚ¸±±¾ÖĞÖ±½ÓÉ¾³ıÈÎÎñ
	local misIndex = GetMissionIndexByID( sceneId, selfId, x808043_g_MissionId )
	local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x808043_g_Param_sceneid )

	if(copysceneid ~= sceneId) then
		DelMission( sceneId, selfId, x808043_g_MissionId )
		return
	end

	local leaderguid = LuaFnGetCopySceneData_TeamLeader( sceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--ÕÒ²»µ½¸ÃÍæ¼Ò
	if leaderObjId == -1 then
		DelMission( sceneId, selfId, x808043_g_MissionId )
		return
	end

	--´ËÊ±Ò»¶¨ÔÚ¸±±¾ÖĞ£¬¿ÉÒÔ»ñµÃÈë¿Ú³¡¾°ºÅ
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["scn"] )	--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	if(selfId == leaderObjId) then
		--¶Ó³¤·ÅÆú£¬È«²¿´«³ö¸±±¾
		LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["cls"], 1 )
		local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
		local mems = {}
		local i
		for	i=0, membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
		end
		--½«µ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË´«ËÍ»ØÔ­À´½øÈëÊ±ºòµÄ³¡¾°
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				DelMission( sceneId, mems[i], x808043_g_MissionId )
				x = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["x"] )
				z = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["z"] )
				NewWorld( sceneId, mems[i], oldsceneId, x, z )
			end
		end
	else
	--×Ô¼º²»ÊÇ¶Ó³¤Ö»ÊÇ×Ô¼º·ÅÆú£¬Ö»°Ñ×Ô¼º´«³ö¸±±¾
		DelMission( sceneId, selfId, x808043_g_MissionId )
		x = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["x"] )
		z = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["z"] )
		NewWorld( sceneId, selfId, oldsceneId, x, z )
	end
end

--**********************************
--´´½¨¸±±¾
--**********************************
function x808043_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	local mylevel = 0
	local i

-- 	PrintStr("sdlf")

	local member, mylevel, numerator, denominator = 0, 0, 0, 0

	for	i = 0, nearmembercount - 1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		numerator = numerator + GetLevel( sceneId, member ) ^ 4
		denominator = denominator + GetLevel( sceneId, member ) ^ 3
		mems[i] = member
	end

	if denominator <= 0 then
		mylevel = 0
	else
		mylevel = numerator / denominator
	end

	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = floor( PlayerMaxLevel/10 ) * 10   -- [NetCo4 02/10] cu: iniLevel = PlayerMaxLevel (119) -> nap <map>_monster_119.ini khong co -> pho ban khong tao duoc
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--µØÍ¼ÊÇ±ØĞëÑ¡È¡µÄ£¬¶øÇÒ±ØĞëÔÚConfig/SceneInfo.iniÀïÅäÖÃºÃ
	LuaFnSetSceneLoad_Map( sceneId, "tangmensg.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x808043_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x808043_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["typ"], x808043_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["spt"], x808043_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["scn"], -1 )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["killedmonsternum"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["killedbossnum"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["mp"], MP_TANGMEN )

	local x,z = GetWorldPos( sceneId, selfId )

--	PrintStr("  "..x..z.." ")

	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["x"], x808043_g_Back_X )
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["z"], x808043_g_Back_Z )

	LuaFnSetSceneLoad_Monster( sceneId, "tangmensg_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --¼¶±ğ²î£¬CopyScene_LevelGap ÔÚ scene.lua ÖĞ¸³Öµ
  LuaFnSetCopySceneData_Param(sceneId, 13, mylevel)
  
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--³õÊ¼»¯Íê³Éºóµ÷ÓÃ´´½¨¸±±¾º¯Êı
	if bRetSceneID > 0 then
		x808043_NotifyTip( sceneId, selfId, "¸±±¾´´½¨³É¹¦£¡" )
	else
		x808043_NotifyTip( sceneId, selfId, "¸±±¾ÊıÁ¿ÒÑ´ïÉÏÏŞ£¬ÇëÉÔºòÔÙÊÔ£¡" )

		--É¾³ıÍæ¼ÒÈÎÎñÁĞ±íÖĞ¶ÔÓ¦µÄÈÎÎñ
		for	i=0, nearmembercount-1 do
			DelMission( sceneId, mems[i], x808043_g_MissionId )
		end
	end

end

--**********************************
--¼ÌĞø
--**********************************
function x808043_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x808043_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--Ìá½»
--**********************************
function x808043_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x808043_OnKillObject( sceneId, selfId, objdataId, objId )

	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--ÊÇ·ñÊÇËùĞèÒªµÄ¸±±¾
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x808043_g_CopySceneType then
		return
	end

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	--Èç¹û¸±±¾ÒÑ¾­±»ÖÃ³É¹Ø±Õ×´Ì¬£¬ÔòÉ±¹ÖÎŞĞ§
	if leaveFlag == 1 then
		return
	end

	--È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊı
	local num = LuaFnGetCopyScene_HumanCount( sceneId )

	--È¡µÃÉ±ËÀ¹ÖÎïµÄGroupID,ÓÃÓÚÅĞ¶ÏÊÇ·ñÊÇËùĞèÒªÉ±µôµÄBoss
	local GroupID = GetMonsterGroupID( sceneId, objId )

	local killedmonsternumber = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["killedmonsternum"] )			--É±ËÀmonsterµÄÊıÁ¿
	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["killedbossnum"] )			--É±ËÀbossµÄÊıÁ¿

	local MonsterName = GetName(sceneId, objId)
	local	isBoss

	if(MonsterName == "Lâu La")then
		killedmonsternumber = killedmonsternumber + 1
		LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["killedmonsternum"], killedmonsternumber )					--ÉèÖÃÉ±ËÀmonsterµÄÊıÁ¿
		isBoss = 0
		if killedmonsternumber ==  x808043_g_Totalkillmonstercount then
			local	Selflev	= GetLevel( sceneId, selfId )
			local PlayerMaxLevel = GetHumanMaxLevelLimit()
			local monsterLevel=0
			if Selflev < 10 then
				monsterLevel = 0
			elseif Selflev < 110 then
				monsterLevel = floor( Selflev/10 ) + 3670 - 1
			elseif Selflev < PlayerMaxLevel then
				monsterLevel = floor( Selflev/10 ) + 33670 - 11
			else
				monsterLevel = floor( Selflev/10 ) + 33670 - 11   -- [NetCo4 03/10] cu: = 9 (quai so 9 = Doan Chinh Minh NPC)
			end
			local tmpMonsterId = LuaFnCreateMonster( sceneId, monsterLevel, 66, 33, 14, 138, -1 )
			local tmpsMessage = format("¿É¶ñ£¬ÑÛ¿´×ÅÎÒÃÇ¾ÍÒªÍµÏ®³É¹¦ÁË£¬¼ÈÈ»ÕâÑù£¬¾Í±ğ¹ÖÎÒ²»¿ÍÆøÁË¡£")
			MonsterTalk(sceneId, tmpMonsterId, x808043_g_CopySceneName, tmpsMessage)
			local szName = GetName(sceneId, tmpMonsterId)
			if szName == "Ác Bá" or szName == "Ác bá"   then
				SetCharacterTitle(sceneId, tmpMonsterId, "¡°ÊéÉ½ÓĞÂ·¡±")
			end
		end
	elseif ( MonsterName == "Ác Bá" or MonsterName == "Ác bá" ) then
		killedbossnumber = killedbossnumber + 1
		LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["killedbossnum"], killedbossnumber )					--ÉèÖÃÉ±ËÀbossµÄÊıÁ¿
		isBoss = 1
	end


	-------------------------------------------------------------------------------
	local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
	local memId
	local teamLeaderName;
	local firstMemName;
	local firstMemId;
	
	teamLeaderName = ""
	for	i = 0, membercount - 1 do
		memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
		if LuaFnIsObjValid( sceneId, memId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, memId ) == 1 then	
			local teamLeaderFlag = LuaFnIsTeamLeader(sceneId, memId);
			if teamLeaderFlag and teamLeaderFlag == 1 then
				teamLeaderName = LuaFnGetName(sceneId, memId);
				break;
			end
		end
	end

	if isBoss==1 and teamLeaderName ~= "" then

	local message;
	local randMessage = random(3);

	if randMessage == 1 then
		message = format("#B#{_INFOUSR%s}#{TouXi_00}#G#{MP_TANGMEN}#{TouXi_01}", teamLeaderName );
	elseif randMessage == 2 then
		message = format("#G#{MP_TANGMEN}#{TouXi_02}#{_INFOUSR%s}#{TouXi_03}#B#{_INFOUSR%s}#{TouXi_04}", teamLeaderName, teamLeaderName );
	else
		message = format("#{TouXi_05}#G#{MP_TANGMEN}#{TouXi_06}#{_INFOUSR%s}#{TouXi_07}", teamLeaderName );
	end

	BroadMsgByChatPipe(sceneId, selfId, message, 4);

	end
	-------------------------------------------------------------------------------


	local i
	local misIndex
	local humanObjId
	local	mppoint

	if (killedmonsternumber < x808043_g_Totalkillmonstercount ) or (killedbossnumber < x808043_g_Totalkillbosscount )then
		local strText = format( "ÒÑÉ±ËÀà¶†ª£º %d/%d ÒÑÉ±ËÀ¶ñ°Ô£º %d/%d" , killedmonsternumber, x808043_g_Totalkillmonstercount, killedbossnumber, x808043_g_Totalkillbosscount )
		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )				--È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId
			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, humanObjId ) == 1 then						--²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷
				x808043_NotifyTip( sceneId, humanObjId, strText )

				local	MenPaiID	=	GetMenPai(sceneId, humanObjId)
				if(MenPaiID == x808043_g_MenPaiID) then
					if isBoss == 0 then
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+1
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					else
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+5
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					end
				end
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x808043_g_MissionId )					--È¡µÃÈÎÎñÊı¾İË÷ÒıÖµ
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808043_g_Param_killmonstercount, killedmonsternumber )	--ÉèÖÃÈÎÎñÊı¾İ
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808043_g_Param_killbosscount, killedbossnumber )	--ÉèÖÃÈÎÎñÊı¾İ
			end
		end
	else

		--ÉèÖÃÈÎÎñÍê³É±êÖ¾
		LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["cls"], 1 )

	        --È¡µÃµ±Ç°³¡¾°ÀïµÄÈËÊı
	        local RenNum = LuaFnGetCopyScene_HumanCount( sceneId )
	        for i=0, RenNum-1 do
	            local EveryBodyID = LuaFnGetCopyScene_HumanObjId( sceneId, i )	  --È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId
                    CallScriptFunction( 890536,"JianCe",sceneId,EveryBodyID)
                    if floor(mod(GetMissionData(sceneId,EveryBodyID,HUOYUEFB_1),100)/10)  < 2 then
                       SetMissionData(sceneId,EveryBodyID,HUOYUEZHI,GetMissionData(sceneId,EveryBodyID,HUOYUEZHI)+18) --»îÔ¾Öµ+18
                       SetMissionData(sceneId,EveryBodyID,HUOYUEFB_1,GetMissionData(sceneId,EveryBodyID,HUOYUEFB_1)+10)
                    end
                end

		--È¡µÃÒÑ¾­Ö´ĞĞµÄ¶¨Ê±´ÎÊı
		local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
		local strText = format( "ÒÑÉ±ËÀà¶†ª£º %d/%d ÒÑÉ±ËÀ¶ñ°Ô£º %d/%d", x808043_g_Totalkillmonstercount, x808043_g_Totalkillmonstercount, x808043_g_Totalkillbosscount, x808043_g_Totalkillbosscount)
		local strText2 = format( "ÈÎÎñÍê³É£¬½«ÔÚ%dÃëºó´«ËÍµ½Èë¿ÚÎ»ÖÃ", x808043_g_CloseTick * x808043_g_TickTime )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )									--È¡µÃµ±Ç°³¡¾°ÀïÈËµÄobjId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, humanObjId ) == 1 then										--²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x808043_g_MissionId)					--È¡µÃÈÎÎñÊı¾İË÷ÒıÖµ

				SetMissionByIndex( sceneId, humanObjId, misIndex, x808043_g_Param_killmonstercount, killedmonsternumber )	--ÉèÖÃÈÎÎñÊı¾İ
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808043_g_Param_killbosscount, killedbossnumber )	--ÉèÖÃÈÎÎñÊı¾İ

				--½«ÈÎÎñµÄµÚ1ºÅÊı¾İÉèÖÃÎª1,±íÊ¾Íê³ÉµÄÈÎÎñ
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808043_g_Param_IsMissionOkFail, 1 )					--ÉèÖÃÈÎÎñÊı¾İ
				--Íê³É¸±±¾ËùÓÃÊ±¼ä
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808043_g_Param_time, TickCount * x808043_g_TickTime )	--ÉèÖÃÈÎÎñÊı¾İ

				x808043_NotifyTip( sceneId, humanObjId, strText )
				x808043_NotifyTip( sceneId, humanObjId, strText2 )

				local	MenPaiID	=	GetMenPai(sceneId, humanObjId)
				if(MenPaiID == x808043_g_MenPaiID) then
					if isBoss == 0 then
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+1
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					else
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+5
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					end
				end
			end
		end
	end
end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x808043_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x808043_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--¸±±¾ÊÂ¼ş
--**********************************
function x808043_OnCopySceneReady( sceneId, destsceneId )

	--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	LuaFnSetCopySceneData_Param( destsceneId, x808043_g_keySD["scn"], sceneId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--ÕÒ²»µ½¸ÃÍæ¼Ò
	if leaderObjId == -1 then
		return
	end

	--´¦ÓÚÎŞ·¨Ö´ĞĞÂß¼­µÄ×´Ì¬
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--È¡µÃÍæ¼Ò¸½½üµÄ¶ÓÓÑÊıÁ¿£¨°üÀ¨×Ô¼º£©
	local numMem	= GetNearTeamCount( sceneId, leaderObjId )
	local member
	local misIndex

	misIndex = GetMissionIndexByID( sceneId, leaderObjId, x808043_g_MissionId )
	SetMissionByIndex( sceneId, leaderObjId, misIndex, x808043_g_Param_sceneid, destsceneId )
	NewWorld( sceneId, leaderObjId, destsceneId, x808043_g_Fuben_X, x808043_g_Fuben_Z )
	
	--»î¶¯Í³¼Æ
	LuaFnAuditQuest(sceneId, leaderObjId, x808043_g_MissionName.."-"..x808043_g_CopySceneName)

	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- ´¦ÓÚ¿ÉÒÔÖ´ĞĞÂß¼­µÄ×´Ì¬
			if IsHaveMission( sceneId, member, x808043_g_MissionId ) > 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x808043_g_MissionId )

				--½«ÈÎÎñµÄµÚ2ºÅÊı¾İÉèÖÃÎª¸±±¾µÄ³¡¾°ºÅ
				SetMissionByIndex( sceneId, member, misIndex, x808043_g_Param_sceneid, destsceneId )

				NewWorld( sceneId, member, destsceneId, x808043_g_Fuben_X, x808043_g_Fuben_Z )
				
				--»î¶¯Í³¼Æ
				LuaFnAuditQuest(sceneId, member, x808043_g_MissionName.."-"..x808043_g_CopySceneName)
			else
				x808043_NotifyTip( sceneId, member, "Äãµ±Ç°Î´½Ó´ËÈÎÎñ" )
			end
		end
	end
end

--**********************************
--ÓĞÍæ¼Ò½øÈë¸±±¾ÊÂ¼ş
--**********************************
function x808043_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x808043_g_MissionId ) == 0 then				--Èç¹û½øÈë¸±±¾Ç°É¾³ıÈÎÎñ£¬ÔòÖ±½Ó´«ËÍ»Ø
		x808043_NotifyTip( sceneId, selfId, "Äãµ±Ç°Î´½Ó´ËÈÎÎñ" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["scn"] )		--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ
		x = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["x"] )
		z = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["z"] )
		NewWorld( sceneId, selfId, oldsceneId, x, z )
		return
	end


	--ÉèÖÃËÀÍöºó¸´»îµãÎ»ÖÃ
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x808043_g_Fuben_X, x808043_g_Fuben_Z )

end

--**********************************
--ÓĞÍæ¼ÒÔÚ¸±±¾ÖĞËÀÍöÊÂ¼ş
--**********************************
function x808043_OnHumanDie( sceneId, selfId, killerId )
--	x = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["x"] )
--	z = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["z"] )
--	NewWorld( sceneId, selfId, oldsceneId, x, z )
end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼ş
--**********************************
function x808043_OnCopySceneTimer( sceneId, nowTime )

--	local once = LuaFnGetCopySceneData_Param( sceneId, 16 )
--
--	if (once == 0) then
--		LuaFnSetCopySceneData_Param(sceneId, 16, 1)
--		local mylevel = LuaFnGetCopySceneData_Param( sceneId, 13 )
--		
--		local PlayerMaxLevel = GetHumanMaxLevelLimit()
--		local iniLevel;
--		if mylevel < 10 then
--			iniLevel = 10;
--		elseif mylevel < PlayerMaxLevel then
--			iniLevel = floor(mylevel/10) * 10;
--		else
--			iniLevel = PlayerMaxLevel;
--		end
--	 
--		local iNianShouIdx = iniLevel / 10
--	
--		for i=1,x808043_g_NianNum do
--			local objId = LuaFnCreateMonster( sceneId, x808043_g_NianShou[iniLevel/10], x808043_g_NianPos[i].x, x808043_g_NianPos[i].y, 1, 272, -1 )
--			SetLevel( sceneId, objId, mylevel )
--			LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 10472, 0); -- zchw
--		end  
--	end
	
	--¸±±¾Ê±ÖÓ¶ÁÈ¡¼°ÉèÖÃ
	--È¡µÃÒÑ¾­Ö´ĞĞµÄ¶¨Ê±´ÎÊı
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["tim"] )
	TickCount = TickCount + 1
	--ÉèÖÃĞÂµÄ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊı
	LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["tim"], TickCount )

	--¸±±¾¹Ø±Õ±êÖ¾
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["cls"] )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	if membercount==0 and leaveFlag~=1 then
		LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["cls"], 1 )
		return
	end

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--ĞèÒªÀë¿ª
	if leaveFlag == 1 then
		--Àë¿ªµ¹¼ÆÊ±¼äµÄ¶ÁÈ¡ºÍÉèÖÃ
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["dwn"] )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["dwn"], leaveTickCount )

		if leaveTickCount == x808043_g_CloseTick then										--µ¹¼ÆÊ±¼äµ½£¬´ó¼Ò¶¼³öÈ¥°É
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["scn"] )	--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ

			--½«µ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË´«ËÍ»ØÔ­À´½øÈëÊ±ºòµÄ³¡¾°
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					DelMission( sceneId, mems[i], x808043_g_MissionId )
					x = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["x"] )
					z = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["z"] )
					NewWorld( sceneId, mems[i], oldsceneId, x, z )
				end
			end

		--	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )

		elseif leaveTickCount < x808043_g_CloseTick then
			--Í¨Öªµ±Ç°¸±±¾³¡¾°ÀïµÄËùÓĞÈË£¬³¡¾°¹Ø±Õµ¹¼ÆÊ±¼ä
			local strText = format( "Äã½«ÔÚ%dÃëºóÀë¿ª³¡¾°!", (x808043_g_CloseTick-leaveTickCount) * x808043_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x808043_NotifyTip( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x808043_g_LimitTimeSuccess then
		--´Ë´¦ÉèÖÃÓĞÊ±¼äÏŞÖÆµÄÈÎÎñÍê³É´¦Àí
		local misIndex
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then

			DelMission( sceneId, mems[i], x808043_g_MissionId )

				x808043_NotifyTip( sceneId, mems[i], "ÈÎÎñÊ±¼äµ½£¬Íê³É!" )

				--È¡µÃÈÎÎñÊı¾İË÷ÒıÖµ
				misIndex = GetMissionIndexByID( sceneId, mems[i], x808043_g_MissionId )
				--½«ÈÎÎñµÄµÚ1ºÅÊı¾İÉèÖÃÎª1,±íÊ¾Íê³ÉµÄÈÎÎñ
				--ÉèÖÃÈÎÎñÊı¾İ
				SetMissionByIndex( sceneId, mems[i], misIndex, x808043_g_Param_IsMissionOkFail, 1 )
				--Íê³É¸±±¾ËùÓÃÊ±¼ä
				SetMissionByIndex( sceneId, mems[i], misIndex, x808043_g_Param_time, TickCount * x808043_g_TickTime )	--ÉèÖÃÈÎÎñÊı¾İ
			end
		end

		--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾
		LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["cls"], 1 )
	elseif TickCount == x808043_g_LimitTotalHoldTime then						--¸±±¾×ÜÊ±¼äÏŞÖÆµ½ÁË
		--´Ë´¦ÉèÖÃ¸±±¾ÈÎÎñÓĞÊ±¼äÏŞÖÆµÄÇé¿ö£¬µ±Ê±¼äµ½ºó´¦Àí...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				DelMission( sceneId, mems[i], x808043_g_MissionId )				--ÈÎÎñÊ§°Ü,É¾³ıÖ®
				x808043_NotifyTip( sceneId, mems[i], "ÈÎÎñÊ§°Ü£¬³¬Ê±!" )
			end
		end

		--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾
		LuaFnSetCopySceneData_Param( sceneId, x808043_g_keySD["cls"], 1 )
	else
		--¶¨Ê±¼ì²é¶ÓÎé³ÉÔ±µÄ¶ÓÎéºÅ£¬Èç¹û²»·ûºÏ£¬ÔòÌß³ö¸±±¾
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["tem"] )		--È¡µÃ±£´æµÄ¶ÓÎéºÅ
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["scn"] )	--È¡µÃ¸±±¾Èë¿Ú³¡¾°ºÅ

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and IsHaveMission( sceneId, mems[i], x808043_g_MissionId ) > 0 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					DelMission( sceneId, mems[i], x808043_g_MissionId )			--ÈÎÎñÊ§°Ü,É¾³ıÖ®
					x808043_NotifyTip( sceneId, mems[i], "ÈÎÎñÊ§°Ü£¬Äã²»ÔÚÕıÈ·µÄ¶ÓÎéÖĞ!" )

					x = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["x"] )
					z = LuaFnGetCopySceneData_Param( sceneId, x808043_g_keySD["z"] )
					NewWorld( sceneId, mems[i], oldsceneId, x, z )
				end
			end
		end

	end
end

--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x808043_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--¶Ô»°´°¿ÚĞÅÏ¢ÌáÊ¾
--**********************************
function x808043_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x808043_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

