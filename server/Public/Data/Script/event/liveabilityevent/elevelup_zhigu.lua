--ÖÆ¹Æ¼¼ÄÜÉı¼¶

--½Å±¾ºÅ
x713575_g_ScriptId = 713575

--´Ënpc¿ÉÒÔÉıµ½µÄ×î¸ßµÈ¼¶
x713575_g_nMaxLevel = 10

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x713575_OnDefaultEvent( sceneId, selfId, targetId )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHIGU)
	--Íæ¼ÒÖÆ¹Æ¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_ZHIGU)
	--ÈÎÎñÅĞ¶Ï

	--ÅĞ¶ÏÊÇ·ñÊÇ´óÀíÅÉµÜ×Ó,²»ÊÇ´óÀíÅÉµÜ×Ó²»ÄÜÑ§Ï°
		if GetMenPai(sceneId,selfId) ~= MP_DALI then
			BeginEvent(sceneId)
        		AddText(sceneId,"Ngß½i không phäi là ğ® tØ b±n bang, ta không th¬ dÕy ngß½i");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--Èç¹û»¹Ã»ÓĞÑ§»á¸ÃÉú»î¼¼ÄÜ
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "Ngß½i vçn chßa h÷c kÛ nång chª tÕo mê"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--Èç¹ûÉú»î¼¼ÄÜµÈ¼¶ÒÑ¾­³¬³ö¸ÃnpcËùÄÜ½ÌµÄ·¶Î§
	if AbilityLevel >= x713575_g_nMaxLevel then
		BeginEvent(sceneId)
			strText = "Ta chï có th¬ dÕy ngß½i kÛ nång chª tÕo mê t× c¤p 1-10, hãy t¾i bang phái ğ¬ h÷c c¤p cao h½n"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713575_g_ScriptId, ABILITY_ZHIGU, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].Money, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanLevelLimit)
		local tempAbilityId = ABILITY_ZHIGU;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x713575_g_ScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x713575_OnEnumerate( sceneId, selfId, targetId )
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		if 1 then
			AddNumText(sceneId,x713575_g_ScriptId,"Thång c¤p kÛ nång chª tÕo mê", 12, 1)
		end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x713575_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713575_OnAccept( sceneId, selfId, ABILITY_ZHIGU )
end
