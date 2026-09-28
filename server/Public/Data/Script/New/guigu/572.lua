

--K¸ch bän g¯c Hào 
x760572_g_ScriptId	= 760572

--Phó bän Logic K¸ch bän g¯c Hào....
x760572_g_FuBenScriptId = 002052


--Mi­n d¸ch Riêng KÛ nång buff....
x760572_Buff_MianYi1	= 10472	--Mi­n d¸ch Mµt ít M£t trái Hi®u quä....
x760572_Buff_MianYi2	= 10471	--Mi­n d¸ch Bình thß¶ng †n thân....

--Hàn bång phù 
x760572_SkillA_ID			= 813
x760572_SkillA_CD			= 30000
x760572_SkillA_SpecObj = 855

--Thiên höa phù 
x760572_SkillC_ID		= 814
x760572_SkillC_CD			= 40000
x760572_SkillC_SpecObj		= 856

--Duy ngã ðµc tôn 
x760572_SkillD_ID		= 815
x760572_SkillD_CD		= 20000


--B¡t ð¥u Tiªn vào Cu°ng bÕo TrÕng thái Th¶i gian....
x760572_EnterKuangBaoTime	= 500*60*1000
--AI Index....
x760572_IDX_StopWatch						= 1	--Ð°ng h° b¤m giây....
x760572_IDX_SkillA_CD						= 2	--AKÛ nång Cüa CDTh¶i gian....
x760572_IDX_SkillC_CD						= 3	--CKÛ nång Cüa CDTh¶i gian....
x760572_IDX_SkillD_CD						= 4	--CKÛ nång Cüa CDTh¶i gian....
x760572_IDX_SkillE_CD						= 5	--EKÛ nång Cüa CDTh¶i gian....
x760572_IDX_KuangBaoTimer				= 6	--Cu°ng bÕo Tính gi¶ Khí....

x760572_IDX_CombatFlag 			= 1	--Hay không ch² Vu TrÕng thái chiªn ð¤u Cüa Tiêu chí....
x760572_IDX_IsKuangBaoMode	= 2	--Hay không ch² Vu Cu°ng bÕo Hình thÑc Cüa Tiêu chí....

--**********************************
--M¾i b¡t ð¥u Hóa....
--**********************************
function x760572_OnInit(sceneId, selfId)
	--Tr÷ng Trí AI....
	x760572_ResetMyAI(sceneId, selfId)
end


--**********************************
--Tim ð§p....
--**********************************
function x760572_OnHeartBeat(sceneId, selfId, nTick)

	--Ki¬m tra ðo lß¶ng Có phäi hay không Ðã chªt....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--Ki¬m tra ðo lß¶ng Hay không Không · TrÕng thái chiªn ð¤u....
	if 0 == MonsterAI_GetBoolParamByIndex(sceneId, selfId, x760572_IDX_CombatFlag) then
		return
	end

	--Cu°ng bÕo TrÕng thái Không c¥n T¦u Logic....
	if 1 == MonsterAI_GetBoolParamByIndex(sceneId, selfId, x760572_IDX_IsKuangBaoMode) then
		return
	end

	--AKÛ nång Tim ð§p....
	if 1 == x760572_TickSkillA(sceneId, selfId, nTick) then
		return
	end

	--CKÛ nång Tim ð§p....
	if 1 == x760572_TickSkillC(sceneId, selfId, nTick) then
		return
	end

	--DKÛ nång Tim ð§p....
	if 1 == x760572_TickSkillD(sceneId, selfId, nTick) then
		return
	end

	--EKÛ nång Tim ð§p....
	--if 1 == x760572_TickSkillE(sceneId, selfId, nTick) then
	--	return
	--end

	--Ð°ng h° b¤m giây Tim ð§p....
	x760572_TickStopWatch(sceneId, selfId, nTick)

end


