--çÎç¿·å¸±±¾....   ____¡¢·ÉÏè By£º403413393 ÐÞ¸´

--½Å±¾ºÅ
x001151_g_ScriptId = 001151
x001151_g_CopySceneType = FUBEN_HUANJING	--¸±±¾ÀàÐÍ£¬¶¨ÒåÔÚScriptGlobal.luaÀïÃæ
x001151_g_TickTime		= 1				--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x001151_g_NoUserTime	= 10			--¸±±¾ÖÐÃ»ÓÐÈËºó¿ÉÒÔ¼ÌÐø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x001151_g_Fuben_X			= 66			--½øÈë¸±±¾µÄÎ»ÖÃX
x001151_g_Fuben_Z			= 57			--½øÈë¸±±¾µÄÎ»ÖÃZ
x001151_g_FuBenTime		= 1*60*60	--¸±±¾¹Ø±ÕÊ±¼ä....
--BOSS±í....
x001151_g_BOSSList =
{
	["JiuMoZhi_NPC"]				= { DataID=42957, Title="", posX=60, posY=50, Dir=0, BaseAI=3, AIScript=0, ScriptID=001151},
	["JiuMoZhi_BOSS"]		= { DataID=42966, Title="Thiªu Th¤t S½n Th¤t Chü", posX=60, posY=50, Dir=27, BaseAI=27, AIScript=0, ScriptID=890069 },
}

x001151_g_FightBOSSList =
{
	[1] = x001151_g_BOSSList["JiuMoZhi_BOSS"].DataID,
}

--³¡¾°±äÁ¿Ë÷Òý....ÊÇ·ñ¿ÉÒÔÌôÕ½Ä³¸öBOSSµÄ±ê¼Ç....
-- 0=²»ÄÜÌôÕ½ 1=¿ÉÒÔÌôÕ½ 2=ÒÑ¾­ÌôÕ½¹ýÁË
x001151_g_IDX_BattleFlag_JiuMoZhi			= 8
x001151_g_IDX_BattleFlag_ZhuangJuXian	= 9
x001151_g_IDX_BattleFlag_MuRongFu		= 10
x001151_g_IDX_BattleFlag_Shuangzi		= 11
x001151_g_IDX_BattleFlag_DingChunQiu	= 12
x001151_g_IDX_FuBenOpenTime		= 13	--¸±±¾½¨Á¢µÄÊ±¼ä....
x001151_g_IDX_FuBenLifeStep		= 14	--¸±±¾ÉúÃüÆÚµÄstep....(°üÀ¨½¨Á¢NPC....¹Ø±Õµ¹¼ÆÊ±ÌáÊ¾....)
--³¡¾°±äÁ¿Ë÷Òý....Í¨ÓÃµÄçÎç¿·å¼ÆÊ±Æ÷....Ö÷ÒªÓÃÓÚ¼¤»îBOSSÕ½¶·....
x001151_g_IDX_PMFTimerStep			= 15
x001151_g_IDX_PMFTimerScriptID	= 16
--³¡¾°±äÁ¿Ë÷Òý....ÎÚÀÏ´óËÀÍöµÄ¼ÆÊ±Æ÷....ÓÃÓÚ´¦ÀíËÀÍöÂß¼­....
x001151_g_IDX_MuRongFuDieStep				= 17
x001151_g_IDX_MuRongFuDieScriptID		= 18
x001151_g_IDX_MuRongFuDiePosX				=	19 
x001151_g_IDX_MuRongFuDiePosY				=	20
--**********************************
--ÈÎÎñÈë¿Úº¯Êý....
--**********************************
function x001151_OnDefaultEvent( sceneId, selfId, targetId )
BeginEvent(sceneId)
if LuaFnGetSceneType(sceneId) == 1 and LuaFnGetCopySceneData_Param(sceneId, 0) == x001151_g_CopySceneType then  -- [NetCo4 02/10] chi trong pho ban moi hien Bat Dau Khieu Chien (NPC Tong Khach Bo o thanh Lau Lan cung gan script nay)
AddNumText( sceneId, x001151_g_ScriptId, "B¡t Ð¥u Khiêu Chiªn",6 ,7  )
else
AddText( sceneId, "Ph\248 b\228n Thi\234n Long \196o C\228nh t\213m \240\243ng." )
end
EndEvent(sceneId)
DispatchEventList(sceneId,selfId,targetId)
end

