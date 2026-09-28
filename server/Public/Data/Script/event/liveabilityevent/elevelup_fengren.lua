--·ìÈÒ¼¼ÄÜÉı¼¶

--½Å±¾ºÅ
x713565_g_ScriptId = 713565

--´Ënpc¿ÉÒÔÉıµ½µÄ×î¸ßµÈ¼¶
x713565_g_MaxLevel = 5

----¼¼ÄÜ±àºÅ
x713565_g_AbilityID = ABILITY_FENGREN

--¼¼ÄÜÃû³Æ
x713565_g_AbilityName = "May m£c"

x713565_g_Name1 = "Mµc Uy¬n Thanh"

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x713565_OnDefaultEvent( sceneId, selfId, targetId, nNum, npcScriptId, bid )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x713565_g_AbilityID)
	--Íæ¼Ò¼Ó¹¤¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, x713565_g_AbilityID)
	--ÈÎÎñÅĞ¶Ï

	--Èç¹û»¹Ã»ÓĞÑ§»á¸ÃÉú»î¼¼ÄÜ
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "Ngß½i vçn chßa th¬ h÷c "..x713565_g_AbilityName.." kÛ nång!"
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
		local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713565_g_AbilityID, bid, 2)
		if ret > 0 then
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713565_g_AbilityID, bid, 2)
		end
		return
	end
	
	local MaxLevel = x713565_g_MaxLevel;
	if GetName(sceneId, targetId) == x713565_g_Name1   then
		MaxLevel = 10;
	end
	
	--Èç¹ûÉú»î¼¼ÄÜµÈ¼¶ÒÑ¾­³¬³ö¸ÃnpcËùÄÜ½ÌµÄ·¶Î§
	if AbilityLevel >= MaxLevel then
		BeginEvent(sceneId)
			if GetName(sceneId, targetId) == x713565_g_Name1   then
				strText = "Ta chï có th¬ dÕy ngß½i t× c¤p 1-10 kÛ nång "..x713565_g_AbilityName.."."
			else
			strText = "Ta chï có th¬ dÕy ngß½i t× c¤p 1-5 "..x713565_g_AbilityName.." kÛ nång, hãy ğªn bang phái ho£c tìm h÷c may m£c cüa#Y Mµc Uy¬n Thanh #GĞÕi Lı #{_INFOAIM107,135,2, Mµc Uy¬n Thanh}#W ğ¬ h÷c cao h½n "..x713565_g_AbilityName.."."
			end
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713565_g_ScriptId, x713565_g_AbilityID, LEVELUP_ABILITY_FENGREN[AbilityLevel+1].Money, LEVELUP_ABILITY_FENGREN[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_FENGREN[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_FENGREN[AbilityLevel+1].HumanLevelLimit)
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(ABILITY_FENGREN, AbilityLevel + 1);
		
		if GetName(sceneId, targetId) == x713565_g_Name1   then
			demandMoney = extraMoney;
			demandExp		=	extraExp;
		end
		
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x713565_g_ScriptId, x713565_g_AbilityID, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x713565_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713565_g_AbilityID, bid, 6)
			if ret > 0 then AddNumText(sceneId,x713565_g_ScriptId,"Thång c¤p "..x713565_g_AbilityName.." kÛ nång", 12, 1) end
			return
		end
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		--if GetLevel(sceneId,selfId) >= LEVELUP_ABILITY_FENGREN[1].HumanLevelLimit then
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(ABILITY_FENGREN, 1);
		if ret and ret == 1 and 1 then
			AddNumText(sceneId,x713565_g_ScriptId,"Thång c¤p "..x713565_g_AbilityName.." kÛ nång", 12, 1)
		end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x713565_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713565_OnAccept( sceneId, selfId, x713565_g_AbilityID )
end