--**********************************
--Tiªn vào Chiªn ð¤u....
--**********************************
function x760572_OnEnterCombat(sceneId, selfId, enmeyId)

	--Gia M¾i b¡t ð¥u buff....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x760572_Buff_MianYi1, 0)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x760572_Buff_MianYi2, 0)

	--Tr÷ng Trí AI....
	x760572_ResetMyAI(sceneId, selfId)

	--Thiªt trí Tiªn vào TrÕng thái chiªn ð¤u....
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x760572_IDX_CombatFlag, 1)

end

--**********************************
--R¶i ði Chiªn ð¤u....
--**********************************
function x760572_OnLeaveCombat(sceneId, selfId)

	--Tr÷ng Trí AI....
	x760572_ResetMyAI(sceneId, selfId)

	--C¡t bö Chính mình....
	LuaFnDeleteMonster(sceneId, selfId)
	--Sáng tÕo Ð¯i thoÕi NPC....
	local MstId = CallScriptFunction(x760572_g_FuBenScriptId,"CreateBOSS", sceneId,"LiFan_NPC", -1, -1)
	SetUnitReputationID(sceneId, MstId, MstId, 0)
end


--**********************************
--Giªt chªt ð¸ch nhân....
--**********************************
function x760572_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--TØ vong....
--**********************************
function x760572_OnDie(sceneId, selfId, killerId)

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
	x760572_ResetMyAI(sceneId, selfId)

	--Thiªt trí Ðã Khiêu chiªn Quá Cáp ÐÕi Bá....
	CallScriptFunction(x760572_g_FuBenScriptId,"SetBossBattleFlag", sceneId,"TaoQin", 2)

	--Nªu Còn không có Khiêu chiªn Quá Tang Th± Công T¡c Có th¬ Khiêu chiªn Tang Th± Công....
	if 2 ~= CallScriptFunction(x760572_g_FuBenScriptId,"GetBossBattleFlag", sceneId,"QinYun")	then
		CallScriptFunction(x760572_g_FuBenScriptId,"SetBossBattleFlag", sceneId,"QinYun", 1)
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
		str = format("#cffcc88#{_INFOUSR%s}Dçn d¡t Ðµi ngû R¯t cuµc Tß½ng Lang hoàn Phúc ð¸a Thiên S½n Ð°ng M² Ðßa lên Tây Thiên !", playerName); --Ô Lão ðÕi 
		AddGlobalCountNews(sceneId, str)
	end
	CallScriptFunction(898992,"MonsterOnDie", sceneId, selfId, killerId,19)
end



--**********************************
--Tr÷ng Trí AI....
--**********************************
function x760572_ResetMyAI(sceneId, selfId)

	--Tr÷ng Trí Tham s¯....
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_StopWatch, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillA_CD, 0)

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillC_CD, x760572_SkillC_CD)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillD_CD, x760572_SkillD_CD)
--	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillE_CD, x760572_SkillE_CD)

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_KuangBaoTimer, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x760572_IDX_CombatFlag, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x760572_IDX_IsKuangBaoMode, 0)

end

--**********************************
--AKÛ nång Tim ð§p....
--**********************************
function x760572_TickSkillA(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillA_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillA_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillA_CD, x760572_SkillA_CD-(nTick-cd))
		return x760572_UseSkillA(sceneId, selfId)
	end

end

--**********************************
--CKÛ nång Tim ð§p....
--**********************************
function x760572_TickSkillC(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillC_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillC_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillC_CD, x760572_SkillC_CD-(nTick-cd))
		return x760572_UseSkillC(sceneId, selfId)
	end

end

--**********************************
--DKÛ nång Tim ð§p....
--**********************************
function x760572_TickSkillD(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillD_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillD_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillD_CD, x760572_SkillD_CD-(nTick-cd))
		return x760572_UseSkillD(sceneId, selfId)
	end

end

--**********************************
--EKÛ nång Tim ð§p....
--**********************************
--function x760572_TickSkillE(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
--	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillE_CD)
--	if cd> nTick then
--		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillE_CD, cd-nTick)
--		return 0
--	else
--		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillE_CD, x760572_SkillE_CD-(nTick-cd))
--		return x760572_UseSkillE(sceneId, selfId)
--	end

