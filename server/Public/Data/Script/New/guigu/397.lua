--Thß½ng S½n BOSSQu¥n Ð±i m¾i K¸ch bän g¯c 

--K¸ch bän g¯c Hào 
x760397_g_ScriptId	= 760397

--Ð±i m¾i Phß½ng thÑc Vi:
--Kích hoÕt ThØ K¸ch bän g¯c Th¶i Xác ð¸nh ð¸a ði¬m Xoát Xu¤t 10Cái BOSS....

--Yêu c¥u Xoát Ra BOSSCüa S¯ li®u Bi¬u....
--BOSSCüa MonsterIDKhông th¬ L£p lÕi....— ðây Cänh Trung Cùng th¶i kh¡c ðó Cùng Cái MonsterIDCüa Quái Chï có th¬ T°n tÕi Mµt cái....Có Li«n không Xoát....
x760397_g_BossData = {
{ID=15436, PosX=255, PosY=262,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=15439, PosX=250, PosY=259,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=15442, PosX=251, PosY=251,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },
{ID=15445, PosX=258, PosY=250,BaseAI=0, ExtAIScript=0, ScriptID=-1, NeedCreate=1 },																						
}


--**********************************
--K¸ch bän g¯c Nh§p kh¦u Hàm s¯ 
--**********************************
function x760397_OnDefaultEvent(sceneId, actId, iNoticeType, param2, param3, param4, param5)

	--M· ra HoÕt ðµng....
	StartOneActivity(sceneId, actId, 180*1000, iNoticeType)

	--BOSSS¯ li®u Bi¬u Vi Không Li«n không Xoát BOSS....
	if getn(x760397_g_BossData) <1 then
		return
	end

	--Tr÷ng Trí BossTrùng kiªn TrÕng thái....
	for _, Data in x760397_g_BossData do
		Data.NeedCreate = 1
	end

	--Biªn L¸ch Cänh tßþng Trung S· hæu Quái....Ð±i m¾i BOSSTrùng kiªn TrÕng thái....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID(sceneId, MonsterId)
		x760397_CurSceneHaveMonster(sceneId, MosDataID)
	end

	--Trùng kiªn Nhu Mu¯n trùng kiªn BOSS....
	for _, BossData in x760397_g_BossData do
		if BossData.NeedCreate == 1 then
			local MonsterID = LuaFnCreateMonster(sceneId, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID)
			SetCharacterTitle(sceneId, MonsterID,"Dûng s¤m Thông thiên Tháp")
		end
	end

end

--**********************************
--Tim ð§p Hàm s¯ 
--**********************************
function x760397_OnTimer(sceneId, actId, uTime)

	--Ki¬m tra ðo lß¶ng HoÕt ðµng Hay không Quá th¶i hÕn 
	if CheckActiviyValidity(sceneId, actId) == 0 then
		StopOneActivity(sceneId, actId)
	end

end

--**********************************
--Dùng cho Ð±i m¾i Trùng kiªn TrÕng thái....
--**********************************
function x760397_CurSceneHaveMonster(sceneId, DataID)

	for i, Data in x760397_g_BossData do
		if DataID == Data.ID then
			x760397_g_BossData[i].NeedCreate = 0
			break
		end
	end

end

