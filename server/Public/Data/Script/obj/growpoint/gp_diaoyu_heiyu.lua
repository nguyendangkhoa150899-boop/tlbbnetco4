--Éú³¤µã
--¶ÔÓ¦Éú»î¼¼ÄÜ£ºµöÓã	µöÓã¼¼ÄÜµÄ±àºÅ9
--ºÚÓã
--½Å±¾ºÅ712006
--ºÚÓã100%
--µÈ¼¶1

--Ã¿´Î´ò¿ª±Ø¶¨»ñµÃµÄ²úÆ·
x712006_g_MainItemId = 20102006
--¿ÉÄÜµÃµ½µÄ²úÆ·
--g_SubItemId = 20304005
--ĞèÒª¼¼ÄÜId
x712006_g_AbilityId = 9
--ĞèÒª¼¼ÄÜµÈ¼¶
x712006_g_AbilityLevel = 6


function 	x712006_OnCreate(sceneId,growPointType,x,y)
	ItemCount = 0-- ÎïÆ·ÊıÁ¿
	ItemBoxId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,ItemCount)	--º¯Êıµ÷ÓÃ
end

function	 x712006_OnOpen(sceneId,selfId,targetId)
	--¼ì²éµöÓã¼¼ÄÜµÈ¼¶
	AbilityId		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,AbilityId)
	if AbilityLevel<x712006_g_AbilityLevel then
		return OR_NO_LEVEL
	end

	--»ñµÃËæ»úÊı,ÉèÖÃÒ»´Îµöµ½ÓãµÄÊ±¼ä
	x712006_g_FishTime = random(80000)+20000	--»ñµÃÒ»¸ö20-100ÃëÖ®¼äµÄËæ»úÊı
	--x712006_g_FishTime = random(8000)+2000	--»ñµÃÒ»¸ö2-10ÃëÖ®¼äµÄËæ»úÊı
	SetAbilityOperaTime(sceneId,selfId,x712006_g_FishTime)	--ÉèÖÃÒ»´Îµöµ½ÓãµÄÊ±¼ä
	--SetAbilityOperaRobotTime(sceneId, selfId,g_totaltime)	--°ÑÀÛ¼ÆÊ±¼ä¸¶¸ø¡£¡£¡£
	
	return OR_OK

end

function	x712006_OnProcOver(sceneId,selfId,targetId)
   
	ret_1 = TryRecieveItem(sceneId,selfId,x712006_g_MainItemId,QUALITY_MUST_BE_CHANGE)
	if ret_1 > 0 then					-->0±íÊ¾ÎïÆ·³É¹¦·ÅÈë±³°üÖĞ
		Msg2Player(sceneId,selfId,"Các hÕ ğã câu ğßşc 1 con H¡c Ngß",MSG2PLAYER_PARA)
		-- Ôö¼ÓÊìÁ·¶È
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
		CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x712006_g_AbilityLevel)
	elseif ret_1 == -1 then
		Msg2Player(sceneId,selfId,"Tay näi ğã ğ¥y!",MSG2PLAYER_PARA)
	end
	return 0
end
