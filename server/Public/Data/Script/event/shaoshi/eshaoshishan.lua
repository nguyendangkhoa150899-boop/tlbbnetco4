--çÎç¿·å¸±±¾....   ____¡¢·ÉÏè By£º403413393 ÐÞ¸´

--½Å±¾ºÅ
x890063_g_ScriptId = 890063

x890063_g_CopySceneType = FUBEN_SHAOSHISHAN	--¸±±¾ÀàÐÍCó¶¨ÒåÔÚScriptGlobal.luaÀïÃæ

x890063_g_TickTime		= 1				--»Øµ÷½Å±¾µÄÊ±ÖÓÊ±¼ä£¨µ¥Î»£ºÃë/´Î£©
x890063_g_NoUserTime	= 10			--¸±±¾ÖÐÃ»ÓÐÈËºó¿ÉÒÔ¼ÌÐø±£´æµÄÊ±¼ä£¨µ¥Î»£ºÃë£©
x890063_g_Fuben_X			= 128			--½øÈë¸±±¾µÄÎ»ÖÃX
x890063_g_Fuben_Z			= 225			--½øÈë¸±±¾µÄÎ»ÖÃZ
x890063_g_FuBenTime		= 3*60*60	--¸±±¾¹Ø±ÕÊ±¼ä....

--BOSS±í....
x890063_g_BOSSList =
{
	["JiuMoZhi_NPC"]				= { DataID=14219, Title="#GKhiêu Chiªn", posX=130, posY=171, Dir=27, BaseAI=3, AIScript=0, ScriptID=890070 },
	["JiuMoZhi_BOSS"]				= { DataID=14249, Title="#cff0000BOSS", posX=130, posY=171, Dir=27, BaseAI=27, AIScript=300, ScriptID=890064 },

	["ZhangJuXian_NPC"]		= { DataID=14218, Title="#GKhiêu Chiªn", posX=68, posY=121, Dir=0, BaseAI=3, AIScript=0, ScriptID=890071 },
	["ZhangJuXian_BOSS"]		= { DataID=14244, Title="#cff0000BOSS", posX=68, posY=121, Dir=0, BaseAI=27, AIScript=0, ScriptID=890065 },
	["JiangShi_BOSS"]			= { DataID=14287, Title="", posX=0, posY=0, Dir=0, BaseAI=28, AIScript=0, ScriptID=890068 },

	["MuRongFu_NPC"]				= { DataID=14217, Title="#GKhiêu Chiªn", posX=195, posY=86, Dir=27, BaseAI=3, AIScript=0, ScriptID=890072 },
	["MuRongFuLoss_NPC"]		= { DataID=14216, Title="", posX=117, posY=49, Dir=0, BaseAI=3, AIScript=0, ScriptID=890075 },
	["MuRongFu_BOSS"]			= { DataID=14239, Title="#cff0000BOSS", posX=195, posY=86, Dir=27, BaseAI=27, AIScript=0, ScriptID=890066 },

	["YaoBoDang_BOSS"]		= { DataID=42202, Title="", posX=129, posY=108, Dir=0, BaseAI=27, AIScript=0, ScriptID=890067 },
	["SiMaLing_BOSS"]	= { DataID=42203, Title="", posX=131, posY=109, Dir=0, BaseAI=27, AIScript=0, ScriptID=890068 },

	["YouDanZhi_BOSS"]		= { DataID=42204, Title="", posX=130, posY=124, Dir=0, BaseAI=0, AIScript=0, ScriptID=890074 },

	["LiFan_NPC"]				= { DataID=14216, Title="#GKhiêu Chiªn", posX=130, posY=124, Dir=27, BaseAI=3, AIScript=0, ScriptID=890075 },

	["DingChunQiu_BOSS"]		= { DataID=14234, Title="#cff0000BOSS", posX=130, posY=124, Dir=27, BaseAI=27, AIScript=0, ScriptID=890069 },

	["Panqinqin_NPC"]				= { DataID=60, Title="", posX=101, posY=111, Dir=0, BaseAI=3, AIScript=0, ScriptID=890080 },
	["Zhong_NPC"]				= { DataID=14119, Title="Xao chung", posX=100, posY=82, Dir=0, BaseAI=3, AIScript=0, ScriptID=890081 },
	["WuDing_BOSS"]			= { DataID=14282, Title="", posX=0, posY=0, Dir=0, BaseAI=3, AIScript=0, ScriptID=-1 },
}

