--ÓñÍÃÏÂ·²Æô¶¯ºÍÖÖboss½Å±¾½Å±¾

--½Å±¾ºÅ
x050058_g_ScriptId	= 050058

--ÐèÒªË¢³öµÄÓñÍÃbossÊý¾Ý
x050058_g_BossData = {
	-- ID						BOSSµÄ monster id
	-- AIType				BOSSµÄAIType....
	-- AIScriptID	BOSSµÄAIScriptID....
	ID = 890, AIType = 0, AIScriptID = 210, scriptID = 050058, name = "Ðào khí ng÷c thö"
}

x050058_g_begintime = 20080914      --»î¶¯¿ªÊ¼Ê±¼ä
x050058_g_endtime = 20080928        --»î¶¯½áÊøÊ±¼ä

--Ë¢³öÓñÍÃµÄËæ»ú×ø±ê
x050058_g_BossPosData = {   
  --posX Ëæ»úµãµÄX×ø±ê 
  --posY Ëæ»úµãµÄY×ø±ê 
  	{posX = 238, posZ = 63},
  	{posX = 193, posZ = 74},
 	{posX = 150, posZ = 74},
  	{posX = 127, posZ = 91},
  	{posX = 48, posZ = 65},
  	{posX = 177, posZ = 100},
}

x050058_gBossPosNum = 6          --ÓëÉÏÃæ¶ÔÓ¦£¬Ëæ»ú×ø±êµÄ¸öÊý
x050058_g_activity_id = 183        --±¾»î¶¯id£¬ÓëActivityNotice.txtÖÐidºÅ¶ÔÓ¦£¬²»¿ÉÂÒ¸Ä

--ÉèÖÃ²ÎÊý£¬±ê¼Çboss×´¿ö:0±íÊ¾boss»î×ÅÄØ£¬²»ÓÃ¹ÜËû£»0---31Ö®¼ä£¬±íÊ¾ÒÑ¾­ËÀÁËboss£¬ÕýÔÚ¼ÆÊý£¬µ½30·ÖÖÓÊ±ÔÙÖÖÒ»¸ö£»32±íÊ¾Ê±¼äµ½ÁË£¬ÖÖ¹Ö£¬ÖÖ¹Öºó¸´0Î»
x050058_g_activityParam_bossstate = 0

--**********************************
--½Å±¾Èë¿Úº¯Êý
--**********************************
function x050058_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	if x050058_IsActivityOpen(sceneId) ~= 1 then
		return
	end
	--²ÎÊýËµÃ÷£º³¡¾°ID£¬»î¶¯ID£¬Ê±¼ä¼ä¸ô£¬¹«¸æÀàÐÍ£¨¿ÉÒÔ²»´«£¬Ä¬ÈÏÆÕÍ¨¹«¸æÀàÐÍ£©,¿ªÆô»î¶¯£¬Ò»·ÖÖÓ½øÐÐÒ»´ÎÐÄÌø
	StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )
	--ÖÖÒ»¸ö¹Ö
	SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, 0)
	x050058_SetBossInRandomPos(sceneId)
	
end

--**********************************
--ÐÄÌøº¯Êý
--**********************************
function x050058_OnTimer( sceneId, actId, uTime )

	--¼ì²â»î¶¯ÊÇ·ñ¹ýÆÚ
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end
	
	if x050058_IsActivityOpen(sceneId) ~= 1 then
		return
	end

	local nBossState = GetActivityParam(sceneId, actId, x050058_g_activityParam_bossstate)
	
	if nBossState > 0 and nBossState < 32 then
		nBossState = nBossState + 1
		SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, nBossState)
	elseif nBossState >= 32 then
		SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, 0)
		x050058_SetBossInRandomPos(sceneId)
	end
end


--**********************************
--³¡¾°ÖÐÉ±ÁË¹Ö
--**********************************
function x050058_OnDie(sceneId, selfId, killerId)						-- ³¡¾°ID, ±»É±µÄObjId, É±ÊÖObjId
	local szName = GetName(sceneId, selfId)
	if szName == x050058_g_BossData.name then
		SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, 1)        --ÓÐÒ»¸öbossËÀÁË
	end
end

--ÔÚ¸ø¶¨Ëæ»úµãÖÖÒ»¸öÍÃ×Óboss
function x050058_SetBossInRandomPos(sceneId)
	local objId
	local nPosRand = random( x050058_gBossPosNum )
	objId = LuaFnCreateMonster( sceneId, x050058_g_BossData.ID, x050058_g_BossPosData[nPosRand].posX, x050058_g_BossPosData[nPosRand].posZ, x050058_g_BossData.AIType, x050058_g_BossData.AIScriptID , x050058_g_BossData.scriptID )
end

--ÅÐ¶ÏÊÇ·ñ»î¶¯Ê±¼ä 2008-08-14--------2008-08-28
--·µ»ØÖµ£º
--0£º²»ÊÇ»î¶¯Ê±¼ä
--1£ºÊÇ»î¶¯Ê±¼ä
function x050058_IsActivityOpen(sceneId)
	local nDay = GetTime2Day(sceneId)
	local bRet = 0
	
	if nDay >= x050058_g_begintime and nDay <= x050058_g_endtime then
		bRet = 1
	else 
		bRet = 0
	end
	
	return bRet	
end
