--µÀ¾ß£ºÏÉµ¤ºùÂ«<ID:31000001>
--½Å±¾ºÅ 332101
--Author: Steven.Han 17:20 2007-5-17

x332101_g_scriptId = 332101
x332101_g_MaxValue = 125000
x332101_g_IncPerAct = 5000

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x332101_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x332101_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x332101_CancelImpacts( sceneId, selfId )
	return 0; --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x332101_OnConditionCheck( sceneId, selfId )
	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
	local PlayerHP = GetHp(sceneId, selfId)
    local PlayerMaxHP  = GetMaxHp(sceneId, selfId)
    
    --PrintStr( ""..UseValue.."/"..ValidValue.." "..PlayerHP.."/"..PlayerMaxHP.."".."")
    
    if PlayerHP == PlayerMaxHP then
        LuaFnSendOResultToPlayer( sceneId, selfId, OR_HEALTH_IS_FULL )
        return 0
    end
        
	return 1; --²»ĞèÒªÈÎºÎÌõ¼ş£¬²¢ÇÒÊ¼ÖÕ·µ»Ø1¡£
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x332101_OnDeplete( sceneId, selfId )
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
function x332101_OnActivateOnce( sceneId, selfId )

    local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
    local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
    local ValidValue = x332101_g_MaxValue - UseValue
    
    local PlayerHP = GetHp(sceneId, selfId)
    local PlayerMaxHP  = GetMaxHp(sceneId, selfId)
    local NeedHP = PlayerMaxHP - PlayerHP   --ĞèÒª»Ö¸´µÄHPÁ¿
    
    if x332101_g_IncPerAct < NeedHP then
        NeedHP = x332101_g_IncPerAct
    end
    
    --PrintStr( ""..ValidValue.."/"..x332101_g_MaxValue.." "..PlayerHP.."/"..PlayerMaxHP.."".."")
    
    if PlayerHP == PlayerMaxHP then
        LuaFnSendOResultToPlayer( sceneId, selfId, OR_HEALTH_IS_FULL )
    else
		local nCB = ValidValue   --Ê¹ÓÃÇ°ÈİÁ¿
		local nHPB = PlayerHP    --Ê¹ÓÃÇ°Íæ¼Òhp
		local bErased = -1       --ÎïÆ·ÊÇ·ñ±»É¾³ı
		    
        if NeedHP >= ValidValue then  --¿ÉÌá¹©µÄHP²»×ã»Ö¸´Íæ¼Ò¶¨Á¿HP
            --IncreaseHp
            IncreaseHp(sceneId, selfId, ValidValue ) --»Ö¸´¿ÉÌá¹©µÄHP
            SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332101_g_MaxValue ) --ÉèÖÃ×î´óÈİÁ¿
            SetBagItemParam( sceneId, selfId, bagId, 8, 2, x332101_g_MaxValue ) --ÉèÖÃÒÑÓÃÈİÁ¿
            bErased = EraseItem( sceneId, selfId, bagId )
        else
            IncreaseHp(sceneId, selfId, NeedHP ) --»Ö¸´ĞèÒªµÄHP,´ËÊ±,Íæ¼ÒÓ¦¸ÃÉúÃüÈ«Âú
            SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332101_g_MaxValue ) --ÉèÖÃ×î´óÈİÁ¿
            SetBagItemParam( sceneId, selfId, bagId, 8, 2, UseValue + x332101_g_IncPerAct ) --ÉèÖÃÒÑÓÃÈİÁ¿
            
            if( x332101_g_MaxValue == ( UseValue + x332101_g_IncPerAct ) ) then
                bErased = EraseItem( sceneId, selfId, bagId )
            end
            
            --SetBagItemParam( sceneId, selfId, bagId, 8, 2, UseValue + NeedHP ) --ÉèÖÃÒÑÓÃÈİÁ¿
        end
        
		local szName = GetName( sceneId, selfId )
		local nGuid = LuaFnGetGUID( sceneId, selfId )
		local nHPA = GetHp(sceneId, selfId)             --Ê¹ÓÃºóÍæ¼Òhp
		        
        if bErased < 0 then
			--local szLog = "Use31000001, Name=%s, Guid=%d, CB=%d, CA=%d, HPB=%d, HPA=%d, BIDX=%d"
			local szLog = "Use31000001, tên=%s, Guid=%d,  lßşng dßşc sØ døng trß¾c=%d, lßşng dßşc sØ døng sau=%d, sØ døng trß¾c HP=%d, sØ døng sau HP=%d, v¸ trí tay näi =%d"
			local UseValue_log = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
			local nCA = x332101_g_MaxValue - UseValue_log   --Ê¹ÓÃºóÈİÁ¿
			
			local szDebugLog = format( szLog, szName, nGuid, nCB, nCA, nHPB, nHPA, bagId )
			WriteDebugLog( sceneId, selfId, szDebugLog )
        else
			local szLog = "Use31000001, tên=%s, Guid=%d, lßşng dßşc sØ døng trß¾c=%d, ğã b¸ xóa, sØ døng trß¾c HP=%d, sØ døng sau HP=%d, v¸ trí tay näi=%d"
			local szDebugLog = format( szLog, szName, nGuid, nCB, nHPB, nHPA, bagId )
			WriteDebugLog( sceneId, selfId, szDebugLog )
        end
        --LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 1000 )
        
    end
    
    LuaFnRefreshItemInfo( sceneId, selfId, bagId )

	return 1;
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x332101_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı.
end

function x332101_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
