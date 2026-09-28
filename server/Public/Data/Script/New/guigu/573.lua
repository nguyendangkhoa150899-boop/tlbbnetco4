--K¸ch bän g¯c Hào 
x760573_g_ScriptId	= 760573

--Phó bän Logic K¸ch bän g¯c Hào....
x760573_g_FuBenScriptId = 002052


--Mi­n d¸ch Riêng KÛ nång buff....
x760573_Buff_MianYi1	= 10472	--Mi­n d¸ch Mµt ít M£t trái Hi®u quä....
x760573_Buff_MianYi2	= 10471	--Mi­n d¸ch Bình thß¶ng †n thân....

--Hàn tø ph¤t huy®t 
x760573_SkillA_ID			= 995
x760573_SkillA_CD			= 20000

--Truy®n âm sßu h°n 
x760573_SkillC_ID		= 996
x760573_SkillC_BID		= 997
x760573_SkillC_CD		= 43000

--Bích trung càn khôn 
x760573_SkillD_ID		= 998
x760573_SkillD_CD		= 60000


--B¡t ð¥u Tiªn vào Cu°ng bÕo TrÕng thái Th¶i gian....
x760573_EnterKuangBaoTime	= 500*60*1000
	x760573_g_DogfacePos = {
	{ 136, 75, 0, 43942 },
    { 143, 51, 1, 43942 },
    { 128, 67, 2, 43942 }, 
    { 131, 54, 3, 43942 },
    { 146, 73, 4, 43942 },
    { 152, 61, 5, 43942 }		
}
	x760573_g_DogfacePosA = {
	{ 136, 75, 6, 43943 },
    { 143, 51, 7, 43943 },
    { 128, 67, 8, 43943 }, 
    { 131, 54, 9, 43943 },
    { 146, 73, 10, 43943 },
    { 152, 61, 11, 43943 }		
}
--AI Index....
x760573_IDX_StopWatch						= 1	--Ð°ng h° b¤m giây....
x760573_IDX_SkillA_CD						= 2	--AKÛ nång Cüa CDTh¶i gian....
x760573_IDX_SkillC_CD						= 3	--CKÛ nång Cüa CDTh¶i gian....
x760573_IDX_SkillD_CD						= 4	--CKÛ nång Cüa CDTh¶i gian....
x760573_IDX_SkillE_CD						= 5	--EKÛ nång Cüa CDTh¶i gian....
x760573_IDX_KuangBaoTimer				= 6	--Cu°ng bÕo Tính gi¶ Khí....

x760573_IDX_CombatFlag 			= 1	--Hay không ch² Vu TrÕng thái chiªn ð¤u Cüa Tiêu chí....
x760573_IDX_IsKuangBaoMode	= 2	--Hay không ch² Vu Cu°ng bÕo Hình thÑc Cüa Tiêu chí....

--**********************************
--M¾i b¡t ð¥u Hóa....
--**********************************
function x760573_OnInit(sceneId, selfId)
	--Tr÷ng Trí AI....
	x760573_ResetMyAI(sceneId, selfId)
end


--**********************************
--Tim ð§p....
--**********************************
function x760573_OnHeartBeat(sceneId, selfId, nTick)

	--Ki¬m tra ðo lß¶ng Có phäi hay không Ðã chªt....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--Ki¬m tra ðo lß¶ng Hay không Không · TrÕng thái chiªn ð¤u....
	if 0 == MonsterAI_GetBoolParamByIndex(sceneId, selfId, x760573_IDX_CombatFlag) then
		return
	end

	--Cu°ng bÕo TrÕng thái Không c¥n T¦u Logic....
	if 1 == MonsterAI_GetBoolParamByIndex(sceneId, selfId, x760573_IDX_IsKuangBaoMode) then
		return
	end

	--AKÛ nång Tim ð§p....
	if 1 == x760573_TickSkillA(sceneId, selfId, nTick) then
		return
	end

	--CKÛ nång Tim ð§p....
	if 1 == x760573_TickSkillC(sceneId, selfId, nTick) then
		return
	end

	--DKÛ nång Tim ð§p....
	if 1 == x760573_TickSkillD(sceneId, selfId, nTick) then
		return
	end

	--EKÛ nång Tim ð§p....
	if 1 == x760573_TickSkillE(sceneId, selfId, nTick) then
		return
	end

	--Ð°ng h° b¤m giây Tim ð§p....
	x760573_TickStopWatch(sceneId, selfId, nTick)

