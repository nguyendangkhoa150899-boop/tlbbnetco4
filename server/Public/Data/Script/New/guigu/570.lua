--Hß Thë tre Ð½n chân B±n 
--K¸ch bän g¯c Hào 
x760570_g_ScriptId	= 760570
--Phó bän Logic K¸ch bän g¯c Hào....
x760570_g_FuBenScriptId = 002052
--Mi­n d¸ch Riêng KÛ nång buff....
x760570_Buff_MianYi1	= 10472	--Mi­n d¸ch Mµt ít M£t trái Hi®u quä....
x760570_Buff_MianYi2	= 10471	--Mi­n d¸ch Bình thß¶ng †n thân....
--Vi ðà chß·ng....
x760570_SkillA_ID			= 820
x760570_SkillA_CD			= 20000
x760570_SkillA_SpecObj = 861
--La hán quy«n...
x760570_SkillC_ID		= 821
x760570_SkillC_CD		= 43000
x760570_SkillC_SpecObj = 863
--Trân lung kÏ cøc....
x760570_SkillD_ID		= 822
x760570_SkillD_CD		= 60000
x760570_SkillD_SpecObj = 927
x760570_SkillD_1SpecObj = 927
x760570_SkillD_2SpecObj = 927
x760570_SkillD_3SpecObj = 927
x760570_SkillD_4SpecObj = 927
x760570_SkillD_5SpecObj = 927
x760570_SkillD_6SpecObj = 927
x760570_SkillD_7SpecObj = 927
x760570_SkillD_8SpecObj = 927
x760570_SkillD_9SpecObj = 927
x760570_SkillD_10SpecObj = 927
x760570_SkillD_11SpecObj = 927
x760570_SkillD_12SpecObj = 927
x760570_SkillD_13SpecObj = 927
x760570_SkillD_14SpecObj = 927
x760570_SkillD_15SpecObj = 927
x760570_SkillD_16SpecObj = 927
x760570_SkillD_17SpecObj = 927
x760570_SkillD_18SpecObj = 927
x760570_SkillD_19SpecObj = 927
x760570_SkillD_20SpecObj = 928
x760570_SkillD_21SpecObj = 928
x760570_SkillD_22SpecObj = 928
x760570_SkillD_23SpecObj = 927
x760570_SkillD_24SpecObj = 927
x760570_SkillD_25SpecObj = 927
x760570_SkillD_26SpecObj = 928
x760570_SkillD_27SpecObj = 927
x760570_SkillD_28SpecObj = 927
x760570_SkillD_29SpecObj = 928
x760570_SkillD_30SpecObj = 928
x760570_SkillD_31SpecObj = 928
x760570_SkillD_32SpecObj = 927
x760570_SkillD_33SpecObj = 927
x760570_SkillD_34SpecObj = 927
x760570_SkillD_35SpecObj = 928
x760570_SkillD_36SpecObj = 928
x760570_SkillD_37SpecObj = 928
x760570_SkillD_38SpecObj = 928
x760570_SkillD_39SpecObj = 928
x760570_SkillD_40SpecObj = 927
x760570_SkillD_41SpecObj = 927
x760570_SkillD_42SpecObj = 927
x760570_SkillD_43SpecObj = 928
x760570_SkillD_44SpecObj = 927
x760570_SkillD_45SpecObj = 928
x760570_SkillD_46SpecObj = 927

--Thiên s½n løc dß½ng chß·ng....
x760570_SkillE_ID			= 823
x760570_SkillE_CD		=	30000

--B¡t ð¥u Tiªn vào Cu°ng bÕo TrÕng thái Th¶i gian....
x760570_EnterKuangBaoTime	= 500*60*1000
--AI Index....
x760570_IDX_StopWatch						= 1	--Ð°ng h° b¤m giây....
x760570_IDX_SkillA_CD						= 2	--AKÛ nång Cüa CDTh¶i gian....
x760570_IDX_SkillC_CD						= 3	--CKÛ nång Cüa CDTh¶i gian....
x760570_IDX_SkillD_CD						= 4	--CKÛ nång Cüa CDTh¶i gian....
x760570_IDX_SkillE_CD						= 5	--EKÛ nång Cüa CDTh¶i gian....
x760570_IDX_KuangBaoTimer				= 6	--Cu°ng bÕo Tính gi¶ Khí....

