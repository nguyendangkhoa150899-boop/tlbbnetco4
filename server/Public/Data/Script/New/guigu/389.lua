--Thái H° NPC
--TÕo phän Ác t£c 
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760389_g_ScriptId	= 760389
	-- ID						BOSSCüa monster id
	-- PosX					T÷a ðµ 
	-- PosY					T÷a ðµ 
	-- BaseAI				BOSSCüa BaseAI....
	-- ExtAIScript	BOSSCüa M· rµng AI....
	-- ScriptID			BOSSChân B±n ID....
	-- NeedCreate		Ðô Ði«n 1....
x760389_g_BossData ={
{ID=42391, PosX=109, PosY=112,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=106, PosY=118,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=107, PosY=124,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=124, PosY=122,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=122, PosY=128,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=128, PosY=120,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42382, PosX=117, PosY=122,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=121, PosY=209,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=120, PosY=212,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=119, PosY=217, BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=128, PosY=219,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=129, PosY=215,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=133, PosY=213,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42383, PosX=126, PosY=214,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=209, PosY=140,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=213, PosY=141,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=218, PosY=141,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=219, PosY=132,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=217, PosY=132,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=215, PosY=132,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42384, PosX=216, PosY=136,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=221, PosY=217,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=218, PosY=220,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=222, PosY=227,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=228, PosY=222,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=223, PosY=217,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=220, PosY=218,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42385, PosX=222, PosY=221,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
}

--**********************************
--K¸ch bän g¯c Nh§p kh¦u Hàm s¯ 
--**********************************
function x760389_OnDefaultEvent(sceneId, actId, iNoticeType, param2, param3, param4, param5)

	--M· ra HoÕt ðµng....
	StartOneActivity(sceneId, actId, 180*1000, iNoticeType)

	--BOSSS¯ li®u Bi¬u Vi Không Li«n không Xoát BOSS....
	if getn(x760389_g_BossData) <1 then
		return
	end

	--Tr÷ng Trí BossTrùng kiªn TrÕng thái....
	for _, Data in x760389_g_BossData do
		Data.NeedCreate = 1
	end

	--Biªn L¸ch Cänh tßþng Trung S· hæu Quái....Ð±i m¾i BOSSTrùng kiªn TrÕng thái....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID(sceneId, MonsterId)
		x760389_CurSceneHaveMonster(sceneId, MosDataID)
	end

	--Trùng kiªn Nhu Mu¯n trùng kiªn BOSS....
	for _, BossData in x760389_g_BossData do
		if BossData.NeedCreate == 1 then
		 local MonsterId = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID)
            SetCharacterTitle(sceneId, MonsterID,"Quân Thiên Cu°ng ð°")
		end
	end

end

--**********************************
--Tim ð§p Hàm s¯ 
--**********************************
function x760389_OnTimer(sceneId, actId, uTime)

	--Ki¬m tra ðo lß¶ng HoÕt ðµng Hay không Quá th¶i hÕn 
	if CheckActiviyValidity(sceneId, actId) == 0 then
		StopOneActivity(sceneId, actId)
	end

end

--**********************************
--Dùng cho Ð±i m¾i Trùng kiªn TrÕng thái....
--**********************************
function x760389_CurSceneHaveMonster(sceneId, DataID)

	for i, Data in x760389_g_BossData do
		if DataID == Data.ID then
			x760389_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