end


--**********************************
--Tiªn vào Chiªn ð¤u....
--**********************************
function x760573_OnEnterCombat(sceneId, selfId, enmeyId)

	--Gia M¾i b¡t ð¥u buff....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x760573_Buff_MianYi1, 0)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x760573_Buff_MianYi2, 0)

	--Tr÷ng Trí AI....
	x760573_ResetMyAI(sceneId, selfId)

	--Thiªt trí Tiªn vào TrÕng thái chiªn ð¤u....
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x760573_IDX_CombatFlag, 1)

end

--**********************************
--R¶i ði Chiªn ð¤u....
--**********************************
function x760573_OnLeaveCombat(sceneId, selfId)

	--Tr÷ng Trí AI....
	x760573_ResetMyAI(sceneId, selfId)

	--C¡t bö Chính mình....
	LuaFnDeleteMonster(sceneId, selfId)
	--Sáng tÕo Ð¯i thoÕi NPC....
	local MstId = CallScriptFunction(x760573_g_FuBenScriptId,"CreateBOSS", sceneId,"MinMo_NPC", -1, -1)
	SetUnitReputationID(sceneId, MstId, MstId, 0)
end


--**********************************
--Giªt chªt ð¸ch nhân....
--**********************************
function x760573_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--TØ vong....
--**********************************
function x760573_OnDie(sceneId, selfId, killerId)

	--L¤y ðßþc Trß¾c m£t Cänh tßþng Lí Nhân s¯ 
	local num = LuaFnGetCopyScene_HumanCount(sceneId)
	local mems = {}
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId, i)
        local aa = random(1,5)
        for j = 1,aa do
		 AddMonsterDropItem(sceneId, selfId, mems[i], 30600084)
        end
	end

	--Tr÷ng Trí AI....
	x760573_ResetMyAI(sceneId, selfId)

	--Thiªt trí Ðã Khiêu chiªn Quá Cáp ÐÕi Bá....
	CallScriptFunction(x760573_g_FuBenScriptId,"SetBossBattleFlag", sceneId,"MinMo", 2)

	--Nªu Còn không có Khiêu chiªn Quá Tang Th± Công T¡c Có th¬ Khiêu chiªn Tang Th± Công....
	if 2 ~= CallScriptFunction(x760573_g_FuBenScriptId,"GetBossBattleFlag", sceneId,"TaoQin") then
		CallScriptFunction(x760573_g_FuBenScriptId,"SetBossBattleFlag", sceneId,"TaoQin", 1)
	end
		
	-- zchw Toàn c¥u Thông cáo 
	local	playerName	= GetName(sceneId, killerId)
	
	--Giªt chªt Quái v§t Chính là Süng v§t T¡c Thu hoÕch Này chü Ngß¶i tên g÷i....
	local playerID = killerId
	local objType = GetCharacterType(sceneId, killerId)
	if objType == 3 then
		playerID = GetPetCreator(sceneId, killerId)
		playerName = GetName(sceneId, playerID)
	end
	
	--Nªu Ngß¶i ch½i T± ðµi R°i T¡c Thu hoÕch Ðµi trß·ng Tên....
	local leaderID = GetTeamLeader(sceneId, playerID)
	if leaderID ~= -1 then
		playerName = GetName(sceneId, leaderID)
	end

	if playerName ~= nil then
		str = format("#cffcc88#{_INFOUSR%s} Dçn d¡t Ðµi ngû R¯t cuµc Tß½ng Lang hoàn Phúc ð¸a Lý Thu thüy Ðánh bÕi !", playerName); --Ô Lão ðÕi 
		AddGlobalCountNews(sceneId, str)
	end
	CallScriptFunction(898992,"MonsterOnDie", sceneId, selfId, killerId,19)
end



