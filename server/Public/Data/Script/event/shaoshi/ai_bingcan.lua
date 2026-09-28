--Æ®Ãì·å É£ÍÁ¹«AI

--A ¡¾ÍÁ¶İ¡¿BOSSµÄHPÃ¿ËğÊ§20%Ôò»áÏûÊ§20Ãë....Í¬Ê±´´½¨Ğ¡¹ÖÒÀ´ÎÎª1122Ö»..ËÀÍöorÍÑÀëÕ½¶·ÏûÊ§....
--B ¡¾Å£Ã«¶¾Õë¡¿·ÇÍÁ¶İ×´Ì¬Ê±Ã¿¸ô20Ò»´Î´ó·¶Î§¹¥»÷....ÍÁ¶İ×´Ì¬ÏÂCDÕı³£×ßÖ»ÊÇ²»Ê¹ÓÃ....ÍÁ¶İ½áÊøÊ±ÇåCD....
--C ¡¾³öÍÁÎÄÎï¡¿½øÈëÍÁ¶İÊ±Ëæ»ú»ñµÃ2¸öbuff....Í¬Ê±Çå³ıÉÏ´ÎµÄ2¸öbuff....
--D ¡¾·è¿ñ¡¿Õ½¶·5·ÖÖÓºó¸ø×Ô¼ººÍËùÓĞ½©Ê¬¼ÓÒ»»÷ÖÂÃübuff....²»ÔÙÊ¹ÓÃAB(C)....

--È«³Ì¶¼´øÓĞÃâÒßÖÆ¶¨¼¼ÄÜµÄbuff....
--ÍÑÀëÕ½¶·»òËÀÍöÊ±É¾³ı½©Ê¬....


--½Å±¾ºÅ
x890068_g_ScriptId	= 890068

--¸±±¾Âß¼­½Å±¾ºÅ....
x890068_g_FuBenScriptId = 890063


--ÃâÒßÌØ¶¨¼¼ÄÜbuff....
x890068_Buff_MianYi1	= 10472	--ÃâÒßÒ»Ğ©¸ºÃæĞ§¹û....
x890068_Buff_MianYi2	= 10471	--ÃâÒßÆÕÍ¨ÒşÉí....

--AÍÁ¶İ....
x890068_SkillID_H				= 1635
x890068_SkillA_TuDun				= 1028
x890068_MianYi_Buff				= 22431
x890068_SkillA_AChildName		= "Bång m£c h±"
x890068_SkillA_BChildName		= "Höa m£c h±"
x890068_SkillA_CChildName		= "Ğµc m£c h±"
x890068_SkillA_DChildName		= "Huy«n m£c h±"
x890068_SkillA_AChildBuff		= 22422
x890068_SkillA_BChildBuff		= 22423
x890068_SkillA_CChildBuff		= 22424
x890068_SkillA_DChildBuff		= 22425

x890068_SkillA_ChildTime		= 5000		--ÍÁ¶İ¶à³¤Ê±¼äºó¿ªÊ¼Ë¢Ğ¡¹Ö....
x890068_SkillA_Time					= 10000		--ÍÁ¶İ³ÖĞøµÄÊ±¼ä....


--BÅ£Ã«¶¾Õë....
x890068_SkillB_NiuMaoDuZhen = 920
--ÀäÈ´Ê±¼ä....
x890068_SkillB_CD						= 5000


--C³öÍÁÎÄÎï¼¼ÄÜµÄbuffÁĞ±í....
x890068_SkillC_ChutuBuff1 = { 19624, 19624 }
x890068_SkillC_ChutuBuff2 = { 19624, 19624, 19624, 19624 }

x890068_BrotherName = "Trang tø hi«n"		--ĞÖµÜµÄÃû×Ö....

--D·è¿ñ....
x890068_SkillD_Buff1	= 10234
x890068_SkillD_Buff2	= 10235
--¿ªÊ¼½øÈë¿ñ±©×´Ì¬µÄÊ±¼ä....
x890068_EnterKuangBaoTime	= 20*60*1000


