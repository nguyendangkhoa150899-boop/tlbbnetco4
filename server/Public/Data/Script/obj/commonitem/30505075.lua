--×¢Òâ£º

--ÎïÆ·¼¼ÄÜµÄÂß¼­Ö»ÄÜÊ¹ÓÃ»ù´¡¼¼ÄÜºÍ½Å±¾À´ÊµÏÖ

--½Å±¾:

--ÒÔÏÂÊÇ½Å±¾ÑùÀı:


--3004.lua
------------------------------------------------------------------------------------------
--Ò»°ãÎïÆ·µÄÄ¬ÈÏ½Å±¾

--½Å±¾ºÅ
x332000_g_scriptId = 332000 --ÁÙÊ±Ğ´Õâ¸ö,ÕæÕıÓÃµÄÊ±ºòÒ»¶¨Òª¸Ä.

--ĞèÒªµÄµÈ¼¶

--Ğ§¹ûµÄID
x332000_g_Impact1 = 3004 --ÁÙÊ±Ğ´Õâ¸ö
x332000_g_Impact2 = -1 --²»ÓÃ

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x332000_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x332000_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x332000_CancelImpacts( sceneId, selfId )
	return 0; --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x332000_OnConditionCheck( sceneId, selfId )

	if sceneId ~= 5 then
		return 0;
	end
	
	local targetX, targetZ;
	targetX = 141;
	targetZ = 208;
	local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
	local fDis = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
	
--	local MonsterId = LuaFnCreateMonster( sceneId, 473, nPlayerX, nPlayerZ, 3, 0, 808038);
--	SetCharacterDieTime(sceneId, MonsterId, 1000*10)
	local msg;
	
	if fDis > 5    then
		msg = "Chï có g¥n (268,241) cüa Kính H° còn có th¬ tiªn hành tu luy®n.";
		x332000_NotifyTip(sceneId, selfId, msg);
		return 0;
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
	if nItemBagIndex >= 0 then
		
		--¼ìÑé ÓĞĞ§ĞÔ
		local nStartTime = GetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2 );
		local nCurTime = LuaFnGetCurrentTime();		
		local nDelta = nCurTime - nStartTime;
		
		if nDelta >= 4*60*60 then
			DelItem (  sceneId, selfId, 40004414, 1);
			local msg = "Ğã quá th¶i hÕn có hi®u lñc!";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;		
		end
	end
	
	--»î¶¯ ÓĞĞ§
	local actId = 36;
	
	local LianYaoStatus = GetActivityParam( sceneId, actId, 0 );
	
	if LianYaoStatus <= 0 then
		DelItem (  sceneId, selfId, 40004414, 1);
		local msg = "Ğã quá 22: 00 không th¬ tr°ng tr÷t, tiên thäo ğã biªn m¤t.";
		x332000_NotifyTip(sceneId, selfId, msg);
		return 0;
	end
	--Éú³ÉµãÓĞĞ§
	local QianNianCaoGen = GetActivityParam( sceneId, actId, 1 );
	if QianNianCaoGen <= 0 then
		return 0;
	end
	--È·±£ Ã»ÓĞ Ò©¶¦
	local YaoDing_LianYao_Status = GetActivityParam( sceneId, actId, 2 );
	if YaoDing_LianYao_Status > 0 then
		return 0;
	end
	
	msg = "#{JingHu_LingYao_01}";
		
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x332000_g_scriptId);		
		UICommand_AddInt(sceneId,1);
		UICommand_AddString(sceneId,"DoUseItemReal");
		UICommand_AddString(sceneId, msg);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		

	--¼ÓÀ¼µÄÂúÀ¼¼ì²é
	--if(GetMp(sceneId, selfId) >= GetMaxMp(sceneId, selfId)) then
	--	return 0
	--end

	--¼ÓÑªºÍÀ¶µÄÂúÑªÂúÀ¶¼ì²é
	--if((GetHp(sceneId, selfId) >= GetMaxHp(sceneId, selfId)) and (GetMp(sceneId, selfId) >= GetMaxMp(sceneId, selfId))) then
	--	return 0
	--end

	return 0; --²»ĞèÒªÈÎºÎÌõ¼ş£¬²¢ÇÒÊ¼ÖÕ·µ»Ø1¡£
end


function x332000_DoUseItemReal( sceneId, selfId, param1, param2 )
	if sceneId ~= 5 then
		return 0;
	end
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
	if nItemBagIndex >= 0 then
	
		-- ¼ì²éÊÇ·ñÔÚÓĞĞ§·¶Î§ÄÚ
		local targetX, targetZ;
	        targetX = 141;
	        targetZ = 208;
		local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
		local fDis = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
	
		if fDis > 5    then
			local msg;
			msg = "Chï có g¥n (268,241) cüa Kính H° còn có th¬ tiªn hành tu luy®n";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;
		end
		
		--¼ìÑé ÓĞĞ§ĞÔ
		local nStartTime = GetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2 );
		local nCurTime = LuaFnGetCurrentTime();		
		local nDelta = nCurTime - nStartTime;
		
		if nDelta >= 4*60*60 then
			DelItem (  sceneId, selfId, 40004414, 1);
			local msg = "Ğã quá th¶i hÕn có hi®u lñc!";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;		
		end

		local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);

		local message = format("#{JingHu_LingYao_02}#{_INFOMSG%s}#{JingHu_LingYao_03}", szTransfer);		

		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		DelItem (  sceneId, selfId, 40004414, 1);
		
		local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
		
		nPlayerX = nPlayerX + 1;
		nPlayerZ = nPlayerZ + 1;
		
		
		local MonsterId = LuaFnCreateMonster( sceneId, 881, nPlayerX, nPlayerZ, 3, -1, 502000 );	
		
--		SetUnitReputationID(sceneId, selfId, MonsterId, GetUnitReputationID(sceneId, selfId, selfId))
		
		SetCharacterDieTime(sceneId, MonsterId, 1000*60*60)

		local nCurTime = LuaFnGetCurrentTime()
		local actId = 36;
		SetActivityParam( sceneId, actId, 4, nCurTime );
		SetActivityParam( sceneId, actId, 2, 1 );
		
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		
		SetActivityParam( sceneId, actId, 3, selfGUID );
		
		local szPlayerName = LuaFnGetName( sceneId, selfId );		
		JINGHU_YAODING_CREATER_NAME = szPlayerName;
		
		SetActivityParam( sceneId, actId, 5, MonsterId );
		
		--ÎªÁË±ÜÃâÒ»¸öÈËÓĞ¶à¸ö Ò©¶¦ÈÎÎñµÀ¾ß
		DelItem (  sceneId, selfId, 40004415, 1);
		if TryRecieveItem( sceneId, selfId, 40004415, 1 ) >= 0 then
			local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004415);
						
			SetBagItemParam( sceneId, selfId, nItemBagIndex, 3, 2, nCurTime )			
			
		end
		
	end
	


end



--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x332000_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--Ö»»áÖ´ĞĞÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒıµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x332000_OnActivateOnce( sceneId, selfId )
	if(-1~=x332000_g_Impact1) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x332000_g_Impact1, 0);
	end
	return 1;
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x332000_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı.
end


--**********************************
--ĞÑÄ¿ÌáÊ¾
--**********************************
function x332000_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
