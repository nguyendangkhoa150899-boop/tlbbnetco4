-- 210242
-- ÊîÆÚ»î¶¯£¬¶Ò»»Æó¶ìµ°

x210242_g_ScriptId = 210242

x210242_g_ItemId = {30505114,30505115,30505116,30505117,30505118,30505119,30505120,}

x210242_g_PetEggId = 30505121

-- µôÂäÆßÐÇËéÆ¬»î¶¯Ê±¼ä[2007/7/1, 2007/9/27]
x210242_g_Drop_QiXingSuiPian_StartDay = 7181 --2007/7/1¿ªÊ¼
x210242_g_Drop_QiXingSuiPian_EndDay = 7269 --2007/9/27½áÊø

-- ¶Ò»»Æó¶ìµ°»î¶¯Ê±¼ä[2007/7/1, 2007/10/31]
x210242_g_ExchangePenguinEggStartDay	= 7181 --2007/7/1¿ªÊ¼
x210242_g_ExchangePenguinEggEndDay		= 7303 --2007/10/31½áÊø
	
--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x210242_OnDefaultEvent( sceneId, selfId, targetId )
	
	-- »î¶¯Ê±¼ä£¬Ö»ÔÚÕâ¸ö»î¶¯Ê±¼äÄÚÄÜÏÔÊ¾Õâ¸ö¶Ô»°
	if x210242_IsValidPenguinEggExchangeTime() == 0    then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y Ð±i Xí Nga" );
			AddText(sceneId, "    HoÕt ðµng ðã quá hÕn." );
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y Ð±i Xí Nga" );
			AddText(sceneId, "  Trong cái nóng cüa mùa HÕ, các hÕ có mu¯n 1 tý gió không ? Có mu¯n 1 ly thÑc u¯ng lÕnh không ? Có mu¯n 1 tý thanh thän sän khoái không ?" );
			AddText(sceneId, "  Chï c¥n có ðü bµ 7 miªng mänh vøn, là có th¬ ðÕt ðßþc r°i!" );
			AddText(sceneId, "  Mµt v¸ không biªt tên, ðã dùng s¯ mänh vøn này mang ðªn cho thª gi¾i Thiên Long Bát Bµ càng thêm thoäi mái, ð¬ làm quà t£ng, ngß¶i còn nh¶ ta t£ng cho nhæng ngß¶i thu th§p ðü mänh vøn th¤t tinh 1 món quà! " );
			AddText(sceneId, "  Mµt con Xí Nga ðáng yêu!" );
			AddText(sceneId, "  Các hÕ xác nh§n mu¯n ð±i trÑng Xí Nga không ?" );
			AddNumText(sceneId, x210242_g_ScriptId,"Duy®t", 8, 3);
			AddNumText(sceneId, x210242_g_ScriptId,"HuÖ", 8, 4);
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	if GetNumText() == 4   then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if GetNumText() == 3   then
		
		-- 1£¬¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓÐÒ»Ì×ËéÆ¬£¬
		local HaveAllItem = 1
		for i, ItemId in x210242_g_ItemId  do
			if GetItemCount(sceneId, selfId, ItemId) < 1   then
				HaveAllItem = 0
			end
			if GetItemCount(sceneId, selfId, ItemId) == 1   then
				BagHavePos = 1
			end
		end
		
		if HaveAllItem == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "    Ð±i trÑng Xí Nga c¥n Kim, Mµc, Thüy, Höa, Th±, Nh§t, Nguy®t 7 loÕi mänh vøn m²i thÑ 1 cái, trên ngß¶i các hÕ không ðü mänh vøn nên không th¬ tiªn hành ð±i." );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 2£¬¼ì²âÍæ¼ÒµÄÕâÌ×ËéÆ¬ÊÇ²»ÊÇ¶¼ÄÜ¹»É¾³ý
		local AllItemCanDelete = 1
		for i, ItemId in x210242_g_ItemId  do
			if LuaFnGetAvailableItemCount(sceneId, selfId, ItemId) < 1   then
				AllItemCanDelete = 0
				break;
			end
		end
		
		if AllItemCanDelete == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "    Kh¤u tr× v§t ph¦m trên ngß¶i các hÕ th¤t bÕi, xin ki¬m tra lÕi phäi chång v§t ph¦m ðã b¸ khóa ho£c v§t ph¦m ðang trong trÕng thái giao d¸ch." );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 3£¬¼ì²âÍæ¼ÒÉíÉÏÊÇ²»ÊÇÓÐ¿Õ¼ä·Å½±Àø
	 	BeginAddItem(sceneId)
			AddItem( sceneId, x210242_g_PetEggId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		local delret = 1
		if ret == 1  then
			for i, ItemId in x210242_g_ItemId  do
				if LuaFnDelAvailableItem(sceneId, selfId, ItemId, 1) == 0   then
					delret = 0
					break
				end
			end
			
			if delret == 1  then
				AddItemListToHuman(sceneId,selfId)
				-- ·¢ÊÀ½ç¹«¸æ
				local transfer = GetItemTransfer(sceneId,selfId,0)
				local str = format("#cff99cc #{_INFOUSR%s} träi qua nhæng n± lñc, cu¯i cùng cûng thu ðßþc ðü bµ Kim Tinh, Mµc Tinh, Thüy Tinh, Höa Tinh, Th± Tinh, M£t Trång và M£t Tr¶i 7 bäy miªng mänh vøn. Ð¬ ð«n ðáp, Cüng Thái Vân · ÐÕi Lý ðã t£ng cho 1 viên #{_INFOMSG%s}. ",GetName(sceneId,selfId), transfer)
				BroadMsgByChatPipe(sceneId, selfId, str, 4)
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)

				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 1000)
			end
		end
		return

	end
	
	if GetNumText() == 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y Ð±i Xí Nga" );
			AddText(sceneId, "#{duihuanqie_shuoming}" );
			
			--AddText(sceneId, "    Ñ×ÈÈµÄÏÄÌìÀï£¬ÄãÏë²»ÏëÒªÒ»ÕóÁ¹·ç£¿Ïë²»ÏëÒªÒ»±­ÀäÒû£¿Ïë²»ÏëÒªÒ»Ë¿ÇåË¬£¿" );
			--AddText(sceneId, "    Ö»ÒªÓÐÈ«²¿Æß¿ÅÆßÐÇËéÆ¬£¬Äã¾Í¶¼¿ÉÒÔ»ñµÃÀ²£¡" );
			--AddText(sceneId, "    Ò»Î»²»ÖªÃûµÄ³¤Õß£¬¿ÉÒÔÊ¹ÓÃÕâÐ©ËéÆ¬À´ÈÃÌìÁú°Ë²¿µÄÊÀ½ç±äµÃ¸ü¼ÓÇåË¬£¬¶ø×÷Îª½±Àø£¬Ëû»¹ÍÐÎÒËÍ¸øÊÕ¼¯ÆßÐÇËéÆ¬µÄÈËÒ»¼þ×îÇåË¬µÄÀñÎï£¡" );
			--AddText(sceneId, "    Ò»Ö»¿É°®µÄÆó¶ì£¡" );
			--AddText(sceneId, "    ËéÆ¬¶ÔÓ¦µÄÐÇËÞ²»Í¬£¬ÆäÖÐ×îÎªÄÑµÃµÄÊÇÌ«ÑôËéÆ¬¡£Ö»ÓÐÔÚ²É¼¯²ÝÒ©»òÕß²É¼¯¿óÊ¯µÄÊ±ºò£¬²ÅÓÐ¿ÉÄÜ»ñµÃÆßÐÇËéÆ¬µ±ÖÐµÄÒ»ÖÖ¡£" );
			--AddText(sceneId, "    µ±Äã´ÕÆë½ðÐÇËéÆ¬£¬Ä¾ÐÇËéÆ¬£¬Ë®ÐÇËéÆ¬£¬»ðÐÇËéÆ¬£¬ÍÁÐÇËéÆ¬£¬ÔÂÁÁËéÆ¬£¬Ì«ÑôËéÆ¬Ö®ºó£¬°ÑËüÃÇ½»¸øÎÒ¡£ÎÒ¾Í¿ÉÒÔ´úÄÇÎ»³¤ÕßËÍ¸øÄãÒ»Ã¶ÌìÏÂº±¼ûµÄÆó¶ìµ°¡£Æó¶ìµ°¿ÉÒÔÔÚÄãµÈ¼¶´óÓÚµÈÓÚ55¼¶Ê±Ê¹ÓÃ£¬Ê¹ÓÃºó½«»áÕÙ»½³öÒ»Ö»Æó¶ì±¦±¦×÷ÎªÄãµÄÕäÊÞ¡£" );
			--AddText(sceneId, "    ÐèÒªËµÃ÷µÄÊÇ£¬ÆßÐÇËéÆ¬Ö»ÓÐ¾Û¼¯ÔÚÒ»ÆðµÄÊ±ºò²ÅÓÐ¼ÛÖµ¡£µ±È»Äú¶àÓàµÄÒ»Ð©ËéÆ¬¿ÉÒÔ³öÊÛ¸øÉÌµê»»È¡ÉÙÁ¿µÄ½ðÇ®¡£" );
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x210242_OnEnumerate( sceneId, selfId, targetId )
	
	-- »î¶¯ÓÐÐ§Ê±¼äÅÐ¶¨
	if x210242_IsValidPenguinEggExchangeTime() == 0    then
		-- »î¶¯Èç¹ûÒÑ¾­¹ýÆÚ£¬¾Í²»ÔÙÏÔÊ¾ÕâÐ©ÄÚÈÝ
		return
	end

	AddNumText(sceneId, x210242_g_ScriptId,"Ta mu¯n ð±i trÑng Xí Nga", 6, 1);
	AddNumText(sceneId, x210242_g_ScriptId,"Liên quan ð±i trÑng Xí Nga", 0, 2);

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x210242_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x210242_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--·ÅÆú
--**********************************
function x210242_OnAbandon( sceneId, selfId )
end