--AI Index....
x890068_IDX_HPStep							= 1	--ÑªÁ¿¼¶±ğ....
x890068_IDX_SkillB_CD						= 2	--B¼¼ÄÜµÄCDÊ±¼ä....
x890068_IDX_KuangBaoTimer				= 3	--¿ñ±©µÄ¼ÆÊ±Æ÷....
x890068_IDX_TuDunTimer					= 4	--ÍÁ¶İµÄ¼ÆÊ±Æ÷....ÓÃÓÚ¼ÆËãºÎÊ±ÍÁ¶İ½áÊø....
x890068_IDX_NeedCreateChildNum	= 5	--ĞèÒª´´½¨µÄĞ¡¹ÖµÄÊıÁ¿....

x890068_IDX_CombatFlag 			= 1	--ÊÇ·ñ´¦ÓÚÕ½¶·×´Ì¬µÄ±êÖ¾....
x890068_IDX_IsTudunMode			= 2	--ÊÇ·ñ´¦ÓÚÍÁ¶İÄ£Ê½µÄ±êÖ¾....
x890068_IDX_IsKuangBaoMode	= 3	--ÊÇ·ñ´¦ÓÚ¿ñ±©Ä£Ê½µÄ±êÖ¾....

--lv,500v, 1000v, 
x890068_LootItem_1 = {
39910003, 39910004,
}
--huyet ngoc, tinh ngoc, long ngoc, huyen, bang, hoa,doc
x890068_LootItem_2 = {
30700231,
}
x890068_LootItem_3 = {
50502001,50502002,50502003,50502004,
}
x890068_LootItem_4 = {
--20500006, 20501006, 20502006,50503001,50504002,50511001,50511002,50512001,50512002,50512003,50512004,
}

--**********************************
--³õÊ¼»¯....
--**********************************
function x890068_OnInit(sceneId, selfId)
	--ÖØÖÃAI....
	x890068_ResetMyAI( sceneId, selfId )
end


--**********************************
--ĞÄÌø....
--**********************************
function x890068_OnHeartBeat(sceneId, selfId, nTick)

	--¼ì²âÊÇ²»ÊÇËÀÁË....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--¼ì²âÊÇ·ñ²»ÔÚÕ½¶·×´Ì¬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag ) then
		return
	end

	--¿ñ±©×´Ì¬²»ĞèÒª×ßÂß¼­....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsKuangBaoMode ) then
		return
	end

	--Ö´ĞĞ¿ñ±©Âß¼­....
	if 1 == x890068_DoSkillD_KuangBao( sceneId, selfId, nTick ) then
		return
	end

	--Ö´ĞĞÍÁ¶İÂß¼­....
	if 1 == x890068_SkillLogicA_TunDun( sceneId, selfId, nTick ) then
		return
	end

	--Ö´ĞĞÅ£Ã«¶¾ÕëÂß¼­....
	if 1 == x890068_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--½øÈëÕ½¶·....
--**********************************
function x890068_OnEnterCombat(sceneId, selfId, enmeyId)

	--¼Ó³õÊ¼buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_Buff_MianYi2, 0 )

	--ÖØÖÃAI....
	x890068_ResetMyAI( sceneId, selfId )

	--ÉèÖÃ½øÈëÕ½¶·×´Ì¬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag, 1 )

end


--**********************************
--Àë¿ªÕ½¶·....
--**********************************
function x890068_OnLeaveCombat(sceneId, selfId)

	--ÖØÖÃAI....
	x890068_ResetMyAI( sceneId, selfId )

	--É¾³ı×Ô¼º....
	LuaFnDeleteMonster( sceneId, selfId )

	--´´½¨¶Ô»°NPC....
	--local MstId = CallScriptFunction( x890068_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhangJuXian_NPC", -1, -1 )
	--SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--É±ËÀµĞÈË....
--**********************************
function x890068_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--ËÀÍö....
--**********************************
function x890068_OnDie( sceneId, selfId, killerId )

	--±éÀú³¡¾°ÀïËùÓĞµÄ¹Ö....Ñ°ÕÒĞÖµÜ....¸øÆäÉèÖÃĞèÒªÊ¹ÓÃ¿ñ±©¼¼ÄÜ....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890068_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, MonsterId, 19626, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, MonsterId, 19627, 0 )
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
			 local WuPin = random( getn(x890068_LootItem_1) )
			AddMonsterDropItem( sceneId, selfId, mems[i], x890068_LootItem_1[WuPin] )
			end
			
			rand = random(100)
			if rand < 60 then
				local WuPin = random( getn(x890068_LootItem_2) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x890068_LootItem_2[WuPin]  )
			end
			rand = random(100)
			if rand < 80 then
				local WuPin = random( getn(x890068_LootItem_3) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x890068_LootItem_3[WuPin]  )
			end
			rand = random(100)
			if rand < 90 then
				local WuPin = random( getn(x890068_LootItem_4) )
				AddMonsterDropItem( sceneId, selfId, mems[i], x890068_LootItem_4[WuPin]  )
			end
	
		end
	end
