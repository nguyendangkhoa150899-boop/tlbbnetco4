--Òý³æÊõ¼¼ÄÜÉý¼¶

--½Å±¾ºÅ
x760109_g_ScriptId = 760109

--´Ënpc¿ÉÒÔÉýµ½µÄ×î¸ßµÈ¼¶
x760109_g_nMaxLevel = 100

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x760109_OnDefaultEvent( sceneId, selfId, targetId )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YINCHONGSHU)
	--Íæ¼ÒÒý³æÊõ¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YINCHONGSHU)
	--ÈÎÎñÅÐ¶Ï

	--ÅÐ¶ÏÊÇ·ñÊÇÐÇËÞÅÉµÜ×Ó,²»ÊÇÐÇËÞµÜ×Ó²»ÄÜÑ§Ï°
		if GetMenPai(sceneId,selfId) ~= MP_GUSU then
			BeginEvent(sceneId)
        		AddText(sceneId, "Nhî b¤t th¸ b±n phái ð® tØ, ngã b¤t nång giáo nhî." );
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--Èç¹û»¹Ã»ÓÐÑ§»á¸ÃÉú»î¼¼ÄÜ
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "Nhî hoàn mµt hæu h÷c hµi b£c quái kÛ nång!"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--Èç¹ûÉú»î¼¼ÄÜµÈ¼¶ÒÑ¾­³¬³ö¸ÃnpcËùÄÜ½ÌµÄ·¶Î§
	if AbilityLevel >= x760109_g_nMaxLevel then
		BeginEvent(sceneId)
			--[ QUFEI 2007-07-17 15:30 ÐÞ¸Ä ]
			strText = "Møc ti«n thØ kÛ nång chï nång h÷c t§p ðáo 100 c¤p"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x760109_g_ScriptId, ABILITY_YINCHONGSHU, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x760109_g_ScriptId;
		local tempAbilityId = ABILITY_YINCHONGSHU;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,tempScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x760109_OnEnumerate( sceneId, selfId, targetId )
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		if 1 then
			AddNumText(sceneId,x760109_g_ScriptId, "Thång c¤p b£c quái kÛ nång", 12, 1)
		end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x760109_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x760109_OnAccept( sceneId, selfId, ABILITY_YINCHONGSHU )
end
