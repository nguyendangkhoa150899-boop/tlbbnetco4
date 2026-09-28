--ÁéĞÄÊõ¼¼ÄÜÉı¼¶

--½Å±¾ºÅ
x713594_g_ScriptId = 713594

--´Ënpc¿ÉÒÔÉıµ½µÄ×î¸ßµÈ¼¶
x713594_g_nMaxLevel = 100

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x713594_OnDefaultEvent( sceneId, selfId, targetId )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_LINGXINSHU)
	--Íæ¼ÒÁéĞÄÊõ¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_LINGXINSHU)
	--ÈÎÎñÅĞ¶Ï

	--ÅĞ¶ÏÊÇ·ñÊÇ¶ëáÒÅÉµÜ×Ó,²»ÊÇ¶ëáÒµÜ×Ó²»ÄÜÑ§Ï°
		if GetMenPai(sceneId,selfId) ~= MP_EMEI then
			BeginEvent(sceneId)
        		AddText(sceneId,"Ngß½i không phäi là ğ® tØ b±n bang, ta không th¬ dÕy ngß½i.");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--Èç¹û»¹Ã»ÓĞÑ§»á¸ÃÉú»î¼¼ÄÜ
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "Ngß½i vçn chßa th¬ h÷c kÛ nång linh tâm thu§t"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--Èç¹ûÉú»î¼¼ÄÜµÈ¼¶ÒÑ¾­³¬³ö¸ÃnpcËùÄÜ½ÌµÄ·¶Î§
	if AbilityLevel >= x713594_g_nMaxLevel then
		BeginEvent(sceneId)			
			strText = "Trß¾c m¡t kÛ nång này chï có th¬ h÷c ğªn c¤p 100"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713594_g_ScriptId, ABILITY_LINGXINSHU, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x713594_g_ScriptId;
		local tempAbilityId = ABILITY_LINGXINSHU;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,tempScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x713594_OnEnumerate( sceneId, selfId, targetId )
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		if 1 then
			AddNumText(sceneId,x713594_g_ScriptId,"Thång c¤p kÛ nång linh tâm thu§t", 12, 1)
		end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x713594_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713594_OnAccept( sceneId, selfId, ABILITY_LINGXINSHU )
end
