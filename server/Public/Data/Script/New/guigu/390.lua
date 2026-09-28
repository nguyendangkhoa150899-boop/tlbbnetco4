--Thái H° NPC
--TÕo phän Ác t£c 
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760390_g_ScriptId	= 760390
	-- ID						BOSSCüa monster id
	-- PosX					T÷a ðµ 
	-- PosY					T÷a ðµ 
	-- BaseAI				BOSSCüa BaseAI....
	-- ExtAIScript	BOSSCüa M· rµng AI....
	-- ScriptID			BOSSChân B±n ID....
	-- NeedCreate		Ðô Ði«n 1....
x760390_g_BossData ={
{ID=42391, PosX=112, PosY=132,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=113, PosY=135,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=116, PosY=140,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=124, PosY=134,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=123, PosY=131,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=121, PosY=127,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42382, PosX=118, PosY=133,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=206, PosY=116,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=213, PosY=113,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=217, PosY=112, BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=223, PosY=130,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=219, PosY=132,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=211, PosY=134,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42383, PosX=215, PosY=127,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=214, PosY=44,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=211, PosY=35,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=218, PosY=26,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=226, PosY=29,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=229, PosY=38,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=222, PosY=43,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42384, PosX=222, PosY=34,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=133, PosY=34,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=133, PosY=37,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=133, PosY=43,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=117, PosY=33,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=117, PosY=36,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=119, PosY=46,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42385, PosX=124, PosY=40,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },

}

--**********************************
--K¸ch bän g¯c Nh§p kh¦u Hàm s¯ 
--**********************************
function x760390_OnDefaultEvent(sceneId, actId, iNoticeType, param2, param3, param4, param5)

	--M· ra HoÕt ðµng....
	StartOneActivity(sceneId, actId, 180*1000, iNoticeType)

	--BOSSS¯ li®u Bi¬u Vi Không Li«n không Xoát BOSS....
	if getn(x760390_g_BossData) <1 then
		return
	end

	--Tr÷ng Trí BossTrùng kiªn TrÕng thái....
	for _, Data in x760390_g_BossData do
		Data.NeedCreate = 1
	end

	--Biªn L¸ch Cänh tßþng Trung S· hæu Quái....Ð±i m¾i BOSSTrùng kiªn TrÕng thái....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID(sceneId, MonsterId)
		x760390_CurSceneHaveMonster(sceneId, MosDataID)
	end

	--Trùng kiªn Nhu Mu¯n trùng kiªn BOSS....
	for _, BossData in x760390_g_BossData do
		if BossData.NeedCreate == 1 then
		 local MonsterId = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID)
            SetCharacterTitle(sceneId, MonsterID,"La Phù Cu°ng ð°")
		end
	end

end

--**********************************
--Tim ð§p Hàm s¯ 
--**********************************
function x760390_OnTimer(sceneId, actId, uTime)

	--Ki¬m tra ðo lß¶ng HoÕt ðµng Hay không Quá th¶i hÕn 
	if CheckActiviyValidity(sceneId, actId) == 0 then
		StopOneActivity(sceneId, actId)
	end

end

--**********************************
--Dùng cho Ð±i m¾i Trùng kiªn TrÕng thái....
--**********************************
function x760390_CurSceneHaveMonster(sceneId, DataID)

	for i, Data in x760390_g_BossData do
		if DataID == Data.ID then
			x760390_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