x760570_IDX_CombatFlag 			= 1	--Hay không ch² Vu TrÕng thái chiªn ð¤u Cüa Tiêu chí....
x760570_IDX_IsKuangBaoMode	= 2	--Hay không ch² Vu Cu°ng bÕo Hình thÑc Cüa Tiêu chí....

--**********************************
--M¾i b¡t ð¥u Hóa....
--**********************************
function x760570_OnInit(sceneId, selfId)
	--Tr÷ng Trí AI....
	x760570_ResetMyAI(sceneId, selfId)
end


--**********************************
--Tim ð§p....
--**********************************
function x760570_OnHeartBeat(sceneId, selfId, nTick)

	--Ki¬m tra ðo lß¶ng Có phäi hay không Ðã chªt....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--Ki¬m tra ðo lß¶ng Hay không Không · TrÕng thái chiªn ð¤u....
	if 0 == MonsterAI_GetBoolParamByIndex(sceneId, selfId, x760570_IDX_CombatFlag) then
		return
	end

	--Cu°ng bÕo TrÕng thái Không c¥n T¦u Logic....
	if 1 == MonsterAI_GetBoolParamByIndex(sceneId, selfId, x760570_IDX_IsKuangBaoMode) then
		return
	end

	--AKÛ nång Tim ð§p....
	if 1 == x760570_TickSkillA(sceneId, selfId, nTick) then
		return
	end

	--CKÛ nång Tim ð§p....
	if 1 == x760570_TickSkillC(sceneId, selfId, nTick) then
		return
	end

	--DKÛ nång Tim ð§p....
	if 1 == x760570_TickSkillD(sceneId, selfId, nTick) then
		return
	end

	--EKÛ nång Tim ð§p....
	if 1 == x760570_TickSkillE(sceneId, selfId, nTick) then
		return
	end

	--Ð°ng h° b¤m giây Tim ð§p....
	x760570_TickStopWatch(sceneId, selfId, nTick)

end


--**********************************
--Tiªn vào Chiªn ð¤u....
--**********************************
function x760570_OnEnterCombat(sceneId, selfId, enmeyId)

	--Gia M¾i b¡t ð¥u buff....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x760570_Buff_MianYi1, 0)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x760570_Buff_MianYi2, 0)

	--Tr÷ng Trí AI....
	x760570_ResetMyAI(sceneId, selfId)

	--Thiªt trí Tiªn vào TrÕng thái chiªn ð¤u....
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x760570_IDX_CombatFlag, 1)

end

--**********************************
--R¶i ði Chiªn ð¤u....
--**********************************
function x760570_OnLeaveCombat(sceneId, selfId)

	--Tr÷ng Trí AI....
	x760570_ResetMyAI(sceneId, selfId)

	--C¡t bö Chính mình....
	LuaFnDeleteMonster(sceneId, selfId)
	--Sáng tÕo Ð¯i thoÕi NPC....
	local MstId = CallScriptFunction(x760570_g_FuBenScriptId,"CreateBOSS", sceneId,"TaoQin_NPC", -1, -1)
	SetUnitReputationID(sceneId, MstId, MstId, 0)
end


