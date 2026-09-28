--Æ®Ãì·å É£ÍÁ¹«AI

--A ¡¾ÍÁ¶İ¡¿BOSSµÄHPÃ¿ËğÊ§20%Ôò»áÏûÊ§20Ãë....Í¬Ê±´´½¨Ğ¡¹ÖÒÀ´ÎÎª1122Ö»..ËÀÍöorÍÑÀëÕ½¶·ÏûÊ§....
--B ¡¾Å£Ã«¶¾Õë¡¿·ÇÍÁ¶İ×´Ì¬Ê±Ã¿¸ô20Ò»´Î´ó·¶Î§¹¥»÷....ÍÁ¶İ×´Ì¬ÏÂCDÕı³£×ßÖ»ÊÇ²»Ê¹ÓÃ....ÍÁ¶İ½áÊøÊ±ÇåCD....
--C ¡¾³öÍÁÎÄÎï¡¿½øÈëÍÁ¶İÊ±Ëæ»ú»ñµÃ2¸öbuff....Í¬Ê±Çå³ıÉÏ´ÎµÄ2¸öbuff....
--D ¡¾·è¿ñ¡¿Õ½¶·5·ÖÖÓºó¸ø×Ô¼ººÍËùÓĞ½©Ê¬¼ÓÒ»»÷ÖÂÃübuff....²»ÔÙÊ¹ÓÃAB(C)....

--È«³Ì¶¼´øÓĞÃâÒßÖÆ¶¨¼¼ÄÜµÄbuff....
--ÍÑÀëÕ½¶·»òËÀÍöÊ±É¾³ı½©Ê¬....


--½Å±¾ºÅ
x890065_g_ScriptId	= 890065

--¸±±¾Âß¼­½Å±¾ºÅ....
x890065_g_FuBenScriptId = 890063


--ÃâÒßÌØ¶¨¼¼ÄÜbuff....
x890065_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ğ©¸ºÃæĞ§¹û....
x890065_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒşÉí....

--AÍÁ¶İ....
x890065_SkillA_TuDun				= 1028
x890065_SkillA_ChildName		= "Bång tàm"
x890065_SkillA_ChildBuff		= 10246
x890065_SkillA_ChildTime		= 5000		--ÍÁ¶İ¶à³¤Ê±¼äºó¿ªÊ¼Ë¢Ğ¡¹Ö....
x890065_SkillA_Time					= 20000		--ÍÁ¶İ³ÖĞøµÄÊ±¼ä....


--BÅ£Ã«¶¾Õë....
x890065_SkillB_NiuMaoDuZhen = 751
--ÀäÈ´Ê±¼ä....
x890065_SkillB_CD						= 60000


--C³öÍÁÎÄÎï¼¼ÄÜµÄbuffÁĞ±í....
--x890065_SkillC_ChutuBuff1 = { 10237, 10238 }
--x890065_SkillC_ChutuBuff2 = { 10239, 10240, 10241, 10242 }

x890065_SkillC_ChutuBuff1 = { 6446, 6446 }
x890065_SkillC_ChutuBuff2 = { 6446, 6446, 6446, 6446 }

--D·è¿ñ....
x890065_SkillD_Buff1	= 10217
x890065_SkillD_Buff2	= 10217
--¿ªÊ¼½øÈë¿ñ±©×´Ì¬µÄÊ±¼ä....
x890065_EnterKuangBaoTime	= 5*60*1000


--AI Index....
x890065_IDX_HPStep							= 1	--ÑªÁ¿¼¶±ğ....
x890065_IDX_SkillB_CD						= 2	--B¼¼ÄÜµÄCDÊ±¼ä....
x890065_IDX_KuangBaoTimer				= 3	--¿ñ±©µÄ¼ÆÊ±Æ÷....
x890065_IDX_TuDunTimer					= 4	--ÍÁ¶İµÄ¼ÆÊ±Æ÷....ÓÃÓÚ¼ÆËãºÎÊ±ÍÁ¶İ½áÊø....
x890065_IDX_NeedCreateChildNum	= 5	--ĞèÒª´´½¨µÄĞ¡¹ÖµÄÊıÁ¿....

x890065_IDX_CombatFlag 			= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....
x890065_IDX_IsTudunMode			= 2	--ÊÇ·ñ´¦ÓÚÍÁ¶İÄ£Ê½µÄ±êÖ¾....
x890065_IDX_IsKuangBaoMode	= 3	--ÊÇ·ñ´¦ÓÚ¿ñ±©Ä£Ê½µÄ±êÖ¾....

--lv,500v, 1000v, 
x890065_LootItem_1 = {
39910003, 39910004,
}
--huyet ngoc, tinh ngoc, long ngoc, huyen, bang, hoa,doc
x890065_LootItem_2 = {
30700231,
}
x890065_LootItem_3 = {
--20500005, 20501005, 20502005,50502001,50502002,50502003,50502004,
}
x890065_LootItem_4 = {
--20500006, 20501006, 20502006,50503001,50504002,50511001,50511002,50512001,50512002,50512003,50512004,
}