--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x210242_CheckSubmit( sceneId, selfId )
end

--**********************************
--Ìá½»
--**********************************
function x210242_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x210242_OnEnterZone( sceneId, selfId, zoneId )
end


-- ÊÇ·ñºÏ·¨¶Ò»»Æó¶ìµ°»î¶¯Ê±¼ä
function x210242_IsValidPenguinEggExchangeTime()
	local theDay = GetDayTime()
	if theDay < x210242_g_ExchangePenguinEggStartDay or
		 theDay > x210242_g_ExchangePenguinEggEndDay then
		return 0 --·Ç»î¶¯Ê±¼ä
	end
	
	return 1
end

--**********************************
--Íæ¼Ò»ñµÃÌ«ÑôÊ¯ µÄÊ±ºò£¬ÔÚµôÂä°üÄÚ»ñµÃ
--**********************************
function x210242_PickupItem( sceneId, selfId, itemId, bagidx )
	-- #cff99cc XÅÙ³öÁËÒ»¿é¹ÖÊ¯£¬²Á¸É¾»ÄàÍÁÖ®ºó£¬²Å·¢ÏÖ¾ÓÈ»ÊÇÒ»¿éY¡£
	local transfer = GetBagItemTransfer(sceneId, selfId, bagidx)
	local str = format("#cff99cc #{_INFOUSR%s} làm ra 1 viên ðá, sau khi mang ði rØa sÕch s¨, thì m¾i phát hi®n ra là #{_INFOMSG%s}. ",GetName(sceneId,selfId), transfer)
	BroadMsgByChatPipe(sceneId, selfId, str, 4)
	
