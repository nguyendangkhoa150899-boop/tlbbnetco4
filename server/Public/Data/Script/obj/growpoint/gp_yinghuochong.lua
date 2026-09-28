--Éú³¤µã
--Ó©»ğ³æ
--½Å±¾ºÅ712527
--Ë®¾§¿óÊ¯1	0.6		2	0.3		3	0.1		ğ©Ê¯1%
--ÒÔ20%¸ÅÂÊµÃµ½¸±²úÆ·20103019,20103031,20103043,20103055 ÖĞµÄÒ»ÖÖ£¬ÊıÁ¿1	0.6		2	0.3		3	0.1
--µÈ¼¶1

--Ã¿´Î´ò¿ª±Ø¶¨»ñµÃµÄ²úÆ·
x712527_g_MainItemId = 30501104
--¿ÉÄÜµÃµ½µÄ²úÆ·
x712527_g_SubItemId = 30501105
--¸±²úÆ·
x712527_g_Byproduct = {20103019,20103031,20103043,20103055}
--ĞèÒª¼¼ÄÜId
x712527_g_AbilityId = 7
--ĞèÒª¼¼ÄÜµÈ¼¶
x712527_g_AbilityLevel = 0


--Éú³Éº¯Êı¿ªÊ¼************************************************************************
--Ã¿¸öItemBoxÖĞ×î¶à10¸öÎïÆ·
function 		x712527_OnCreate(sceneId,growPointType,x,y)
	--·ÅÈëItemBoxÍ¬Ê±·ÅÈëÒ»¸öÎïÆ·
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x712527_g_MainItemId)	--Ã¿¸öÉú³¤µã×îÉÙÄÜµÃµ½Ò»¸öÎïÆ·,ÕâÀïÖ±½Ó·ÅÈëitemboxÖĞÒ»¸ö
	--»ñµÃ1~100µÄËæ»úÊı,ÓÃÀ´·ÅÈëÖ÷²úÆ·ºÍ¸±²úÆ·ÒÔ¼°´ÎÒª²úÆ·£¨±¦Ê¯£©
	--Ö÷²úÆ·1~60²»·Å£¬61~90·Å1¸ö£¬91~100·Å2¸ö
	--¸±²úÆ·1~12·Å1¸ö£¬13~18·Å2¸ö£¬19~20·Å3¸ö
	--´ÎÒª²úÆ·£¨±¦Ê¯£©1·Å1¸ö
	local ItemCount = random(1,4);
	for n = 1, ItemCount do
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x712527_g_MainItemId)
	end
	
	--·ÅÈë´ÎÒª²úÆ·
	if random(1,9) == 1 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x712527_g_SubItemId)
	end
end
--Éú³Éº¯Êı½áÊø**********************************************************************


--´ò¿ªÇ°º¯Êı¿ªÊ¼&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x712527_OnOpen(sceneId,selfId,targetId)
--·µ»ØÀàĞÍ
-- 0 ±íÊ¾´ò¿ª³É¹¦
	ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	res = x712527_OpenCheck(sceneId,selfId,ABilityID,AbilityLevel)
	return res
	end
--´ò¿ªÇ°º¯Êı½áÊø&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--»ØÊÕº¯Êı¿ªÊ¼########################################################################
function	 x712527_OnRecycle(sceneId,selfId,targetId)
	-- Ôö¼ÓÊìÁ·¶È
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x712527_g_AbilityLevel)
		--·µ»Ø1£¬Éú³¤µã»ØÊÕ
		return 1
end
--»ØÊÕº¯Êı½áÊø########################################################################



--´ò¿ªºóº¯Êı¿ªÊ¼@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x712527_OnProcOver( sceneId, selfId, targetId )
	--local ABilityID = GetItemBoxRequireAbilityID( sceneId, targetId )
	--CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, ABilityID, x712527_g_AbilityLevel )
	return 0
end
--´ò¿ªºóº¯Êı½áÊø@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x712527_OpenCheck(sceneId,selfId,AbilityId,AbilityLevel)
	--¼ì²éÉú»î¼¼ÄÜµÈ¼¶
	if AbilityLevel<x712527_g_AbilityLevel then
		return OR_NO_LEVEL
	end
	--¼ì²é¾«Á¦
	--if GetHumanEnergy(sceneId,selfId)< (floor(x712527_g_AbilityLevel * 1.5 +2) * 2) then
	--	return OR_NOT_ENOUGH_ENERGY
	--end
	return OR_OK
end

--Ò»´Î´´½¨¶à¸ö±¦ÏäµÄÍê³Éº¯Êı¿ªÊ¼****************************************************
function x712527_OnTickCreateFinish( sceneId, growPointType, tickCount )
	--if(strlen(x712508_g_TickCreate_Msg) > 0) then
	--	--2006-8-22 14:37 µÈ´ıÏş½¡µÄserver¶Ô»°Æ½Ì¨
	--	print( sceneId .. " (b¯i) cänh s¯ "..x712508_g_TickCreate_Msg)
	--end
end
--Ò»´Î´´½¨¶à¸ö±¦ÏäµÄÍê³Éº¯Êı½áÊø****************************************************
