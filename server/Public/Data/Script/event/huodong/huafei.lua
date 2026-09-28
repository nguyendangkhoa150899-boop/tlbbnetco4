--Ğ«×ÓÖÖ»¨½Å±¾  ³àÉ°¤ÎĞ« QQ-718805400
--»¨·Ê½Å±¾
--Çë×ğÖØÔ­´´£¬×ªÔØÇë×¢Ã÷³ö´¦£¬Ğ»Ğ»~

--½Å±¾ºÅ
x335705_g_scriptId = 335705 --ÁÙÊ±Ğ´Õâ¸ö,ÕæÕıÓÃµÄÊ±ºòÒ»¶¨Òª¸Ä.

--ĞèÒªµÄµÈ¼¶
x335705_g_levelRequire = 1
--AE·¶Î§°ë¾¶
x335705_g_radiusAE = 3.0
--AEµÄÄ¿±ê¹ØÏµ±ê¼Ç
x335705_g_standFlag = 1 -- 2:¶ÓÓÑ£¬ 1£ºÓÑ¾ü£¬ -1£ºµĞ¾ü
--AEÓ°ÏìÊıÄ¿ÏŞÖÆ
x335705_g_effectCount = 4 -- -1:²»ÏŞÖÆ
--Ğ§¹ûµÄID
x335705_g_Impact1 = 3216 --ÁÙÊ±Ğ´Õâ¸ö
x335705_g_Impact2 = -1 --²»ÓÃ

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x335705_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x335705_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x335705_CancelImpacts( sceneId, selfId )
	return 0; --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x335705_OnConditionCheck( sceneId, selfId )

      if sceneId~=2 then
        BeginEvent( sceneId )
		AddText( sceneId, "Chï có th¬ · ĞÕi Lı ĞÕi Lµ Ğông ho£c ĞÕi Lµ Tây m¾i có th¬ sØ døng Hoa Phì bón phân Hoa gi¯ng" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
        return 0
      end

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	local xiezi = GetMonsterDataID(sceneId,targetId)

           if xiezi~=90 and xiezi~=91 and xiezi~=92 then
	      BeginEvent( sceneId )
		AddText( sceneId, "Chï có th¬ dùng ğ¯i v¾i Hoa ğang l¾n m¾i có th¬ sØ døng v§t ph¦m này! Hoa Trß·ng Thành không c¥n bón phân næa! " )
	      EndEvent( sceneId )
	      DispatchMissionTips( sceneId, selfId )
	   return 0;
           end

	return 1; --²»ĞèÒªÈÎºÎÌõ¼ş£¬²¢ÇÒÊ¼ÖÕ·µ»Ø1¡£
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x335705_OnDeplete( sceneId, selfId )
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
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
function x335705_OnActivateOnce( sceneId, selfId )

      if sceneId==2 then
	x335705_OnImpactFadeOut( sceneId, selfId )
	else
	BeginEvent( sceneId )
		AddText( sceneId, "SØ døng v§t ph¦m th¤t bÕi, xin liên h® GM" )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	end
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x335705_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı.
end

--**********************************
--Ê©·Ê³É¹¦£º
--**********************************
function x335705_OnImpactFadeOut( sceneId, selfId )

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	local xiezi = GetMonsterDataID(sceneId,targetId)
        local ownerGUID = LuaFnGetLifeTimeAttrRefix_AttackPhysics( sceneId, targetId )
	local ownerObjId = LuaFnGuid2ObjId(sceneId, ownerGUID);---Í¨¹ıGUIDµÃµ½objID
	if ownerGUID ~= nil then
           ownerName = GetName(sceneId, ownerObjId);     ----µÃµ½Ó¶ÓĞÕßÃû×Ö
        else
     	   ownerName = tostring("Hoang DÕi")
     	end     	     		 
        local x, z = GetWorldPos(sceneId, targetId) 		   
 	LuaFnDeleteMonster(sceneId, targetId)

--ÏÈ¸ø¾­Ñé
             MyLevel=GetLevel( sceneId, selfId )
	     BeginEvent( sceneId )
		AddText( sceneId, "Bón phân thành công!" )
	     EndEvent( sceneId )
	     DispatchMissionTips( sceneId, selfId )
             LuaFnAddExp( sceneId,selfId,MyLevel*500)

--»¨ÃçÉı¼¶
             if xiezi ==90 then
 		local MonsterId = LuaFnCreateMonster(sceneId, xiezi+1, x, z, 3, -1,335701)
                LuaFnSetLifeTimeAttrRefix_AttackPhysics( sceneId, MonsterId, ownerGUID )
                SetCharacterName(sceneId, MonsterId, "Hoa Tß½i Âu Miêu cüa "..ownerName.."")
		SetCharacterDieTime(sceneId, MonsterId, 1800000)
                LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 18, 0);
			elseif xiezi ==91 then
 		local MonsterId = LuaFnCreateMonster(sceneId, xiezi+1, x, z, 3, -1,335701)
                LuaFnSetLifeTimeAttrRefix_AttackPhysics( sceneId, MonsterId, ownerGUID )
                SetCharacterName(sceneId, MonsterId, "Hoa Tß½i Sinh Trß·ng cüa "..ownerName.."")
		SetCharacterDieTime(sceneId, MonsterId, 1800000)
                LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 18, 0);
             elseif xiezi ==92 then
 		local MonsterId = LuaFnCreateMonster(sceneId, xiezi+1, x, z, 3, -1,335704)
 		--local Cmanstid = mod(LuaFnGetCurrentTime(),10000)+300
 		--SetUnitCampID(sceneId,MonsterId, MonsterId, Cmanstid)
 		LuaFnSetLifeTimeAttrRefix_AttackPhysics( sceneId, MonsterId, ownerGUID )            ----±£´æGUID£¬
 	        LuaFnSetLifeTimeAttrRefix_DefencePhysics( sceneId, MonsterId, (LuaFnGetCurrentTime()+300) )  ---±£´æÎå·ÖÖÓ
                SetCharacterName(sceneId, MonsterId, "Hoa Tß½i Trß·ng Thành cüa "..ownerName.."")
		SetCharacterDieTime(sceneId, MonsterId, 600000)
                LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 18, 0);
                LuaFnSendSystemMail(sceneId, GetName(sceneId,ownerObjId), "Các hÕ hãy ğªn ĞÕi Lı #G("..(floor(x))..","..(floor(z))..")#WtoÕ ğµ ğã tr°ng #GHoa Tß½i#W, nay #GHoa Tß½i#cFF0000 ğã trß·ng thành, #Gtrong vòng #G5 Phút#W hãy nhanh chóng thu hoÕch, nªu không s¨ b¸ giang h° phß¶ng ğÕo chích trµm m¤t!")
             end

    end	

