--·ìÈÒ¼¼ÄÜÑ§Ï°

--½Å±¾ºÅ
x713506_g_ScriptId = 713506

--Ñ§Ï°½çÃæÒªËµµÄ»°
x713506_g_MessageStudy = "Nªu các hÕ ðÕt t¾i c¤p %d, phäi tiêu t¯n #{_EXCHG%d} m¾i có th¬ h÷c ðßþc kÛ nång may m£c. Các hÕ có quyªt ð¸nh h÷c không?"

--¼¼ÄÜ±àºÅ
x713506_g_AbilityID = ABILITY_FENGREN

--¼¼ÄÜÃû³Æ
x713506_g_AbilityName = "May m£c"

x713506_g_Name1 = "Mµc Uy¬n Thanh"
--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x713506_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x713506_g_AbilityID)
	--Íæ¼Ò·ìÈÒ¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, x713506_g_AbilityID)
	--ÈÎÎñÅÐ¶Ï

	--ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË·ìÈÒ,Èç¹ûÑ§»áÁË,ÔòÌáÊ¾ÒÑ¾­Ñ§»áÁË
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"Các hÕ ðã h÷c ðßþc "..x713506_g_AbilityName.." kÛ nång");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--ÔÚ³ÇÊÐÀïÑ§Ï°Õâ¸ö¼¼ÄÜ
	if bid then
		x713506_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
		return
	end

	--Èç¹ûµã»÷µÄÊÇ¡°Ñ§Ï°¼¼ÄÜ¡±£¨¼´²ÎÊý=0£©
	if ButtomNum == 0 then
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(ABILITY_FENGREN, 1);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			
			if GetName(sceneId, targetId) == x713506_g_Name1   then
				demandMoney = extraMoney;
			end
			
			local addText = format(x713506_g_MessageStudy, limitLevel, demandMoney);
			AddText(sceneId,addText)
			--È·¶¨Ñ§Ï°°´Å¥
					AddNumText(sceneId,x713506_g_ScriptId,"TÕi hÕ xác ð¸nh mu¯n h÷c", 6, 2)
			--È¡ÏûÑ§Ï°°´Å¥
					AddNumText(sceneId,x713506_g_ScriptId,"TÕi hÕ chï mu¯n coi", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--Èç¹ûµã»÷µÄÊÇ¡°ÎÒÈ·¶¨ÒªÑ§Ï°¡±
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(ABILITY_FENGREN, 1);
		if ret and ret == 1 then
		
			if GetName(sceneId, targetId) == x713506_g_Name1   then
				demandMoney = extraMoney;
			end

			--¼ì²éÍæ¼ÒÊÇ·ñÓÐÒ»¸öÒø±ÒµÄÏÖ½ð
			if GetMoney(sceneId,selfId)+GetMoneyJZ(sceneId,selfId) < demandMoney then			
				BeginEvent(sceneId)
					AddText(sceneId,"Các hÕ không ðü ngân lßþng");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--¼ì²éÍæ¼ÒµÈ¼¶ÊÇ·ñ´ïµ½ÒªÇó
			if GetLevel(sceneId,selfId) < limitLevel then
				BeginEvent(sceneId)
					AddText(sceneId,"ÐÆng c¤p cüa ngß½i không ðü");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--É¾³ý½ðÇ®
			LuaFnCostMoneyWithPriority(sceneId,selfId,demandMoney)
			--¼¼ÄÜÌáÉýµ½1
			SetHumanAbilityLevel(sceneId,selfId,x713506_g_AbilityID,1)
			--ÔÚnpcÁÄÌì´°¿ÚÍ¨ÖªÍæ¼ÒÒÑ¾­Ñ§»áÁË
			BeginEvent(sceneId)
				AddText(sceneId,"Các hÕ ðã h÷c ðßþc "..x713506_g_AbilityName.." kÛ nång")
			EndEvent( )
			LuaFnAuditLearnLifeAbility(sceneId,selfId,x713506_g_AbilityID)
			DispatchEventList(sceneId,selfId,targetId)
		end
	else --Èç¹ûµã»÷¡°ÎÒÖ»ÊÇÀ´¿´¿´¡±
		CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x713506_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713506_g_AbilityID, bid, 5)
			if ret > 0 then AddNumText(sceneId,x713506_g_ScriptId,"H÷c "..x713506_g_AbilityName.." kÛ nång", 12, 0) end
			return
		end
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		--if GetLevel(sceneId,selfId) >= LEVELUP_ABILITY_FENGREN[1].HumanLevelLimit then
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_FENGREN, 1);
		--if ret and ret == 1 and GetLevel(sceneId,selfId) >= limitLevel then
		if ret and ret == 1 then
			AddNumText(sceneId,x713506_g_ScriptId,"H÷c "..x713506_g_AbilityName.." kÛ nång", 12, 0)
		end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x713506_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713506_OnAccept( sceneId, selfId, x713506_g_AbilityID )
end

--ÔÚ³ÇÊÐÀïÑ§Ï°´ËÉú»î¼¼ÄÜÊ±ÐèÒªÖ´ÐÐµÄº¯Êý
function x713506_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
	if bid then
		if 0 == ButtomNum then
			--¼ì²é³ÇÊÐÊÇ·ñ´¦ÓÚµÍÎ¬»¤×´Ì¬
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			--Ìí¼ÓÌõ¼þÏÔÊ¾ÄÚÈÝ
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713506_g_AbilityID, bid, 4)
			local studyMsg = format("Nªu các hÕ ðÕt t¾i c¤p %d, phäi tiêu t¯n #{_EXCHG%d} và %d ði¬m bang hµi s¨ có th¬ h÷c ðßþc "..x713506_g_AbilityName.." kÛ nång. Ngß½i quyªt ð¸nh h÷c không?", lv, money, con)
			AddText(sceneId,studyMsg)
			--È·¶¨Ñ§Ï°°´Å¥
					AddNumText(sceneId,x713506_g_ScriptId,"TÕi hÕ xác ð¸nh mu¯n h÷c", 6, 2)
			--È¡ÏûÑ§Ï°°´Å¥
					AddNumText(sceneId,x713506_g_ScriptId,"TÕi hÕ chï mu¯n coi", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 2 == ButtomNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713506_g_AbilityID, bid, 1)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713506_g_AbilityID, bid, 1)
			end
		else
			CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end
