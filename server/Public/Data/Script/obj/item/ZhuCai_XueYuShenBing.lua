-- ´´½¨ÈË[ QUFEI 2007-09-30 21:53 UPDATE BugID 25759 ]
-- ĞŞ¸ÄÈË[ ñÒÉÙÎ¢ 2008.5.20 Ìí¼Ó102¼¶ÉñÆ÷µÄºÏ³ÉÅä·½ ]

-- ÑªÔ¡Éñ±øÍêÕûÖ÷²ÄµÄºÏ³É»úÖÆÊµÏÖ £¨¸Ä³ÉÕıÈ·Ãû×Ö£©
-- ItemID = 30505800~30505805(ĞÂÃ§Éñ·û)			30505806 102¼¶ÉñÆ÷
-- 335135
-- Ìá¸ßÉñ·ûÍê³É¶È¼°ÍêÕûÉñ·ûµÄºÏ³É
-- ÎïÆ·¿ÉÒÔÊ¹ÓÃ1´Î
-- Ê¹ÓÃÍê¾ÍÉ¾³ıÎïÆ·


--******************************************************************************
-- ÒÔÏÂ²¿·ÖĞèÒªÊÇĞèÒªĞŞ¸ÄµÄ²¿·Ö
--******************************************************************************

--½Å±¾ºÅ £¨¸Ä³ÉÕıÈ·½Å±¾ºÅ£©
x335135_g_scriptId = 335135

-- Ôö¼ÓÖµ £¨¸ù¾İÒªÇó¸ÄĞ´¾ßÌåÊıÖµ£©
x335135_g_CompleteValue = 5			-- Éñ²ÄÔö¼ÓÍê³É¶È			-- ñÒÉÙÎ¢£¬102ÉñÆ÷¡£·½±ã²âÊÔµ÷³ÉÁË50£¬²âÊÔÍê±Ïµ÷»Ø5¼´¿É¡£
x335135_g_MaxCompleteValue = 95-- ×î´óÉñ²ÄÍê³É¶ÈÉÏÏŞ
x335135_g_MaxUseCount = 1				-- ×î´óÊ¹ÓÃ´ÎÊı1´Î

--±ê×¼Ğ§¹ûID £¨¸Ä³ÉÉñ²ÄºÏ³ÉµÄÌØĞ§£©
--g_ImpactID = 0

--Éñ²ÄºÏ³É¶ÔÓ¦±í
x335135_g_ShenCaiTable = {{sjid=30505700,sfid=30505800,lrid=30505900},
													{sjid=30505701,sfid=30505801,lrid=30505901},
													{sjid=30505702,sfid=30505802,lrid=30505902},
													{sjid=30505703,sfid=30505803,lrid=30505903},
													{sjid=30505704,sfid=30505804,lrid=30505904},
													{sjid=30505705,sfid=30505805,lrid=30505905},
													{sjid=30505706,sfid=30505806,lrid=30505906},}		-- -- ñÒÉÙÎ¢ 2008.5.20¡£ 102¼¶ÉñÆ÷ÖıÔìÍ¼Ñù¡£²ĞÈ±µÄÉñ½Ú7¼¶£¬ĞÂÃ§Éñ·û7¼¶£¬Á¬ÈÖÉñ½Ú7¼¶¡£

-- µ±Ç°¿ÉÒÔºÏ³ÉµÄÉñ²ÄË÷ÒıºÅ
x335135_g_ShenCaiIndex = 0

-- Ê¹ÓÃĞÂÃ§Éñ·ûÔö¼ÓÍêÕû¶ÈÊ±µÄÌØĞ§ID
x335135_g_Impact_LevelUP = 47

-- ºÏ³É³öÁ¬ÈÖÉñ½ÚÊ±µÄÌØĞ§ID
x335135_g_Impact_Complete = 48

-- ñÒÉÙÎ¢£¬102ÉñÆ÷
x335135_g_XinMang7JiInfo = "Tân mãng th¥n phù c¤p 7"

--******************************************************************************
-- ÒÔÉÏ²¿·ÖĞèÒªÊÇĞèÒªĞŞ¸ÄµÄ²¿·Ö
--******************************************************************************

