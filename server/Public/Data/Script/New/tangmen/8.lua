--Á¶µ¤¼¼ÄÜÉý¼¶

--½Å±¾ºÅ
x760007_g_ScriptId = 760007

--´Ënpc¿ÉÒÔÉýµ½µÄ×î¸ßµÈ¼¶
x760007_g_nMaxLevel = 10

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x760007_OnDefaultEvent( sceneId, selfId, targetId )
	--Íæ¼Ò¼¼ÄÜµÄµÈ¼¶
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHIDU)
	--Íæ¼ÒÁ¶µ¤¼¼ÄÜµÄÊìÁ·¶È
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_ZHIDU)
	--ÈÎÎñÅÐ¶Ï

	--ÅÐ¶ÏÊÇ·ñÊÇÎäµ±ÅÉµÜ×Ó,²»ÊÇÎäµ±µÜ×Ó²»ÄÜÑ§Ï°
		if GetMenPai(sceneId,selfId) ~= MP_TANGMEN then
			BeginEvent(sceneId)
        		AddText(sceneId,"Ngß½i không phäi b±n phái ð® tØ, ta không th¬ giáo ngß½i.");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--Èç¹û»¹Ã»ÓÐÑ§»á¸ÃÉú»î¼¼ÄÜ
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "Ngß½i còn không có h÷c ðßþc luy®n ðan kÛ nång!"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--Èç¹ûÉú»î¼¼ÄÜµÈ¼¶ÒÑ¾­³¬³ö¸ÃnpcËùÄÜ½ÌµÄ·¶Î§
	if AbilityLevel >= x760007_g_nMaxLevel then
		BeginEvent(sceneId)
			strText = "Ta chï có th¬ giáo ngß½i 1-10 c¤p luy®n ðan kÛ nång, thïnh ðªn bang phái trung h÷c t§p càng cao c¤p luy®n ðan."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x760007_g_ScriptId, ABILITY_ZHIDU, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].Money, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanLevelLimit)
		local tempAbilityId = ABILITY_ZHIDU;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x760007_g_ScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x760007_OnEnumerate( sceneId, selfId, targetId )
		--Èç¹û²»µ½µÈ¼¶Ôò²»ÏÔÊ¾Ñ¡Ïî
		if 1 then
			AddNumText(sceneId,x760007_g_ScriptId,"thång c¤p nÕp thu§t", 12, 1)
		end
		return
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x760007_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x760007_OnAccept( sceneId, selfId, ABILITY_ZHIDU )
end
