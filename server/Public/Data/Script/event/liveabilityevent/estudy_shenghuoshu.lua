--Ê¥»ðÊõ¼¼ÄÜÑ§Ï°

--½Å±¾ºÅ
x713513_g_ScriptId = 713513

--´Ënpc¿ÉÒÔÉýµ½µÄ×î¸ßµÈ¼¶
x713513_g_nMaxLevel = 5

--Ñ§Ï°½çÃæÒªËµµÄ»°
x713513_g_MessageStudy = "Nªu các hÕ ðÕt t¾i c¤p %d, phäi tiêu t¯n #{_EXCHG%d} m¾i có th¬ h÷c ðßþc kÛ nång thánh hoä thu§t. Ngß½i quyªt ð¸nh h÷c không?"


--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x713513_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_SHENGHUOSHU)
	--Íæ¼ÒÊ¥»ðÊõ¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_SHENGHUOSHU)
	--ÈÎÎñÅÐ¶Ï

	--ÅÐ¶ÏÊÇ·ñÊÇÃ÷½ÌÅÉµÜ×Ó,²»ÊÇÃ÷½ÌµÜ×Ó²»ÄÜÑ§Ï°
		if GetMenPai(sceneId,selfId) ~= MP_MINGJIAO then
			BeginEvent(sceneId)
        		AddText(sceneId,"Ngß½i không phäi là ð® tØ b±n bang, ta không th¬ dÕy ngß½i.");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁËÊ¥»ðÊõ,Èç¹ûÑ§»áÁË,ÔòÌáÊ¾ÒÑ¾­Ñ§»áÁË
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"Các hÕ ðã h÷c kÛ nång thánh höa thu§t r°i");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--Èç¹ûµã»÷µÄÊÇ¡°Ñ§Ï°¼¼ÄÜ¡±£¨¼´²ÎÊý=0£©
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_SHENGHUOSHU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x713513_g_MessageStudy)
			local addText = format(x713513_g_MessageStudy, limitLevel, demandMoney);
			AddText(sceneId,addText)
			--È·¶¨Ñ§Ï°°´Å¥
					AddNumText(sceneId,x713513_g_ScriptId,"TÕi hÕ xác ð¸nh mu¯n h÷c", 6, 2)
			--È¡ÏûÑ§Ï°°´Å¥
					AddNumText(sceneId,x713513_g_ScriptId,"TÕi hÕ chï mu¯n coi", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--Èç¹ûµã»÷µÄÊÇ¡°ÎÒÈ·¶¨ÒªÑ§Ï°¡±
		local tempAbilityId = ABILITY_SHENGHUOSHU;
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
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_SHENGHUOSHU,1)
			--ÔÚnpcÁÄÌì´°¿ÚÍ¨ÖªÍæ¼ÒÒÑ¾­Ñ§»áÁË
			BeginEvent(sceneId)
				AddText(sceneId,"Các hÕ ðã h÷c xong kÛ nång thánh höa thu§t")
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
function x713513_OnEnumerate( sceneId, selfId, targetId )
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		--if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713513_g_ScriptId,"H÷c kÛ nång thánh höa thu§t", 12, 0)
		--end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x713513_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713513_OnAccept( sceneId, selfId, ABILITY_CAIKUANG )
end