function x001151_OnEventRequest( sceneId, selfId, targetId, eventId )
	if LuaFnGetSceneType(sceneId) ~= 1 or LuaFnGetCopySceneData_Param(sceneId, 0) ~= x001151_g_CopySceneType then  -- [NetCo4 02/10] ngoai pho ban: Thien Long Ao Canh tam dong, khong vao / khong dat co
		BeginEvent(sceneId)
		AddText(sceneId, "Ph\248 b\228n Thi\234n Long \196o C\228nh t\213m \240\243ng.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if GetNumText() == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi, 1 )	
	x001151_TipAllHuman( sceneId, "Khiêu Chiªn Thành Công" )	
	return 0
	end 	
	--¼ì²âÊÇ·ñ¿ÉÒÔ½øÈë¸±±¾....
	local ret, msg = x001151_CheckCanEnter( sceneId, selfId, targetId )
	if 1 ~= ret then
		BeginEvent(sceneId)
		AddText(sceneId,msg)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--¹Ø±ÕNPC¶Ô»°´°¿Ú....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	x001151_MakeCopyScene( sceneId, selfId )
	
	
end	

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x001151_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x001151_g_ScriptId, "#GTiªn Vào Thí Luy®n", 10, 1 )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔ½øÈë´Ë¸±±¾....
--**********************************
function x001151_CheckCanEnter( sceneId, selfId, targetId )

	--ÊÇ·ñÓÐ¶ÓÎé....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#{PMF_20080521_02}"
	end

	--ÊÇ²»ÊÇ¶Ó³¤....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "#{PMF_20080521_03}"
	end
	
	
	
	
if LuaFnGetAvailableItemCount(sceneId, selfId, 20310193)<1 then
return 0, "Các hÕ không có l®nh bài thí luy®n"	
end	
	--ÈËÊýÊÇ·ñ¹»....
	if GetTeamSize(sceneId,selfId) < 1 then
		return 0, "#{PMF_20080521_04}"
	end

	--ÊÇ·ñ¶¼ÔÚ¸½½ü....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "#{PMF_20080521_05}"
	end

	local Humanlist = {}
	local nHumanNum = 0

	--ÊÇ·ñÓÐÈË²»¹»90¼¶....
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 80 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end

	if nHumanNum > 0 then

		local msg = "    Ðµi ngû giØa"
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "£¬"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "µÄÐÞÎªÉÐÇ³\£¬»¹ÊÇ²»ÒªÈ¥ÎªÃî¡£"
		return 0, msg

	end


	--ÊÇ·ñÓÐÈË½ñÌì×ö¹ý3´ÎÁË....
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_LINGQUZHAOPAI_HAVESENDMAIL )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )
	
		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 5 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end

	end

	if nHumanNum > 0 then

		local msg = "    "
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "£¬"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "±¾ÈÕÒÑ¾­ÌôÕ½¹ý5´ÎÌìÁú»Ã¾³ÁË¡£"
		return 0, msg

	end
DelItem(sceneId,selfId,20310193,1)
	return 1,msg

end

--**********************************
--´´½¨¸±±¾....
--**********************************
function x001151_MakeCopyScene( sceneId, selfId )
	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "tianlonghuanjing.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x001151_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x001151_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x001151_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x001151_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_ZhuangJuXian, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_MuRongFu, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_Shuangzi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_PMFTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_PMFTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "tianlonghuanjing_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "tianlonghuanjing_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"¸±±¾´´½¨³É¹¦£¡");
		else
			AddText(sceneId,"¸±±¾ÊýÁ¿ÒÑ´ïÉÏÏÞ£¬ÇëÉÔºòÔÙÊÔ£¡");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--¸±±¾ÊÂ¼þ....
--**********************************
function x001151_OnCopySceneReady( sceneId, destsceneId )
	--½øÈë¸±±¾µÄ¹æÔò
	-- 1£¬Èç¹ûÕâ¸öÍæ¼ÒÃ»ÓÐ×é¶Ó£¬¾Í´«ËÍÕâ¸öÍæ¼Ò×Ô¼º½øÈë¸±±¾
	-- 2, Èç¹ûÍæ¼ÒÓÐ¶ÓÎé£¬µ«ÊÇÍæ¼Ò²»ÊÇ¶Ó³¤£¬¾Í´«ËÍ×Ô¼º½øÈë¸±±¾
	-- 3£¬Èç¹ûÍæ¼ÒÓÐ¶ÓÎé£¬²¢ÇÒÕâ¸öÍæ¼ÒÊÇ¶Ó³¤£¬¾Í´«ËÍ×Ô¼ººÍ¸½½ü¶ÓÓÑÒ»Æð½øÈ¥
	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--Í³¼Æ´´½¨¸±±¾´ÎÊý....
	--AuditPMFCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x001151_g_Fuben_X, x001151_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x001151_g_Fuben_X, x001151_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x001151_g_Fuben_X, x001151_g_Fuben_Z)
			end
		end		
	end

