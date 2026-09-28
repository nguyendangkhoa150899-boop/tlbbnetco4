--¾­Âö°Ù¾ö¼¼ÄÜÉý¼¶

--½Å±¾ºÅ
x713592_g_ScriptId = 713592

--´Ënpc¿ÉÒÔÉýµ½µÄ×î¸ßµÈ¼¶
x713592_g_nMaxLevel = 100

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x713592_OnDefaultEvent( sceneId, selfId, targetId )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_JINGMAIBAIJUE)
	--Íæ¼Ò¾­Âö°Ù¾ö¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_JINGMAIBAIJUE)
	--ÈÎÎñÅÐ¶Ï

	--ÅÐ¶ÏÊÇ·ñÊÇ´óÀíÅÉµÜ×Ó,²»ÊÇ´óÀíÅÉµÜ×Ó²»ÄÜÑ§Ï°
		if GetMenPai(sceneId,selfId) ~= MP_DALI then
			BeginEvent(sceneId)
        		AddText(sceneId,"Ngß½i không phäi là ð® tØ b±n bang, ta không th¬ dÕy ngß½i.");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--Èç¹û»¹Ã»ÓÐÑ§»á¸ÃÉú»î¼¼ÄÜ
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "Ngß½i vçn chßa th¬ h÷c kÛ nång Kinh mÕch bách quyªt"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--Èç¹ûÉú»î¼¼ÄÜµÈ¼¶ÒÑ¾­³¬³ö¸ÃnpcËùÄÜ½ÌµÄ·¶Î§
	if AbilityLevel >= x713592_g_nMaxLevel then
		BeginEvent(sceneId)
			--[ QUFEI 2007-07-17 15:29 ÐÞ¸Ä ]
			strText = "Trß¾c m¡t kÛ nång này chï có th¬ h÷c ðªn c¤p 100"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713592_g_ScriptId, ABILITY_JINGMAIBAIJUE, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x713592_g_ScriptId;
		local tempAbilityId = ABILITY_JINGMAIBAIJUE;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,tempScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x713592_OnEnumerate( sceneId, selfId, targetId )
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		if 1 then
			AddNumText(sceneId,x713592_g_ScriptId,"Thång c¤p kÛ nång Kinh mÕch bách quyªt", 12, 1)
		end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x713592_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713592_OnAccept( sceneId, selfId, ABILITY_JINGMAIBAIJUE )
end
