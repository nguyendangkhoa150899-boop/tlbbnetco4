--×¢Òâ£º

--ÎïÆ·¼¼ÄÜµÄÂß¼­Ö»ÄÜÊ¹ÓÃ»ù´¡¼¼ÄÜºÍ½Å±¾À´ÊµÏÖ

--½Å±¾:

--ÒÔÏÂÊÇ½Å±¾ÑùÀý:


--JiaoZi.lua
------------------------------------------------------------------------------------------
--Ò»°ãÎïÆ·µÄÄ¬ÈÏ½Å±¾

--½Å±¾ºÅ
x050057_g_scriptId = 050057 --ÁÙÊ±Ð´Õâ¸ö,ÕæÕýÓÃµÄÊ±ºòÒ»¶¨Òª¸Ä.

--buffµÄÁÐ±í
x050057_g_Impact = {

		3004,
}

x050057_g_Impact1 = {
					10490,
					10491,
					10492,
					10493,
}

--³Ôµ½ºÃ¶«Î÷µÄ¹«¸æ
x050057_g_strGetItem = {

	"",
	"",
	"",
}

x050057_g_GetItem =
{
	30505167,
	30505168,
	30505169,
}
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x050057_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ÐèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êý
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ý³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ÐÐ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊýµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ÐÐ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌÐøÀàËÆ¼¼ÄÜµÄÖ´ÐÐ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x050057_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ÐèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûÐ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾ÝÕâ¸öº¯ÊýµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ÐÐ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ð§¹û£¬²»ÔÙÖ´ÐÐºóÐø²Ù×÷£»·µ»Ø0£ºÃ»ÓÐ¼ì²âµ½Ïà¹ØÐ§¹û£¬¼ÌÐøÖ´ÐÐ¡£
--**********************************
function x050057_CancelImpacts( sceneId, selfId )
	return 0; --²»ÐèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êý,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼þ¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾ÝÕâ¸öº¯ÊýµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ÐÐ¡£
--·µ»Ø1£ºÌõ¼þ¼ì²âÍ¨¹ý£¬¿ÉÒÔ¼ÌÐøÖ´ÐÐ£»·µ»Ø0£ºÌõ¼þ¼ì²âÊ§°Ü£¬ÖÐ¶ÏºóÐøÖ´ÐÐ¡£
--**********************************
function x050057_OnConditionCheck( sceneId, selfId )
	--Ð£ÑéÊ¹ÓÃµÄÎïÆ·
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	local OwnGUID	= GetBagItemParam( sceneId, selfId, bagId, 4, 2 )
	OwnGUID = OwnGUID + 2147483648
	local SelfGUID = LuaFnGetGUID( sceneId, selfId )
	if OwnGUID == SelfGUID then
		BeginEvent( sceneId )
			AddText( sceneId, "L­ ph¦m süi cäo chï có th¬ giao d¸ch cho ngß¶i khác sØ døng." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	if LuaFnGetPropertyBagSpace(sceneId, selfId) == 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LLFB_80821_6}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	
	--local id = selfId
	--local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	--if 30001035 < itemTblIndex then
		--id = LuaFnGetTargetObjID(sceneId, selfId)
		--if(1~=LuaFnUnitIsFriend(sceneId, selfId, id)) then
		--	SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			--return 0;
	--	end	
	--end
	--¼ÓÑªµÄÂúÑª¼ì²é
	--if(GetHp(sceneId, id) >= GetMaxHp(sceneId, id)) then
	--	LuaFnSendOResultToPlayer(sceneId, selfId, OR_HEALTH_IS_FULL)
	--	return 0
	--end
	

	return 1;
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾ÝÕâ¸öº¯ÊýµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ÐÐ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ý£¬¿ÉÒÔ¼ÌÐøÖ´ÐÐ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖÐ¶ÏºóÐøÖ´ÐÐ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔðÏûºÄµÄ¼ì²âÒ²¸ºÔðÏûºÄµÄÖ´ÐÐ¡£
--**********************************
function x050057_OnDeplete( sceneId, selfId )
	--²»ÏûºÄ....ºó±ß»¹ÒªÊ¹ÓÃ´æµ½ÎïÆ·ÉÏµÄÐÅÏ¢ÄØ....
	return 1;