end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼þ....
--**********************************
function x001151_OnCopySceneTimer( sceneId, nowTime )

	x001151_TickFubenLife( sceneId, nowTime )

	x001151_TickPMFTimer( sceneId, nowTime )

	x001151_TickMuRongFuDieTimer( sceneId, nowTime )
	
	
--x001151_TipAllHuman( sceneId,nowTime )
end

--**********************************
--ÓÐÍæ¼Ò½øÈë¸±±¾ÊÂ¼þ....
--**********************************
function x001151_OnPlayerEnter( sceneId, selfId )

	--ÉèÖÃËÀÍöÊÂ¼þ....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x001151_g_Fuben_X, x001151_g_Fuben_Z )

	--ÉèÖÃÌôÕ½¹ýÒ»´ÎçÎç¿·å....
	local lastTime = GetMissionData( sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL, lastTime )


end

--**********************************
--ÓÐÍæ¼ÒÔÚ¸±±¾ÖÐËÀÍöÊÂ¼þ....
--**********************************
function x001151_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--ÌáÊ¾ËùÓÐ¸±±¾ÄÚÍæ¼Ò....
--**********************************
function x001151_TipAllHuman( sceneId, Str )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end

end

--**********************************
--Tick¸±±¾ÉúÃüÆÚ....
--**********************************
function x001151_TickFubenLife( sceneId, nowTime )
	local openTime = LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x001151_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep )
	if lifeStep == 15 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 16 )
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		local oldSceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )
		local oldX = LuaFnGetCopySceneData_Param( sceneId, 4 )
		local oldZ = LuaFnGetCopySceneData_Param( sceneId, 5 )
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
				NewWorld( sceneId, PlayerId, oldSceneId, oldX, oldZ )
			end
		end

		return

	end

	if lifeStep == 14 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 15 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ1Ãëáá¹Ø±Õ¡£" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 14 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ2Ãëáá¹Ø±Õ¡£" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 13 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ3Ãëáá¹Ø±Õ¡£" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 12 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ4Ãëáá¹Ø±Õ¡£" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 11 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ5Ãëáá¹Ø±Õ¡£" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 10 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ10Ãëáá¹Ø±Õ¡£" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 9 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ30Ãëáá¹Ø±Õ¡£" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 8 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ1·ÖÖÓáá¹Ø±Õ¡£" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 7 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ2·ÖÖÓáá¹Ø±Õ¡£" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 6 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ3·ÖÖÓáá¹Ø±Õ¡£" )
		return
	end
	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 5 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ5·ÖÖÓáá¹Ø±Õ¡£" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 4 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ15·ÖÖÓáá¹Ø±Õ¡£" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 3 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ30·ÖÖÓáá¹Ø±Õ¡£" )
		return
	end



	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 2 )
		x001151_TipAllHuman( sceneId, "¸±±¾½«ÔÚ60·ÖÖÓáá¹Ø±Õ¡£" )
		return
	end

	--³õÊ¼»¯¸±±¾ÄÚµÄNPC....
	if lifeStep == 0 then
		local MstId = x001151_CreateBOSS( sceneId, "JiuMoZhi_NPC", -1, -1 )
		SetUnitCampID(sceneId, MstId, MstId, 0)
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_FuBenLifeStep, 1 )
		return
	end
	if	LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi ) ==1 then
		x001151_ClearMonsterByName(sceneId, "ÁéÈµÏÉ×Ó")
		x401040_CreateMonster_1(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi )+1 )
		x001151_TipAllHuman( sceneId, "ËÙ¶ÈÇ°Íù(ÌìÉñµî)ÏûÃð¹Ö1·ÖÖÓºó³öÏÖµÚ¶þ²¨¹ÖÔÚ(ÁúÍõµî)" )
	end
	--	x001151_TipAllHuman( sceneId, LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu) - leftTime )
  if LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi ) ==2 and  LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_2(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x001151_TipAllHuman( sceneId, "¹ÖÎïÒÑ¾­³öÏÖÔÚ(ÁúÍõµî)ÏûÃð¹Ö1·ÖÖÓºó³öÏÖµÚÈý²¨¹ÖÔÚ(Ò¹²æµî)" )
  end

  if LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi ) ==3 and  LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_3(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x001151_TipAllHuman( sceneId, "¹ÖÎïÒÑ¾­³öÏÖÔÚ(Ò¹²æµî)ÏûÃð¹Ö1·ÖÖÓºó³öÏÖµÚËÄ²¨¹ÖÔÚ(ÐÞÂÞµî)" )
  end
  if LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi ) ==4 and  LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_4(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x001151_TipAllHuman( sceneId, "¹ÖÎïÒÑ¾­³öÏÖÔÚ(ÐÞÂÞµî)ÏûÃð¹Ö1·ÖÖÓºó³öÏÖµÚÎå²¨¹ÖÔÚ(Ç¬´ïÂÞµî)" )
  end

  if LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi ) ==5 and  LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_5(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x001151_TipAllHuman( sceneId, "¹ÖÎïÒÑ¾­³öÏÖÔÚ(Ç¬´ïÂÞµî)ÏûÃð¹Ö1·ÖÖÓºó³öÏÖµÚÁù²¨¹ÖÔÚ(åÈÂ¥ÂÞµî)" )
  end

  if LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi ) ==6 and  LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_6(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x001151_TipAllHuman( sceneId, "¹ÖÎïÒÑ¾­³öÏÖÔÚ(åÈÂ¥ÂÞµî)ÏûÃð¹Ö1·ÖÖÓºó³öÏÖµÚÆß²¨¹ÖÔÚ(½ôÄÉÂÞµî)" )
  end
  if LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi ) ==7 and  LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_7(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x001151_TipAllHuman( sceneId, "¹ÖÎïÒÑ¾­³öÏÖÔÚ(½ôÄÉÂÞµî)ÏûÃð¹Ö1·ÖÖÓºó³öÏÖµÚ°Ë²¨¹ÖÔÚ(Ä¦ºôÂÞåÈµî)" )
  end
  if LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi ) ==8 and  LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu) - leftTime  >60 then 
		x401040_CreateMonster_8(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi )+1 )
	x001151_TipAllHuman( sceneId, "¹ÖÎïÒÑ¾­³öÏÖÔÚ(Ä¦ºôÂÞåÈµî)ÏûÃð¹Ö2·ÖÖÓºó³öÏÖ¶¥¼¶BOSS" )
  end
  
  if LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi ) ==9 and  LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu) - leftTime  >120 then 
		x401040_CreateMonster_9(sceneId)
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_DingChunQiu,  leftTime )
		SetUnitReputationID(sceneId, targetId, targetId, 28)  
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi,LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_BattleFlag_JiuMoZhi )+1 )
	   x001151_TipAllHuman( sceneId, "3·ÖÖÓºó¶¥¼¶BOSSÒÑ¾­³öÏÖÔÚ×ø±ê(58,61)ËÙ¶ÈÏûÃð°É" )
  end
