--玄武岛 BOSS群刷新脚本

--脚本号
x810112_g_ScriptId	= 810112

--刷新方式为:
--激活此脚本时定点刷出10个BOSS....

--需要刷出的BOSS的数据表....
--BOSS的MonsterID不能重复....在场景中同一时刻同一个MonsterID的怪只能存在一个....有了就不刷了....
x810112_g_BossData = {

	-- ID						BOSS的 monster id
	-- PosX					坐标
	-- PosY					坐标
	-- BaseAI				BOSS的BaseAI....
	-- ExtAIScript	BOSS的扩展AI....
	-- ScriptID			BOSS的脚本ID....
	-- NeedCreate		都填1....
	
	{ ID=13565, PosX=266, PosY=257,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13566, PosX=236, PosY=226,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13567, PosX=227, PosY=156,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13568, PosX=245, PosY=74,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13569, PosX=211, PosY=192,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13570, PosX=156, PosY=77,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13571, PosX=83, PosY=111,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13572, PosX=63, PosY=142,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13573, PosX=88, PosY=230,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13565, PosX=195, PosY=227,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13565, PosX=226, PosY=126,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13566, PosX=127, PosY=256,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13567, PosX=95, PosY=174,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13568, PosX=241, PosY=162,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13569, PosX=196, PosY=177,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13570, PosX=203, PosY=101,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13571, PosX=163, PosY=192,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
	{ ID=13572, PosX=138, PosY=210,  BaseAI=3, ExtAIScript=-1, ScriptID=807004, NeedCreate=1 },
}


--**********************************
--脚本入口函数
--**********************************
function x810112_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--开启活动....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS数据表为空就不刷BOSS....
	if getn(x810112_g_BossData) < 1 then
		return
	end

	--重置Boss重建状态....
	for _, Data in x810112_g_BossData do
		Data.NeedCreate = 1
	end

	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x810112_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--重建需要重建的BOSS....
	for _, BossData in x810112_g_BossData do
		if BossData.NeedCreate == 1 then
			local MonsterID = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
			SetCharacterTitle(sceneId, MonsterID, "T鄋g Kinh C醕")
                        SetCharacterDieTime(sceneId, MonsterID, 1800000)
		end
	end

end

--**********************************
--心跳函数
--**********************************
function x810112_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--用于更新重建状态....
--**********************************
function x810112_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x810112_g_BossData do
		if DataID == Data.ID then
			x810112_g_BossData[i].NeedCreate = 0
			break
		end
	end

end
