--Òý³æÊõ¼¼ÄÜÑ§Ï°

--½Å±¾ºÅ
x760011_g_ScriptId = 760011

--´Ënpc¿ÉÒÔÉýµ½µÄ×î¸ßµÈ¼¶
x760011_g_nMaxLevel = 30

--Ñ§Ï°½çÃæÒªËµµÄ»°
x760011_g_MessageStudy = "Chï c¥n ngß½i ch¸u tiêu phí #{_EXCHG%d} li«n có th¬ h÷c ðßþc bách thäo thÑc bi®n kÛ nång. Ngß½i quyªt ð¸nh h÷c t§p sao?"


--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x760011_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YINCHONGSHU)
	--Íæ¼Ò¼Ó¹¤¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YINCHONGSHU)
	--ÈÎÎñÅÐ¶Ï

	--ÅÐ¶ÏÊÇ·ñÊÇÐÇËÞÅÉµÜ×Ó,²»ÊÇÐÇËÞµÜ×Ó²»ÄÜÑ§Ï°
		if GetMenPai(sceneId,selfId) ~= MP_TANGMEN then
			BeginEvent(sceneId)
        		AddText(sceneId,"Ngß½i không phäi ngß¶i môn phái. ta không th¬ dÕy");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁËÒý³æÊõ,Èç¹ûÑ§»áÁË,ÔòÌáÊ¾ÒÑ¾­Ñ§»áÁË
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"Ngß½i ðã h÷c ðßþc bách thäo");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--Èç¹ûµã»÷µÄÊÇ¡°Ñ§Ï°¼¼ÄÜ¡±£¨¼´²ÎÊý=0£©
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_YINCHONGSHU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x760011_g_MessageStudy)
			local addText = format(x760011_g_MessageStudy, demandMoney);
			AddText(sceneId,addText)
			--È·¶¨Ñ§Ï°°´Å¥
					AddNumText(sceneId,x760011_g_ScriptId,"Xác ð¸nh", 6, 2)
			--È¡ÏûÑ§Ï°°´Å¥
					AddNumText(sceneId,x760011_g_ScriptId,"Hüy", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--Èç¹ûµã»÷µÄÊÇ¡°ÎÒÈ·¶¨ÒªÑ§Ï°¡±
		local tempAbilityId = ABILITY_YINCHONGSHU;
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
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_YINCHONGSHU,100)
			--ÔÚnpcÁÄÌì´°¿ÚÍ¨ÖªÍæ¼ÒÒÑ¾­Ñ§»áÁË
			BeginEvent(sceneId)
				AddText(sceneId,"BÕn ðã h÷c xong bách thäo")
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
function x760011_OnEnumerate( sceneId, selfId, targetId )
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		--if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x760011_g_ScriptId,"H÷c bách thäo", 12, 0)
		--end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x760011_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x760011_OnAccept( sceneId, selfId, ABILITY_YINCHONGSHU )
end
