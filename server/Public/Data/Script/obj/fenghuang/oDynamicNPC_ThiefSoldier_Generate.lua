--太湖NPC
--造反恶贼
--普通

--脚本号
x900017_g_ScriptId	= 900017

x900017_g_BossData ={
{ID=13786, PosX=100, PosY=119,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=146, PosY=148,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=144, PosY=226,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=164, PosY=118,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },																						
{ID=13786, PosX=96, PosY=119,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=175, PosY=147,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=200, PosY=233,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=162, PosY=212,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },																						
{ID=13786, PosX=169, PosY=92,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=122, PosY=109, BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=98, PosY=195,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=173, PosY=177,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },																						
{ID=13786, PosX=209, PosY=210,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=187, PosY=200,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=148, PosY=176,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },
{ID=13786, PosX=223, PosY=162,BaseAI=3,ExtAIScript=-1,ScriptID=900018,NeedCreate=1 },

}

--**********************************
--脚本入口函数
--**********************************
function x900017_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--开启活动....
	StartOneActivity( sceneId, actId, 180*1000, iNoticeType )

	--BOSS数据表为空就不刷BOSS....
	if getn(x900017_g_BossData) < 1 then
		return
	end

	--重置Boss重建状态....
	for _, Data in x900017_g_BossData do
		Data.NeedCreate = 1
	end

	--遍历场景中所有的怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, MonsterId )
		x900017_CurSceneHaveMonster( sceneId, MosDataID )
	end

	--重建需要重建的BOSS....
	for _, BossData in x900017_g_BossData do
		if BossData.NeedCreate == 1 then
		   local MonsterId = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
                       SetCharacterDieTime(sceneId, MonsterId, 1000*60*60)
		end
	end

end

--**********************************
--心跳函数
--**********************************
function x900017_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--用于更新重建状态....
--**********************************
function x900017_CurSceneHaveMonster( sceneId, DataID )

	for i, Data in x900017_g_BossData do
		if DataID == Data.ID then
			x900017_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