end

end
--**********************************
--ÖØÖÃAI....
--**********************************
function x890068_ResetMyAI( sceneId, selfId )

	--ÖØÖÃ²ÎÊı....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_SkillB_CD, x890068_SkillB_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_TuDunTimer, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_NeedCreateChildNum, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsTudunMode, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsKuangBaoMode, 0 )

	--Çå³ıbuff....
	for i, buffId in x890068_SkillC_ChutuBuff1 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	for i, buffId in x890068_SkillC_ChutuBuff2 do
		LuaFnCancelSpecificImpact( sceneId, selfId, buffId )
	end

	LuaFnCancelSpecificImpact( sceneId, selfId, x890068_SkillD_Buff1 )
	LuaFnCancelSpecificImpact( sceneId, selfId, x890068_SkillD_Buff2 )

	--Çå³ıĞ¡¹Ö....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x890068_SkillA_AChildName or GetName(sceneId, MonsterId) == x890068_SkillA_BChildName or GetName(sceneId, MonsterId) == x890068_SkillA_CChildName or GetName(sceneId, MonsterId) == x890068_SkillA_DChildName then
			LuaFnDeleteMonster(sceneId, MonsterId)
		end
	end

end


--**********************************
--¿ñ±©¼¼ÄÜ....
--**********************************
function x890068_DoSkillD_KuangBao( sceneId, selfId )

	--¼Ó¿ñ±©buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillD_Buff1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillD_Buff2, 0 )

	--¸øËùÓĞĞ¡¹Ö¼Ó¿ñ±©....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, MonsterId) == x890068_SkillA_ChildName then
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890068_SkillD_Buff1, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890068_SkillD_Buff2, 0 )
		end
	end

end


