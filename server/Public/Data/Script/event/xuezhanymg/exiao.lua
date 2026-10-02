--ÑªÕ½ÑãÃÅÓÉ°¡ÏôÉ±ÖÆ×÷q1552743098
--ÎÒµÚÈı¸ö¸±±¾
--½Å±¾ºÅ
x391200_g_ScriptId = 391200

x391200_g_CopySceneType = FUBEN_XUEZHANYMG	--¸±±¾ÀàĞÍ£¬¶¨ÒåÔÚScriptGlobal.luaÀïÃæ

x391200_g_TickTime		= 1				--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x391200_g_NoUserTime	= 10			--¸±±¾ÖĞÃ»ÓĞÈËºó¿ÉÒÔ¼ÌĞø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x391200_g_Fuben_X			= 125			--½øÈë¸±±¾µÄÎ»ÖÃX
x391200_g_Fuben_Z			= 235			--½øÈë¸±±¾µÄÎ»ÖÃZ
x391200_g_FuBenTime		= 1*60*60	--¸±±¾¹Ø±ÕÊ±¼ä....

--BOSS±í....
--ÊÇ·ñ¿ÉÒÔÌôÕ½Ä³¸öBOSSµÄ±ê¼ÇÁĞ±í....
x391200_g_BattleFlagTbl = 
{
	["XiaoYiFeng"]			= 8,	--ÊÇ·ñ¿ÉÒÔÌôÕ½¹ş´ó°Ô...
	["XiaoRuJun"]	= 9,	--ÊÇ·ñ¿ÉÒÔÌôÕ½É£ÍÁ¹«....
	["YeLvYan"]			= 10,	--ÊÇ·ñ¿ÉÒÔÌôÕ½ÎÚÀÏ´ó....
	["ShuangZi"]		= 11,	--ÊÇ·ñ¿ÉÒÔÌôÕ½Ë«×Ó....
	["YeLvLian"]		= 12,	--ÊÇ·ñ¿ÉÒÔÌôÕ½ÀîÇïË®....
	["PlayHp"]		= 21,	--Íæ¼ÒÑªÁ¿....
}

--³¡¾°±äÁ¿Ë÷Òı....ÊÇ·ñ¿ÉÒÔÌôÕ½Ä³¸öBOSSµÄ±ê¼Ç....
-- 0=²»ÄÜÌôÕ½ 1=¿ÉÒÔÌôÕ½ 2=ÒÑ¾­ÌôÕ½¹ıÁË
x391200_g_IDX_BattleFlag_XiaoYiFeng			= 8
x391200_g_IDX_BattleFlag_XiaoRuJun	= 9
x391200_g_IDX_BattleFlag_YeLvYan		= 10
x391200_g_IDX_BattleFlag_Shuangzi		= 11
x391200_g_IDX_BattleFlag_YeLvLian	= 12
x391200_g_IDX_BattleFlag_PlayHp	= 21

x391200_g_IDX_FuBenOpenTime		= 13	--¸±±¾½¨Á¢µÄÊ±¼ä....
x391200_g_IDX_FuBenLifeStep		= 14	--¸±±¾ÉúÃüÆÚµÄstep....(°üÀ¨½¨Á¢NPC....¹Ø±Õµ¹¼ÆÊ±ÌáÊ¾....)

--³¡¾°±äÁ¿Ë÷Òı....Í¨ÓÃµÄçÎç¿·å¼ÆÊ±Æ÷....Ö÷ÒªÓÃÓÚ¼¤»îBOSSÕ½¶·....
x391200_g_IDX_BQZTimerStep			= 15
x391200_g_IDX_BQZTimerScriptID	= 16

--³¡¾°±äÁ¿Ë÷Òı....ÎÚÀÏ´óËÀÍöµÄ¼ÆÊ±Æ÷....ÓÃÓÚ´¦ÀíËÀÍöÂß¼­....
x391200_g_IDX_YeLvYanDieStep				= 17
x391200_g_IDX_YeLvYanDieScriptID		= 18
x391200_g_IDX_YeLvYanDiePosX				=	19
x391200_g_IDX_YeLvYanDiePosY				=	20


