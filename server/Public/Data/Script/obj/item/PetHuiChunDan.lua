-- ´´½¨ÈË[ QUFEI 2007-09-26 22:53 UPDATE BugID 25292 ]

-- ÈËÃñ±Ò³èÁ¸_»Ø´ºµ¤ (¸Ä³ÉÕıÈ·Tên)
-- ItemID = 30607001
-- 702001
-- Ôö¼Ó³èÎïÉúÃüÖµºÍ¿ìÀÖ¶È
-- ÎïÆ·¿ÉÒÔÊ¹ÓÃ100´Î
-- ÒÔºóÃ¿´ÎÊ¹ÓÃ¿Ûmµt ´Î,¿ÛÍê¾ÍÉ¾³ıÎïÆ·

-- ³èÎïÍ¨ÓÃ¹¦ÄÜ½Å±¾
x702001_g_petCommonId = PETCOMMON

--******************************************************************************
-- ÒÔÏÂ²¿·ÖC¥n ĞúngC¥n ĞŞ¸ÄtoÕ ğµ ²¿·Ö
--******************************************************************************

--½Å±¾ºÅ (¸Ä³ÉÕıÈ·½Å±¾ºÅ)
x702001_g_scriptId = 702001

-- Ôö¼ÓÖµ (¸ù¾İÒªÇó¸ÄĞ´¾ßÌåÊıÖµ)
x702001_g_HPValue = 10000			-- ÉúÃüÖµÔö¼ÓÖµ
x702001_g_MaxHPValue = 0			-- ×î´óÉúÃüÖµÔö¼ÓÖµ
x702001_g_LifeValue = 0				-- ÊÙÃüÔö¼ÓÖµ
x702001_g_HappinessValue = 1	-- ¿ìÀÖ¶ÈÔö¼ÓÖµ
x702001_g_MaxUseCount = 100		-- ×î´óÊ¹ÓÃ´ÎÊı100´Î

--±ê×¼Ğ§¹ûID (¸Ä³É³èÎï³Ô³èÁ¸toÕ ğµ ÌØĞ§)
--g_ImpactID = 0

--******************************************************************************
-- ÒÔÉÏ²¿·ÖC¥n ĞúngC¥n ĞŞ¸ÄtoÕ ğµ ²¿·Ö
--******************************************************************************

--½Å±¾

