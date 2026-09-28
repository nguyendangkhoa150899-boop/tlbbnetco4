-- 402254
-- Ä½Èİ¸´

x402254_TBL = 
{
IDX_TimerPrepare = 1,
IDX_TimerInterval = 2,
IDX_FlagCombat = 1,
BossSkill = 1002,
PrepareTime = 60000,
SkillInterval = 60000,
BossBuff = 9998
}

-- ÍõÓïÑÔ¿ªÊ¼µãÃûµÄ¿ª¹Ø
x402254_g_bWangyuyanSpeak = 24
x402254_g_DuanAndWangFlag = 29

--**********************************
-- ×Ô¼ºËÀÍö
--**********************************
function x402254_OnDie( sceneId, selfId, killerId )

	LuaFnNpcChat(sceneId, selfId, 0, "Các ngß½i hãy ch¶ ğó, ngày này nåm sau ta s¨ tìm các ngß½i lo mà s¯ng hªt nhæng ngày còn lÕi ği ha..ha..ha..")

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)

	-- Í£Ö¹µãÃû
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 0)
	
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_DuanAndWangFlag, 0)
	
	-- É¾³ı¶ÎÓşÓïæÌµÈÈË
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Vß½ng Ngæ Yên")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Ğoàn Dñ")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Ba Thiên ThÕch")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "PhÕm Hoa")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "ChØ VÕn Lı")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "C± Ğ¯c Thành")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Phó Tß Quy")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Chu Ğan Th¥n")
	
	x402254_TipAllHuman( sceneId, "Mµ Dung Phøc ğã b¸ ğánh bÕi, thäo phÕt Yªn TØ ‘ thành công, theo l¯i này tr· lÕi Thái H°" )
	
	--LuaFnDeleteMonster(sceneId, selfId)
	
	-- ·¢ÊÀ½ç¹«¸æ
--#w¡¾¶Ó³¤Ãû¡¿#PÓë#{_BOSS0}µ¥Ìô£¬È´°µÊ¹¶ÓÓÑÔÚÆäÉíºóÔÒ°å×©¡¢Ê¹°í×Ó¡¢ÇÃÃÆ¹÷¡¢È÷Ê¯»Ò¡­¡­ÎŞËù²»ÓÃ£¬ÖÕÓÚ½«#{_BOSS0}´òµÃ´ó°Ü£¬Âä»Ä¶øÌÓ£¬Ò»¾Ù¹¥ÏÂÁËÑà×ÓÎë¡£
--#w¡¾¶Ó³¤Ãû¡¿#PÂÊÁì¶ÓÓÑÓë#{_BOSS0}º¨Õ½°ëÈÕ£¬ºö¶øÁìÎòµ½ÎäÑ§µÄÕæÚĞ£¬¶ÙÊ±Îä¹¦±©ÕÇ£¬#{_BOSS0}µÖµĞ²»¹ı£¬Ö»µÃÂä»Ä¶øÌÓ£¬Ñà×ÓÎëËìÏİ¡£
--#w¡¾¶Ó³¤Ãû¡¿#PÔÚÑà×ÓÎëµ÷±øÇ²½«£¬ÔË³ïá¡á¢£¬ÔÚÊ¹ÓÃÁËÂ÷Ìì¹ıº££¬°µ¶È³Â²ÖµÈÈıÊ®Áù¼ÆÖ®ºó£¬´òµÃ#{_BOSS0}Ö»µÃÊ¹ÓÃµÚÈıÊ®Æß¼ÆÌÓÖ®Ø²Ø²ÁË¡£
	
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
	end
		--Èç¹û×éÁË¶ÓÔò»ñÈ¡¶Ó³¤µÄID....
	local nLeaderId = GetTeamLeader(sceneId, playerID)
	if nLeaderId < 1   then
		nLeaderId = playerID
	end
	local str = ""
	local ran = random(3)
	if ran == 1  then
		str = format("#W#{_INFOUSR%s}#P cùng  #{_BOSS0} quyªt chiªn ác li®t trong yªn tØ ±, #{_BOSS0} th¤y mình sÑc yªu không ğ¸ch lÕi ğ¯i thü, quay ğ¥u bö chÕy.", GetName(sceneId,nLeaderId))
	elseif ran == 2  then
		str = format("#W#{_INFOUSR%s}#P chï huy ğµi ngû cùng #{_BOSS0} ğánh nhau k¸ch li®t næa ngày, b²ng nhiên lînh ngµ chân lı võ h÷c, nh¤t th¶i võ công tång v÷t, #{_BOSS0} ğánh không lÕi, ğành tung mình bö chÕy khöi Yªn TØ ‘.", GetName(sceneId,nLeaderId))
	else
		str = format("#W#{_INFOUSR%s}#P tÕi Yªn TØ ‘ ği«u binh khi¬n tß¾ng, bày mßu nghî kª, sØ døng li­u man thiên quá häi, ám ğµ tr¥n thß½ng ğÆng ba mß½i sáu kª chi h§u, ğánh cho #{_BOSS0} chï phäi sØ døng ğ® tam th§p th¤t kª bö tr¯n m¤t dÕng.", GetName(sceneId,nLeaderId))
	end
	
	BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
	CallScriptFunction( 898992, "MonsterOnDie", sceneId, selfId, killerId,5 )
	