x890063_g_FightBOSSList =
{
	[1] = x890063_g_BOSSList["JiuMoZhi_BOSS"].DataID,
	[2] = x890063_g_BOSSList["ZhangJuXian_BOSS"].DataID,
	[3] = x890063_g_BOSSList["MuRongFu_BOSS"].DataID,
	[4] = x890063_g_BOSSList["YaoBoDang_BOSS"].DataID,
	[5] = x890063_g_BOSSList["SiMaLing_BOSS"].DataID,
	[6] = x890063_g_BOSSList["DingChunQiu_BOSS"].DataID
}

--ÊÇ·ñ¿ÉÒÔÌôÕ½Ä³¸öBOSSµÄ±ê¼ÇÁÐ±í....
x890063_g_BattleFlagTbl = 
{
	["JiuMoZhi"]			= 8,	--ÊÇ·ñ¿ÉÒÔÌôÕ½¹þ´ó°Ô...
	["ZhangJuXian"]	= 9,	--ÊÇ·ñ¿ÉÒÔÌôÕ½É£ÍÁ¹«....
	["MuRongFu"]			= 10,	--ÊÇ·ñ¿ÉÒÔÌôÕ½ÎÚÀÏ´ó....
	["ShuangZi"]		= 11,	--ÊÇ·ñ¿ÉÒÔÌôÕ½Ë«×Ó....
	["DingChunQiu"]		= 12,	--ÊÇ·ñ¿ÉÒÔÌôÕ½ÀîÇïË®....
	["PlayHp"]		= 21,	--Íæ¼ÒÑªÁ¿....
}

--³¡¾°±äÁ¿Ë÷Òý....ÊÇ·ñ¿ÉÒÔÌôÕ½Ä³¸öBOSSµÄ±ê¼Ç....
-- 0=²»ÄÜÌôÕ½ 1=¿ÉÒÔÌôÕ½ 2=ÒÑ¾­ÌôÕ½¹ýÁË
x890063_g_IDX_BattleFlag_JiuMoZhi			= 8
x890063_g_IDX_BattleFlag_ZhangJuXian	= 9
x890063_g_IDX_BattleFlag_MuRongFu		= 10
x890063_g_IDX_BattleFlag_Shuangzi		= 11
x890063_g_IDX_BattleFlag_DingChunQiu	= 12
x890063_g_IDX_BattleFlag_PlayHp	= 21

x890063_g_IDX_FuBenOpenTime		= 13	--¸±±¾½¨Á¢µÄÊ±¼ä....
x890063_g_IDX_FuBenLifeStep		= 14	--¸±±¾ÉúÃüÆÚµÄstep....(°üÀ¨½¨Á¢NPC....¹Ø±Õµ¹¼ÆÊ±ÌáÊ¾....)

--³¡¾°±äÁ¿Ë÷Òý....Í¨ÓÃµÄçÎç¿·å¼ÆÊ±Æ÷....Ö÷ÒªÓÃÓÚ¼¤»îBOSSÕ½¶·....
x890063_g_IDX_SSSTimerStep			= 15
x890063_g_IDX_SSSTimerScriptID	= 16

--³¡¾°±äÁ¿Ë÷Òý....ÎÚÀÏ´óËÀÍöµÄ¼ÆÊ±Æ÷....ÓÃÓÚ´¦ÀíËÀÍöÂß¼­....
x890063_g_IDX_MuRongFuDieStep				= 17
x890063_g_IDX_MuRongFuDieScriptID		= 18
x890063_g_IDX_MuRongFuDiePosX				=	19
x890063_g_IDX_MuRongFuDiePosY				=	20


