--²ÄÁÏ¼Ó¹¤¼¼ÄÜÑ§Ï°

--½Å±¾ºÅ
x713538_g_ScriptId = 713538

--Ñ§Ï°½çÃæÒªËµµÄ»°
x713538_g_MessageStudy = "Nªu các hÕ ðÕt t¾i c¤p %d, phäi tiêu t¯n #{_EXCHG%d} là có th¬ h÷c kÛ nång gia công nguyên li®u. Các hÕ quyªt ð¸nh h÷c không?"

--¼¼ÄÜ±àºÅ
x713538_g_AbilityID = ABILITY_CAILIAOHECHENG

--¼¼ÄÜÃû³Æ
x713538_g_AbilityName = "Gia công nguyên li®u"

--Ñ§Ï°±¾¼¼ÄÜµÄµÈ¼¶ÏÞÖÆ
x713538_g_LimitLevel = 10

--ÒªÈÃÍæ¼ÒÑ§»áµÄÅä·½ÁÐ±í
x713538_g_PeiFangID = { 399, 400, 401, 402, 403, 404, 405, 406, 407 }


--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x713538_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x713538_g_AbilityID)

	--ÈÎÎñÅÐ¶Ï

	--ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË²ÄÁÏ¼Ó¹¤,Èç¹ûÑ§»áÁË,ÔòÌáÊ¾ÒÑ¾­Ñ§»áÁË
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"Các hÕ ðã h÷c ðßþc "..x713538_g_AbilityName.." kÛ nång");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	
	--Èç¹ûµã»÷µÄÊÇ¡°Ñ§Ï°¼¼ÄÜ¡±£¨¼´²ÎÊý=0£©
	if ButtomNum == 0 then
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(x713538_g_AbilityID, 1);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			local addText = format(x713538_g_MessageStudy, x713538_g_LimitLevel, demandMoney);
			AddText(sceneId, addText)
			--È·¶¨Ñ§Ï°°´Å¥
					AddNumText(sceneId,x713538_g_ScriptId,"TÕi hÕ xác ð¸nh mu¯n h÷c", 6, 2)
			--È¡ÏûÑ§Ï°°´Å¥
					AddNumText(sceneId,x713538_g_ScriptId,"TÕi hÕ chï mu¯n coi", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--Èç¹ûµã»÷µÄÊÇ¡°ÎÒÈ·¶¨ÒªÑ§Ï°¡±
	--¼ì²éÍæ¼ÒÊÇ·ñÓÐ×ã¹»µÄÏÖ½ð
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(x713538_g_AbilityID, 1);
		if ret and ret == 1 then
			if GetMoney(sceneId,selfId)+GetMoneyJZ(sceneId,selfId) < demandMoney then			
				BeginEvent(sceneId)
					local addText2 = format( "Xin l²i! S¯ ti«n các hÕ mang theo không ðü, xin hãy mang theo#{_EXCHG%d} r°i hãy ðªn ðây h÷c.", demandMoney )
					AddText( sceneId, addText2 );
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--¼ì²éÍæ¼ÒµÈ¼¶ÊÇ·ñ´ïµ½ÒªÇó
			if GetLevel(sceneId,selfId) < x713538_g_LimitLevel then
				BeginEvent(sceneId)
					AddText(sceneId,"ÐÆng c¤p cüa ngß½i không ðü");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--É¾³ý½ðÇ®
			LuaFnCostMoneyWithPriority(sceneId, selfId, demandMoney)
			--¼¼ÄÜÌáÉýµ½1
			SetHumanAbilityLevel(sceneId,selfId,x713538_g_AbilityID,1)
			--ÈÃÍæ¼ÒÑ§»áËùÓÐ9¸öÅä·½
			x713538_AddAllPeiFang( sceneId, selfId )
			--ÔÚnpcÁÄÌì´°¿ÚÍ¨ÖªÍæ¼ÒÒÑ¾­Ñ§»áÁË
			BeginEvent(sceneId)
				AddText(sceneId,"Các hÕ ðã h÷c ðßþc "..x713538_g_AbilityName.." kÛ nång")
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
function x713538_OnEnumerate( sceneId, selfId, targetId )

		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(x713538_g_AbilityID, 1);
		if ret and ret == 1 then
			AddNumText(sceneId,x713538_g_ScriptId,"H÷c "..x713538_g_AbilityName.." kÛ nång", 12, 0)
		end
		return

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x713538_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x713538_OnAccept( sceneId, selfId, x713538_g_AbilityID )
end


function x713538_AddAllPeiFang( sceneId, selfId )

	for i, pfID in x713538_g_PeiFangID do
	
		if IsPrescrLearned( sceneId, selfId, pfID ) == 0 then
			SetPrescription( sceneId, selfId, pfID, 1 )
		end

	end

end
