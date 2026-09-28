--µÀ¾ß: ÕäÊÞ±¦ÄÒ<ID:30504001>
--½Å±¾ºÅ 889001
--Author: Steven.Han 10:39 2007-5-17

x889001_g_scriptId = 889001

x889001_g_DuanWuBaoHePrize = {
	                 50101001,
	                 50101002,
	                 50102001,
	                 50102002,
	                 50102003,
	                 50102004,
	                 50103001,
	                 50104002,
	                 50301001,
	                 50301002,
	                 50302001,
	                 50302002,
	                 50302003,
	                 50302004,
	                 50303001,
	                 50304002,
	                 50601001,
	                 50601002,
	                 50602001,
	                 50602002,
	                 50602003,
	                 50602004,
	                 50603001,
	                 50604002,
}	

x889001_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#c00FFFFTh§t c¦n th§n m· ra #G#{_ITEM30504002}#c00FFFF, nhäy ra mµt viên #{_INFOMSG%s}#c00FFFF, lóng lánh vô cùng bäo thÕch lµ ra ánh sáng, hi¬n lµ ra giá tr¸ phi phàm!",
  "#{_INFOUSR%s}#c00FFFFTh§t c¦n th§n m· ra #G#{_ITEM30504002}#c00FFFF, nhäy ra mµt viên #{_INFOMSG%s}#c00FFFF, lóng lánh vô cùng bäo thÕch lµ ra ánh sáng, hi¬n lµ ra giá tr¸ phi phàm!",
  "#{_INFOUSR%s}#c00FFFFTh§t c¦n th§n m· ra #G#{_ITEM30504002}#c00FFFF, nhäy ra mµt viên #{_INFOMSG%s}#c00FFFF, lóng lánh vô cùng bäo thÕch lµ ra ánh sáng, hi¬n lµ ra giá tr¸ phi phàm!",
}
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x889001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»C¥n Cái này ½Ó¿Ú,µ«Òª±£Áô¿Õº¯Êý
end

--**********************************
--Cái này ÎïÆ·toÕ ðµ Ê¹ÓÃ¹ý³ÌÐúng·ñÀàËÆÓÚ¼¼ÄÜ: 
--H® th¯ng»áTÕi Ö´ÐÐ¿ªÊ¼Ê±¼ì²âCái này º¯ÊýtoÕ ðµ Tr· v«Öµ,Èç¹ûTr· v«th¤t bÕiÔòºöÂÔºóÃætoÕ ðµ ÀàËÆ¼¼ÄÜtoÕ ðµ Ö´ÐÐ.
--Tr· v«1: ¼¼ÄÜÀàËÆtoÕ ðµ ÎïÆ·,¿ÉÒÔ¼ÌÐøÀàËÆ¼¼ÄÜtoÕ ðµ Ö´ÐÐ£»Tr· v«0: ºöÂÔºóÃætoÕ ðµ ²Ù×÷.
--**********************************
function x889001_IsSkillLikeScript( sceneId, selfId)
	return 1; --Cái này ½Å±¾C¥n ¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓHuÖ böÐ§¹û: 
--H® th¯ng»áÖ±½Óµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾ÝCái này º¯ÊýtoÕ ðµ Tr· v«ÖµXác nh§nÒÔºótoÕ ðµ Á÷³ÌÐúng·ñÖ´ÐÐ.
--Tr· v«1: ÒÑ¾­HuÖ bö¶ÔÓ¦Ð§¹û,²»ÔÙÖ´ÐÐºóÐø²Ù×÷£»Tr· v«0: Ã»ÓÐ¼ì²âµ½Ïà¹ØÐ§¹û,¼ÌÐøÖ´ÐÐ.
--**********************************
function x889001_CancelImpacts( sceneId, selfId )
	return 0; --²»C¥n Cái này ½Ó¿Ú,µ«Òª±£Áô¿Õº¯Êý,²¢ÇÒÊ¼ÖÕTr· v«0.
end

--**********************************
--Ìõ¼þ¼ì²âÈë¿Ú: 
--H® th¯ng»áTÕi ¼¼ÄÜ¼ì²âtoÕ ðµ Ê±¼ä ði¬mµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾ÝCái này º¯ÊýtoÕ ðµ Tr· v«ÖµXác nh§nÒÔºótoÕ ðµ Á÷³ÌÐúng·ñÖ´ÐÐ.
--Tr· v«1: Ìõ¼þ¼ì²âÍ¨¹ý,¿ÉÒÔ¼ÌÐøÖ´ÐÐ£»Tr· v«0: Ìõ¼þ¼ì²âth¤t bÕi,ÖÐ¶ÏºóÐøÖ´ÐÐ.
--**********************************
function x889001_OnConditionCheck( sceneId, selfId )

	--Ð£ÑéÊ¹ÓÃtoÕ ðµ Îï
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end


