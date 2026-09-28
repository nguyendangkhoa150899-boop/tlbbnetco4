--±àÄÉÊõ¼¼ÄÜÑ§Ï°

--½Å±¾ºÅ
x760006_g_ScriptId = 760006

--´Ënpc¿ÉÒÔÉýµ½µÄ×î¸ßµÈ¼¶
x760006_g_nMaxLevel = 5

--Ñ§Ï°½çÃæÒªËµµÄ»°
x760006_g_MessageStudy = "Nªu ngß½i ðÕt t¾i %d c¤p h½n næa ch¸u tiêu phí #{_EXCHG%d} li«n có th¬ h÷c ðßþc biên nÕp thu§t kÛ nång. Ngß½i quyªt ð¸nh h÷c t§p sao?"


--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x760006_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHIDU)
	--Íæ¼Ò±àÄÉÊõ¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_ZHIDU)
	--ÈÎÎñÅÐ¶Ï

	--ÅÐ¶ÏÊÇ·ñÊÇÌÆÃÅÅÉµÜ×Ó,²»ÊÇÌÆÃÅµÜ×Ó²»ÄÜÑ§Ï°
		if GetMenPai(sceneId,selfId) ~= MP_TANGMEN then
			BeginEvent(sceneId)
        		AddText(sceneId,"ngß½i không phäi ð® tØ môn phái.");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË±àÄÉÊõ,Èç¹ûÑ§»áÁË,ÔòÌáÊ¾ÒÑ¾­Ñ§»áÁË
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"ngß½i ðã h÷c nÕp thu§t kÛ nång");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--Èç¹ûµã»÷µÄÊÇ¡°Ñ§Ï°¼¼ÄÜ¡±£¨¼´²ÎÊý=0£©
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_ZHIDU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x760006_g_MessageStudy)
			local addText = format(x760006_g_MessageStudy, limitLevel, demandMoney);
			AddText(sceneId,addText)
			--È·¶¨Ñ§Ï°°´Å¥
					AddNumText(sceneId,x760006_g_ScriptId,"Xác ð¸nh", 6, 2)
			--È¡ÏûÑ§Ï°°´Å¥
					AddNumText(sceneId,x760006_g_ScriptId,"Hüy", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--Èç¹ûµã»÷µÄÊÇ¡°ÎÒÈ·¶¨ÒªÑ§Ï°¡±
		local tempAbilityId = ABILITY_ZHIDU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			--¼ì²éÍæ¼ÒÊÇ·ñÓÐÒ»¸öÒø±ÒµÄÏÖ½ð
			if GetMoney(sceneId,selfId)+GetMoneyJZ(sceneId,selfId) < demandMoney then			
				BeginEvent(sceneId)
					AddText(sceneId,"ti«n vàng không ðü");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--¼ì²éÍæ¼ÒµÈ¼¶ÊÇ·ñ´ïµ½ÒªÇó
			if GetLevel(sceneId,selfId) < limitLevel then
				BeginEvent(sceneId)
					AddText(sceneId,"không ðü c¤p");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--É¾³ý½ðÇ®
			LuaFnCostMoneyWithPriority(sceneId,selfId,demandMoney)
			--¼¼ÄÜÌáÉýµ½1
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_ZHIDU,10)
			--ÔÚnpcÁÄÌì´°¿ÚÍ¨ÖªÍæ¼ÒÒÑ¾­Ñ§»áÁË
			BeginEvent(sceneId)
				AddText(sceneId,"ðã h÷c ðßþc nÕp thu§t")
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
function x760006_OnEnumerate( sceneId, selfId, targetId )
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		--if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x760006_g_ScriptId,"h÷c nÕp thu§t", 12, 0)
		--end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x760006_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x760006_OnAccept( sceneId, selfId, ABILITY_CAIKUANG )
end
