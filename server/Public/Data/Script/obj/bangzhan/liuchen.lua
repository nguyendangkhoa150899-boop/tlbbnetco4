--°ïÕ½¸±±¾NPC B°ï
--ÉñÒ½ Áðå·
--ÆÕÍ¨

--½Å±¾ºÅ
x402299_g_scriptId = 402299

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x402299_g_eventList={701603}

--ÓÎÒ½½Å±¾±àºÅ
x402299_g_healScriptId = 000064

--ÖÎÁÆÉè¶¨ ²Î¼û½Å±¾000064

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x402299_UpdateEventList( sceneId, selfId, targetId )
		BeginEvent(sceneId)
			AddNumText(sceneId,x402299_g_scriptId,"#g0f0ff0 Tr¸ Li®u", 6, 20 )
		EndEvent( sceneId )
	    DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x402299_OnDefaultEvent( sceneId, selfId,targetId )
	x402299_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x402299_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	gld =CallScriptFunction( x402299_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1
	
	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 0 then
		return
	end

	local	key	= GetNumText()
	if key == 20 then
		RestoreHp( sceneId, selfId )
		RestoreMp( sceneId, selfId )
		RestoreRage( sceneId, selfId )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
	end
	
	if key == 1000 then	--²»Ô¸ÔÙÖÎÁÆ
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	if key == 1001 then	--È·ÈÏÒªÖÎÁÆ
		gld =CallScriptFunction( x402299_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1
		local money = GetMoney( sceneId, selfId )
		local JiaoZi = GetMoneyJZ( sceneId, selfId )
		gld = floor(gld)

		if money+JiaoZi < gld then
			BeginEvent( sceneId )
				AddText( sceneId, "#{BHXZ_081103_85}" )
				EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		else
			local jz, jb = LuaFnCostMoneyWithPriority(sceneId, selfId, gld);
			if jz ~= -1 then
				CallScriptFunction( x402299_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			end
		end
		return
	end
	
	--¼ÓÑª
	if key == 0 then
		if GetHp( sceneId, selfId ) == GetMaxHp( sceneId, selfId ) and
		GetRage( sceneId, selfId ) == GetMaxRage( sceneId, selfId ) and
		GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) then
			BeginEvent( sceneId )
			AddText( sceneId, "#{BHXZ_081103_86}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--È¡ÏûÖ¸¶¨Íæ¼ÒÉíÉÏµÄËùÓÐµÐ¶Ô¿ÉÇýÉ¢×¤ÁôÐ§¹û
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			CallScriptFunction( x402299_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			--x402299_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
			AddText( sceneId, "#{BHXZ_081103_87}#{_EXCHG"..gld.."}#{BHXZ_081103_88}" )
			AddNumText( sceneId, x402299_g_scriptId, "Có", -1, 1001 )
			AddNumText( sceneId, x402299_g_scriptId, "không", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x402299_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()ÊÇaddnumtextÖÐ×îºóµÄ±äÁ¿
				return
			end
		end
	end
end

--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x402299_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402299_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--¾Ü¾ø´ËNPCµÄÈÎÎñ
--**********************************
function x402299_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x402299_g_eventList do
		if missionScriptId == findId then
			x402299_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x402299_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402299_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x402299_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402299_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x402299_OnDie( sceneId, selfId, killerId )
end