--**********************************
--³õÊ¼»¯....
--**********************************
function x890065_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x890065_ResetMyAI( sceneId, selfId )
end


--**********************************
--ĞÄÌø....
--**********************************
function x890065_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890065_IDX_CombatFlag ) then
		return
	end

	--¿ñ±©×´Ì¬²»ĞèÒª×ßÂß¼­....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsKuangBaoMode ) then
		return
	end

	--Ö´ĞĞ¿ñ±©Âß¼­....
	if 1 == x890065_DoSkillD_KuangBao( sceneId, selfId, nTick ) then
		return
	end

	--Ö´ĞĞÍÁ¶İÂß¼­....
	if 1 == x890065_SkillLogicA_TunDun( sceneId, selfId, nTick ) then
		return
	end

	--Ö´ĞĞÅ£Ã«¶¾ÕëÂß¼­....
	if 1 == x890065_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x890065_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x890065_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x890065_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x890065_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	local MstId = CallScriptFunction( x890065_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuangJuXian_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--É±ËÀµĞÈË....
--**********************************
function x890065_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x890065_OnDie( sceneId, selfId, killerId )

	--ÖØÖÃAI....
	x890065_ResetMyAI( sceneId, selfId )

	--ÉèÖÃÒÑ¾­ÌôÕ½¹ıÉ£ÍÁ¹«....
	CallScriptFunction( x890065_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ZhuangJuXian", 2 )

	--Èç¹û»¹Ã»ÓĞÌôÕ½¹ıÎÚÀÏ´óÔò¿ÉÒÔÌôÕ½ÎÚÀÏ´ó....
	if 2 ~= CallScriptFunction( x890065_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MuRongFu" )	then
		CallScriptFunction( x890065_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "MuRongFu", 1 )
	end
	
	-- zchw È«Çò¹«¸æ
	local	playerName	= GetName( sceneId, killerId )
	
	--É±ËÀ¹ÖÎïµÄÊÇ³èÎïÔò»ñÈ¡ÆäÖ÷ÈËµÄÃû×Ö....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--Èç¹ûÍæ¼Ò×é¶ÓÁËÔò»ñÈ¡¶Ó³¤µÄÃû×Ö....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		--str = format("#Y[Trang tø hi«n]#W#cff99cc cûng ngån cän không ğßşc #Y[#{_INFOUSR%s}]#W#cff99cc công kích. B¸ ğánh cho hoa r½i nß¾c chäy, chích tr¯n mà ği, vàng bÕc tài bäo phân tán nh¤t !", playerName); --É£ÍÁ¹«
		AddGlobalCountNews( sceneId, str )
	end
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	for i = 0, num - 1 do
		if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then					-- ²»ÔÚ³¡¾°µÄ²»×ö´Ë²Ù×÷

			rand = random(100)
			if rand < 60 then
			 local WuPin = random( getn(x890065_LootItem_1) )
			AddMonsterDropItem( sceneId, selfId, mems[i], x890065_LootItem_1[WuPin] )
			end
			
			rand = random(100)
			if rand < 60 then
				local WuPin = random( getn(x890065_LootItem_2) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x890065_LootItem_2[WuPin]  )
			end
			rand = random(100)
			if rand < 80 then
				local WuPin = random( getn(x890065_LootItem_3) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x890065_LootItem_3[WuPin]  )
			end
			rand = random(100)
			if rand < 90 then
				local WuPin = random( getn(x890065_LootItem_4) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x890065_LootItem_4[WuPin]  )
			end
		end
	end
end


--**********************************
--ÖØÖÃAI....
--**********************************
function x890065_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊı....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_SkillB_CD, x890065_SkillB_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_KuangBaoTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_TuDunTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_NeedCreateChildNum, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsTudunMode, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsKuangBaoMode, 0 )

	--Çå³ıbuff....
	for i, buffId in x890065_SkillC_ChutuBuff1 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	for i, buffId in x890065_SkillC_ChutuBuff2 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	LuaFnCancelSpecificImpact( sceneId, selfId, x890065_SkillD_Buff1 )
	LuaFnCancelSpecificImpact( sceneId, selfId, x890065_SkillD_Buff2 )

	--Çå³ıĞ¡¹Ö....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x890065_SkillA_ChildName then
			LuaFnDeleteMonster(sceneId, MonsterId)
		end
	end

end


--**********************************
--¿ñ±©¼¼ÄÜ....
--**********************************
function x890065_DoSkillD_KuangBao( sceneId, selfId )

	--¼Ó¿ñ±©buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillD_Buff1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillD_Buff2, 0 )

	--¸øËùÓĞĞ¡¹Ö¼Ó¿ñ±©....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x890065_SkillA_ChildName then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890065_SkillD_Buff1, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890065_SkillD_Buff2, 0 )
		end
	end