end

x401040_g_Npc_1= {   
{id=15609,x=71,y=28,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15609,x=70,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15609,x=69,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=68,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=67,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=66,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15609,x=65,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15609,x=64,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=63,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=62,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=61,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15609,x=71,y=28,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15609,x=70,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15609,x=69,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=68,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=67,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=66,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15609,x=65,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15609,x=64,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=63,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=62,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15609,x=61,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
}
x401040_g_Npc_2= {    
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15613,x=86,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15613,x=87,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=88,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=89,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15613,x=86,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15613,x=87,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=88,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=89,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15613,x=86,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15613,x=87,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=88,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=89,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15613,x=86,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15613,x=87,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=88,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=89,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15613,x=85,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
}

x401040_g_Npc_3= {   
{id=15616,x=99,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15616,x=99,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15616,x=97,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=98,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15616,x=99,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15616,x=99,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=55,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15616,x=99,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15616,x=99,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15616,x=97,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=98,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15616,x=99,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15616,x=99,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15616,x=99,y=55,script=-1,pp=0,camp=110,ai=21,af=234},
}

x401040_g_Npc_4= {  
{id=15621,x=80,y=88,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15621,x=81,y=89,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15621,x=82,y=80,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=83,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=84,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=85,y=88,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15621,x=86,y=89,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15621,x=87,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=88,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=89,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=90,y=93,script=-1,pp=0,camp=110,ai=21,af=234},  
{id=15621,x=80,y=88,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15621,x=81,y=89,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15621,x=82,y=80,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=83,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=84,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=85,y=88,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15621,x=86,y=89,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15621,x=87,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=88,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=89,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15621,x=90,y=93,script=-1,pp=0,camp=110,ai=21,af=234},  
}

x401040_g_Npc_5= {  
{id=15625,x=55,y=99,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15625,x=56,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15625,x=57,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=58,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=59,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=55,y=99,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15625,x=56,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15625,x=57,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=58,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=59,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=55,y=98,script=-1,pp=0,camp=110,ai=21,af=234},  
{id=15625,x=55,y=99,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15625,x=56,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15625,x=57,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=58,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=59,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=55,y=99,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15625,x=56,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15625,x=57,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=58,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=59,y=99,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15625,x=55,y=98,script=-1,pp=0,camp=110,ai=21,af=234},  
}

x401040_g_Npc_6= {    
{id=15629,x=30,y=98,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15629,x=31,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15629,x=32,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=33,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=34,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=35,y=98,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15629,x=36,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15629,x=37,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=38,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=39,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=35,y=95,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15629,x=30,y=98,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15629,x=31,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15629,x=32,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=33,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=34,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=35,y=98,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15629,x=36,y=99,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15629,x=37,y=90,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=38,y=91,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=39,y=92,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15629,x=35,y=95,script=-1,pp=0,camp=110,ai=21,af=234},
}

x401040_g_Npc_7= {    
{id=15633,x=27,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15633,x=27,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15633,x=27,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=28,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=29,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=25,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15633,x=26,y=62,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15633,x=27,y=63,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=28,y=64,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=29,y=65,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=25,y=66,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15633,x=27,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15633,x=27,y=59,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15633,x=27,y=50,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=28,y=51,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=29,y=52,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=25,y=58,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15633,x=26,y=62,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15633,x=27,y=63,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=28,y=64,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=29,y=65,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15633,x=25,y=66,script=-1,pp=0,camp=110,ai=21,af=234},
}

x401040_g_Npc_8= {    
{id=15637,x=30,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15637,x=31,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15637,x=32,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=33,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=34,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=35,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15637,x=36,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15637,x=37,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=38,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=39,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=35,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15637,x=30,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15637,x=31,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15637,x=32,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=33,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=34,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=35,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
{id=15637,x=36,y=39,script=-1,pp=1,camp=110,ai=21,af=234},
{id=15637,x=37,y=40,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=38,y=41,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=39,y=42,script=-1,pp=2,camp=110,ai=21,af=234},
{id=15637,x=35,y=38,script=-1,pp=0,camp=110,ai=21,af=234},
}

x401040_g_Npc_9= {    
{id=15605,x=66,y=60,script=-1,pp=0,camp=110,ai=21,af=242},
}

--**********************************
-- Éú³ÉÔÀÀÏÈýÖ®ºó£¬°éËæË¢³öµÄÐ¡¹Ö
--**********************************
function x401040_CreateMonster_1(sceneId)
	for i, Npc in x401040_g_Npc_1  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end


function x401040_CreateMonster_2(sceneId)
	for i, Npc in x401040_g_Npc_2  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end
function x401040_CreateMonster_3(sceneId)
	for i, Npc in x401040_g_Npc_3  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end
function x401040_CreateMonster_4(sceneId)
	for i, Npc in x401040_g_Npc_4  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end
function x401040_CreateMonster_5(sceneId)
	for i, Npc in x401040_g_Npc_5  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end

function x401040_CreateMonster_6(sceneId)
	for i, Npc in x401040_g_Npc_6  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end

function x401040_CreateMonster_7(sceneId)
	for i, Npc in x401040_g_Npc_7  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end
function x401040_CreateMonster_8(sceneId)
	for i, Npc in x401040_g_Npc_8  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end

function x401040_CreateMonster_9(sceneId)
	for i, Npc in x401040_g_Npc_9  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
         SetUnitReputationID(sceneId, nNpcId, nNpcId, 28)
	end
end

function x001151_ClearMonsterByName(sceneId, szName)
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId)== szName  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end
end

--**********************************
-- Í¨ÓÃ´´½¨¹ÖÎïº¯Êý
--**********************************
function x401040_CreateNpc(sceneId, NpcId, x, y, Ai, AiFile, Script)
	local nMonsterId = LuaFnCreateMonster(sceneId, NpcId, x, y, Ai, AiFile, Script)
	--SetLevel(sceneId, nMonsterId,GetLevel(sceneId,selfId))
	return nMonsterId
end
--**********************************
--TickçÎç¿·å¼ÆÊ±Æ÷....
--**********************************
function x001151_TickPMFTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_PMFTimerStep )
	if step <= 0 then
		return
	end
	
	
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_PMFTimerScriptID )

	--»Øµ÷Ö¸¶¨½Å±¾µÄOnTimer....
	CallScriptFunction( scriptID, "OnPMFTimer", sceneId, step )

	--Èç¹ûÒÑ¾­×ßÍêËùÓÐstepÔò¹Ø±Õ¼ÆÊ±Æ÷....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_PMFTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_PMFTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_PMFTimerStep, step )
	end