--**********************************
--ÈÎÎñÈë¿Úº¯Êı....
--**********************************
function x391200_OnDefaultEvent( sceneId, selfId, targetId )

	--¼ì²âÊÇ·ñ¿ÉÒÔ½øÈë¸±±¾....
	local ret, msg = x391200_CheckCanEnter( sceneId, selfId, targetId )
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

	x391200_MakeCopyScene( sceneId, selfId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#Y NhÕn Môn Quan : Gia Lu§t H°ng C½ không ğ¬ ı cùng Tiêu Phong chi l¶i th«, dçn ğ¥u ğÕi quân mµt l¥n næa Nam chinh.#gff00f0 İ chí báo qu¯c chi tâm #gffff00"..nam.."#gff00f0 Su¤t ğµi tÕi phßşng gáy tr¤n tiªn vào #gffff00 Huyªt chiªn NhÕn Môn Quan #gff00f0 Phó bän, th« ğem Gia Lu§t H°ng C½ ğÕi quân ğánh lui.", 4 )

end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x391200_OnEnumerate( sceneId, selfId, targetId )
	BeginEvent( sceneId )
	AddNumText( sceneId, x391200_g_ScriptId, "#cFF0000Huyªt chiªn nhÕn môn quan", 10, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔ½øÈë´Ë¸±±¾....
--**********************************
function x391200_CheckCanEnter( sceneId, selfId, targetId )

	--ÊÇ·ñÓĞ¶ÓÎé....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#{PMF_20080521_02}"
	end

	--ÊÇ²»ÊÇ¶Ó³¤....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "#{PMF_20080521_03}"
	end

	--ÈËÊıÊÇ·ñ¹»....
	if GetTeamSize(sceneId,selfId) < 1 then
		return 0, "\208\181i ng\251 ph\228i c\243 \237t nh\164t 1 ng\223\182i m\190i c\243 th\172 ti\170n v\224o!" -- [NetCo4 02/10] chu ghi 3 nguoi, code la GetTeamSize < 1
	end

	--ÊÇ·ñ¶¼ÔÚ¸½½ü....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "#{PMF_20080521_05}"
	end

	local Humanlist = {}
	local nHumanNum = 0

	--ÊÇ·ñÓĞÈË²»¹»90¼¶....
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 108 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end

	if nHumanNum > 0 then

	local msg = "    Trong \240\181i ng\251 c\243 " -- [NetCo4 02/10] thieu dau cach truoc ten nguoi (di cung dong 130)
	for i=0, nHumanNum-2 do
	msg = msg .. Humanlist[i] .. ", "
	end
	msg = msg .. Humanlist[nHumanNum-1] .. " ch\223a \240\252 c\164p 108, kh\244ng th\172 ti\170n v\224o!" -- [NetCo4 02/10] chu ghi 120, code chan < 108 (dong 118)
	return 0, msg

	end


	--ÊÇ·ñÓĞÈË½ñÌì×ö¹ı3´ÎÁË....
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_HEXIE_GUANGHUAN_DATE )
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
			msg = msg .. Humanlist[i] .. " "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "ğã khiêu chiªn 5 l¥n"
		return 0, msg

	end

	return 1

end

--**********************************
--´´½¨¸±±¾....
--**********************************
function x391200_MakeCopyScene( sceneId, selfId )

	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "xuezhanymg.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x391200_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x391200_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x391200_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x391200_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_XiaoYiFeng, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_XiaoRuJun, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_YeLvYan, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_Shuangzi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_YeLvLian, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BattleFlag_PlayHp, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "xuezhanymg_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "xuezhanymg_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"Khai sáng phó bän thành công");
		else
			AddText(sceneId,"Phø bän ğ¥y vui lòng thØ lÕi sau");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--¸±±¾ÊÂ¼ş....
--**********************************
function x391200_OnCopySceneReady( sceneId, destsceneId )

	--½øÈë¸±±¾µÄ¹æÔò
	-- 1£¬Èç¹ûÕâ¸öÍæ¼ÒÃ»ÓĞ×é¶Ó£¬¾Í´«ËÍÕâ¸öÍæ¼Ò×Ô¼º½øÈë¸±±¾
	-- 2, Èç¹ûÍæ¼ÒÓĞ¶ÓÎé£¬µ«ÊÇÍæ¼Ò²»ÊÇ¶Ó³¤£¬¾Í´«ËÍ×Ô¼º½øÈë¸±±¾
	-- 3£¬Èç¹ûÍæ¼ÒÓĞ¶ÓÎé£¬²¢ÇÒÕâ¸öÍæ¼ÒÊÇ¶Ó³¤£¬¾Í´«ËÍ×Ô¼ººÍ¸½½ü¶ÓÓÑÒ»Æğ½øÈ¥

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --ÉèÖÃ¸±±¾Èë¿Ú³¡¾°ºÅ
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local CurDayTime = GetDayTime()
	for	i=0,nearteammembercount-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_HEXIE_GUANGHUAN_DATE )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )

		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 5 then
			BeginEvent( sceneId )
				AddText( sceneId, "  Các hÕ ğã khiêu chiªn quá 5 l¥n" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		return
		end
	end

	--Í³¼Æ´´½¨¸±±¾´ÎÊı....
	--AuditBQZCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x391200_g_Fuben_X, x391200_g_Fuben_Z) ;
	else
		local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
			NewWorld( sceneId, mems[i], destsceneId, x391200_g_Fuben_X, x391200_g_Fuben_Z)
		end
	end

