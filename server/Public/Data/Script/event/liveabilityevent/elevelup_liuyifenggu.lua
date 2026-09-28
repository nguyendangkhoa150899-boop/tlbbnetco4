--ÁùÒÕ·ç¹Ç¼¼ÄÜÉý¼¶

--½Å±¾ºÅ
x713596_g_ScriptId = 713596

--´Ënpc¿ÉÒÔÉýµ½µÄ×î¸ßµÈ¼¶
x713596_g_nMaxLevel = 100

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x713596_OnDefaultEvent( sceneId, selfId, targetId )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_LIUYIFENGGU)
	--Íæ¼Ò¼Ó¹¤¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_LIUYIFENGGU)
	--ÈÎÎñÅÐ¶Ï

	--ÅÐ¶ÏÊÇ·ñÊÇåÐÒ£ÅÉµÜ×Ó,²»ÊÇåÐÒ£µÜ×Ó²»ÄÜÑ§Ï°
		if GetMenPai(sceneId,selfId) ~= MP_XIAOYAO then
			BeginEvent(sceneId)
        		AddText(sceneId,"Ngß½i không phäi là ð® tØ b±n bang, ta không th¬ dÕy ngß½i.");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--Èç¹û»¹Ã»ÓÐÑ§»á¸ÃÉú»î¼¼ÄÜ
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "Ngß½i vçn chßa th¬ h÷c kÛ nång løc ngh® phong c¯t"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--Èç¹ûÉú»î¼¼ÄÜµÈ¼¶ÒÑ¾­³¬³ö¸ÃnpcËùÄÜ½ÌµÄ·¶Î§
	if AbilityLevel >= x713596_g_nMaxLevel then
		BeginEvent(sceneId)
			--[ QUFEI 2007-07-17 15:33 ÐÞ¸Ä ]
			strText = "Trß¾c m¡t kÛ nång này chï có th¬ h÷c ðªn c¤p 100"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713596_g_ScriptId, ABILITY_LIUYIFENGGU, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x713596_g_ScriptId;
		local tempAbilityId = ABILITY_LIUYIFENGGU;
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
function x713596_OnEnumerate( sceneId, selfId, targetId )
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		if 1 then
			AddNumText(sceneId,x713596_g_ScriptId,"Thång c¤p kÛ nång løc ngh® phong c¯t", 12, 1)
		end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x713596_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713596_OnAccept( sceneId, selfId, ABILITY_LIUYIFENGGU )
end
