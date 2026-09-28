--×¢Òâ£º

--ÎïÆ·¼¼ÄÜµÄÂß¼­Ö»ÄÜÊ¹ÓÃ»ù´¡¼¼ÄÜºÍ½Å±¾À´ÊµÏÖ

--½Å±¾:

--ÒÔÏÂÊÇ½Å±¾ÑùÀı:


--4846.lua
------------------------------------------------------------------------------------------
--Ò»°ãÎïÆ·µÄÄ¬ÈÏ½Å±¾
--¶¨Î»·û£¨ºìÉ«¡¢À¶É«¡¢°×É«¡¢ÂÌÉ«¡¢»ÆÉ«¡¢×ÏÉ«£©
--½Å±¾ºÅ
x334846_g_ScriptId	= 334846

--Ğ§¹ûµÄID
x334846_g_Impact		= -1	--Ê¹ÓÃÒ»¸öÌØ¶¨µÄÌØĞ§±àºÅ

--²Ù×÷¼¯
x334846_g_Key				= {}
x334846_g_Key["nul"]= 0		--É¶¶¼Ã»×ö
x334846_g_Key["log"]= 1		--¼ÇÂ¼×ø±ê
x334846_g_Key["bus"]= 2		--³É¹¦´«ËÍ

--²»Í¬µÈ¼¶µÄ¶¨Î»·ûÊ¹ÓÃ´ÎÊı²»Í¬
x334846_g_UseTim		= { 8, 13, 20,30 }

x334846_g_Yinpiao = 40002000

x334846_g_Impact_NotTransportList = { 200 } -- ½ûÖ¹´«ËÍµÄImpact
x334846_g_TalkInfo_NotTransportList = { "Ğang · trÕng thái ğoÕt bäo không th¬ sØ døng phù" } -- ½ûÖ¹´«ËÍµÄImpactÌáÊ¾ĞÅÏ¢

--½ûÖ¹´«ËÍµ½Â¥À¼³¡¾°µÈ¼¶ÉÏÏŞ	--add by xindefeng
x334846_g_LimitTransLevel = 75

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x334846_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x334846_IsSkillLikeScript( sceneId, selfId )
	return 1	 --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x334846_CancelImpacts( sceneId, selfId )
	return 0	 --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x334846_OnConditionCheck( sceneId, selfId )

	--±³°üÖĞµÄÎ»ÖÃ
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--ÅĞ¶Ïµ±Ç°×´Ì¬ÊÇ·ñ¿ÉÊ¹ÓÃ¶¨Î»·û
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x334846_MsgBox( sceneId, selfId, "Ğang b¸ quän chª, không th¬ sØ døng phù" )
		return 0
	end

	--¼ì²âÎïÆ·ÊÇ·ñ¼ÓËø
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x334846_MsgBox( sceneId, selfId, "Ğã ğßşc ğ¸nh v¸" )
		return 0
	end

	--¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓĞ¡°ÒøÆ±¡±Õâ¸ö¶«Î÷£¬ÓĞ¾Í²»ÄÜÊ¹ÓÃÕâÀïµÄ¹¦ÄÜ
	if GetItemCount(sceneId, selfId, x334846_g_Yinpiao) >= 1  then
		x334846_MsgBox(sceneId, selfId, "Ğang · trÕng thái thß½ng nhân, không th¬ sØ døng phù")
		return 0
	end
	
	--¼ì²âImpact×´Ì¬×¤ÁôĞ§¹û
	for i, ImpactId in x334846_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x334846_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	local	opx, opy	--¼ÇÒä×ø±ê
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )
	local osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )--ÒÑ¶¨Î»³¡¾°ID
	--ÈôÎ´¼ÇÂ¼¹ı¶¨Î»ĞÅÏ¢
	if opx <= 0 and opy <= 0 then
		--ÅĞ¶Ïµ±Ç°³¡¾°ÊÇ·ñ¿ÉÊ¹ÓÃ¶¨Î»·û
		if sceneId ~= SCENE_DALI and sceneId ~= SCENE_LUOYANG and sceneId ~= SCENE_SUZHOU and sceneId ~= SCENE_LOULAN then	--Â¥À¼Ò²ÊÇÖ÷³Ç--modify by xindefeng
			x334846_MsgBox( sceneId, selfId, "Ngoài ĞÕi Lı, LÕc Dß½ng, Tô Châu, Lâu Lan các cänh khác không th¬ sØ døng phù" )
			return 0
		end		
	else	
		--ÒÑ¾­¶¨Î»,²¢ÇÒ¶¨Î»µ½Â¥À¼,ÔòÅĞ¶Ï¼¶±ğ,<90¼¶½ûÈë!--add by xindefeng
		if (osid == SCENE_LOULAN) and (GetLevel(sceneId, selfId) < x334846_g_LimitTransLevel) then
			local szMsg = format("Lâu Lan c¥n %d c¤p m¾i có th¬ ği vào", x334846_g_LimitTransLevel)
			x334846_MsgBox( sceneId, selfId, szMsg )
			return 0
		end
	end

	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
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
function x334846_OnDeplete( sceneId, selfId )
--if( 0 < LuaFnDepletingUsedItem( sceneId, selfId ) ) then
--	return 1
--end
--return 0

	return 1