end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼ş....
--**********************************
function x391200_OnCopySceneTimer( sceneId, nowTime )

	x391200_TickFubenLife( sceneId, nowTime )

	x391200_TickBQZTimer( sceneId, nowTime )

	x391200_TickYeLvYanDieTimer( sceneId, nowTime )

	x391200_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--ÓĞÍæ¼Ò½øÈë¸±±¾ÊÂ¼ş....
--**********************************
function x391200_OnPlayerEnter( sceneId, selfId )

	--ÉèÖÃËÀÍöÊÂ¼ş....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x391200_g_Fuben_X, x391200_g_Fuben_Z )

	--ÉèÖÃÌôÕ½¹ıÒ»´ÎçÎç¿·å....
	local lastTime = GetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_DATE )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_HEXIE_GUANGHUAN_DATE, lastTime )

end

--**********************************
--ÓĞÍæ¼ÒÔÚ¸±±¾ÖĞËÀÍöÊÂ¼ş....
--**********************************
function x391200_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--ÌáÊ¾ËùÓĞ¸±±¾ÄÚÍæ¼Ò....
--**********************************
function x391200_TipAllHuman( sceneId, Str )

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
function x391200_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x391200_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 16 )

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

	if lifeStep == 39 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 38 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 30 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 38 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 37 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 29 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 37 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 36 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 28 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 36 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 35 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 27 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 35 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 34 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 26 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 34 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 33 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 25 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 33 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 32 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 24 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 32 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 31 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 23 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 31 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 30 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 22 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 30 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 29 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 21 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 29 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 28 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 20 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 28 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 27 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 19 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 27 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 26 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 18 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 26 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 25 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 17 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 25 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 24 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 16 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 24 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 23 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 15 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 23 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 22 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 14 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 22 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 21 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 13 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 21 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 20 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 12 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 20 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 19 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 11 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 19 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 18 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 10 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 18 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 17 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 9 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 17 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 16 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 8 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 16 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 10 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 7 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end
	if lifeStep == 14 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 15 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 1 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 14 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 2 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 13 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 3 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 12 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 4 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 11 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 5 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 10 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 10 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 9 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 30 giây" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 8 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 1 phút" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 7 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 2 phút" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 6 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 3 phút" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 5 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 5 phút" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 4 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 15 phút" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 3 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 30 phút" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 2 )
		x391200_TipAllHuman( sceneId, "Phó bän s¨ \240\243ng sau 60 phút" ) -- [NetCo4 02/10] chinh ta: dong -> dong (dong cua)
		return
	end

	--³õÊ¼»¯¸±±¾ÄÚµÄNPC....
	if lifeStep == 0 then

	local MstIdA = LuaFnCreateMonster(sceneId, 45430, 125, 244, 3, 128, 391211 )
	SetUnitReputationID( sceneId, MstIdA, MstIdA, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--TickçÎç¿·å¼ÆÊ±Æ÷....
--**********************************
function x391200_TickBQZTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerScriptID )

	--»Øµ÷Ö¸¶¨½Å±¾µÄOnTimer....
	CallScriptFunction( scriptID, "OnBQZTimer", sceneId, step )

	--Èç¹ûÒÑ¾­×ßÍêËùÓĞstepÔò¹Ø±Õ¼ÆÊ±Æ÷....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep, step )
	end