--**********************************
--Giªt chªt ð¸ch nhân....
--**********************************
function x760570_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--TØ vong....
--**********************************
function x760570_OnDie(sceneId, selfId, killerId)

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
	x760570_ResetMyAI(sceneId, selfId)

	--Thiªt trí Ðã Khiêu chiªn Quá Cáp ÐÕi Bá....
	CallScriptFunction(x760570_g_FuBenScriptId,"SetBossBattleFlag", sceneId,"PangQi", 2)

	local num = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, num-1 do
	 local ServerID = LuaFnGetCopyScene_HumanObjId(sceneId, i)	--L¤y ðßþc Trß¾c m£t Cänh tßþng Lí Ngß¶i objId
        if floor(GetMissionData(sceneId,ServerID,GONGZI_2)/10^8) == mod(GetWeekTime(),10) then
         if floor(GetMissionData(sceneId,ServerID,GONGZI_1)/10^8) == 2 or floor(GetMissionData(sceneId,ServerID,GONGZI_1)/10^8) == 3 and mod(floor(GetMissionData(sceneId,ServerID,GONGZI_1)/10^6),100) <4 then
           SetMissionData(sceneId,ServerID,GONGZI_1,GetMissionData(sceneId,ServerID,GONGZI_1)+10^6)
         end
        end
      CallScriptFunction(890536,"JianCe",sceneId,ServerID)
      if floor(mod(GetMissionData(sceneId,ServerID,HUOYUEFB_2),10^8)/10^7) <2 then
        SetMissionData(sceneId,ServerID,HUOYUEZHI,GetMissionData(sceneId,ServerID,HUOYUEZHI)+89) --Sinh ðµng Tr¸ +89
        SetMissionData(sceneId,ServerID,HUOYUEFB_2,GetMissionData(sceneId,ServerID,HUOYUEFB_2)+10^7)
      end
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
		str = format("#cffcc88#{_INFOUSR%s}Dçn d¡t Ðµi ngû Träi qua Tr¡c tr· ,R¯t cuµc Ð÷c ðã m¡t Ðªn Lang hoàn Phúc ð¸a S· hæu Võ công Ði¬n t¸ch !", playerName); 
		AddGlobalCountNews(sceneId, str)
	end
	CallScriptFunction(898992,"MonsterOnDie", sceneId, selfId, killerId,19)
end



--**********************************
--Tr÷ng Trí AI....
--**********************************
function x760570_ResetMyAI(sceneId, selfId)

	--Tr÷ng Trí Tham s¯....
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_StopWatch, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillA_CD, 0)

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillC_CD, x760570_SkillC_CD)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillD_CD, x760570_SkillD_CD)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillE_CD, x760570_SkillE_CD)

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_KuangBaoTimer, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x760570_IDX_CombatFlag, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x760570_IDX_IsKuangBaoMode, 0)

end

--**********************************
--AKÛ nång Tim ð§p....
--**********************************
function x760570_TickSkillA(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillA_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillA_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillA_CD, x760570_SkillA_CD-(nTick-cd))
		return x760570_UseSkillA(sceneId, selfId)
	end

end

--**********************************
--CKÛ nång Tim ð§p....
--**********************************
function x760570_TickSkillC(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillC_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillC_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillC_CD, x760570_SkillC_CD-(nTick-cd))
		return x760570_UseSkillC(sceneId, selfId)
	end

end

--**********************************
--DKÛ nång Tim ð§p....
--**********************************
function x760570_TickSkillD(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillD_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillD_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillD_CD, x760570_SkillD_CD-(nTick-cd))
		return x760570_UseSkillD(sceneId, selfId)
	end

end

--**********************************
--EKÛ nång Tim ð§p....
--**********************************
function x760570_TickSkillE(sceneId, selfId, nTick)

	--Càng KÛ nång m¾i CD....
	local cd = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillE_CD)
	if cd> nTick then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillE_CD, cd-nTick)
		return 0
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillE_CD, x760570_SkillE_CD-(nTick-cd))
		return x760570_UseSkillE(sceneId, selfId)
	end

end

--**********************************
--Ð°ng h° b¤m giây Tim ð§p....
--**********************************
function x760570_TickStopWatch(sceneId, selfId, nTick)

	--HÕn chª M²i Mi¬u M¾i có th¬ Ch¤p hành Mµt l¥n....
	local time = MonsterAI_GetIntParamByIndex(sceneId, selfId, x760570_IDX_StopWatch)
	if (time + nTick)> 1000 then
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_StopWatch, time+nTick-1000)
	else
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x760570_IDX_StopWatch, time+nTick)
		return
	end
end

--**********************************
--SØ døng AKÛ nång....
--**********************************
function x760570_UseSkillA(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillB_Step)> 0 then
		return 0
	end	
	LuaFnNpcChat(sceneId, selfId, 0,"A di ðà ph§t !")
	
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
	LuaFnUnitUseSkill(sceneId, selfId, x760570_SkillA_ID, selfId, x, z, 0, 1)

	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, selfId, x760570_SkillA_SpecObj, x, z, 0)

	return 1	
	

end

