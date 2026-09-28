--Thái H° NPC
--TÕo phän Ác t£c 
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760391_g_ScriptId	= 760391
	-- ID						BOSSCüa monster id
	-- PosX					T÷a ðµ 
	-- PosY					T÷a ðµ 
	-- BaseAI				BOSSCüa BaseAI....
	-- ExtAIScript	BOSSCüa M· rµng AI....
	-- ScriptID			BOSSChân B±n ID....
	-- NeedCreate		Ðô Ði«n 1....
x760391_g_BossData ={
{ID=42391, PosX=151, PosY=133,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=150, PosY=138,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=145, PosY=143,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=133, PosY=134,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=136, PosY=129,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=139, PosY=126,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42382, PosX=139, PosY=133,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=73, PosY=46,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=77, PosY=50,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=80, PosY=53, BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=84, PosY=37,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=88, PosY=40,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=92, PosY=45,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42383, PosX=84, PosY=46,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=30, PosY=129,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=37, PosY=131,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=44, PosY=132,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=32, PosY=113,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=40, PosY=112,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=46, PosY=113,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42384, PosX=41, PosY=121,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=36, PosY=38,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=31, PosY=40,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=27, PosY=36,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
{ID=42391, PosX=28, PosY=30,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=34, PosY=29,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42391, PosX=37, PosY=34,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=42385, PosX=32, PosY=33,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },

}

--**********************************
--K¸ch bän g¯c Nh§p kh¦u Hàm s¯ 
--**********************************
function x760391_OnDefaultEvent(sceneId, actId, iNoticeType, param2, param3, param4, param5)

	--M· ra HoÕt ðµng....
	StartOneActivity(sceneId, actId, 180*1000, iNoticeType)

	--BOSSS¯ li®u Bi¬u Vi Không Li«n không Xoát BOSS....
	if getn(x760391_g_BossData) <1 then
		return
	end

	--Tr÷ng Trí BossTrùng kiªn TrÕng thái....
	for _, Data in x760391_g_BossData do
		Data.NeedCreate = 1
	end

	--Biªn L¸ch Cänh tßþng Trung S· hæu Quái....Ð±i m¾i BOSSTrùng kiªn TrÕng thái....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID(sceneId, MonsterId)
		x760391_CurSceneHaveMonster(sceneId, MosDataID)
	end

	--Trùng kiªn Nhu Mu¯n trùng kiªn BOSS....
	for _, BossData in x760391_g_BossData do
		if BossData.NeedCreate == 1 then
		 local MonsterId = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID)
            SetCharacterTitle(sceneId, MonsterID,"Tri«u Kinh thành Cu°ng ð°")
		end
	end

end

--**********************************
--Tim ð§p Hàm s¯ 
--**********************************
function x760391_OnTimer(sceneId, actId, uTime)

	--Ki¬m tra ðo lß¶ng HoÕt ðµng Hay không Quá th¶i hÕn 
	if CheckActiviyValidity(sceneId, actId) == 0 then
		StopOneActivity(sceneId, actId)
	end

end

--**********************************
--Dùng cho Ð±i m¾i Trùng kiªn TrÕng thái....
--**********************************
function x760391_CurSceneHaveMonster(sceneId, DataID)

	for i, Data in x760391_g_BossData do
		if DataID == Data.ID then
			x760391_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

