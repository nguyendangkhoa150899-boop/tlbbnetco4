-- 402254
-- ƒΩ»›∏¥

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

-- Õı”Ô—‘ø™ ºµ„√˚µƒø™πÿ
x402254_g_bWangyuyanSpeak = 24
x402254_g_DuanAndWangFlag = 29

--**********************************
-- ◊‘º∫À¿Õˆ
--**********************************
function x402254_OnDie( sceneId, selfId, killerId )
	CallScriptFunction( 950001, "TB_Ghi", sceneId, selfId, killerId )   -- [NetCo4 01/10] tui do giet boss (roimap.lua, chi ghi khi ID co trong danh sach)

	LuaFnNpcChat(sceneId, selfId, 0, "C·c ngﬂΩi h„y ch∂ Û, ng‡y n‡y nÂm sau ta s® tÏm c·c ngﬂΩi lo m‡ sØng h™t nhÊng ng‡y cÚn l’i i ha..ha..ha..")

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)

	-- Õ£÷πµ„√˚
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 0)
	
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_DuanAndWangFlag, 0)
	
	-- …æ≥˝∂Œ”˛”ÔÊÃµ»»À
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "VﬂΩng NgÊ YÍn")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "–o‡n DÒ")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Ba ThiÍn Th’ch")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Ph’m Hoa")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Chÿ V’n L˝")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "C± –Øc Th‡nh")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "PhÛ Tﬂ Quy")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Chu –an Th•n")
	
	x402254_TipAllHuman( sceneId, "M\181 Dung Ph\248c \240\227 b\184 \240\225nh b\213i, th\228o ph\213t Y\170n T\216 \145 th\224nh c\244ng! H\227y ra c\216a \240\172 v\171 Th\225i H\176." )	-- [NetCo4 02/10] cau goc tieng Trung (GBK) -> client hien chu rac

	--»°µ√µ±«∞≥°æ∞¿Ôµƒ»À ˝
	local RenNum = LuaFnGetCopyScene_HumanCount( sceneId )
	for i=0, RenNum-1 do
	    local EveryBodyID = LuaFnGetCopyScene_HumanObjId( sceneId, i )	  --»°µ√µ±«∞≥°æ∞¿Ô»ÀµƒobjId
            CallScriptFunction( 890536,"JianCe",sceneId,EveryBodyID)
            if floor(GetMissionData(sceneId,EveryBodyID,HUOYUEFB_2)/10^9) < 1 then
               SetMissionData(sceneId,EveryBodyID,HUOYUEZHI,GetMissionData(sceneId,EveryBodyID,HUOYUEZHI)+163) --ªÓ‘æ÷µ+163
               SetMissionData(sceneId,EveryBodyID,HUOYUEFB_2,GetMissionData(sceneId,EveryBodyID,HUOYUEFB_2)+10^9)
            end
        end

	--LuaFnDeleteMonster(sceneId, selfId)
	
	-- ∑¢ ¿ΩÁπ´∏Ê
--#w°æ∂”≥§√˚°ø#P”Î#{_BOSS0}µ•ÃÙ£¨»¥∞µ π∂””—‘⁄∆‰…Ì∫Û‘“∞Â◊©°¢ π∞Ì◊”°¢«√√∆π˜°¢»˜ Øª“°≠°≠ŒﬁÀ˘≤ª”√£¨÷’”⁄Ω´#{_BOSS0}¥Úµ√¥Û∞‹£¨¬‰ªƒ∂¯Ã”£¨“ªæŸπ•œ¬¡À—‡◊”ŒÎ°£
--#w°æ∂”≥§√˚°ø#P¬ ¡Ï∂””—”Î#{_BOSS0}∫®’Ω∞Î»’£¨∫ˆ∂¯¡ÏŒÚµΩŒ‰—ßµƒ’Ê⁄–£¨∂Ÿ ±Œ‰π¶±©’«£¨#{_BOSS0}µ÷µ–≤ªπ˝£¨÷ªµ√¬‰ªƒ∂¯Ã”£¨—‡◊”ŒÎÀÏœ›°£
--#w°æ∂”≥§√˚°ø#P‘⁄—‡◊”ŒÎµ˜±¯«≤Ω´£¨‘À≥Ô·°·¢£¨‘⁄ π”√¡À¬˜ÃÏπ˝∫££¨∞µ∂»≥¬≤÷µ»»˝ Æ¡˘º∆÷Æ∫Û£¨¥Úµ√#{_BOSS0}÷ªµ√ π”√µ⁄»˝ Æ∆ﬂº∆Ã”÷Æÿ≤ÿ≤¡À°£
	
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
	end
		--»Áπ˚◊È¡À∂”‘ÚªÒ»°∂”≥§µƒID....
	local nLeaderId = GetTeamLeader(sceneId, playerID)
	if nLeaderId < 1   then
		nLeaderId = playerID
	end
	local str = ""
	local ran = random(3)
	if ran == 1  then
		str = format("#W#{_INFOUSR%s}#P c˘ng  #{_BOSS0} quy™t chi™n ·c liÆt trong y™n tÿ ±, #{_BOSS0} th§y mÏnh s—c y™u khÙng ∏ch l’i Øi th¸, quay •u bˆ ch’y.", GetName(sceneId,nLeaderId))
	elseif ran == 2  then
		str = format("#W#{_INFOUSR%s}#P chÔ huy µi ng˚ c˘ng #{_BOSS0} ·nh nhau k∏ch liÆt nÊa ng‡y, b≤ng nhiÍn lÓnh ngµ ch‚n l˝ vı h˜c, nh§t th∂i vı cÙng tÂng v˜t, #{_BOSS0} ·nh khÙng l’i, ‡nh tung mÏnh bˆ ch’y khˆi Y™n Tÿ ë.", GetName(sceneId,nLeaderId))
	else
		str = format("#W#{_INFOUSR%s}#P t’i Y™n Tÿ ë i´u binh khi¨n tﬂæng, b‡y mﬂu nghÓ k™, sÿ d¯ng li≠u man thiÍn qu· h‰i, ·m µ tr•n thﬂΩng ∆ng ba mﬂΩi s·u k™ chi hßu, ·nh cho #{_BOSS0} chÔ ph‰i sÿ d¯ng Æ tam thßp th§t k™ bˆ trØn m§t d’ng.", GetName(sceneId,nLeaderId))
	end
	
	BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
	
	