--**********************************
--ÈÎÎñÈë¿Úº¯Êý....
--**********************************
function x890063_OnDefaultEvent( sceneId, selfId, targetId )

	--¼ì²âÊÇ·ñ¿ÉÒÔ½øÈë¸±±¾....
	local ret, msg = x890063_CheckCanEnter( sceneId, selfId, targetId )
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

	x890063_MakeCopyScene( sceneId, selfId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	--BroadMsgByChatPipe( sceneId, selfId, "#YThiªu th¤t s½n£º#WØ¤°ï¹ã·¢Ó¢ÐÛÌûCóÑûÇëÖÐÔ­ÎäÁÖ¸÷Â·ºÀ½ÜÆë¾ÛÉÙÁÖCóÈ«¹ÚÇå¼Æ»®ÀûÓÃÕâ´Î»ú»áCóÊ¹Ø¤°ïÁ¦Ñ¹ÉÙÁÖ³ÉÎªÎäÁÖµÚÒ»CóÕÆ¿ØÕû¸öÖÐÔ­ÎäÁÖ£»#gff00f0Íæ¼Ò#gffff00"..nam.."#gff00f0ÂÊ¶ÓÔÚÂåÑô½øÈëThiªu th¤t s½n¸±±¾,ÊÄÒª·ÛËéÈ«¹ÚÇåÒõÄ±¡£", 4 )

end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x890063_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x890063_g_ScriptId, "Khiêu Chiªn Thiªu Th¤t S½n", 10, 1 )

end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔ½øÈë´Ë¸±±¾....
--**********************************
function x890063_CheckCanEnter( sceneId, selfId, targetId )

	--ÊÇ·ñÓÐ¶ÓÎé....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#YNhi®m vø #cFF0000Thiªu Th¤t S½n #Wlà dành cho mµt #GÐµi nhóm. #WNªu các hÕ mu¯n th¬ hi®n Tài nång cüa mình · ðây thì không th¬ nào ðâu.."
	end

	--ÊÇ²»ÊÇ¶Ó³¤....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "Chï có #Gnhóm trß·ng #Wm¾i có th¬ #YKhiêu Chiªn"
	end

	--ÈËÊýÊÇ·ñ¹»....
	if GetTeamSize(sceneId,selfId) < 1 then
		return 0, "Mu¯n Tham gia nhi®m vø #cFF0000Thiªu Th¤t S½n #Wyêu c¥u phäi l§p t± ðµi #Y3 ngß¶i #Wtr· lên m¾i có th¬ Tham gia"
	end

	--ÊÇ·ñ¶¼ÔÚ¸½½ü....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "Trong nhóm cüa bÕn có #RThành viên #Wkhông · #Gg¥n ðây #Wnên không th¬ Tham gia"
	end

	local Humanlist = {}
	local nHumanNum = 0

	--ÊÇ·ñÓÐÈË²»¹»90¼¶....
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 75 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end

	if nHumanNum > 0 then

		local msg = "Nhóm cüa bÕn: #R"
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "  "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "#WChßa ðÕt #GÐÆng c¤p #Wyêu c¥u có th¬ Tham gia là #Y75"
		return 0, msg

	end


	--ÊÇ·ñÓÐÈË½ñÌì×ö¹ý3´ÎÁË....
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_SHUANGXIANGPAO_LASTTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )
	
		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 3 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end

	end

	if nHumanNum > 0 then

		local msg = "Nhóm cüa bÕn: #R"
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "  "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. " #Wðã tham gia hªt #Y3 l¥n #W/ #G1 Ngày"
		return 0, msg

	end

	return 1

end

--**********************************
--´´½¨¸±±¾....
--**********************************
function x890063_MakeCopyScene( sceneId, selfId )

	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "cangjingge_80JQTZ.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x890063_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x890063_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x890063_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x890063_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_JiuMoZhi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_ZhangJuXian, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_MuRongFu, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_Shuangzi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_DingChunQiu, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_SSSTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_SSSTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "cangjingge_80JQTZ_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "cangjingge_80JQTZ_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D¸ch chuy¬n Thành công");
		else
			AddText(sceneId,"S¯ lßþng bän sao t¯i ða, Xin vui lòng quay lÕi sau");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--¸±±¾ÊÂ¼þ....