end

--**********************************
--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷....
--**********************************
function x391200_OpenBQZTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerScriptID, ScriptID )

end

--**********************************
--µ±Ç°çÎç¿·å¼ÆÊ±Æ÷ÊÇ·ñ¼¤»î....
--**********************************
function x391200_IBQZSTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_BQZTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--TickÎÚÀÏ´óËÀÍö¼ÆÊ±Æ÷....
--**********************************
function x391200_TickYeLvYanDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosY )

	--»Øµ÷Ö¸¶¨½Å±¾µÄOnTimer....
	CallScriptFunction( scriptID, "OnXiaoYiFengDieTimer", sceneId, step, posX, posY )

	--Èç¹ûÒÑ¾­×ßÍêËùÓĞstepÔò¹Ø±Õ¼ÆÊ±Æ÷....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieStep, step )
	end

end

--**********************************
--¿ªÆôÎÚÀÏ´óËÀÍö¼ÆÊ±Æ÷....
--**********************************
function x391200_OpenYeLvYanDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_YeLvYanDiePosY, posY )

end

--**********************************
--Tick½£ÎèÇøÓò....
--Ö»ÒªÍæ¼ÒÕ¾ÔÚ³¡¾°ÀïµÄ6¸ö¹âÖùÄÚ....Ã¿Ãë¶¼ÄÜ»ñµÃÒ»¸öÃâÒß½£ÎèµÄbuff....
--**********************************
function x391200_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--´´½¨Ö¸¶¨BOSS....
--**********************************
--**********************************
--Ñ°ÕÒÖ¸¶¨BOSS....
--**********************************
function x391200_FindBOSS( sceneId, name )

	local BOSSData = x391200_g_BOSSList[name]
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
function x391200_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
				if (GetName(sceneId, MonsterId)  == "Gia Lu§t H°ng C½" ) or (GetName(sceneId, MonsterId)  == "Gia Lu§t nguyên" ) or (GetName(sceneId, MonsterId)  == "Gia Lu§t uy¬n" ) or (GetName(sceneId, MonsterId)  == "Gia Lu§t tân" ) then
				nBossNum = nBossNum + 1
				end
			end

	if nBossNum > 0 then
		local msg = "boss Ngay tÕi chiªn ğ¤u bên trong"
		return 1, msg
	end

	return 0, ""

end

--**********************************
--»ñÈ¡ÊÇ·ñ¿ÉÒÔÌôÕ½Ä³¸öBOSSµÄ±ê¼Ç....
--**********************************
function x391200_GetBossBattleFlag( sceneId )

	return LuaFnGetCopySceneData_Param( sceneId, 8 )

end

--**********************************
--ÉèÖÃÊÇ·ñ¿ÉÒÔÌôÕ½Ä³¸öBOSSµÄ±ê¼Ç....
--**********************************
function x391200_SetBossBattleFlag( sceneId, bCan )
	LuaFnSetCopySceneData_Param(sceneId, 8, bCan)
	if bCan == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x391200_g_IDX_FuBenLifeStep, 39 )
end
end
