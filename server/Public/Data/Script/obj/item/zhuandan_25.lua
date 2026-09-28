--µÀ¾ß: Æß²ÊÉñÃØ²ÊÍà<ID:30504047>
--½Å±¾ºÅ 889025
--Author:zhangzhuang 2009-01-15

x889025_g_scriptId = 889025
x889025_g_ColorSockPrize = {
		            39999901,	
								30900014,	
								30900016,	
								38000948,	
								38000949,	
								50502003,	
								50501001,	
								50501002,	
								50502001,	
								50502002,	
								50502004,
								50504002,
								50502003,
								50501001,
								50501002,
								50502001,
								50502002,
								50502004,
								50504002,
								50602003,
								50601001,
								50601002,
								50602001,
								50602002,
								50602004,
								50604002,
								50602003,
								50601001,
								50601002,
								50602001,
								50602002,
								50602004,
								50604002,
								50702003,
								50701001,
								50701002,
								50702001,
								50702002,
								50702004,
								50704002,
								10157005,
								10141207,
								10141208,
								10141209,
								10141210,
								10155002,
								10155003,
								20310168,
								20310168,
								10157008,
								10157009,
	              } 
                 
x889025_g_strGongGaoInfo = {
	"#{_INFOUSR%s}#c00FFFFTrong tay  #G#{_ITEM30504047}#c00FFFF k¸ch li®t run run ðÑng lên, th¤t s¡c quang mang theo thÑ tñ hi®n lên, mµt cái #{_INFOMSG%s}#c00FFFF xu¤t hi®n · tÕi trong tay.",
	"#{_INFOUSR%s}#c00FFFFTrong tay  #G#{_ITEM30504047}#c00FFFF k¸ch li®t run run ðÑng lên, th¤t s¡c quang mang theo thÑ tñ hi®n lên, mµt cái #{_INFOMSG%s}#c00FFFF xu¤t hi®n · tÕi trong tay.",
	"#{_INFOUSR%s}#c00FFFFTrong tay  #G#{_ITEM30504047}#c00FFFF k¸ch li®t run run ðÑng lên, th¤t s¡c quang mang theo thÑ tñ hi®n lên, mµt cái #{_INFOMSG%s}#c00FFFF xu¤t hi®n · tÕi trong tay.",
}                
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú   
--**********************************
function x889025_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»C¥n Cái này ½Ó¿Ú,µ«Òª±£Áô¿Õº¯Êý
end              
                 
--**********************************
--Cái này ÎïÆ·toÕ ðµ Ê¹ÓÃ¹ý³ÌÐúng·ñÀàËÆÓÚ¼¼ÄÜ: 
--H® th¯ng»áTÕi Ö´ÐÐ¿ªÊ¼Ê±¼ì²âCái này º¯ÊýtoÕ ðµ Tr· v«Öµ,Èç¹ûTr· v«th¤t bÕiÔòºöÂÔºóÃætoÕ ðµ ÀàËÆ¼¼ÄÜtoÕ ðµ Ö´ÐÐ.
--Tr· v«1: ¼¼ÄÜÀàËÆtoÕ ðµ ÎïÆ·,¿ÉÒÔ¼ÌÐøÀàËÆ¼¼ÄÜtoÕ ðµ Ö´ÐÐ£»Tr· v«0: ºöÂÔºóÃætoÕ ðµ ²Ù×÷.
--**********************************
function x889025_IsSkillLikeScript( sceneId, selfId)
	return 1; --Cái này ½Å±¾C¥n ¶¯×÷Ö§³Ö
end              
                 
--**********************************
--Ö±½ÓHuÖ böÐ§¹û:  
--H® th¯ng»áÖ±½Óµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾ÝCái này º¯ÊýtoÕ ðµ Tr· v«ÖµXác nh§nÒÔºótoÕ ðµ Á÷³ÌÐúng·ñÖ´ÐÐ.
--Tr· v«1: ÒÑ¾­HuÖ bö¶ÔÓ¦Ð§¹û,²»ÔÙÖ´ÐÐºóÐø²Ù×÷£»Tr· v«0: Ã»ÓÐ¼ì²âµ½Ïà¹ØÐ§¹û,¼ÌÐøÖ´ÐÐ.
--**********************************
function x889025_CancelImpacts( sceneId, selfId )
	return 0; --²»C¥n Cái này ½Ó¿Ú,µ«Òª±£Áô¿Õº¯Êý,²¢ÇÒÊ¼ÖÕTr· v«0.
end              
                 
--**********************************
--Ìõ¼þ¼ì²âÈë¿Ú:  
--H® th¯ng»áTÕi ¼¼ÄÜ¼ì²âtoÕ ðµ Ê±¼ä ði¬mµ÷ÓÃCái này ½Ó¿Ú,²¢¸ù¾ÝCái này º¯ÊýtoÕ ðµ Tr· v«ÖµXác nh§nÒÔºótoÕ ðµ Á÷³ÌÐúng·ñÖ´ÐÐ.
--Tr· v«1: Ìõ¼þ¼ì²âÍ¨¹ý,¿ÉÒÔ¼ÌÐøÖ´ÐÐ£»Tr· v«0: Ìõ¼þ¼ì²âth¤t bÕi,ÖÐ¶ÏºóÐøÖ´ÐÐ.
--**********************************
function x889025_OnConditionCheck( sceneId, selfId )
	--Ð£ÑéÊ¹ÓÃtoÕ ðµ Îï
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
--ÒòÎª×ªµ°±¾ÉíÏûºÄmµt cái,»á¶à³ömµt cái¿Õ¸ñ,ÇÒ°×½ðÀñºÐ×î¶à½±Àø3cáiËùÒÔÅÐ¶ÏÊ£Óà¿Õ¼ä<2	
--ÒòÎªÆß²ÊÉñÃØ²ÊÍàÎïÆ·ÓÐtoÕ ðµ TÕi Ô ðÕo cø ðã ð¥y¸,ÓÐtoÕ ðµ TÕi ²ÄÁÏÀ¸
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 5 ) then 
	        local strNotice = "Ch² tr¯ng trong tay näi không ðü 5 ch²."
		      x889025_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 5 ) then 
	        local strNotice = "Ô nguyên li®u không gian không ðü 5 ch²."
		      x889025_ShowNotice( sceneId, selfId, strNotice)
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
function x889025_OnDeplete( sceneId, selfId )
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
function x889025_OnActivateOnce( sceneId, selfId )

    --Êý¾ÝÍ³¼Æ: ×ªµ°toÕ ðµ Ê¹ÓÃ
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 24, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 21)
    if( RandomBase > 0 ) then    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 21 )
        local PrizeNum = 1
        if (RandomID == x889025_g_ColorSockPrize[5] or RandomID ==x889025_g_ColorSockPrize[1]) then
          PrizeNum = 5
        elseif  (RandomID ==x889025_g_ColorSockPrize[48] or RandomID ==x889025_g_ColorSockPrize[49]) then
        	PrizeNum = 500
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
					       x889025_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "ÐÕt ðßþc "..ItemName
					  local playerName = GetName(sceneId,selfId)
				      x889025_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "Ch² tr¯ng trong túi xách không ðü"
				      x889025_ShowNotice( sceneId, selfId, strNotice)
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
function x889025_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÐúngÒýµ¼ÐÔ½Å±¾, Ö»±£Áô¿Õº¯Êý.
end

function x889025_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889025_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889025_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889025_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889025_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