end

--**********************************
--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷....
--**********************************
function x001151_OpenPMFTimer( sceneId, allstep, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_PMFTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_PMFTimerScriptID, ScriptID )
end

--**********************************
--µ±Ç°çÎç¿·å¼ÆÊ±Æ÷ÊÇ·ñ¼¤»î....
--**********************************
function x001151_IsPMFTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_PMFTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--TickÎÚÀÏ´óËÀÍö¼ÆÊ±Æ÷....
--**********************************
function x001151_TickMuRongFuDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDiePosY )

	--»Øµ÷Ö¸¶¨½Å±¾µÄOnTimer....
	CallScriptFunction( scriptID, "OnJiuMoZhiDieTimer", sceneId, step, posX, posY )

	--Èç¹ûÒÑ¾­×ßÍêËùÓÐstepÔò¹Ø±Õ¼ÆÊ±Æ÷....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDieStep, step )
	end

end

--**********************************
--¿ªÆôÎÚÀÏ´óËÀÍö¼ÆÊ±Æ÷....
--**********************************
function x001151_OpenMuRongFuDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x001151_g_IDX_MuRongFuDiePosY, posY )

end
--**********************************
--´´½¨Ö¸¶¨BOSS....
--**********************************
function x001151_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x001151_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local posX = 0
	local posY = 0
	if x ~= -1 and y ~= -1 then
		posX = x
		posY = y
	else
		posX = BOSSData.posX
		posY = BOSSData.posY
	end

	local MstId = LuaFnCreateMonster( sceneId, BOSSData.DataID, posX, posY, BOSSData.BaseAI, BOSSData.AIScript, BOSSData.ScriptID )
	--SetUnitReputationID(sceneId, selfId, nMonsterId, 29)   --by yaya
	SetUnitCampID(sceneId, MstId, MstId, 110)
	--SetObjDir( sceneId, MstId, BOSSData.Dir )
	SetMonsterFightWithNpcFlag( sceneId, MstId, 0 )
	if BOSSData.Title ~= "" then
		SetCharacterTitle(sceneId, MstId, BOSSData.Title)
	end
	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)
	--Í³¼Æ´´½¨BOSS....
	--AuditPMFCreateBoss( sceneId, BOSSData.DataID )

	return MstId