end

--**********************************
-- –ƒÃ¯
--**********************************
function x402254_OnHeartBeat(sceneId, selfId, nTick)

	-- µ±ƒΩ»›∏¥—™¡øµÙµΩ50%µƒ ±∫Ú£¨»√ Õı”ÔÊÃ µ„√˚£¨Õ¨ ±∂Œ”˛—π•
	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat)) then
			--PrintNum(1)
			-- »Áπ˚ ƒΩ»›∏¥ —™…Ÿ”⁄∂‡…Ÿ£¨æÕ‘ı√¥—˘◊”
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
--						LuaFnNpcChat(sceneId, selfId, 0, "≥¢≥¢‰±—ÙΩ≠…œµƒ¡“—Ê∞…£°")
--					end
--				end
--			end
--		end
--	end
end

--**********************************
-- ≥ı ºªØ
--**********************************
function x402254_OnInit(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)
end

--**********************************
-- …±À¿ÕÊº“
--**********************************
function x402254_OnKillCharacter(sceneId, selfId, targetId)
--	if(-1~=targetId) then
--		local szTarget = GetName(sceneId, targetId)
--		LuaFnNpcChat(sceneId, selfId, 0, szTarget .. "£¨ƒ„æÕÀ„‘Ÿ¿˜∫¶ Æ±∂£¨”ˆ…œ“Ø“Ø“≤÷ª”–À¿¬∑“ªÃı£°")
--	end
end

--**********************************
-- Ω¯»Î’Ω∂∑
--**********************************
function x402254_OnEnterCombat(sceneId, selfId, enmeyId)
	if(0<x402254_TBL.BossBuff) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x402254_TBL.BossBuff, 0)
	end
	
	-- Ω¯»Î’Ω∂∑◊¥Ã¨£¨
	LuaFnNpcChat(sceneId, selfId, 0, "B˜n vÙ danh ti¨u tØt, ai d·m ph· hˆng ’i k™ ph¯c quØc c¸a ta thÏ hÙm nay l‡ ng‡y gi≤ c¸a c·c ngﬂΩi, nΩi ‚y s® l‡ m∞ chÙn c¸a c·c ngﬂΩi!")
	
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, x402254_TBL.PrepareTime)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 1)
	
	CallScriptFunction((200060), "Paopao",sceneId, "–o‡n DÒ", "Y™n Tÿ ë", "VﬂΩng cÙ nﬂΩng, cÙ xem nΩi n‡y binh m„ nguy hi¨m, hay l‡ ta che ch∑ ngﬂΩi i trﬂæc ﬂ˛c khÙng?")
	CallScriptFunction((200060), "Paopao",sceneId, "VﬂΩng NgÊ YÍn", "Y™n Tÿ ë", "Bi¨u ca khÙng i, ta c˚ng s® khÙng i, ta muØn ∑ l’i gi˙p bi¨u ca.")

end

--**********************************
-- Õ—¿Î’Ω∂∑
--**********************************
function x402254_OnLeaveCombat(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)

	-- …æ≥˝∂Œ”˛”ÔÊÃµ»»À
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "VﬂΩng NgÊ YÍn")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "–o‡n DÒ")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Ba ThiÍn Th’ch")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Ph’m Hoa")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Chÿ V’n L˝")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "C± –Øc Th‡nh")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "PhÛ Tﬂ Quy")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "Chu –an Th•n")

	-- ¥”–¬‘⁄≥°æ∞÷–…˙≥…’‚–©Npc
	CallScriptFunction((401040), "CreateMonster_11",sceneId)

	-- Õ£÷πµ„√˚
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 0)
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_DuanAndWangFlag, 0)
end

--**********************************
--Ã· æÀ˘”–∏±±æƒ⁄ÕÊº“
--**********************************
function x402254_TipAllHuman( sceneId, Str )
	-- ªÒµ√≥°æ∞¿ÔÕ∑µƒÀ˘”–»À
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- √ª”–»Àµƒ≥°æ∞£¨ ≤√¥∂º≤ª◊ˆ
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
