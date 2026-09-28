--µöÓã¼¼ÄÜÉı¼¶

--½Å±¾ºÅ
x713569_g_ScriptId = 713569

--´Ënpc¿ÉÒÔÉıµ½µÄ×î¸ßµÈ¼¶
x713569_g_MaxLevel = 5

----¼¼ÄÜ±àºÅ
x713569_g_AbilityID = ABILITY_DIAOYU

--¼¼ÄÜÃû³Æ
x713569_g_AbilityName = "Câu cá"

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x713569_OnDefaultEvent( sceneId, selfId, targetId, nNum, npcScriptId, bid )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x713569_g_AbilityID)
	--Íæ¼Ò¼Ó¹¤¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, x713569_g_AbilityID)
	--ÈÎÎñÅĞ¶Ï

	--Èç¹û»¹Ã»ÓĞÑ§»á¸ÃÉú»î¼¼ÄÜ
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "Ngß½i vçn chßa th¬ h÷c "..x713569_g_AbilityName.." kÛ nång!"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	--Èç¹ûÊÇÔÚ³ÇÊĞÖĞÉı¼¶
	if bid then
		--¼ì²é³ÇÊĞÊÇ·ñ´¦ÓÚµÍÎ¬»¤×´Ì¬
		if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
			return
		end
		local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713569_g_AbilityID, bid, 2)
		if ret > 0 then
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713569_g_AbilityID, bid, 2)
		end
		return
	end
	--Èç¹ûÉú»î¼¼ÄÜµÈ¼¶ÒÑ¾­³¬³ö¸ÃnpcËùÄÜ½ÌµÄ·¶Î§
	if AbilityLevel >= x713569_g_MaxLevel then
		BeginEvent(sceneId)
			strText = "Ta chï có th¬ dÕy ngß½i t× c¤p 1-5 "..x713569_g_AbilityName.." kÛ nång, xin t¾i bang hµi ğ¬ h÷c cao h½n! "..x713569_g_AbilityName.."."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--old
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713569_g_ScriptId, x713569_g_AbilityID, LEVELUP_ABILITY_DIAOYU[AbilityLevel+1].Money, LEVELUP_ABILITY_DIAOYU[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_DIAOYU[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_DIAOYU[AbilityLevel+1].HumanLevelLimit)
		--new
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_DIAOYU, AbilityLevel + 1);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x713569_g_ScriptId, x713569_g_AbilityID, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x713569_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713569_g_AbilityID, bid, 6)
			if ret > 0 then AddNumText(sceneId,x713569_g_ScriptId,"Thång c¤p "..x713569_g_AbilityName.." kÛ nång", 12, 1) end
			return
		end
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		--old
		--if GetLevel(sceneId,selfId) >= LEVELUP_ABILITY_DIAOYU[1].HumanLevelLimit then
		--	AddNumText(sceneId,x713569_g_ScriptId,"Thång c¤p "..x713569_g_AbilityName.." kÛ nång", 12, 1)
		--end
		--new
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_DIAOYU, 1);
		if ret and ret == 1 and 1 then
			AddNumText(sceneId,x713569_g_ScriptId,"Thång c¤p "..x713569_g_AbilityName.." kÛ nång", 12, 1)
		end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x713569_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713569_OnAccept( sceneId, selfId, x713569_g_AbilityID )
end