end

--**********************************
-- ĞÄÌø
--**********************************
function x402254_OnHeartBeat(sceneId, selfId, nTick)

	-- µ±Ä½Èİ¸´ÑªÁ¿µôµ½50%µÄÊ±ºò£¬ÈÃ ÍõÓïæÌ µãÃû£¬Í¬Ê±¶ÎÓşÑğ¹¥
	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat)) then
			--PrintNum(1)
			-- Èç¹û Ä½Èİ¸´ ÑªÉÙÓÚ¶àÉÙ£¬¾ÍÔõÃ´Ñù×Ó
			if LuaFnGetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak) == 0  then
				if GetHp(sceneId, selfId)*2 <= GetMaxHp(sceneId, selfId) then
					LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 1)
				end
			end
		else
			--PrintNum(2)
		end
	end

--	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
--		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat)) then
--			--Countdown TimerPrepare
--			local TimePrepare = MonsterAI_GetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare)
--			if(0<TimePrepare) then
--				TimePrepare = TimePrepare - nTick;
--				MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, TimePrepare)
--			else
--				local TimeInterval = MonsterAI_GetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval)
--				if(0<TimeInterval) then
--					--Countdown TimerInterval
--					TimeInterval = TimeInterval - nTick;
--					MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, TimeInterval)
--				else
--					MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, x402254_TBL.SkillInterval)
--					local nTarget = LuaFnGetTargetObjID(sceneId, selfId)
--					if(-1~=nTarget) then
--						local posX, posZ = GetWorldPos(sceneId,nTarget)
--						local fDir = 0.0
--						LuaFnUnitUseSkill(sceneId, selfId, x402254_TBL.BossSkill, nTarget, posX, posZ, fDir)			
--						LuaFnNpcChat(sceneId, selfId, 0, "³¢³¢ä±Ñô½­ÉÏµÄÁÒÑæ°É£¡")
--					end
--				end
--			end
--		end
--	end
end

--**********************************
-- ³õÊ¼»¯
--**********************************
function x402254_OnInit(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)
end

--**********************************
-- É±ËÀÍæ¼Ò
--**********************************
function x402254_OnKillCharacter(sceneId, selfId, targetId)
--	if(-1~=targetId) then
--		local szTarget = GetName(sceneId, targetId)
--		LuaFnNpcChat(sceneId, selfId, 0, szTarget .. "£¬Äã¾ÍËãÔÙÀ÷º¦Ê®±¶£¬ÓöÉÏÒ¯Ò¯Ò²Ö»ÓĞËÀÂ·Ò»Ìõ£¡")
--	end
end

--**********************************
-- ½øÈëÕ½¶·
--**********************************
function x402254_OnEnterCombat(sceneId, selfId, enmeyId)
	if(0<x402254_TBL.BossBuff) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x402254_TBL.BossBuff, 0)
	end
	
	-- ½øÈëÕ½¶·×´Ì¬£¬
	LuaFnNpcChat(sceneId, selfId, 0, "B÷n vô danh ti¬u t¯t, ai dám phá höng ğÕi kª phøc qu¯c cüa ta thì hôm nay là ngày gi² cüa các ngß½i, n½i ğây s¨ là m° chôn cüa các ngß½i!")
	
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, x402254_TBL.PrepareTime)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 1)
	
	CallScriptFunction((200060), "Paopao",sceneId, "Ğoàn Dñ", "Yªn TØ ‘", "Vß½ng cô nß½ng, cô xem n½i này binh mã nguy hi¬m, hay là ta che ch· ngß½i ği trß¾c ğßşc không?")
	CallScriptFunction((200060), "Paopao",sceneId, "Vß½ng Ngæ Yên", "Yªn TØ ‘", "Bi¬u ca không ği, ta cûng s¨ không ği, ta mu¯n · lÕi giúp bi¬u ca.")

end

--**********************************
-- ÍÑÀëÕ½¶·
--**********************************
function x402254_OnLeaveCombat(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)

	-- É¾³ı¶ÎÓşÓïæÌµÈÈË
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Vß½ng Ngæ Yên")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Ğoàn Dñ")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Ba Thiên ThÕch")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "PhÕm Hoa")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "ChØ VÕn Lı")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "C± Ğ¯c Thành")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Phó Tß Quy")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Chu Ğan Th¥n")

	-- ´ÓĞÂÔÚ³¡¾°ÖĞÉú³ÉÕâĞ©Npc
	CallScriptFunction((401040), "CreateMonster_11",sceneId)

	-- Í£Ö¹µãÃû
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 0)
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_DuanAndWangFlag, 0)
end

--**********************************
--ÌáÊ¾ËùÓĞ¸±±¾ÄÚÍæ¼Ò
--**********************************
function x402254_TipAllHuman( sceneId, Str )
	-- »ñµÃ³¡¾°ÀïÍ·µÄËùÓĞÈË
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- Ã»ÓĞÈËµÄ³¡¾°£¬Ê²Ã´¶¼²»×ö
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end