--**********************************
--SØ døng CKÛ nång....
--**********************************
function x760570_UseSkillC(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....	
	
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillB_Step)> 0 then
		return 0
	end
	LuaFnNpcChat(sceneId, selfId, 0,"A di ðà ph§t !")
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
	LuaFnUnitUseSkill(sceneId, selfId, x760570_SkillC_ID, selfId, x, z, 0, 1)
	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, selfId, x760570_SkillC_SpecObj, x, z, 0)
	return 1

end

--**********************************
--SØ døng DKÛ nång....
--**********************************
function x760570_UseSkillD(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760570_IDX_SkillB_Step)> 0 then
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
	
  --Ðßþc ðªn Quái v§t id
	local MonsterId = 0
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
	MonsterId = GetMonsterObjID(sceneId,i)
	end
  
	SetPos(sceneId, MonsterId, 82, 180)	

	--SØ døng Không KÛ nång....
	local x,z = GetWorldPos(sceneId, selfId)
	LuaFnUnitUseSkill(sceneId, selfId, x760570_SkillD_ID, selfId, x, z, 0, 1)
	LuaFnNpcChat(sceneId, selfId, 0,"Các v¸ ,Này ðó là Trân lung kÏ cøc ,Nhìn xem Các v¸ Thøc Nång Nhìn ra Sinh môn N½i !")
	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_SpecObj, 82, 180)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_1SpecObj, 78, 180)
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_2SpecObj, 74, 180)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_3SpecObj, 70, 180)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_4SpecObj, 66, 180)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_5SpecObj, 62, 180)
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_6SpecObj, 86, 180)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_7SpecObj, 90, 180)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_8SpecObj, 94, 180)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_9SpecObj, 98, 180)		
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_10SpecObj, 102, 180)	
	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_11SpecObj, 78, 184)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_12SpecObj, 78, 188)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_13SpecObj, 78, 192)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_14SpecObj, 78, 196)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_15SpecObj, 78, 176)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_16SpecObj, 78, 172)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_17SpecObj, 78, 168)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_18SpecObj, 78, 164)
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_19SpecObj, 82, 184)
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_20SpecObj, 82, 188)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_21SpecObj, 82, 192)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_22SpecObj, 82, 196)
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_23SpecObj, 82, 176)
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_24SpecObj, 82, 172)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_25SpecObj, 82, 168)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_26SpecObj, 82, 164)	
	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_27SpecObj, 86, 184)		
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_28SpecObj, 86, 188)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_29SpecObj, 86, 192)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_30SpecObj, 86, 196)		
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_31SpecObj, 86, 176)		
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_32SpecObj, 86, 172)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_33SpecObj, 86, 168)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_34SpecObj, 86, 164)	

	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_35SpecObj, 74, 184)
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_36SpecObj, 74, 188)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_37SpecObj, 74, 176)		
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_38SpecObj, 74, 172)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_39SpecObj, 90, 184)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_40SpecObj, 90, 188)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_41SpecObj, 90, 176)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_42SpecObj, 90, 172)	

	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_43SpecObj, 70, 184)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_44SpecObj, 70, 176)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_45SpecObj, 94, 184)	
	CreateSpecialObjByDataIndex(sceneId, MonsterId, x760570_SkillD_46SpecObj, 94, 176)	
	return 1

end

function x760570_UseSkillE(sceneId, selfId)

	--Nªu Ðang · dùng BKÛ nång T¡c Khiêu Quá....
	if MonsterAI_GetIntParamByIndex(sceneId, selfId, x760570_IDX_SkilE_Step)> 0 then
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
	LuaFnUnitUseSkill(sceneId, selfId, x760570_SkillE_ID, selfId, x, z, 0, 1)
	LuaFnNpcChat(sceneId, selfId, 0,"Ngß½i Nång Tiªp thu Ngã Mµt chß·ng này MÕ ?Khán Bän tôn Dùng ra Giæ nhà Bän lînh Thiên s½n løc dß½ng chß·ng !")
	--TÕi Cai Ngß¶i ch½i Dß¾i lòng bàn chân Phóng Bçy r§p....
	x,z = GetWorldPos(sceneId, PlayerId)
	CreateSpecialObjByDataIndex(sceneId, selfId, x760570_SkillE_SpecObj, x, z, 0)

	return 1	
	

end