--**********************************
--Tr÷ng Trí AI....
--**********************************
function x760573_ResetMyAI(sceneId, selfId)

	--Tr÷ng Trí Tham s¯....
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_StopWatch, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillA_CD, 0)

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillC_CD, x760573_SkillC_CD)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillD_CD, x760573_SkillD_CD)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillE_CD, x760573_SkillE_CD)

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_KuangBaoTimer, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x760573_IDX_CombatFlag, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x760573_IDX_IsKuangBaoMode, 0)

end

--**********************************
--AKÛ nång Tim ð§p....
--**********************************
function x760573_TickSkillA(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillA_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillA_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillA_CD, x760573_SkillA_CD-(nTick-cd))
		return x760573_UseSkillA(sceneId, selfId)
	end

end

--**********************************
--CKÛ nång Tim ð§p....
--**********************************
function x760573_TickSkillC(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillC_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillC_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillC_CD, x760573_SkillC_CD-(nTick-cd))
		return x760573_UseSkillC(sceneId, selfId)
	end

end

--**********************************
--DKÛ nång Tim ð§p....
--**********************************
function x760573_TickSkillD(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillD_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillD_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillD_CD, x760573_SkillD_CD-(nTick-cd))
		return x760573_UseSkillD(sceneId, selfId)
	end

end

--**********************************
--EKÛ nång Tim ð§p....
--**********************************
function x760573_TickSkillE(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillE_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillE_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillE_CD, x760573_SkillE_CD-(nTick-cd))
		return x760573_UseSkillE(sceneId, selfId)
	end

end

--**********************************
--Ð°ng h° b¤m giây Tim ð§p....
--**********************************
function x760573_TickStopWatch(sceneId, selfId, nTick)

	--HÕn chª M²i Mi¬u M¾i có th¬ Ch¤p hành Mµt l¥n....
	local time = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_StopWatch)
	if (time + nTick)> 1000 then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_StopWatch, time+nTick-1000)
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760573_IDX_StopWatch, time+nTick)
		return
	end
end

--**********************************
--SØ døng AKÛ nång....
--**********************************
function x760573_UseSkillA(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillB_Step)> 0 then
		return 0
	end
	LuaFnNpcChat(sceneId, selfId, 0,"Cûng dám Cùng ta Chính di®n giao phong ,Ngã Ðäo Mu¯n nhìn Ai có th¬ Tránh thoát Hàn tø ph¤t huy®t !")
	
	--Phó bän Trung Hæu hi®u Ngß¶i ch½i Cüa Danh sách....
	local PlayerList = {}

	--Tß½ng Hæu hi®u Nhân Gia nh§p Danh sách....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--Tùy c½ Thiêu Tuy¬n mµt cái Ngß¶i ch½i....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[random(numPlayer)]


	
	--SØ døng Không KÛ nång....
	
	local x,z = GetWorldPos(sceneId, selfId)
	LuaFnUnitUseSkill(sceneId, selfId, x760573_SkillA_ID, selfId, x, z, 0, 1)

	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, selfId, x760573_SkillA_SpecObj, x, z, 0)

	return 1	
	

end

--**********************************
--SØ døng CKÛ nång....
--**********************************
function x760573_UseSkillC(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	
	local CurPercent = GetHp(sceneId, selfId) / GetMaxHp(sceneId, selfId)
	local LastStep = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillA_HPStep)
	local CurStep = 0
	if CurPercent <= 0.1333 then
		CurStep = 5
	elseif CurPercent <= 0.3666 then
		CurStep = 4
	elseif CurPercent <= 0.6666 then
		CurStep = 3
	elseif CurPercent <= 0.8333 then
		CurStep = 2
	elseif CurPercent <= 0.9333 then
		CurStep = 1
	end

		for i = 1, getn(x760573_g_DogfacePos) do
			if x760573_g_DogfacePos[i] then
			  local dogfaceId = LuaFnCreateMonster(sceneId, x760573_g_DogfacePos[i][4], x760573_g_DogfacePos[i][1], x760573_g_DogfacePos[i][2], 1, 4, -1)
				SetMonsterGroupID(sceneId, dogfaceId, x760573_g_DogfaceGroup)
				SetPatrolId(sceneId, dogfaceId, x760573_g_DogfacePos[i][3])		-- Thiªt trí Tu¥n tra Ðß¶ng nhö 
				SetCharacterDieTime(sceneId, dogfaceId, 12000)
			end
		end	
	
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillB_Step)> 0 then
		return 0
	end
	LuaFnNpcChat(sceneId, selfId, 0,"Nhìn xem Là các ngß½i Ðao Khoái ,Vçn là ta Cüa Vô tß¾ng Bóng dáng Khoái !")
	--Phó bän Trung Hæu hi®u Ngß¶i ch½i Cüa Danh sách....
	local PlayerList = {}

	--Tß½ng Hæu hi®u Nhân Gia nh§p Danh sách....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--Tùy c½ Thiêu Tuy¬n mµt cái Ngß¶i ch½i....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[random(numPlayer)]


	
	--SØ døng Không KÛ nång....
	
	local x,z = GetWorldPos(sceneId, selfId)
	LuaFnUnitUseSkill(sceneId, selfId, x760573_SkillC_ID, selfId, x, z, 0, 1)
	LuaFnUnitUseSkill(sceneId, selfId, x760573_SkillC_BID, selfId, x, z, 0, 1)
	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, selfId, x760573_SkillC_SpecObj, x, z, 0)

	return 1