end

--**********************************
--Ö»»áÖ´ÐÐÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼þ¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒýµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ÐÐÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúÐ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x050057_OnActivateOnce( sceneId, selfId )

	--×Ô¼º²»ÄÜÊ¹ÓÃ....
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return
	end
	
	local OwnGUID	= GetBagItemParam( sceneId, selfId, bagId, 4, 2 )
	OwnGUID = OwnGUID + 2147483648
	local SelfGUID = LuaFnGetGUID( sceneId, selfId )
	if OwnGUID == SelfGUID then
		BeginEvent( sceneId )
			AddText( sceneId, "L­ ph¦m süi cäo chï có th¬ giao d¸ch cho ngß¶i khác sØ døng." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--¿ÛÎïÆ·....
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end

	--¼Óbuff....Ôö¼ÓÌØÐ§
	local id = selfId
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	--if 30001035 < itemTblIndex then
		--id = LuaFnGetTargetObjID(sceneId, selfId)
		--if(1~=LuaFnUnitIsFriend(sceneId, selfId, id)) then
			--SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			--return 0;
		--end
		
	--end
	
	local impactID = x050057_g_Impact[1]
	LuaFnSendSpecificImpactToUnit(sceneId, id, id, id, impactID, 0);

	local randImpact = random(4)
	LuaFnSendSpecificImpactToUnit(sceneId, id, id, id, x050057_g_Impact1[randImpact], 0);
	
	local level = GetLevel( sceneId, selfId )
	local rand10 = random(10)
	
	if level < 30 and rand10 > 1 then
			return 0
	end
	
	--Ëæ»ú²úÉú²»Í¬µÄ½ð±Ò
	local GoodLuck = random(4000)
	
	
	if GoodLuck < 5 then
	
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[1], QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then
			--·¢¹«¸æ....
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local str = format("#W#{_INFOUSR%s}#P ðang ån sØi cäo nóng h±i c¡n phäi mµt v§t cÑng, phung ra v×a nhìn ðÑng là mµt cái #cB3DB35#{_INFOMSG%s}#P, vui vë không khöi ra m£t. C¥u chúc nåm m¾i làm ån phát ðÕt, vÕn sñ nhß ý.", GetName(sceneId,selfId), ItemInfo)
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	elseif GoodLuck > 1500 and GoodLuck < 1511 then
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[2], QUALITY_MUST_BE_CHANGE )
		
		if BagIndex ~= -1 then
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local str = format("#W#{_INFOUSR%s}#P ðang ån sØi cäo nóng h±i c¡n phäi mµt v§t cÑng, phung ra v×a nhìn ðÑng là mµt cái #cB3DB35#{_INFOMSG%s}#P, vui vë không khöi ra m£t. C¥u chúc nåm m¾i làm ån phát ðÕt, vÕn sñ nhß ý.", GetName(sceneId,selfId), ItemInfo)
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	elseif GoodLuck > 2500 and GoodLuck < 2901 then
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[3], QUALITY_MUST_BE_CHANGE )
		
		if BagIndex ~= -1 then
			--local str = format("#W#{_INFOUSR%s}#P ðang ån sØi cäo nóng h±i c¡n phäi mµt v§t cÑng, phung ra v×a nhìn ðÑng là mµt cái #H#{_ITEM%d}#P, vui vë không khöi ra m£t. C¥u chúc nåm m¾i làm ån phát ðÕt, vÕn sñ nhß ý.", GetName(sceneId,selfId), x050057_g_GetItem[3])
			--BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	end
	
	return 1;
end

--**********************************
--Òýµ¼ÐÄÌø´¦ÀíÈë¿Ú£º
--Òýµ¼¼¼ÄÜ»áÔÚÃ¿´ÎÐÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌÐøÏÂ´ÎÐÄÌø£»0£ºÖÐ¶ÏÒýµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúÐ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x050057_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÊÇÒýµ¼ÐÔ½Å±¾, Ö»±£Áô¿Õº¯Êý.
end
