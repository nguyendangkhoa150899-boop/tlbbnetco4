--²ÔÉ½ BOSSÈºË¢ÐÂ½Å±¾

--Viet Translate by VTAngel (Suong Anh)
x891007_g_ScriptId	= 891007

--Ë¢ÐÂ·½Ê½Îª:
--¼¤»î´Ë½Å±¾Ê±¶¨µãË¢³ö10¸öBOSS....

--C¥n có Ë¢³öµÄBOSSµÄÊý¾Ý±í....
--BOSSµÄMonsterID²»ÄÜÖØ¸´....ÔÚ³¡¾°ÖÐÍ¬Ò»Ê±¿ÌÍ¬Ò»¸öMonsterIDµÄ¹ÖÖ»ÄÜ´æÔÚÒ»¸ö....ÓÐÁË¾Í²»Ë¢ÁË....
x891007_g_BossData = {

	-- ID						BOSSµÄ monster id
	-- PosX					×ø±ê
	-- PosY					×ø±ê
	-- BaseAI				BOSSµÄBaseAI....
	-- ExtAIScript	BOSSµÄÀ©Õ¹AI....
	-- ScriptID			BOSSµÄ½Å±¾ID....
	-- NeedCreate		¶¼Ìî1....

	{ ID=39749, PosX=168,  PosY=245, BaseAI=21, ExtAIScript=259, ScriptID=-1, NeedCreate=1 },
	{ ID=39750, PosX=168,  PosY=224, BaseAI=21, ExtAIScript=259, ScriptID=-1, NeedCreate=1 },
	{ ID=39751, PosX=167,  PosY=194, BaseAI=21, ExtAIScript=259, ScriptID=-1, NeedCreate=1 },
	{ ID=39752, PosX=167, PosY=164, BaseAI=21, ExtAIScript=259, ScriptID=-1, NeedCreate=1 },
	{ ID=39753, PosX=184,  PosY=146, BaseAI=21, ExtAIScript=259, ScriptID=-1, NeedCreate=1 },
	{ ID=39754, PosX=184,  PosY=123, BaseAI=21, ExtAIScript=259, ScriptID=-1, NeedCreate=1 },
	{ ID=39755, PosX=163,  PosY=122, BaseAI=21, ExtAIScript=259, ScriptID=-1, NeedCreate=1 },
	{ ID=39756, PosX=145, PosY=128, BaseAI=21, ExtAIScript=259, ScriptID=-1, NeedCreate=1 },
	{ ID=39757, PosX=148,  PosY=147, BaseAI=21, ExtAIScript=259, ScriptID=-1, NeedCreate=1 },
	{ ID=39758, PosX=168,  PosY=146, BaseAI=21, ExtAIScript=259, ScriptID=-1, NeedCreate=1 },

}


--**********************************
--½Å±¾Èë¿Úº¯Êý
--**********************************
function x891007_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--¿ªÆô»î¶¯....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSSÊý¾Ý±íÎª¿Õ¾Í²»Ë¢BOSS....
	if getn(x891007_g_BossData) < 1 then
		return
	end

	--ÖØÖÃBossÖØ½¨×´Ì¬....
	for _, Data in x891007_g_BossData do
		Data.NeedCreate = 1
	end

	--±éÀú³¡¾°ÖÐËùÓÐµÄ¹Ö....¸üÐÂBOSSÖØ½¨×´Ì¬....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x891007_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--ÖØ½¨C¥n có ÖØ½¨µÄBOSS....
	for _, BossData in x891007_g_BossData do
		if BossData.NeedCreate == 1 then
			local MonsterID = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
			SetCharacterTitle(sceneId, MonsterID, "Ma gi¾i chiªn th¥n")
		end
	end

end

--**********************************
--ÐÄÌøº¯Êý
--**********************************
function x891007_OnTimer( sceneId, actId, uTime )

	--¼ì²â»î¶¯ÊÇ·ñ¹ýÆÚ
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--ÓÃÓÚ¸üÐÂÖØ½¨×´Ì¬....
--**********************************
function x891007_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x891007_g_BossData do
		if DataID == Data.ID then
			x891007_g_BossData[i].NeedCreate = 0
			break
		end
	end

end