end

--**********************************
--SØ døng DKÛ nång....
--**********************************
function x760573_UseSkillD(sceneId, selfId)

	local CurPercent = GetHp(sceneId, selfId) / GetMaxHp(sceneId, selfId)
	local LastStep = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillD_HPStep)
	local CurStep = 6
	if CurPercent <= 0.1333 then
		CurStep = 7
	elseif CurPercent <= 0.3666 then
		CurStep = 8
	elseif CurPercent <= 0.6666 then
		CurStep = 9
	elseif CurPercent <= 0.8333 then
		CurStep = 10
	elseif CurPercent <= 0.9333 then
		CurStep = 11
	end

		for i = 1, getn(x760573_g_DogfacePosA) do
			if x760573_g_DogfacePosA[i] then
			  local dogfaceId = LuaFnCreateMonster(sceneId, x760573_g_DogfacePosA[i][4], x760573_g_DogfacePosA[i][1], x760573_g_DogfacePosA[i][2], 1, 4, -1)
				SetMonsterGroupID(sceneId, dogfaceId, x760573_g_DogfaceGroup)
				--SetPatrolId(sceneId, dogfaceId, x760573_g_DogfacePosA[i][3])		-- Thiªt trí Tu¥n tra Ðß¶ng nhö 
				SetCharacterDieTime(sceneId, dogfaceId, 8000)
			end
		end

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_SkillB_Step)> 0 then
		return 0
	end

	--Phó bän Trung Hæu hi®u Ngß¶i ch½i Cüa Danh sách....
	local PlayerList = {}

	--Tß½ng Hæu hi®u Nhân Gia nh§p Danh sách....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--Tùy c½ Thiêu Tuy¬n mµt cái Ngß¶i ch½i....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[random(numPlayer)]

	--SØ døng Không KÛ nång....
	local x,z = GetWorldPos(sceneId, selfId)
	LuaFnUnitUseSkill(sceneId, selfId, x760573_SkillD_ID, selfId, x, z, 0, 1)
	LuaFnNpcChat(sceneId, selfId, 0,"Ðáng gi§n !Các ngß½i Thª nhßng Nhßþng Ngã Thß½ng ðªn LoÕi tình trÕng này ,Ta mu¯n Cho các ngß½i Tan xß½ng nát th¸t !")
	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, selfId, x760573_SkillD_SpecObj, x, z, 0)

	return 1

end

function x760573_UseSkillE(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760573_IDX_SkilE_Step)> 0 then
		return 0
	end

	--Phó bän Trung Hæu hi®u Ngß¶i ch½i Cüa Danh sách....
	local PlayerList = {}

	--Tß½ng Hæu hi®u Nhân Gia nh§p Danh sách....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--Tùy c½ Thiêu Tuy¬n mµt cái Ngß¶i ch½i....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[random(numPlayer)]


	
	--SØ døng Không KÛ nång....
	local x,z = GetWorldPos(sceneId, selfId)
	LuaFnUnitUseSkill(sceneId, selfId, x760573_SkillE_ID, selfId, x, z, 0, 1)

	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, selfId, x760573_SkillE_SpecObj, x, z, 0)

	return 1	
	

end

