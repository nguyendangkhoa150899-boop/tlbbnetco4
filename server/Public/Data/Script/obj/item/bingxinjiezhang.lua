
--×¢Òâ£º

--ÎïÆ·¼¼ÄÜµÄÂß¼­Ö»ÄÜÊ¹ÓÃ»ù´¡¼¼ÄÜºÍ½Å±¾À´ÊµÏÖ
--½Å±¾ºÅ
x332208_g_scriptId = 332208

x332208_g_event = 808136

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x332208_OnDefaultEvent( sceneId, selfId, bagIndex )

end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x332208_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x332208_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x332208_OnConditionCheck( sceneId, selfId )
	if IsHaveMission(sceneId,selfId,x808136_g_MissionId) < 0 then
	BeginEvent( sceneId )
		AddText( sceneId, "ÄãÃ»ÓĞÁìÈ¡ÉèÕó·âÄ§ÈÎÎñ£¬²»ÄÜÊ¹ÓÃ±ùĞÄ½ÚÕÈ£¡" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
        return 0
    
	end
	if sceneId==4  then  
		didian="Ì«ºş"
        treasureX = 160				--»ñµÃ±¦ÎïX×ø±ê
	    treasureZ = 252				--»ñµÃ±¦ÎïZ×ø±ê
	elseif sceneId==3  then
		didian="áÔÉ½"
		treasureX = 275				--»ñµÃ±¦ÎïX×ø±ê
	    treasureZ = 85
	elseif sceneId==30  then
		didian="Î÷ºş"
		treasureX = 170				--»ñµÃ±¦ÎïX×ø±ê
	    treasureZ = 235
	elseif sceneId==6  then
		didian="ÎŞÁ¿É½"
		treasureX = 53			--»ñµÃ±¦ÎïX×ø±ê
	    treasureZ = 264
	elseif sceneId==7  then
		didian="½£¸ó"
		treasureX = 130				--»ñµÃ±¦ÎïX×ø±ê
	    treasureZ = 135
		elseif sceneId==8  then
		didian="¶Ø»Í"
		treasureX = 260				--»ñµÃ±¦ÎïX×ø±ê
	    treasureZ = 260
	end
       --misIndex = GetMissionIndexByID(sceneId,selfId,x808136_g_MissionId)
	   -- x808136_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		--»ñµÃÈÎÎñ×´Ì¬
	   -- scene = GetMissionParam(sceneId,selfId,misIndex,2)					--»ñµÃ±¦Îï³¡¾°ºÅ
	   -- treasureX = GetMissionParam(sceneId,selfId,misIndex,3)				--»ñµÃ±¦ÎïX×ø±ê
	    --treasureZ = GetMissionParam(sceneId,selfId,misIndex,4)				--»ñµÃ±¦ÎïZ×ø±ê
		--È¡µÃÍæ¼Òµ±Ç°×ø±ê
	    PlayerX = GetHumanWorldX(sceneId,selfId)
	    PlayerZ = GetHumanWorldZ(sceneId,selfId)
		--Distance = floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))
	--¼ÆËãÍæ¼ÒÓë°²·ÅµãµÄ¾àÀë
	      Distance = floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))
	if sceneId==4  or sceneId==3  or sceneId==30   or sceneId==6   or sceneId==7   or sceneId==8  then
	else
		BeginEvent(sceneId)
			AddText(sceneId,"Ngß½i không có nh§n l¤y thiªt tr§n phong ma nhi®m vø, không th¬ sØ døng Bång Tâm tiªt trßşng!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return  0
	end
	
	if Distance > 8 then
		BeginEvent(sceneId)
			AddText(sceneId,"M¶i tÕi."..didian.."Ğ¸a ği¬m chï ğ¸nh phø c§n s¡p ğ£t Bång Tâm tiªt trßşng, trß¾c m¡t t÷a ğµ khoäng cách s¡p ğ£t v¸ trí còn có"..Distance.."GÕo, møc tiêu v¸ trí là:"..treasureX..","..treasureZ)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return  0
	end
	if Distance <= 8 then
		if  sceneId==4  then
                if   LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_th) >= 1   then
                     BeginEvent(sceneId)
		             AddText(sceneId,"Bång Tâm tiªt trßşng ğã tÕi"..didian.."S¡p ğ£t hoàn t¤t, ğ×ng lÕi lãng phí th¶i gian, nhanh ği cái khác tràng cänh tiªp tøc s¡p ğ£t ği")
		             EndEvent(sceneId)
                     DispatchMissionTips(sceneId,selfId)
				    return  0
				else
		        return CallScriptFunction(x332208_g_event,"CheckAccept",sceneId, selfId, -1, -1)
                end
		elseif  sceneId==3  then
		        if   LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_ss) >= 1   then
                     BeginEvent(sceneId)
		             AddText(sceneId,"Bång Tâm tiªt trßşng ğã tÕi"..didian.."S¡p ğ£t hoàn t¤t, ğ×ng lÕi lãng phí th¶i gian, nhanh ği cái khác tràng cänh tiªp tøc s¡p ğ£t ği")
		             EndEvent(sceneId)
                     DispatchMissionTips(sceneId,selfId)
				    return  0
				else
		        return CallScriptFunction(x332208_g_event,"CheckAccept",sceneId, selfId, -1, -1)
                end
		elseif  sceneId==30  then
		        if   LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_xh) >= 1   then
                     BeginEvent(sceneId)
		             AddText(sceneId,"Bång Tâm tiªt trßşng ğã tÕi"..didian.."S¡p ğ£t hoàn t¤t, ğ×ng lÕi lãng phí th¶i gian, nhanh ği cái khác tràng cänh tiªp tøc s¡p ğ£t ği")
		             EndEvent(sceneId)
                     DispatchMissionTips(sceneId,selfId)
				    return  0
				else
		        return CallScriptFunction(x332208_g_event,"CheckAccept",sceneId, selfId, -1, -1)
                end
		elseif  sceneId==6  then
		        if   LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_wl) >= 1   then
                     BeginEvent(sceneId)
		             AddText(sceneId,"Bång Tâm tiªt trßşng ğã tÕi"..didian.."S¡p ğ£t hoàn t¤t, ğ×ng lÕi lãng phí th¶i gian, nhanh ği cái khác tràng cänh tiªp tøc s¡p ğ£t ği")
		             EndEvent(sceneId)
                     DispatchMissionTips(sceneId,selfId)
				    return  0
				else
		        return CallScriptFunction(x332208_g_event,"CheckAccept",sceneId, selfId, -1, -1)
                end
		elseif  sceneId==7  then
		        if   LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_jg) >= 1   then
                     BeginEvent(sceneId)
		             AddText(sceneId,"Bång Tâm tiªt trßşng ğã tÕi"..didian.."S¡p ğ£t hoàn t¤t, ğ×ng lÕi lãng phí th¶i gian, nhanh ği cái khác tràng cänh tiªp tøc s¡p ğ£t ği")
		             EndEvent(sceneId)
                     DispatchMissionTips(sceneId,selfId)
				    return  0
				else
		        return CallScriptFunction(x332208_g_event,"CheckAccept",sceneId, selfId, -1, -1)
                end
		elseif  sceneId==8  then
		        if   LuaFnGetAvailableItemCount(sceneId, selfId, x808136_g_fmf_dh) >= 1   then
                     BeginEvent(sceneId)
		             AddText(sceneId,"Bång Tâm tiªt trßşng ğã tÕi"..didian.."S¡p ğ£t hoàn t¤t, ğ×ng lÕi lãng phí th¶i gian, nhanh ği cái khác tràng cänh tiªp tøc s¡p ğ£t ği")
		             EndEvent(sceneId)
                     DispatchMissionTips(sceneId,selfId)
				    return  0
				else
		        return CallScriptFunction(x332208_g_event,"CheckAccept",sceneId, selfId, -1, -1)
                end
		end
		
	end
 
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x332208_OnDeplete( sceneId, selfId )
	return 1; --²»ÏûºÄ
end

--**********************************
--Ö»»áÖ´ĞĞÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒıµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x332208_OnActivateOnce( sceneId, selfId )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 146, 0);
	CallScriptFunction(x332208_g_event,"OnUseItem",sceneId, selfId, -1)
	
	BeginEvent(sceneId)
		AddText(sceneId,"V§t ph¦m sØ døng thành công, nhi®m vø hoàn thành!")
	EndEvent( )
	DispatchMissionTips(sceneId,selfId)
	Msg2Player( sceneId,selfId,"V§t ph¦m sØ døng thành công, nhi®m vø hoàn thành",MSG2PLAYER_PARA) --Í¨ÖªÍæ¼Ò
	return 1;
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x332208_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı.
end

