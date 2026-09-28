-- ÖÕ¼¶»¹Í¯µ¤


-- ³èÎïÍ¨ÓÃ¹¦ÄÜ½Å±¾
x334908_g_petCommonId = PETCOMMON

x334908_g_itemList = {}
x334908_g_itemList[30503016] = {minLevel = 1, maxLevel = 85}	--ÖÕ¼¶ÕäÊŞ»¹Í¯¾íÖá
x334908_g_itemList[30503017] = {minLevel = 1, maxLevel = 35}	--µÍ¼¶ÕäÊŞ»¹Í¯ÌìÊé
x334908_g_itemList[30503018] = {minLevel = 1, maxLevel = 65}	--ÖĞ¼¶ÕäÊŞ»¹Í¯ÌìÊé
x334908_g_itemList[30503019] = {minLevel = 1, maxLevel = 85}	--¸ß¼¶ÕäÊŞ»¹Í¯ÌìÊé
x334908_g_itemList[30503020] = {minLevel = 1, maxLevel = 95}	--³¬¼¶ÕäÊŞ»¹Í¯ÌìÊé
--******************************************************************************
-- ÒÔÏÂ²¿·ÖĞèÒªÊÇĞèÒªĞŞ¸ÄµÄ²¿·Ö
--******************************************************************************

--½Å±¾ºÅ £¨¸Ä³ÉÕıÈ·½Å±¾ºÅ£©
x334908_g_scriptId = 334908

--±ê×¼Ğ§¹ûID £¨¸Ä³É³èÎïÊ¹ÓÃÑ±ÑøµÀ¾ßµÄÌØĞ§£©
--g_ImpactID = 0

--******************************************************************************
-- ÒÔÉÏ²¿·ÖĞèÒªÊÇĞèÒªĞŞ¸ÄµÄ²¿·Ö
--******************************************************************************

--½Å±¾

--**********************************
--±ØĞë·µ»Ø 1 ²ÅÄÜÕıÈ·Ö´ĞĞÒÔÏÂÁ÷³Ì
--**********************************
function x334908_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x334908_OnConditionCheck( sceneId, selfId )
	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local petItem = x334908_g_itemList[itemTblIndex];
	if not petItem then
		x334908_NotifyTip(sceneId, selfId, "Chßa m· ğÕo cø, không th¬ sØ døng.");
		return 0;
	end

	local petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	if LuaFnPetCanReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 1, -1) == 0 then
		return 0
	end
	
	local petDataID = LuaFnGetPetDataIDByGUID(sceneId, selfId, petGUID_H, petGUID_L);
	if not petDataID or petDataID < 0 then
		x334908_NotifyTip(sceneId, selfId, "Không th¬ tiªn hành hoàn ğ°ng v¾i Trân thú chï ğ¸nh.");
		return 0;
	end
	
	local petTakeLevel = GetPetTakeLevel(petDataID);
	if not petTakeLevel or petTakeLevel < 1 then
		x334908_NotifyTip(sceneId, selfId, "Không th¬ nh§n ra ğÆng c¤p mang theo cüa Trân thú.");
		return 0;
	end
	
	if petTakeLevel > petItem.maxLevel then
		if (petTakeLevel == 95) then
			x334908_NotifyTip(sceneId, selfId, "#{95ZSH_081121_01}");
			return 0;
		else
			x334908_NotifyTip(sceneId, selfId, "ĞÆng c¤p không th¬ mang theo là"..petItem.maxLevel.."c¤p tr· lên trân thú có th¬ hoàn ğ°ng.");
			return 0;
		end
	end

	return 1
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x334908_OnDeplete( sceneId, selfId )
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
function x334908_OnActivateOnce( sceneId, selfId )
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	-- ÕäÊŞ»¹Í¯
	local ret, perLevel = LuaFnPetReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 1, -1)
	if ret and ret == 1 then
		local szMsg = "Trân thú hoàn ğ°ng thành công!";
		x334908_NotifyTip( sceneId, selfId, szMsg );															-- ĞÑÄ¿ÌáÊ¾
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);		-- ÌØĞ§
		
		local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );			--by Vega 20080919
		local nGrowLevel = 0;
		if (itemTblIndex == 30503017 or itemTblIndex == 30503018 or itemTblIndex == 30503019 or itemTblIndex == 30503020 or itemTblIndex == 30503016) then		
			nGrowLevel = LuaFnGetPetGrowRateByGUID( sceneId, selfId, petGUID_H, petGUID_L )      
		end											--by Vega 20080919

		local selfName = LuaFnGetName(sceneId, selfId);
		local petTransfer = LuaFnGetPetTransferByGUID(sceneId, selfId, petGUID_H, petGUID_L);
		if perLevel and perLevel >= 6 and selfName and petTransfer then
			local strWorldChat = "#{_INFOUSR"..selfName.."}#H Sau khi sØ døng sách Hoàn Ğ°ng, 1 con #{_INFOMSG"..petTransfer.."}#H t× trên tr¶i giáng xu¯ng!";
			BroadMsgByChatPipe(sceneId, selfId, strWorldChat, 4);
		end
		
		-- ³É³¤ÂÊÔÚ½Ü³ö£¨º¬£©ÒÔÉÏÊ±²¥·ÅÏµÍ³¹«¸æ
		-- add by WTT	20090116
		if (nGrowLevel >= 4) then
			local strTbl = {"S½ c¤p","Xu¤t s¡c","Ki®t xu¤t","Trác vi®t","Toàn mÛ"};
			-- AAAºÜÏ²»¶Ğ¡¶¯Îï£¬½«ÕäÊŞ»¹Í¯ºó¾¹È»ÒâÍâµÄµÃµ½ÁË³É³¤ÂÊÎªCCCµÄBBB£¡°®ĞÄµÄ»Ø±¨¹ûÈ»·áºñ¡£
			-- AAAÎªÍæ¼ÒÁ´½Ó  BBBÎª»¹Í¯ºóÕäÊŞµÄÁ´½Ó	 CCCÎª³É³¤ÂÊ£¨½Ü³ö¼°ÒÔÉÏ£©¡£
			local Msg = "#W#{_INFOUSR%s}#{HT14}#Y"..strTbl[nGrowLevel].."#{HT15}#{_INFOMSG%s}#{HT16}"
			local szPetTrans = GetPetTransString ( sceneId, selfId, petGUID_H, petGUID_L )
			local str = format( Msg, selfName, szPetTrans )
				
			BroadMsgByChatPipe (sceneId, selfId, str, 4)
		end
		
	end
	return 1
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x334908_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- Õâ¸öº¯ÊıÃ»ÓĞÊ²Ã´ÓÃ£¬µ«ÊÇ±ØĞëÓĞ
function x334908_CancelImpacts( sceneId, selfId )
	return 0
end


--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x334908_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
