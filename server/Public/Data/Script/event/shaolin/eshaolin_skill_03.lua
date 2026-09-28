-- 212142
-- ¸±±¾

-- ¸±±¾ÈÎÎñ  »ØÂíÇ¹
-- Íæ¼ÒµÈ¼¶´óÓÚµÈÓÚ20¼¶£¬Íê³É¡°ÈıÈËÍ¬ĞĞ¡±£¬¶Ó³¤ÇÒ¶ÓÎéÖĞÖÁÉÙÈıÈË¡£


--************************************************************************
--MisDescBegin
--½Å±¾ºÅ
x212142_g_ScriptId = 212142

x212142_g_MissionId = 964

--MisDescEnd
--************************************************************************

--¸±±¾Ãû³Æ
x212142_g_CopySceneName = "Bao vây NhÕn Môn Quan"

x212142_g_CopySceneType = FUBEN_JUQING	--¸±±¾ÀàĞÍ£¬¶¨ÒåÔÚScriptGlobal.luaÀïÃæ

x212142_g_CopySceneMap = "gongdi.nav"
x212142_g_LimitMembers = 3				--¿ÉÒÔ½ø¸±±¾µÄ×îĞ¡¶ÓÎéÈËÊı
x212142_g_TickTime = 5					--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x212142_g_LimitTotalHoldTime = 360		--¸±±¾¿ÉÒÔ´æ»îµÄÊ±¼ä£¨µ¥Î»£º´ÎÊı£©,Èç¹û´ËÊ±¼äµ½ÁË£¬ÔòÈÎÎñ½«»áÊ§°Ü
x212142_g_LimitTimeSuccess = 500		--¸±±¾Ê±¼äÏŞÖÆ£¨µ¥Î»£º´ÎÊı£©£¬Èç¹û´ËÊ±¼äµ½ÁË£¬ÈÎÎñÍê³É
x212142_g_CloseTick = 3					--¸±±¾¹Ø±ÕÇ°µ¹¼ÆÊ±£¨µ¥Î»£º´ÎÊı£©
x212142_g_NoUserTime = 300				--¸±±¾ÖĞÃ»ÓĞÈËºó¿ÉÒÔ¼ÌĞø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x212142_g_DeadTrans = 0					--ËÀÍö×ªÒÆÄ£Ê½£¬0£ºËÀÍöºó»¹¿ÉÒÔ¼ÌĞøÔÚ¸±±¾£¬1£ºËÀÍöºó±»Ç¿ÖÆÒÆ³ö¸±±¾
x212142_g_Fuben_X = 18					--½øÈë¸±±¾µÄÎ»ÖÃX
x212142_g_Fuben_Z = 47					--½øÈë¸±±¾µÄÎ»ÖÃZ
x212142_g_Back_X = 262					--Ô´³¡¾°Î»ÖÃX
x212142_g_Back_Z = 46					--Ô´³¡¾°Î»ÖÃZ

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x212142_OnDefaultEvent( sceneId, selfId, targetId )
	-- ½øÈëÌõ¼ş£¬×Ô¼ºÊÇ¶Ó³¤£¬±ØĞë3ÈË£¬
	--1£¬¼ì²â×Ô¼ºÊÇ²»ÊÇÔÚ¶ÓÎéÖĞ
	if GetTeamSize(sceneId,selfId) < 3  then
		BeginEvent(sceneId)
			AddText(sceneId,"  Mu¯n tiªn vào bän sao này, các hÕ c¥n mµt nhóm có ít nh¤t 3 ngß¶i, h½n næa thành viên trong nhóm c¥n có t±ng cµng ít nh¤t 3 ngß¶i · g¥n, các hÕ còn c¥n là nhóm trß·ng.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNearTeamCount(sceneId,selfId) < 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"  Mu¯n tiªn vào bän sao này, các hÕ c¥n mµt nhóm có ít nh¤t 3 ngß¶i, h½n næa thành viên trong nhóm c¥n có t±ng cµng ít nh¤t 3 ngß¶i · g¥n, các hÕ còn c¥n là nhóm trß·ng.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNearTeamCount(sceneId,selfId) < 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"  Mu¯n tiªn vào bän sao này, các hÕ c¥n mµt nhóm có ít nh¤t 3 ngß¶i, h½n næa thành viên trong nhóm c¥n có t±ng cµng ít nh¤t 3 ngß¶i · g¥n, các hÕ còn c¥n là nhóm trß·ng.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"  Mu¯n tiªn vào bän sao này, các hÕ c¥n mµt nhóm có ít nh¤t 3 ngß¶i, h½n næa thành viên trong nhóm c¥n có t±ng cµng ít nh¤t 3 ngß¶i · g¥n, các hÕ còn c¥n là nhóm trß·ng.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	x212142_MakeCopyScene(sceneId, selfId)
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x212142_OnEnumerate( sceneId, selfId, targetId )
	
	-- ½øÈë¸±±¾µÄÌõ¼ş£¬Íæ¼ÒµÈ¼¶´óÓÚ20£¬Íæ¼ÒÍê³ÉÁËÈÎÎñ 
	if IsHaveMission( sceneId, selfId, x212142_g_MissionId ) > 0 then
		AddNumText( sceneId, x212142_g_ScriptId, "Ğßa ta ğªn bao vây NhÕn Môn Quan", 10 ,-1 )
	end
	
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x212142_CheckAccept( sceneId, selfId )
	
end

--**********************************
--Ñ¯ÎÊÍæ¼ÒÊÇ·ñÒª½øÈë¸±±¾
--**********************************
function x212142_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--½ÓÊÜ
--**********************************
function x212142_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--Íæ¼ÒÍ¬Òâ½øÈë¸±±¾
--**********************************
function x212142_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--´´½¨¸±±¾
--**********************************
function x212142_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "gongdi.nav"); --µØÍ¼ÊÇ±ØĞëÑ¡È¡µÄ£¬¶øÇÒ±ØĞëÔÚConfig/SceneInfo.iniÀïÅäÖÃºÃ
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x212142_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x212142_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x212142_g_CopySceneType);--ÉèÖÃ¸±±¾Êı¾İ£¬ÕâÀï½«0ºÅË÷ÒıµÄÊı¾İÉèÖÃÎª999£¬ÓÃÓÚ±íÊ¾¸±±¾ºÅ999(Êı×Ö×Ô¶¨Òå)
	LuaFnSetCopySceneData_Param(sceneId, 1, x212142_g_ScriptId);--½«1ºÅÊı¾İÉèÖÃÎª¸±±¾³¡¾°ÊÂ¼ş½Å±¾ºÅ
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--ÉèÖÃ¶¨Ê±Æ÷µ÷ÓÃ´ÎÊı
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ, ³õÊ¼»¯
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--ÉèÖÃ¸±±¾¹Ø±Õ±êÖ¾, 0¿ª·Å£¬1¹Ø±Õ
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--ÉèÖÃÀë¿ªµ¹¼ÆÊ±´ÎÊı
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --±£´æ¶ÓÎéºÅ
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--É±ËÀBossµÄÊıÁ¿
	
	-- ¾çÇéÓÃµ½µÄ±äÁ¿Çå¿Õ
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	--ÉèÖÃ³¡¾°ÖĞµÄ¸÷ÖÖNpcºÍÇøÓò
	LuaFnSetSceneLoad_Area( sceneId, "gongdishaolinmis_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "gongdishaolinmis_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --³õÊ¼»¯Íê³Éºóµ÷ÓÃ´´½¨¸±±¾º¯Êı
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D¸ch chuy¬n thành công!");
		else
			AddText(sceneId,"S¯ lßşng bän sao ğã ğªn gi¾i hÕn, ğ« ngh¸ lát næa thØ lÕi!");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--¸±±¾ÊÂ¼ş
--**********************************
function x212142_OnCopySceneReady( sceneId, destsceneId )

	--½øÈë¸±±¾µÄ¹æÔò
	-- 1£¬Èç¹ûÕâ¸öÎÄ¼şÃ»ÓĞ×é¶Ó£¬¾Í´«ËÍÕâ¸öÎÄ¼ş×Ô¼º½øÈë¸±±¾
	-- 2, Èç¹ûÍæ¼ÒÓĞ¶ÓÎé£¬µ«ÊÇÍæ¼Ò²»ÊÇ¶Ó³¤£¬¾Í´«ËÍ×Ô¼º½øÈë¸±±¾
	-- 3£¬Èç¹ûÍæ¼ÒÓĞ¶ÓÎé£¬²¢ÇÒÕâ¸öÍí¼äÊÇ¶Ó³¤£¬¾Í´«ËÍ×Ô¼ººÍ¸½½ü¶ÓÓÑÒ»Æğ½øÈ¥

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- ´¦ÓÚÎŞ·¨Ö´ĞĞÂß¼­µÄ×´Ì¬
		return
	end

	-- ¼ì²âÍæ¼ÒÊÇ²»ÊÇÓĞ¶ÓÎé
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- Ã»ÓĞ¶ÓÎé
		return
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x212142_g_Fuben_X, x212142_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x212142_g_Fuben_X, x212142_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--ÓĞÍæ¼Ò½øÈë¸±±¾ÊÂ¼ş
--**********************************
function x212142_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--ÓĞÍæ¼ÒÔÚ¸±±¾ÖĞËÀÍöÊÂ¼ş
--**********************************
function x212142_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--·ÅÆú
--**********************************
function x212142_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- »Ø³Ç£¬Ö»ÓĞ³ÇÊĞÈÎÎñ¸±±¾¿ÉÒÔµ÷ÓÃ´Ë½Ó¿Ú
--**********************************
function x212142_BackToCity( sceneId, selfId )
	
end

--**********************************
--¼ÌĞø
--**********************************
function x212142_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x212142_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--Ìá½»
--**********************************
function x212142_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x212142_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x212142_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x212142_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼ş
--**********************************
function x212142_OnCopySceneTimer( sceneId, nowTime )
	--¼ì²â¸±±¾ÖĞµÄ¹ÖÊÇ²»ÊÇÉ±¹â£¬É±¹â×Ô¶¯´«Íæ¼Ò³ö¸±±¾
	
	
end




