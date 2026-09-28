--×¢Òâ£º

--ÎïÆ·¼¼ÄÜµÄÂß¼­Ö»ÄÜÊ¹ÓÃ»ù´¡¼¼ÄÜºÍ½Å±¾À´ÊµÏÖ

--½Å±¾:

--ÒÔÏÂÊÇ½Å±¾ÑùÀı:


--obj_71.lua
------------------------------------------------------------------------------------------
--Ò»°ãÎïÆ·µÄÄ¬ÈÏ½Å±¾

--½Å±¾ºÅ
x880008_g_scriptId = 880008 --ÁÙÊ±Ğ´Õâ¸ö,ÕæÕıÓÃµÄÊ±ºòÒ»¶¨Òª¸Ä.

--ĞèÒªµÄµÈ¼¶

--Ğ§¹ûµÄID
x880008_g_Impact1 = 33600 --ÁÙÊ±Ğ´Õâ¸ö
x880008_g_Impact2 = -1 --²»ÓÃ
x880008_g_SpecailObj = 94--

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x880008_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x880008_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x880008_CancelImpacts( sceneId, selfId )
	return 0; --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x880008_OnConditionCheck( sceneId, selfId )

	local xiezi1 = GetMissionData( sceneId, selfId, XIAYIN_SG )
	local xiezi2 = GetMissionData( sceneId, selfId, XIAYIN_FY )
	local xiezi3 = GetMissionData( sceneId, selfId, XIAYIN_WK )
	local xiezi4 = GetMissionData( sceneId, selfId, XIAYIN_SM )
	local xiezi5 = GetMissionData( sceneId, selfId, XIAYIN_MB )
	local xiezi6 = GetMissionData( sceneId, selfId, XIAYIN_FX )
	local xiezi7 = GetMissionData( sceneId, selfId, XIAYIN_HS )
	local xiaoguo = xiezi1*2000 + xiezi2*2000 + xiezi3*2000 + xiezi4*2000 + xiezi5*2000 + xiezi6*2000 + xiezi7*2000

	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

        if xiaoguo < 1 then
           BeginEvent( sceneId )
		AddText( sceneId, "[ Hào Hi®p ¤n ] cüa b¢ng hæu chßa h÷c ğßşc [ Thø ¤n hi®u quä ], không c¥n thiªt l§p lÕi!" )
	   EndEvent( sceneId )
	   DispatchMissionTips( sceneId, selfId )
           return 0
        end
	return 1; --²»ĞèÒªÈÎºÎÌõ¼ş£¬²¢ÇÒÊ¼ÖÕ·µ»Ø1¡£
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ?ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡?
--**********************************
function x880008_OnDeplete( sceneId, selfId )
	
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
function x880008_OnActivateOnce( sceneId, selfId )

	local xiezi1 = GetMissionData( sceneId, selfId, XIAYIN_SG )
	local xiezi2 = GetMissionData( sceneId, selfId, XIAYIN_FY )
	local xiezi3 = GetMissionData( sceneId, selfId, XIAYIN_WK )
	local xiezi4 = GetMissionData( sceneId, selfId, XIAYIN_SM )
	local xiezi5 = GetMissionData( sceneId, selfId, XIAYIN_MB )
	local xiezi6 = GetMissionData( sceneId, selfId, XIAYIN_FX )
	local xiezi7 = GetMissionData( sceneId, selfId, XIAYIN_HS )

	local gongxun_yuan = GetMissionData( sceneId, selfId, XIAYIN_GONGXUN )
	local xiaoguo = xiezi1*2000 + xiezi2*2000 + xiezi3*2000 + xiezi4*2000 + xiezi5*2000 + xiezi6*2000 + xiezi7*2000

        if xiaoguo < 1 then
           BeginEvent( sceneId )
		AddText( sceneId, "[ Hào Hi®p ¤n ] cüa b¢ng hæu chßa h÷c ğßşc [ Thø ¤n hi®u quä ], không c¥n thiªt l§p lÕi!" )
	   EndEvent( sceneId )
	   DispatchMissionTips( sceneId, selfId )
           return 0
        else
	   SetMissionData(sceneId, selfId, XIAYIN_GONGXUN, gongxun_yuan+xiaoguo );
	   SetMissionData( sceneId, selfId, XIAYIN_SG, 0 )
	   SetMissionData( sceneId, selfId, XIAYIN_FY, 0 )
	   SetMissionData( sceneId, selfId, XIAYIN_WK, 0 )
	   SetMissionData( sceneId, selfId, XIAYIN_SM, 0 )
	   SetMissionData( sceneId, selfId, XIAYIN_MB, 0 )
	   SetMissionData( sceneId, selfId, XIAYIN_FX, 0 )
	   SetMissionData( sceneId, selfId, XIAYIN_HS, 0 )
           LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
           CallScriptFunction( 880006, "AddXiaYinBuff",sceneId, selfId)
           CallScriptFunction( 880006, "HXY_E",sceneId, selfId)
	--CallScriptFunction( 390101, "ReturnAttr", sceneId, selfId )	--·²ÊÇĞŞ¸Äµ½ĞŞÁ¶ÊôĞÔµÄ£¬¶¼Òª¼ÓÉÏÕâÒ»ĞĞ£¬ÈÃ¿Í»§¶ËµÄÏÔÊ¾Í¬²½
	BeginEvent( sceneId )
		AddText( sceneId, "Chúc m×ng b¢ng hæu  thiªt l§p lÕi [ Hào hi®p ¤n ] Thø ¤n hi®u quä thành công! Ği¬m c¯ng hiªn ğã ğßşc hoàn trä lÕi!" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	return 1;
     end
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x880008_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı.
end