--**********************************
function x890063_OnCopySceneReady( sceneId, destsceneId )

	--½øÈë¸±±¾µÄ¹æÔò
	-- 1CóÈç¹ûÕâ¸öÍæ¼ÒÃ»ÓÐ×é¶ÓCó¾Í´«ËÍÕâ¸öÍæ¼Ò×Ô¼º½øÈë¸±±¾
	-- 2, Èç¹ûÍæ¼ÒÓÐ¶ÓÎéCóµ«ÊÇÍæ¼Ò²»ÊÇ¶Ó³¤Có¾Í´«ËÍ×Ô¼º½øÈë¸±±¾
	-- 3CóÈç¹ûÍæ¼ÒÓÐ¶ÓÎéCó²¢ÇÒÕâ¸öÍæ¼ÒÊÇ¶Ó³¤Có¾Í´«ËÍ×Ô¼ººÍ¸½½ü¶ÓÓÑÒ»Æð½øÈ¥

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
		local lastTime = GetMissionData( sceneId, PlayerId, MD_SHUANGXIANGPAO_LASTTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )

		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 5 then
			BeginEvent( sceneId )
				AddText( sceneId, "  Hôm nay bän sao ðã ð¥y. Xin vui lòng quay lÕi vào ngày mai" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		return
		end
	end



	--Í³¼Æ´´½¨¸±±¾´ÎÊý....
	--AuditSSSCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z) ;
	else
		local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
			NewWorld( sceneId, mems[i], destsceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z)
		end
	end

end

--**********************************
--¸±±¾³¡¾°¶¨Ê±Æ÷ÊÂ¼þ....
--**********************************
function x890063_OnCopySceneTimer( sceneId, nowTime )

	x890063_TickFubenLife( sceneId, nowTime )

	x890063_TickSSSTimer( sceneId, nowTime )

	x890063_TickMuRongFuDieTimer( sceneId, nowTime )

	x890063_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--ÓÐÍæ¼Ò½øÈë¸±±¾ÊÂ¼þ....
--**********************************


function x890063_HoiSinh( sceneId, selfId )
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "%10", sceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z )


end
function x890063_OnPlayerEnter( sceneId, selfId )

	--ÉèÖÃËÀÍöÊÂ¼þ....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z )

	--ÉèÖÃÌôÕ½¹ýÒ»´ÎçÎç¿·å....
	local lastTime = GetMissionData( sceneId, selfId, MD_SHUANGXIANGPAO_LASTTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_SHUANGXIANGPAO_LASTTIME, lastTime )

end

--**********************************
--ÓÐÍæ¼ÒÔÚ¸±±¾ÖÐËÀÍöÊÂ¼þ....
--**********************************
function x890063_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--ÌáÊ¾ËùÓÐ¸±±¾ÄÚÍæ¼Ò....
--**********************************
function x890063_TipAllHuman( sceneId, Str )

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
function x890063_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x890063_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 16 )

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
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 15 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 1 giây" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 14 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 2 giây" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 13 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 3 giây" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 12 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 4 giây" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 11 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 5 giây" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 10 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 10 giây" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 9 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 30 giây" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 8 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 1 phút" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 7 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 2 phút" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 6 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 3 phút" )
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 5 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 5 phút" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 4 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 15 phút" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 3 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 30 phút" )
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 2 )
		x890063_TipAllHuman( sceneId, "Nhi®m vø Thiªu Th¤t S½n s¨ kªt thúc sau 60 phút" )
		return
	end

	--³õÊ¼»¯¸±±¾ÄÚµÄNPC....
	if lifeStep == 0 then

		local MstId = x890063_CreateBOSS( sceneId, "JiuMoZhi_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x890063_CreateBOSS( sceneId, "ZhangJuXian_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x890063_CreateBOSS( sceneId, "MuRongFu_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x890063_CreateBOSS( sceneId, "LiFan_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--TickçÎç¿·å¼ÆÊ±Æ÷....
--**********************************
function x890063_TickSSSTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_SSSTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_SSSTimerScriptID )

	--»Øµ÷Ö¸¶¨½Å±¾µÄOnTimer....
	CallScriptFunction( scriptID, "OnSSSTimer", sceneId, step )

	--Èç¹ûÒÑ¾­×ßÍêËùÓÐstepÔò¹Ø±Õ¼ÆÊ±Æ÷....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_SSSTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_SSSTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_SSSTimerStep, step )
	end

end

--**********************************
--¿ªÆôçÎç¿·å¼ÆÊ±Æ÷....
--**********************************
function x890063_OpenSSSTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_SSSTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_SSSTimerScriptID, ScriptID )