end

function x210242_CheckPercentOK( numerator, denominator )
  --²ÎÊýÎª·Ö×Ó,·ÖÄ¸. ÀýÈç ( 100, 10000 ) ±íÊ¾¼¸ÂÊÎª 100 / 10000
  local roll = random( denominator )
  if roll <= numerator then
      return 1
  end
  return 0
end

--**********************************
--¼ì²âÊÇ·ñÕýÈ·µÄ»î¶¯Ê±¼ä(µôÂäÆßÐÇËéÆ¬)
--**********************************
function x210242_IsValidDayToDrop_QiXingSuiPian()
    local DayTime = GetDayTime()
    if DayTime < x210242_g_Drop_QiXingSuiPian_StartDay or
    	 DayTime > x210242_g_Drop_QiXingSuiPian_EndDay	 then
       return 0    --·Ç»î¶¯Ê±¼ä
    end
    
    return 1  
end

function x210242_DropStoneList(sceneId, LongzhuIndex) 
  --½ð	0.0200 	0.00667
	--Ä¾	0.0050 	0.00167
	--Ë®	0.0020 	0.00067
	--»ð	0.0011 	0.00037
	--ÍÁ	0.0007 	0.00023
	--ÔÂ	0.0004 	0.00013
	--ÈÕ	0.0002 	0.00007

  if 0 == x210242_IsValidDayToDrop_QiXingSuiPian()  then
  	return -1
  end
  
  if 1 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 667, 100000 )--0.00667
      if 1 == CheckOK then
          return 30505114
      end
  end
  
  if 2 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 167, 100000 )
      if 1 == CheckOK then
          return 30505115
      end
  end
  
  if 3 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 67, 100000 )
      if 1 == CheckOK then
          return 30505116
      end
  end
  
  if 4 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 37, 100000 )
      if 1 == CheckOK then
          return 30505117
      end
  end
  
  if 5 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 23, 100000 )
      if 1 == CheckOK then
          return 30505118
      end
  end
  
  if 6 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 13, 100000 )
      if 1 == CheckOK then
          return 30505119
      end
  end
  
  if 7 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 7, 100000 )
      if 1 == CheckOK then
          return 30505120
      end
  end
  
  return -1
    
end
