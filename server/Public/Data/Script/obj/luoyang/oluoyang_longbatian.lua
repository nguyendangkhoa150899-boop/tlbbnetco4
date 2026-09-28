--ÂåÑôNPC
--ÉñÒ½
--ÆÕÍ¨

--½Å±¾ºÅ
x000129_g_scriptId = 000129

--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x000129_g_eventList={701603}				-- ¡°ÕäÊÞÖÎÁÆ¡±½Å±¾

--ÓÎÒ½½Å±¾±àºÅ
x000129_g_healScriptId = 000064

--ÖÎÁÆÉè¶¨ ²Î¼û½Å±¾000064

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x000129_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_BaTian}")
		AddNumText(sceneId,x000129_g_scriptId,"Tr¸ li®u",6,20)
	local strGUID = LuaFnGetGUID(sceneId,selfId)
	 --if strGUID == 1010001565 or strGUID == 1010001573 or strGUID == 1010001572 or strGUID == 1010001604 or strGUID == 1010001605 or strGUID == 1010001608 then
     --    AddNumText(sceneId,x000129_g_scriptId,"Buff Tàng hình GM",1,111)   
    --end
		AddNumText(sceneId,x000129_g_scriptId,"H°i Toàn Bµ Skill #G[500 ÐMP]",1,1993)
	EndEvent(sceneId)
	for i, eventId in x000129_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x000129_OnDefaultEvent( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
	     AddText(sceneId,"#{OBJ_luoyang_BaTian}")
		 x000129_UpdateEventList( sceneId, selfId, targetId )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x000129_OnEventRequest( sceneId, selfId, targetId, eventId )
	-- µ÷ÓÃ¡°½­ºþÓÎÒ½¡±½Å±¾ÖÐ¼ÆËã½ðÇ®µÄº¯Êý
	local	gld = CallScriptFunction( x000129_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1

	local	key	= GetNumText()
	
	if key == 20 then
		RestoreHp( sceneId, selfId )
		RestoreMp( sceneId, selfId )
		RestoreRage( sceneId, selfId )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		x000129_NotifyFailBox( sceneId, selfId, selfId, "Ðã tr¸ li®u thành công")
				EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	
	if key == 1000 then	--²»Ô¸ÔÙÖÎÁÆ
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	if key == -111 then
	    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 2690, 0)
	    BeginEvent( sceneId )
			AddText( sceneId, "nh§n buff thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	
	if key == 1993 then
								if  GetMenPai(sceneId,selfId)  ==3   then
				x000129_NotifyFailBox( sceneId, selfId, selfId,  "#bNghe truy«n #cFF0000Du Nhãn Hæu Dß #Wlà tuy®t kÛ ðÕt t¾i cänh t¯i cao cüa võ h÷c phái #GVõ Ðang, #Wsau khi sØ døng có th¬ h°i toàn bµ chiêu thÑc, dù sao b¢ng hæu cûng là môn hÕ cüa phái #GVõ Ðang, #Wkhông c¥n thiªt phäi sØ døng chÑc nång h°i skill ðâu!"  )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
				end
				BeginEvent(sceneId)
			AddText(sceneId,"#b Tß½ng truy«n chï có môn hÕ cüa phái #GVõ Ðang #Wm¾i có th¬ sØ døng #YTuy®t kÛ #cFF0000Du Nhãn Hæu Dß #Wl×ng danh thiên hÕ m¾i có th¬ chuy¬n hóa toàn bµ th¶i gian chiêu thÑc tr· v« ban ð¥u. R¤t tiªc là b¢ng hæu không phäi ð® tØ cüa phái Võ Ðang! ")
			AddText(sceneId,"#bNhßng lành thay tÕi hÕ cûng t×ng giao häo r¤t nhi«u môn phái, do ðó cûng h÷c ðßþc tuy®t kÛ loÕi này! nay b¢ng hæu có ð°ng ý ch¸u t¯n phí#c00ffff 500 Ði¬m Môn Phái #Wð¬ h°i phøc toàn bµ skill không?")
					AddNumText(sceneId,x000129_g_scriptId,"Ð°ng ý",6,1994)
					AddNumText(sceneId,x000129_g_scriptId,"Quay lÕi",8,1995)				
						EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
		elseif key == 1994 then
			if GetHumanMenpaiPoint(sceneId, selfId) < 500  then
				x000129_NotifyFailBox( sceneId, selfId, selfId, "#WB¢ng hæu không ðü #c00ffff500 Ði¬m Môn Phái,#W hãy ði ð±i #YVàng #Wl¤y #c00ffffÐi¬m Môn Phái #Wði" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			else
			    x000129_NotifyFailBox( sceneId, selfId, selfId,"#b#HÐã h°i phøc toàn Bµ skill, m¶i bÕn tiªp tøc Chiªn Ð¤u ! " )
			    SetHumanMenpaiPoint(sceneId,selfId, GetHumanMenpaiPoint(sceneId, selfId) - 500)
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 460, 0)
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	end
	    if GetNumText() == 1995 then  
        x000129_OnDefaultEvent( sceneId, selfId, targetId )  
    end  
	
	if key == 1001 then	--È·ÈÏÒªÖÎÁÆ
		-- µ÷ÓÃ¡°½­ºþÓÎÒ½¡±½Å±¾ÖÐ¼ÆËã½ðÇ®µÄº¯Êý
		gld = CallScriptFunction( x000129_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1

		-- µÃµ½½»×ÓºÍ½ðÇ®ÊýÄ¿
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		
		--¼ì²éÍæ¼ÒÊÇ·ñÓÐ×ã¹»µÄÏÖ½ð
		if (nMoneyJZ + nMoney >= gld) then
			--¿ÛÇ®
			LuaFnCostMoneyWithPriority (sceneId, selfId, gld)
			-- µ÷ÓÃ¡°½­ºþÓÎÒ½¡±½Å±¾
			CallScriptFunction( x000129_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			RestoreStrikePoint( sceneId, selfId )			
			return
		
		else
			BeginEvent( sceneId )
				AddText( sceneId, "Ngân lßþng cüa các hÕ không ðü!" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	
	--¼ÓÑª
	if key == 0 then
		if GetHp( sceneId, selfId ) == GetMaxHp( sceneId, selfId ) and
			 GetRage( sceneId, selfId ) == GetMaxRage( sceneId, selfId ) and
			 GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) and
			 IsStrikePointFull( sceneId, selfId ) == 1 then
			BeginEvent( sceneId )
				AddText( sceneId, "Ngß½i hi®n r¤t khoë mÕnh, không c¥n chæa tr¸!" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--È¡ÏûÖ¸¶¨Íæ¼ÒÉíÉÏµÄËùÓÐµÐ¶Ô¿ÉÇýÉ¢×¤ÁôÐ§¹û
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			-- µ÷ÓÃ¡°½­ºþÓÎÒ½¡±½Å±¾
			CallScriptFunction( x000129_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			RestoreStrikePoint( sceneId, selfId )
			--x000129_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "Các hÕ c¥n t¯n #G#{_EXCHG"..gld.."}#W t¾i h°i phøc huyªt và khí, xác ð¸nh có c¥n chæa tr¸ không?" )
				AddNumText( sceneId, x000129_g_scriptId, "Có", -1, 1001 )
				AddNumText( sceneId, x000129_g_scriptId, "Không", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x000129_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()ÊÇaddnumtextÖÐ×îºóµÄ±äÁ¿
				return
			end
		end
	end
end
function x000129_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--½ÓÊÜ´ËNPCµÄÈÎÎñ
--**********************************
function x000129_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000129_g_eventList do
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
function x000129_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--¾Ü¾øÖ®ºó£¬Òª·µ»ØNPCµÄÊÂ¼þÁÐ±í
	for i, findId in x000129_g_eventList do
		if missionScriptId == findId then
			x000129_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--¼ÌÐø£¨ÒÑ¾­½ÓÁËÈÎÎñ£©
--**********************************
function x000129_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000129_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêµÄÈÎÎñ
--**********************************
function x000129_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000129_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x000129_OnDie( sceneId, selfId, killerId )
end

function x000129_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

function x000129_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