end

--**********************************
--µ±Ç°çÎç¿·å¼ÆÊ±Æ÷ÊÇ·ñ¼¤»î....
--**********************************
function x890063_IsSSSTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_SSSTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--TickÎÚÀÏ´óËÀÍö¼ÆÊ±Æ÷....
--**********************************
function x890063_TickMuRongFuDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY )

	--»Øµ÷Ö¸¶¨½Å±¾µÄOnTimer....
	CallScriptFunction( scriptID, "OnJiuMoZhiDieTimer", sceneId, step, posX, posY )

	--Èç¹ûÒÑ¾­×ßÍêËùÓÐstepÔò¹Ø±Õ¼ÆÊ±Æ÷....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, step )
	end

end

--**********************************
--¿ªÆôÎÚÀÏ´óËÀÍö¼ÆÊ±Æ÷....
--**********************************
function x890063_OpenMuRongFuDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY, posY )

end

--**********************************
--Tick½£ÎèÇøÓò....
--Ö»ÒªÍæ¼ÒÕ¾ÔÚ³¡¾°ÀïµÄ6¸ö¹âÖùÄÚ....Ã¿Ãë¶¼ÄÜ»ñµÃÒ»¸öÃâÒß½£ÎèµÄbuff....
--**********************************
function x890063_TickJianWuArea( sceneId, nowTime )
	local nMonsterNum = GetMonsterCount( sceneId )
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, MonsterId) == "Bàng xí" then

			local x,z = GetWorldPos( sceneId, MonsterId )
			local buff1 = -1
			local buff2 = -1

			if x>=38 and x<=42 and z>=22 and z<=27 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22446) == 1 then
					buff1 = 22446
					buff2 = 22451
                            end
			elseif x>=37 and x<=41 and z>=34 and z<=38 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22447) == 1 then
					buff1 = 22447
					buff2 = 22452
                            end
			elseif x>=18 and x<=23 and z>=35 and z<=39 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22448) == 1 then
					buff1 = 22448
					buff2 = 22453
                            end
			elseif x>=16 and x<=21 and z>=23 and z<=27 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22449) == 1 then
					buff1 = 22449
					buff2 = 22454
                            end
			elseif x>=27 and x<=32 and z>=15 and z<=20 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22450) == 1 then
					buff1 = 22450
					buff2 = 22455
                            end
			end

			if buff1 ~= -1 then
				LuaFnCancelSpecificImpact(sceneId, MonsterId, buff1)
				LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, buff2, 0)
			end

		end
	end

end

--**********************************
--´´½¨Ö¸¶¨BOSS....
--**********************************
function x890063_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x890063_g_BOSSList[name]
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
	--AuditSSSCreateBoss( sceneId, BOSSData.DataID )

	return MstId

end

--**********************************
--É¾³ýÖ¸¶¨BOSS....
--**********************************
function x890063_DeleteBOSS( sceneId, name )

	local BOSSData = x890063_g_BOSSList[name]
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
function x890063_FindBOSS( sceneId, name )

	local BOSSData = x890063_g_BOSSList[name]
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
function x890063_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x890063_g_FightBOSSList do
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
			msg = msg .. BossList[i] .. "Có"
		end
		msg = msg .. BossList[nBossNum-1] .. "Chiªn ð¤u"
		return 1, msg
	end

	return 0, ""

end

--**********************************
--»ñÈ¡ÊÇ·ñ¿ÉÒÔÌôÕ½Ä³¸öBOSSµÄ±ê¼Ç....
--**********************************
function x890063_GetBossBattleFlag( sceneId, bossName )

	local idx = x890063_g_BattleFlagTbl[ bossName ]
	return LuaFnGetCopySceneData_Param( sceneId, idx )

end

--**********************************
--ÉèÖÃÊÇ·ñ¿ÉÒÔÌôÕ½Ä³¸öBOSSµÄ±ê¼Ç....
--**********************************
function x890063_SetBossBattleFlag( sceneId, bossName, bCan )

	local idx = x890063_g_BattleFlagTbl[ bossName ]
	LuaFnSetCopySceneData_Param( sceneId, idx, bCan )

end