end


--**********************************
--ÍÁ¶İÂß¼­....
--**********************************
function x890065_SkillLogicA_TunDun( sceneId, selfId, nTick )


	--ÍÁ¶İÄ£Ê½Ôò¸üĞÂÍÁ¶İµÄ¼ÆÊ±Æ÷....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsTudunMode ) then

		local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890065_IDX_TuDunTimer )
		if cd > nTick then

			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_TuDunTimer, cd-nTick )
			--Èç¹ûµ½ÁËË¢Ğ¡¹ÖµÄÊ±¼ä²¢ÇÒ±¾´ÎÍÁ¶İ»¹Ã»Ë¢¹ıĞ¡¹Ö....
			if cd < (x890065_SkillA_Time-x890065_SkillA_ChildTime) then
				local needCreateNum = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890065_IDX_NeedCreateChildNum )
				if needCreateNum > 0 then
					--´´½¨Ğ¡¹Ö....
					MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_NeedCreateChildNum, 0 )
					local x,z = GetWorldPos( sceneId, selfId )
					for i=1, needCreateNum do
						local MstId = CallScriptFunction( x890065_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x890065_SkillA_ChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x890065_SkillA_ChildName )
					end
				end
			end

		else

			--ÍÁ¶İ½áÊø....ÉèÖÃÀë¿ªÍÁ¶İ×´Ì¬....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_TuDunTimer, 0 )
			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsTudunMode, 0 )
			--ÖØÖÃÅ£Ã«¶¾ÕëCD....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_SkillB_CD, x890065_SkillB_CD )

		end


	--·ÇÍÁ¶İÄ£Ê½Ôò¼ì²âÊÇ·ñ¿ÉÒÔ½øÈëÍÁ¶İÄ£Ê½....
	else


		--Ã¿¼õÉÙ20%ÑªÊ±½øÈëÍÁ¶İÄ£Ê½....
		local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
		local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890065_IDX_HPStep )
		local CurStep = -1
		if CurPercent <= 0.2 then
			CurStep = 4
		elseif CurPercent <= 0.4 then
		 	CurStep = 3
		elseif CurPercent <= 0.6 then
		 	CurStep = 2
		elseif CurPercent <= 0.8 then
			CurStep = 1
		end

		--½øĞĞÍÁ¶İ....
		if CurStep > LastStep then
			--¸ø×Ô¼ºÉèÖÃÒşÉíand²»ÄÜ¹¥»÷....
			local x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x890065_SkillA_TuDun, selfId, x, z, 0, 1 )

			--Ëæ»ú»ñµÃ2¸öbuff(³öÍÁÎÄÎï)....
			local idx1 = random( getn(x890065_SkillC_ChutuBuff1) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillC_ChutuBuff1[idx1], 0 )
			local idx2 = random( getn(x890065_SkillC_ChutuBuff2) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillC_ChutuBuff2[idx2], 0 )

			local NeedCreateNum = 1
			if CurStep == 3 or CurStep == 4 then
				NeedCreateNum = 2
			end

			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsTudunMode, 1 )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_NeedCreateChildNum, NeedCreateNum )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_HPStep, CurStep )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_TuDunTimer, x890065_SkillA_Time )
			return 1
		end


	end

	return 0

end


--**********************************
--Å£Ã«¶¾ÕëÂß¼­....
--**********************************
function x890065_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick )

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890065_IDX_SkillB_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_SkillB_CD, cd-nTick )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_SkillB_CD, x890065_SkillB_CD-(nTick-cd) )
		--·ÇÍÁ¶İ×´Ì¬²Å¿ÉÒÔÓÃ....
		if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsTudunMode ) then
			local x,z = GetWorldPos( sceneId, selfId )
			MonsterTalk( sceneId, -1, "", "#{PMF_20080530_16}" )
			LuaFnUnitUseSkill( sceneId, selfId, x890065_SkillB_NiuMaoDuZhen, selfId, x, z, 0, 0 )
			return 1
		end
	end

	return 0

end


--**********************************
--¿ñ±©Âß¼­....
--**********************************
function x890065_DoSkillD_KuangBao( sceneId, selfId, nTick )

	--¼ì²âÊÇ·ñµ½ÁË¿ñ±©µÄÊ±ºò....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890065_IDX_KuangBaoTimer )
	if kbTime < x890065_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890065_IDX_KuangBaoTimer, kbTime+nTick )

	else

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890065_IDX_IsKuangBaoMode, 1 )
		--¼Ó¿ñ±©buff....
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillD_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890065_SkillD_Buff2, 0 )
		--¸øËùÓĞĞ¡¹Ö¼Ó¿ñ±©buff....
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, MonsterId) == x890065_SkillA_ChildName then
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890065_SkillD_Buff1, 0 )
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890065_SkillD_Buff2, 0 )
			end
		end
		return 1

	end


	return 0

end