--ÒòÎª¶ÍÎä±¦ºÐ½±ÀøÎïÆ·¶¼TÕi µÚ2À¸
	local FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 5 ) then 
	        local strNotice = "Cµt nguyên li®u cüa các hÕ không có ch² tr¯ng, c¥n s¡p xªp lÕi."
		      x889001_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
			
	return 1; --²»C¥n ÈÎºÎÌõ¼þ,²¢ÇÒÊ¼ÖÕTr· v«1.
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú: 
--H® th¯ng»áTÕi ¼¼ÄÜÏûºÄtoÕ ðµ Ê±¼ä ði¬mµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾ÝCái này º¯ÊýtoÕ ðµ Tr· v«ÖµXác nh§nÒÔºótoÕ ðµ Á÷³ÌÐúng·ñÖ´ÐÐ.
--Tr· v«1: ÏûºÄ´¦ÀíÍ¨¹ý,¿ÉÒÔ¼ÌÐøÖ´ÐÐ£»Tr· v«0: ÏûºÄ¼ì²âth¤t bÕi,ÖÐ¶ÏºóÐøÖ´ÐÐ.
--×¢Òâ: Õâ²»¹â¸ºÔðÏûºÄtoÕ ðµ ¼ì²âÒ²¸ºÔðÏûºÄtoÕ ðµ Ö´ÐÐ.
--**********************************
function x889001_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

--**********************************
--Ö»»áÖ´ÐÐmµt ´ÎÈë¿Ú: 
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áTÕi ÏûºÄÍê³Éºóµ÷ÓÃCái này ½Ó¿Ú(¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼þ¶¼Thöa mãntoÕ ðµ Ê±ºò),¶øÒýµ¼
--¼¼ÄÜÒ²»áTÕi ÏûºÄÍê³Éºóµ÷ÓÃCái này ½Ó¿Ú(¼¼ÄÜtoÕ ðµ mµt ¿ªÊ¼,ÏûºÄ³É¹¦Ö´ÐÐÖ®ºó).
--Tr· v«1: ´¦Àí³É¹¦£»Tr· v«0: ´¦Àíth¤t bÕi.
--×¢: ÕâÀïÐúng¼¼ÄÜÉúÐ§mµt ´ÎtoÕ ðµ Èë¿Ú
--**********************************
function x889001_OnActivateOnce( sceneId, selfId )

    --Êý¾ÝÍ³¼Æ: ×ªµ°toÕ ðµ Ê¹ÓÃ
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 1, 0)
	
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 1 )
    
    if( RandomBase > 0 ) then    
       		
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 1 )
        
        local PrizeNum = 0
        if( RandomID == x889001_g_DuanWuBaoHePrize[1] or RandomID == x889001_g_DuanWuBaoHePrize[2]
            or RandomID == x889001_g_DuanWuBaoHePrize[3] or RandomID == x889001_g_DuanWuBaoHePrize[4]
            or RandomID == x889001_g_DuanWuBaoHePrize[5] or RandomID == x889001_g_DuanWuBaoHePrize[6]
            or RandomID == x889001_g_DuanWuBaoHePrize[7] or RandomID == x889001_g_DuanWuBaoHePrize[8]
            ) then
          PrizeNum = 5
        else
          PrizeNum = 1
        end
        
        if( RandomID > 0 ) then
           BeginAddItem(sceneId)
				   AddItem( sceneId, RandomID, PrizeNum )
			     local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			     if Ret > 0 then
			       	LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)

			       	if 1 == Notice then
			       	   local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					       x889001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "ÐÕt ðßþc "..ItemName
				      x889001_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "Ch² tr¯ng trong túi xách không ðü"
				      x889001_ShowNotice( sceneId, selfId, strNotice)
			     end
			
        end
        
    end
    
	return 1;
end

--**********************************
--Òýµ¼ÐÄÌø´¦ÀíÈë¿Ú: 
--Òýµ¼¼¼ÄÜ»áTÕi Ã¿´ÎÐÄÌø½áÊøÊ±µ÷ÓÃCái này ½Ó¿Ú.
--Tr· v«: 1¼ÌÐøÏÂ´ÎÐÄÌø£»0: ÖÐ¶ÏÒýµ¼.
--×¢: ÕâÀïÐúng¼¼ÄÜÉúÐ§mµt ´ÎtoÕ ðµ Èë¿Ú
--**********************************
function x889001_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÐúngÒýµ¼ÐÔ½Å±¾, Ö»±£Áô¿Õº¯Êý.
end

function x889001_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889001_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889001_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x889001_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889001_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
