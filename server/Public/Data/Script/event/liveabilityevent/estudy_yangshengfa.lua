--ÑøÉú·¨¼¼ÄÜÑ§Ï°

--½Å±¾ºÅ
x713528_g_ScriptId = 713528

--´Ënpc¿ÉÒÔÉýµ½µÄ×î¸ßµÈ¼¶
x713528_g_nMaxLevel = 30

x713528_g_AbilityID = ABILITY_YANGSHENGFA
--Ñ§Ï°½çÃæÒªËµµÄ»°
x713528_g_MessageStudy = "Chï c¥n các hÕ ch¸u bö #{_EXCHG%d} m¾i có th¬ h÷c ðßþc kÛ nång dßÞng sinh pháp. Ngß½i quyªt ð¸nh h÷c không?"

x713528_g_AbilityName = "DßÞng sinh pháp"

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x713528_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YANGSHENGFA)
	--Íæ¼Ò¼Ó¹¤¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YANGSHENGFA)
	--ÈÎÎñÅÐ¶Ï

	--ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁËÑøÉú·¨,Èç¹ûÑ§»áÁË,ÔòÌáÊ¾ÒÑ¾­Ñ§»áÁË
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"Các hÕ ðã h÷c kÛ nång dßÞng sinh pháp r°i");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--ÔÚ³ÇÊÐÀïÑ§Ï°Õâ¸ö¼¼ÄÜ
	if bid then
		x713528_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
		return
	end

	--Èç¹ûµã»÷µÄÊÇ¡°Ñ§Ï°¼¼ÄÜ¡±£¨¼´²ÎÊý=0£©
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_YANGSHENGFA;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x713528_g_MessageStudy)
			local addText = format(x713528_g_MessageStudy, demandMoney);
			AddText(sceneId,addText)
			--È·¶¨Ñ§Ï°°´Å¥
					AddNumText(sceneId,x713528_g_ScriptId,"TÕi hÕ xác ð¸nh mu¯n h÷c", 6, 2)
			--È¡ÏûÑ§Ï°°´Å¥
					AddNumText(sceneId,x713528_g_ScriptId,"TÕi hÕ chï mu¯n coi", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--Èç¹ûµã»÷µÄÊÇ¡°ÎÒÈ·¶¨ÒªÑ§Ï°¡±
		local tempAbilityId = ABILITY_YANGSHENGFA;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
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
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_YANGSHENGFA,1)
			--ÔÚnpcÁÄÌì´°¿ÚÍ¨ÖªÍæ¼ÒÒÑ¾­Ñ§»áÁË
			BeginEvent(sceneId)
				AddText(sceneId,"Các hÕ ðã h÷c xong kÛ nång dßÞng sinh pháp")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	else --Èç¹ûµã»÷¡°ÎÒÖ»ÊÇÀ´¿´¿´¡±
		CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x713528_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713528_g_AbilityID, bid, 5)
			if ret > 0 then AddNumText(sceneId,x713528_g_ScriptId,"H÷c "..x713528_g_AbilityName.." kÛ nång", 12, 0) end
			return
		end
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		--if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713528_g_ScriptId,"H÷c kÛ nång dßÞng sinh pháp", 12, 0)
		--end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x713528_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713528_OnAccept( sceneId, selfId, ABILITY_YANGSHENGFA )
end

--ÔÚ³ÇÊÐÀïÑ§Ï°´ËÉú»î¼¼ÄÜÊ±ÐèÒªÖ´ÐÐµÄº¯Êý
function x713528_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
	if bid then
		if 0 == ButtomNum then
			--¼ì²é³ÇÊÐÊÇ·ñ´¦ÓÚµÍÎ¬»¤×´Ì¬
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			--Ìí¼ÓÌõ¼þÏÔÊ¾ÄÚÈÝ
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713528_g_AbilityID, bid, 4)
			local studyMsg = format("Nªu các hÕ ðÕt t¾i c¤p %d, phäi tiêu t¯n #{_EXCHG%d} và %d ði¬m bang hµi s¨ có th¬ h÷c ðßþc "..x713528_g_AbilityName.." kÛ nång. Ngß½i quyªt ð¸nh h÷c không?", lv, money, con)
			AddText(sceneId,studyMsg)
			--È·¶¨Ñ§Ï°°´Å¥
					AddNumText(sceneId,x713528_g_ScriptId,"TÕi hÕ xác ð¸nh mu¯n h÷c", 6, 2)
			--È¡ÏûÑ§Ï°°´Å¥
					AddNumText(sceneId,x713528_g_ScriptId,"TÕi hÕ chï mu¯n coi", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 2 == ButtomNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713528_g_AbilityID, bid, 1)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713528_g_AbilityID, bid, 1)
			end
		else
			CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end