--½Å±¾

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x335135_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x335135_IsSkillLikeScript( sceneId, selfId)
	return 1	--Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x335135_OnConditionCheck( sceneId, selfId )
	-- PrintStr("OnConditionCheck...")
	
	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ·
	--if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		--return 1
	--end
	
	-- µÃµ½µ±Ç°ÕıÔÚÊ¹ÓÃµÄÎïÆ·µÄ±³°üÎ»ÖÃ
	local nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
	
	-- µÃµ½µ±Ç°ÕıÔÚÊ¹ÓÃµÄÎïÆ·µÄID
	local Item01 = LuaFnGetItemTableIndexByIndex(sceneId, selfId, nIndex)
	
	-- PrintStr("Item01 ="..Item01)
	
	-- ñÒÉÙÎ¢ 2008.5.20¡£ 102¼¶ÉñÆ÷ÖıÔìÍ¼Ñù¡£Æß¸öĞÂÃ§Éñ·û¡£
	for i=1, 7 do				--for i=1, 6 do
		if Item01 == x335135_g_ShenCaiTable[i].sfid then
			x335135_g_ShenCaiIndex = i
			-- PrintStr("x335135_g_ShenCaiIndex ="..x335135_g_ShenCaiIndex)
			break
		end
		-- PrintStr("sfid ="..x335135_g_ShenCaiTable[i].sfid)
	end
	
	-- PrintStr("x335135_g_ShenCaiIndex ="..x335135_g_ShenCaiIndex)
		
	-- ñÒÉÙÎ¢ 2008.5.20¡£ 102¼¶ÉñÆ÷ÖıÔìÍ¼Ñù¡£Ìí¼ÓĞÂµÄĞÂÃ§Éñ·û
	if Item01 < 30505800 or Item01 > 30505806 then			-- if Item01 < 30505800 or Item01 > 30505805 then
		local strNotice = "Chï có th¬ dùng tân mãng th¥n phù hşp thành" -- ĞÂÃ§Éñ·û
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	-- PrintStr("sjid ="..x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid)
	
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid )
	if ItemCount < 1 then
		local strNotice = "Ngß½i c¥n".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- ²ĞÈ±µÄÉñ½Ú
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	local bagbegin = GetBasicBagStartPos(sceneId, selfId)
	local bagend   = GetBasicBagEndPos(sceneId, selfId)
	-- PrintStr("bagbegin ="..bagbegin)
	-- PrintStr("bagend ="..bagend)
	local ItemEX
	-- »ñµÃµ±Ç°¿ÉÒÔºÏ³ÉµÄµÚÒ»¸öÉñ½ÚÔÚ±³°üÖĞµÄÎ»ÖÃ	
	local sjbagpos = -1
	for i=bagbegin, bagend do
		if LuaFnIsItemAvailable( sceneId, selfId, i ) == 1 then
			ItemEX = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)			
			if ItemEX == x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid then
				-- PrintStr("ItemEX ="..ItemEX)
				sjbagpos = i
				break
			end		
		end
	end
		
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	if sjbagpos == -1 then
		local strNotice = "Ngß½i c¥n".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}" -- ²ĞÈ±µÄÉñ½Ú
		x335135_ShowMsg( sceneId, selfId, strNotice)
	  return 0
	end
	
	-- PrintStr("sjbagpos ="..sjbagpos)
	
	--local CheckParam = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )   
	local CompleteValue = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )

		if CompleteValue >= x335135_g_MaxCompleteValue then		-- µ±ÍêÕû¶È´ïµ½100Ê±
			local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
		                 if( FreeSpace < 1 ) then
	                           local strNotice = "Ô ğÕo cø không có không gian, c¥n sØa sang lÕi"
		                      x335135_ShowMsg( sceneId, selfId, strNotice)
	                               return 0
		                 end				
			local EraseRet = EraseItem( sceneId, selfId, sjbagpos )
			
			if EraseRet < 0 then      --Èç¹ûÉ¾³ıÊ§°Ü,½«²»»á²úÉúÈÎºÎĞ§¹û			  
					return 0
			end
			
			-- PrintStr("lrid ="..x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid)
			
			BeginAddItem( sceneId )
			AddItem( sceneId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid, 1 )
			ret = EndAddItem( sceneId, selfId )
											
			if ret > 0 then
		              local playername = GetName(sceneId, selfId) 
				local bagpos01 = TryRecieveItem( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid, QUALITY_MUST_BE_CHANGE )	-- ·Å²»ÏÂ¾ÍÃ»ÓĞÁË							
				local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		              local strText = format("@*;SrvMsg;SCA:#G[H® Th¯ng]:#GÂm vang long,thiên lôi ği®n phóng ra, chúc m×ng#{_INFOUSR%s}träi qua thiên tân vÕn kh± cu¯i cùng cûng rèn ğßşc #{_INFOMSG%s}! ", playername, szItemTransfer)									
		                BroadMsgByChatPipe(sceneId, selfId, strText, 4)				
			else
					BeginEvent(sceneId)
					strText = "Tân mãng th¥n phù không ğü ho£c nguyên li®u không ğü, xin ki¬m tra lÕi l¥n sau"
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return 0
			end		
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335135_g_Impact_Complete, 0 )	
                 end
              LuaFnDelAvailableItem(sceneId, selfId, Item01, 1)
		CompleteValue = CompleteValue + x335135_g_CompleteValue
		SetBagItemParam( sceneId, selfId, sjbagpos, 8, 2, CompleteValue ) --ÉèÖÃÍê³É¶È
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		local strNotice = "".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}".." thành công gia tång 5%,hi®n tÕi "..CompleteValue.."%, hãy tiªp tøc c¯ g¡ng" -- ²ĞÈ±µÄÉñ½Ú
		x335135_ShowMsg( sceneId, selfId, strNotice)

	-- PrintStr("CheckParam ="..CheckParam)
	
	--if CheckParam < x335135_g_MaxCompleteValue and CheckParam + x335135_g_CompleteValue >= x335135_g_MaxCompleteValue then		-- µ±ÍêÕû¶È´ïµ½100Ê±ÊÇ·ñ»¹ÓĞ¿Õ¼ä
		local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
		if( FreeSpace < 1 ) then
	BeginEvent( sceneId )
	AddText( sceneId, "Túi ğeo thiªu không gian, xin ki¬m tra lÕi" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	     return 0
	end
	     --local strNotice = "ÄúµÄÎïÆ·À¸Ã»ÓĞ¿Õ¼ä£¬ĞèÒªÕûÀí¡£"
		  --x335135_ShowMsg( sceneId, selfId, strNotice)
	     --return 0
		--end
	--end
	
	
	-- ñÒÉÙÎ¢£¬102ÉñÆ÷¡£Èç¹ûÊ¹ÓÃµÄÊÇĞÂÃ§Éñ·û7¼¶
	if Item01 == 30505806 then
		local playername = GetName(sceneId, selfId)
	        --local nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
		x335135_g_XinMang7JiInfo = GetItemName( sceneId, 30505806 )
		local strText = format("#{_INFOUSR%s}#{DQSJ_20080512_12}#cFF0000Tàn Khuyªt Th¥n Tiªt c¤p 7 #{DQSJ_20080512_13}", playername, GetItemName( sceneId, 30505806 ))						
		BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		--PrintStr(x335135_g_XinMang7JiInfo)
	end
	
	
	return 1; --²»ĞèÒªÈÎºÎÌõ¼ş£¬²¢ÇÒÊ¼ÖÕ·µ»Ø1¡£
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x335135_OnDeplete( sceneId, selfId )
	--if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		--return 1
	--end
	--return 0
end

--**********************************
--Ö»»áÖ´ĞĞÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒıµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x335135_OnActivateOnce( sceneId, selfId )

	-- »ñµÃµ±Ç°ºÏ³ÉµÄÉñ½ÚÍêÕû¶È	
	local CompleteValue = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )

	-- PrintStr("CompleteValue ="..CompleteValue)

	--if nIndex >= 0 then		
		
		-- ¼ÇÂ¼Í³¼ÆĞÅÏ¢
		--LuaFnAuditShenCai(sceneId, selfId, Item01)
		
		--CompleteValue = CompleteValue + x335135_g_CompleteValue
		
		-- PrintStr("CompleteValue ="..CompleteValue)
		
		--SetBagItemParam( sceneId, selfId, sjbagpos, 8, 2, CompleteValue ) --ÉèÖÃÍê³É¶È
		
		-- ñÒÉÙÎ¢£¬2008.5.22 Ìí¼ÓÊÀ½çÏµÍ³¹«¸æ	#IÊ¹ÓÃÁËÒ»¸öĞÂÃ§Éñ·û#G7¼¶#I£¬ÀëÖı³É¾øÊÀÉñÆ÷ÓÖ½üÁËÒ»²½¡£
		if Item01 == 30505806 then
			local playername = GetName(sceneId, selfId)	
			local strText = format("#{_INFOUSR%s}#{DQSJ_20080512_12}#{_INFOMSG%s}#{DQSJ_20080512_13}", playername, x335135_g_XinMang7JiInfo)						
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		end
		
		--------------²ÎÊıÉèÖÃ°²È«ĞÔ¼ì²â,ËäÈ»ÀíÂÛÉÏ²ÎÊıÉèÖÃ²»»áÊ§°Ü
		local CheckParam = GetBagItemParam( sceneId, selfId, sjbagpos, 8, 2 )   
				
		-- PrintStr("CheckParam ="..CheckParam)
				
		if CheckParam ~= CompleteValue then
		    return 0
		end		
		--------------²ÎÊıÉèÖÃ°²È«ĞÔ¼ì²â,ËäÈ»ÀíÂÛÉÏ²ÎÊıÉèÖÃ²»»áÊ§°Ü
		
		local strNotice = "".."#{_ITEM"..(x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].sjid).."}".."ğã gia tång thêm 5%" -- ²ĞÈ±µÄÉñ½Ú
		x335135_ShowMsg( sceneId, selfId, strNotice)
		
		LuaFnRefreshItemInfo( sceneId, selfId, sjbagpos )	--Ë¢ĞÂ±³°üĞÅÏ¢
		
		if CompleteValue >= x335135_g_MaxCompleteValue then		-- µ±ÍêÕû¶È´ïµ½100Ê±
					
			local EraseRet = EraseItem( sceneId, selfId, sjbagpos )
			
			if EraseRet < 0 then      --Èç¹ûÉ¾³ıÊ§°Ü,½«²»»á²úÉúÈÎºÎĞ§¹û			  
					return 0
			end
			
			-- PrintStr("lrid ="..x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid)
			
			BeginAddItem( sceneId )
			AddItem( sceneId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid, 1 )
			ret = EndAddItem( sceneId, selfId )
											
			if ret > 0 then
				TryRecieveItem( sceneId, selfId, x335135_g_ShenCaiTable[x335135_g_ShenCaiIndex].lrid, QUALITY_MUST_BE_CHANGE )	-- ·Å²»ÏÂ¾ÍÃ»ÓĞÁË							
				
			else
					BeginEvent(sceneId)
					strText = "Ô ğÕo cø ho£c nguyên li®u không ğü không gian, thïnh sØa sang lÕi sau lÕi ğªn lînh"
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return 0
			end		
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335135_g_Impact_Complete, 0 )
		else
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335135_g_Impact_LevelUP, 0 )
		end
		
	--else
		--local strMsg = "Ö÷²ÄºÏ³ÉÊ§°Ü"
		--x335135_ShowMsg( sceneId, selfId, strMsg)
		--return 0
	--end
  
	-- Ö÷²ÄºÏ³ÉÍê±Ï

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x335135_OnActivateEachTick( sceneId, selfId )
	return 1
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
function x335135_CancelImpacts( sceneId, selfId )
	return 0		--²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

function x335135_ShowMsg( sceneId, selfId, strMsg)
	BeginEvent( sceneId )
		AddText( sceneId, strMsg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