end

--**********************************
--Ö»»áÖ´ĞĞÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒıµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x334846_OnActivateOnce( sceneId, selfId )
	if( -1 ~= x334846_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x334846_g_Impact, 0 )
	end
	
	--±³°üÖĞµÄÎ»ÖÃ
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local	key, tim	= x334846_OnUse( sceneId, selfId )
	
	--ÅĞ¶ÏÊÇ·ñÏú»ÙÎïÆ·
	if key == x334846_g_Key["bus"] and tim <= 0 then
--	LuaFnDepletingUsedItem( sceneId, selfId )
		if bagId >= 0 then
			EraseItem( sceneId, selfId, bagId )
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
function x334846_OnActivateEachTick( sceneId, selfId )
	return 1	 --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı¡£
end

--**********************************
--Ê¹ÓÃ£¬·µ»Ø²Ù×÷Ö¸ÁîÒÔ¼°Ê£ÓàÊ¹ÓÃ´ÎÊı
--**********************************
function x334846_OnUse( sceneId, selfId )

	--±³°üÖĞµÄÎ»ÖÃ
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return x334846_g_Key["nul"]
	end

	--ÅĞ¶Ïµ±Ç°×´Ì¬ÊÇ·ñ¿ÉÊ¹ÓÃ¶¨Î»·û
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x334846_MsgBox( sceneId, selfId, "Ğang b¸ quän chª, không th¬ sØ døng phù" )
		return x334846_g_Key["nul"]
	end

	--¼ì²âÎïÆ·ÊÇ·ñ¼ÓËø
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x334846_MsgBox( sceneId, selfId, "Ğã ğßşc ğ¸nh v¸" )
		return x334846_g_Key["nul"]
	end

	--¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓĞ¡°ÒøÆ±¡±Õâ¸ö¶«Î÷£¬ÓĞ¾Í²»ÄÜÊ¹ÓÃÕâÀïµÄ¹¦ÄÜ
	if GetItemCount(sceneId, selfId, x334846_g_Yinpiao) >= 1  then
		x334846_MsgBox(sceneId, selfId, "Ğang · trÕng thái thß½ng nhân, không th¬ sØ døng phù")
		return x334846_g_Key["nul"]
	end
	
	--¼ì²âImpact×´Ì¬×¤ÁôĞ§¹û
	for i, ImpactId in x334846_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x334846_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	--¶¨Î»·ûµÄ×î´óÊ¹ÓÃ´ÎÊı
	local	oid		= LuaFnGetItemTableIndexByIndex( sceneId, selfId, bagId )
	local	olev	= GetCommonItemGrade( oid )
	local	omax	= x334846_g_UseTim[olev]

	--»ñÈ¡¼ÇÂ¼ÔÚÎïÆ·ÉíÉÏµÄÊı¾İ½á¹¹
	local	otim			--¶¨Î»·ûµÄÊ£ÓàÊ¹ÓÃ´ÎÊı
	local	osid			--³¡¾°±àºÅ
	local	opx, opy	--¼ÇÒä×ø±ê
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	--ÈôÒÑ¼ÇÂ¼¹ı¶¨Î»ĞÅÏ¢Ôò´«ËÍ£¬·ñÔò¼ÇÂ¼µ±Ç°ĞÅÏ¢
	--Í¬Ê±¿ÉÊ¹ÓÃ´ÎÊı¼õ1£¬µ±ÆäÖµÎª0Ê±É¾³ı¸ÃÎïÆ·
	if opx > 0 and opy > 0 then
		if sceneId == osid then
			--Í¬Ò»³¡¾°´«ËÍ
			SetPos( sceneId, selfId, opx, opy )
		else
			--Â¥À¼<90¼¶½ûÈë--add by xindefeng
			if (osid == SCENE_LOULAN) and (GetLevel(sceneId, selfId) < x334846_g_LimitTransLevel) then
				local szMsg = format("Lâu Lan c¥n %d c¤p m¾i có th¬ ği vào", x334846_g_LimitTransLevel)
				x334846_MsgBox( sceneId, selfId, szMsg )
				return x334846_g_Key["nul"]
			end
			--¼ì²âÊÇ·ñ¿ÉÒÔÇĞ»»µ½Ä¿±ê³¡¾°
			if IsCanNewWorld( sceneId, selfId, osid, opx, opy ) ~= 1 then
				return x334846_g_Key["nul"]
			end
			--²»Í¬³¡¾°´«ËÍ
			NewWorld( sceneId, selfId, osid, opx, opy )
		end
		SetBagItemParam( sceneId, selfId, bagId, 3, 0, (otim-1) )
		--¼ÇÂ¼Í³¼ÆĞÅÏ¢
		LuaFnAuditGPS(sceneId, selfId, 0)

		--Ë¢ĞÂClient¶ËµÄ±³°üÎïÆ·ĞÅÏ¢
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )
		return x334846_g_Key["bus"], (otim-1)
	end

	--¼ÇÂ¼¶¨Î»ĞÅÏ¢	
	--ÅĞ¶Ïµ±Ç°³¡¾°ÊÇ·ñ¿ÉÊ¹ÓÃ¶¨Î»·û
	if sceneId ~= SCENE_DALI and sceneId ~= SCENE_LUOYANG and sceneId ~= SCENE_SUZHOU and sceneId ~= SCENE_LOULAN then	--Â¥À¼Ò²ÊÇÖ÷³Ç--modify by xindefeng
		x334846_MsgBox( sceneId, selfId, "Ngoài ĞÕi Lı, LÕc Dß½ng, Tô Châu, Lâu Lan các cänh khác không th¬ sØ døng phù" )
		return x334846_g_Key["nul"]
	end	

	--»ñÈ¡Íæ¼ÒµÄµ±Ç°×ø±ê
	osid			= sceneId
	opx, opy	= LuaFnGetUnitPosition( sceneId, selfId )
	opx	= floor( opx )
	opy	= floor( opy )

	SetBagItemParam( sceneId, selfId, bagId, 0, 1, 10 )		--Key£¬ÕâÎ»±êÊ¶²Ù×÷¼¯ºÏ£¬Ò²ÊÇClientĞŞÕıTooltipsµÄÒÀ¾İ
	SetBagItemParam( sceneId, selfId, bagId, 2, 0, omax )	--×î´óÊ¹ÓÃ´ÎÊı
	SetBagItemParam( sceneId, selfId, bagId, 3, 0, omax )	--Ê£ÓàÊ¹ÓÃ´ÎÊı
	SetBagItemParam( sceneId, selfId, bagId, 4, 1, osid )	--³¡¾°±àºÅ
	SetBagItemParam( sceneId, selfId, bagId, 6, 1, opx )	--X×ø±ê
	SetBagItemParam( sceneId, selfId, bagId, 8, 1, opy )	--Y×ø±ê
	--Ë¢ĞÂClient¶ËµÄ±³°üÎïÆ·ĞÅÏ¢
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	--¼ÇÂ¼Í³¼ÆĞÅÏ¢
	LuaFnAuditGPS(sceneId, selfId, 1)

	return x334846_g_Key["log"], omax
end

--**********************************
--ĞÅÏ¢ÌáÊ¾
--**********************************
function x334846_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