end

--**********************************
--É¾³ýÖ¸¶¨BOSS....
--**********************************
function x001151_DeleteBOSS( sceneId, name )

	local BOSSData = x001151_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			--LuaFnDeleteMonster( sceneId, MonsterId )
			LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			SetCharacterDieTime( sceneId, MonsterId, 1000 )
		end
	end

end

--**********************************
--Ñ°ÕÒÖ¸¶¨BOSS....
--**********************************
function x001151_FindBOSS( sceneId, name )

	local BOSSData = x001151_g_BOSSList[name]
	if not BOSSData then
		return -1
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			return MonsterId
		end
	end

	return -1

end

--**********************************
--¼ì²âµ±Ç°ÊÇ·ñÒÑ¾­´æÔÚÒ»¸öBOSSÁË....
--**********************************
function x001151_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x001151_g_FightBOSSList do
				if DataID == dataId then
					BossList[nBossNum] = GetName( sceneId, MonsterId )
					nBossNum = nBossNum + 1
				end
			end
		end
	end
	if nBossNum > 0 then
		local msg = "ÕýÓë"
		for i=0, nBossNum-2 do
			msg = msg .. BossList[i] .. "£¬"
		end
		msg = msg .. BossList[nBossNum-1] .. "Õ½¶·ÖÐ"
		return 1, msg
	end

	return 0, ""

end