--**********************************
--±ØĞëTr· v« 1 ²ÅÄÜÕıÈ·Ö´ĞĞÒÔÏÂÁ÷³Ì
--**********************************
function x702001_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú: 
--H® th¯ng»áTÕi ¼¼ÄÜ¼ì²âtoÕ ğµ Ê±¼ä ği¬mµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾İCái này º¯ÊıtoÕ ğµ Tr· v«ÖµXác nh§nÒÔºótoÕ ğµ Á÷³ÌĞúng·ñÖ´ĞĞ.
--Tr· v«1: Ìõ¼ş¼ì²âÍ¨¹ı,¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»Tr· v«0: Ìõ¼ş¼ì²âth¤t bÕi,ÖĞ¶ÏºóĞøÖ´ĞĞ.
--**********************************
function x702001_OnConditionCheck( sceneId, selfId )
	--Ğ£ÑéÊ¹ÓÃtoÕ ğµ ÎïÆ·
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	--  ği¬mµ½µ±Ç°ÕıTÕi Ê¹ÓÃtoÕ ğµ ÎïÆ·toÕ ğµ trí tay näi
	nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
	ret = CallScriptFunction( x702001_g_petCommonId, "IsPetCanUseFood", sceneId, selfId, nIndex )
	return ret
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú: 
--H® th¯ng»áTÕi ¼¼ÄÜÏûºÄtoÕ ğµ Ê±¼ä ği¬mµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾İCái này º¯ÊıtoÕ ğµ Tr· v«ÖµXác nh§nÒÔºótoÕ ğµ Á÷³ÌĞúng·ñÖ´ĞĞ.
--Tr· v«1: ÏûºÄ´¦ÀíÍ¨¹ı,¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»Tr· v«0: ÏûºÄ¼ì²âth¤t bÕi,ÖĞ¶ÏºóĞøÖ´ĞĞ.
--×¢Òâ: Õâ²»¹â¸ºÔğÏûºÄtoÕ ğµ ¼ì²âÒ²¸ºÔğÏûºÄtoÕ ğµ Ö´ĞĞ.
--**********************************
function x702001_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--Ö»»áÖ´ĞĞmµt ´ÎÈë¿Ú: 
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áTÕi ÏûºÄÍê³Éºóµ÷ÓÃCái này ½Ó¿Ú(¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Thöa mãntoÕ ğµ Ê±ºò),¶øÒıµ¼
--¼¼ÄÜÒ²»áTÕi ÏûºÄÍê³Éºóµ÷ÓÃCái này ½Ó¿Ú(¼¼ÄÜtoÕ ğµ mµt ¿ªÊ¼,ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó).
--Tr· v«1: ´¦Àí³É¹¦£»Tr· v«0: ´¦Àíth¤t bÕi.
--×¢: ÕâÀïĞúng¼¼ÄÜÉúĞ§mµt ´ÎtoÕ ğµ Èë¿Ú
--**********************************
function x702001_OnActivateOnce( sceneId, selfId )

	local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
  local ValidValue = x702001_g_MaxUseCount - UseValue

	-- PrintNum(UseValue)
	
	local petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )	
	
	local valueHP = LuaFnGetPetHP( sceneId, selfId, petGUID_H, petGUID_L )
	local MaxHP = LuaFnGetPetMaxHP( sceneId, selfId, petGUID_H, petGUID_L )
	
	local valueHappy = LuaFnGetPetHappiness( sceneId, selfId, petGUID_H, petGUID_L )
	local MaxHappiness = 100
	
	-- PrintNum(valueHP)
	-- PrintNum(MaxHP)
	-- PrintNum(valueHappy)
	
	if valueHP == MaxHP and valueHappy == MaxHappiness then
		x702001_ShowMsg( sceneId, selfId, "Trân thú không c¥n sØ døng thÑc ån")
		return 0
	end

	--ÏûºÄmµt ´ÎÕäÊŞ»Ø´ºµ¤
	if bagId >= 0 then		
	
		if UseValue >= x702001_g_MaxUseCount then   --¼ÇÂ¼toÕ ğµ Ê¹ÓÃ´ÎÊı´óÓÚµÈÓÚ×î´ó¿ÉÓÃ´ÎÊı,ÀíÂÛÉÏ²»¿ÉÄÜ³öÏÖ.
		    return 0
		end
		
		local CurValue = UseValue + 1
		
		-- PrintNum(CurValue)
		
		SetBagItemParam( sceneId, selfId, bagId, 4, 2, x702001_g_MaxUseCount ) --ÉèÖÃ×î´ó´ÎÊı
		SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurValue ) --ÉèÖÃÒÑÓÃ´ÎÊı
				
		--------------²ÎÊıÉèÖÃ°²È«ĞÔ¼ì²â,ËäÈ»ÀíÂÛÉÏ²ÎÊıÉèÖÃ²»»áth¤t bÕi
		local CheckParam1 = GetBagItemParam( sceneId, selfId, bagId, 4, 2 )   
		local CheckParam2 = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
		
		-- PrintNum(CheckParam1)
		-- PrintNum(CheckParam2)
		
		if CheckParam1 ~= x702001_g_MaxUseCount then
		    return 0
		end
		if CheckParam2 ~= CurValue then
		    return 0
		end
		--------------²ÎÊıÉèÖÃ°²È«ĞÔ¼ì²â,ËäÈ»ÀíÂÛÉÏ²ÎÊıÉèÖÃ²»»áth¤t bÕi
		
		
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )	--Ë¢ĞÂ±³°üĞÅÏ¢
	    
		if CurValue >= x702001_g_MaxUseCount then  --µ±Ê¹ÓÃ´ÎÊı´ïµ½×î´ó´ÎÊıÊ±,½«É¾³ı´ËÎïÆ·
			local EraseRet = EraseItem( sceneId, selfId, bagId )
			
			-- PrintStr("É¾³ı")
			-- PrintNum(EraseRet)
			
			if EraseRet < 0 then      --Èç¹ûÉ¾³ıth¤t bÕi,½«²»»á²úÉúÈÎºÎĞ§¹û
			  local strMsg = "C¥n Trân thú h°i xuân ğan"
				x702001_ShowMsg( sceneId, selfId, strMsg)
				return 0
			end
			
		end
	else
		local strMsg = "C¥n Trân thú h°i xuân ğan"
		x702001_ShowMsg( sceneId, selfId, strMsg)
		return 0
	end

	-- ÏûºÄÕäÊŞ»Ø´ºµ¤Íê±Ï

	-- PrintNum(x702001_g_HPValue)

	if x702001_g_HPValue > 0 then
		CallScriptFunction( x702001_g_petCommonId, "IncPetHP", sceneId, selfId, x702001_g_HPValue )
	end

	if x702001_g_MaxHPValue > 0 then
		CallScriptFunction( x702001_g_petCommonId, "IncPetMaxHP", sceneId, selfId, x702001_g_MaxHPValue )
	end

	if x702001_g_LifeValue > 0 then
		CallScriptFunction( x702001_g_petCommonId, "IncPetLife", sceneId, selfId, x702001_g_LifeValue )
	end

	if x702001_g_HappinessValue > 0 then
		local happy = LuaFnGetPet_Happyness(sceneId, selfId, 0)
		
		-- PrintNum(happy)
		
		if valueHappy < 60 then
			local happyes = 61 - valueHappy
			
			-- PrintNum(happyes)
			
			CallScriptFunction( x702001_g_petCommonId, "IncPetHappiness", sceneId, selfId, happyes )
		else
			CallScriptFunction( x702001_g_petCommonId, "IncPetHappiness", sceneId, selfId, x702001_g_HappinessValue )
		end
	end

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú: 
--Òıµ¼¼¼ÄÜ»áTÕi Ã¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃCái này ½Ó¿Ú.
--Tr· v«: 1¼ÌĞøÏÂ´ÎĞÄÌø£»0: ÖĞ¶ÏÒıµ¼.
--×¢: ÕâÀïĞúng¼¼ÄÜÉúĞ§mµt ´ÎtoÕ ğµ Èë¿Ú
--**********************************
function x702001_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- Cái này º¯ÊıÃ»ÓĞÊ²Ã´ÓÃ,µ«Ğúng±ØĞëÓĞ
function x702001_CancelImpacts( sceneId, selfId )
	return 0
end

function x702001_ShowMsg( sceneId, selfId, strMsg)
	BeginEvent( sceneId )
		AddText( sceneId, strMsg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