--**********************************
--ÍÁ¶İÂß¼­....
--**********************************
function x890068_SkillLogicA_TunDun( sceneId, selfId, nTick )


	--ÍÁ¶İÄ£Ê½Ôò¸üĞÂÍÁ¶İµÄ¼ÆÊ±Æ÷....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsTudunMode ) then

		local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_TuDunTimer )
		if cd > nTick then

			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_TuDunTimer, cd-nTick )
			--Èç¹ûµ½ÁËË¢Ğ¡¹ÖµÄÊ±¼ä²¢ÇÒ±¾´ÎÍÁ¶İ»¹Ã»Ë¢¹ıĞ¡¹Ö....
			if cd < (x890068_SkillA_Time-x890068_SkillA_ChildTime) then
				local needCreateNum = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_NeedCreateChildNum )
				if needCreateNum > 0 then
					--´´½¨Ğ¡¹Ö....
					MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_NeedCreateChildNum, 0 )
					local x,z = GetWorldPos( sceneId, selfId )
					if needCreateNum == 1 then
						local MstId = CallScriptFunction( x890068_g_FuBenScriptId, "CreateBOSS", sceneId, "JiangShi_BOSS", x, z )
						LuaFnSendSpecificImpactToUnit( sceneId, MstId, MstId, MstId, x890068_SkillA_AChildBuff, 0 )
						SetCharacterName( sceneId, MstId, x890068_SkillA_AChildName )
					end
				end
			end

		else

			--ÍÁ¶İ½áÊø....ÉèÖÃÀë¿ªÍÁ¶İ×´Ì¬....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_TuDunTimer, 0 )
			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsTudunMode, 0 )
			--ÖØÖÃÅ£Ã«¶¾ÕëCD....
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_SkillB_CD, x890068_SkillB_CD )

		end


	--·ÇÍÁ¶İÄ£Ê½Ôò¼ì²âÊÇ·ñ¿ÉÒÔ½øÈëÍÁ¶İÄ£Ê½....
	else

		--Ã¿¼õÉÙ20%ÑªÊ±½øÈëÍÁ¶İÄ£Ê½....
		local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
		local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_HPStep )
		local CurStep = -1
		if CurPercent <= 0.6333 then
			CurStep = 1
		end

		--½øĞĞÍÁ¶İ....
		if CurStep > LastStep then
			--¸ø×Ô¼ºÉèÖÃ²Ï¼ë....
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 19623, 0 )

			--Ëæ»ú»ñµÃ2¸öbuff(³öÍÁÎÄÎï)....
			local idx1 = random( getn(x890068_SkillC_ChutuBuff1) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillC_ChutuBuff1[idx1], 0 )
			local idx2 = random( getn(x890068_SkillC_ChutuBuff2) )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillC_ChutuBuff2[idx2], 0 )

			--local NeedCreateNum = 0
			--if CurStep == 1 then
				--NeedCreateNum = 1
			--end

			MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsTudunMode, 1 )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_NeedCreateChildNum, NeedCreateNum )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_HPStep, CurStep )
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_TuDunTimer, x890068_SkillA_Time )
			return 1
		end


	end

	return 0

end


--**********************************
--Å£Ã«¶¾ÕëÂß¼­....
--**********************************
function x890068_SkillLogicB_NiuMaoDuZhen( sceneId, selfId, nTick )

	--¸üĞÂ¼¼ÄÜCD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_SkillB_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_SkillB_CD, cd-nTick )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_SkillB_CD, x890068_SkillB_CD-(nTick-cd) )
		--·ÇÍÁ¶İ×´Ì¬²Å¿ÉÒÔÓÃ....
		if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsTudunMode ) then
			local x,z = GetWorldPos( sceneId, selfId )
			CallScriptFunction((200060), "Paopao",sceneId, "Bång tàm", "Thiªu th¤t s½n", "Nªm thØ cüa ta bång tàm ğµc chß·ng!" )
			MonsterTalk( sceneId, -1, "", "Bång tàm ğµc chß·ng có ğßşc ğµc bÕo trÕng thái hi®u quä, n± mÕnh sau ğ¯i ğµi hæu tÕo thành ğÕi lßşng thß½ng t±n!!" )
			LuaFnUnitUseSkill( sceneId, selfId, x890068_SkillB_NiuMaoDuZhen, selfId, x, z, 0, 0 )
			return 1
		end
	end

	return 0

end


--**********************************
--¿ñ±©Âß¼­....
--**********************************
function x890068_DoSkillD_KuangBao( sceneId, selfId, nTick )

	--¼ì²âÊÇ·ñµ½ÁË¿ñ±©µÄÊ±ºò....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoTimer )
	if kbTime < x890068_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoTimer, kbTime+nTick )

	else

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_IsKuangBaoMode, 1 )
		--¼Ó¿ñ±©buff....
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillD_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_SkillD_Buff2, 0 )
		--¸øËùÓĞĞ¡¹Ö¼Ó¿ñ±©buff....
		local nMonsterNum = GetMonsterCount(sceneId)
		for i=0, nMonsterNum-1 do
			local MonsterId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, MonsterId) == x890068_SkillA_AChildName or GetName(sceneId, MonsterId) == x890068_SkillA_BChildName or GetName(sceneId, MonsterId) == x890068_SkillA_CChildName or GetName(sceneId, MonsterId) == x890068_SkillA_DChildName then
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890068_SkillD_Buff1, 0 )
				LuaFnSendSpecificImpactToUnit( sceneId, MonsterId, MonsterId, MonsterId, x890068_SkillD_Buff2, 0 )
			end
		end
		return 1

	end


	return 0

end

