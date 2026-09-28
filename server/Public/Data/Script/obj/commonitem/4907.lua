-- ¸ß¼¶ÕäÊŞ»¹Í¯¾íÖá


-- ³èÎïÍ¨ÓÃ¹¦ÄÜ½Å±¾
x334907_g_petCommonId = PETCOMMON

--******************************************************************************
-- ÒÔÏÂ²¿·ÖĞèÒªÊÇĞèÒªĞŞ¸ÄµÄ²¿·Ö
--******************************************************************************

--½Å±¾ºÅ £¨¸Ä³ÉÕıÈ·½Å±¾ºÅ£©
x334907_g_scriptId = 334907

--±ê×¼Ğ§¹ûID £¨¸Ä³É³èÎïÊ¹ÓÃÑ±ÑøµÀ¾ßµÄÌØĞ§£©
--g_ImpactID = 0

--******************************************************************************
-- ÒÔÉÏ²¿·ÖĞèÒªÊÇĞèÒªĞŞ¸ÄµÄ²¿·Ö
--******************************************************************************

--½Å±¾

--**********************************
--±ØĞë·µ»Ø 1 ²ÅÄÜÕıÈ·Ö´ĞĞÒÔÏÂÁ÷³Ì
--**********************************
function x334907_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x334907_OnConditionCheck( sceneId, selfId )
	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )
	
	local petDataID = LuaFnGetPetDataIDByGUID(sceneId, selfId, petGUID_H, petGUID_L);
	if not petDataID or petDataID < 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "Không th¬ tiªn hành hoàn ğ°ng v¾i Trân thú chï ğ¸nh." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
	
	local petTakeLevel = GetPetTakeLevel(petDataID);
	if not petTakeLevel or petTakeLevel < 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "Không th¬ nh§n ra ğÆng c¤p mang theo cüa Trân thú." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
	
	if petTakeLevel > 85 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{95ZSH_081121_01}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	if LuaFnPetCanReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 0, -1) == 0 then
		return 0
	end

	return 1
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x334907_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--Ö»»áÖ´ĞĞÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒıµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x334907_OnActivateOnce( sceneId, selfId )
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	local ret,curLevel = LuaFnPetReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 0, -1)
	
		--»¹Í¯³É¹¦ÒªÓĞĞÑÄ¿ÌáÊ¾--add by xindefeng
	if((ret ~= nil) or (ret == 1))then
		BeginEvent( sceneId )
			AddText( sceneId, "Trân thú hoàn ğ°ng thành công!" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )	
	end

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x334907_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- Õâ¸öº¯ÊıÃ»ÓĞÊ²Ã´ÓÃ£¬µ«ÊÇ±ØĞëÓĞ
function x334907_CancelImpacts( sceneId, selfId )
	return 0
end