--end

--**********************************
--Ð°ng h° b¤m giây Tim ð§p....
--**********************************
function x760572_TickStopWatch(sceneId, selfId, nTick)

	--HÕn chª M²i Mi¬u M¾i có th¬ Ch¤p hành Mµt l¥n....
	local time = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760572_IDX_StopWatch)
	if (time + nTick)> 1000 then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_StopWatch, time+nTick-1000)
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760572_IDX_StopWatch, time+nTick)
		return
	end
end

--**********************************
--SØ døng AKÛ nång....
--**********************************
function x760572_UseSkillA(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillB_Step)> 0 then
		return 0
	end
	LuaFnNpcChat(sceneId, selfId, 0,"Giá Ký Hàn bång phù Ngß½i là Ån ð¸nh r°i ,Bän tôn Càng Mu¯n nhìn ngß½i mµt chút Nhß thª nào Tr¯n ðªn quá Dß¾i chân Cüa Thiên S½n Hàn khí !")
	
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
	LuaFnUnitUseSkill(sceneId, selfId, x760572_SkillA_ID, selfId, x, z, 0, 1)

	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, selfId, x760572_SkillA_SpecObj, x, z, 0)

	return 1	
	

end

--**********************************
--SØ døng CKÛ nång....
--**********************************
function x760572_UseSkillC(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillB_Step)> 0 then
		return 0
	end
	LuaFnNpcChat(sceneId, selfId, 0,"Giá Ký Hàn bång phù Ngß½i là Ån ð¸nh r°i ,Bän tôn Càng Mu¯n nhìn ngß½i mµt chút Nhß thª nào Tr¯n ðªn quá Dß¾i chân Cüa Thiên S½n Hàn khí !")
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
	LuaFnUnitUseSkill(sceneId, selfId, x760572_SkillC_ID, selfId, x, z, 0, 1)
	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, selfId, x760572_SkillC_SpecObj, x, z, 0)

	return 1

end

--**********************************
--SØ døng DKÛ nång....
--**********************************
function x760572_UseSkillD(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760572_IDX_SkillB_Step)> 0 then
		return 0
	end
	LuaFnNpcChat(sceneId, selfId, 0,"Các ngß½i Dùng hªt toàn lñc Công kích Ba ,Chï c¥n Huyªt Phách Hµ th¬ Không phá Bän tôn Li«n có th¬ Døng Ngß½i Máu tß½i Ði«u tÑc ,Phóng thích Duy ngã ðµc tôn Th¥n công !")
	
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
	LuaFnUnitUseSkill(sceneId, selfId, x760572_SkillD_ID, selfId, x, z, 0, 1)

	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, selfId, x760572_SkillD_SpecObj, x, z, 0)

	return 1	

end

--function x760572_UseSkillE(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	--if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760572_IDX_SkilE_Step)> 0 then
	--	return 0
	--end

	--Phó bän Trung Hæu hi®u Ngß¶i ch½i Cüa Danh sách....
	--local PlayerList = {}

	--Tß½ng Hæu hi®u Nhân Gia nh§p Danh sách....
	--local numPlayer = 0
	--local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	--for i=0, nHumanCount-1 do
	--	local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
	--	if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
		--	PlayerList[numPlayer+1] = nHumanId
			--numPlayer = numPlayer + 1
		--end
	--end

	--Tùy c½ Thiêu Tuy¬n mµt cái Ngß¶i ch½i....
	--if numPlayer <= 0 then
	--	return 0
	--end
	--local PlayerId = PlayerList[random(numPlayer)]


	
	--SØ døng Không KÛ nång....
	--local x,z = GetWorldPos(sceneId, selfId)
	--LuaFnUnitUseSkill(sceneId, selfId, x760572_SkillE_ID, selfId, x, z, 0, 1)

	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	--x,z = GetWorldPos(sceneId, PlayerId)
	--CreateSpecialObjByDataIndex(sceneId, selfId, x760572_SkillE_SpecObj, x, z, 0)

	--return 1	
	

--end

