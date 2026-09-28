--»î¶¯¡ª¡ª¶Ò»»ÐÄ·¨, ÃØ¼®
--MisDescBegin
--Viet Translate by VTAngel (Suong Anh)
x808058_g_ScriptId = 808058
x808058_g_ExchangeLongzhu_Active = 1
x808058_g_LongpaiId = 30505092
x808058_g_Longpai75Id =	30505907
--x808058_g_LongzhuList = { 30505085, 30505086, 30505087, 30505088, 30505089, 30505090, 30505091 }
x808058_g_LongzhuList = { 30505098, 30505102 }

--x808058_g_ActiveStartTime = 7128
--x808058_g_ActiveEndTime = 7150

--MisDescEnd


function x808058_CheckPercentOK( numerator, denominator )
    --²ÎÊýÎª·Ö×Ó,·ÖÄ¸. ÀýÈç ( 100, 10000 ) ±íÊ¾¼¸ÂÊÎª 100 / 10000
    local roll = random( denominator )
    
    if roll <= numerator then
        return 1
    end
    
    return 0
end


function x808058_DropLongzhuList( sceneId, LongzhuIndex )
    
    --30505136   0.000200
    --30505137   0.000050
    --30505138   0.000020
    --30505139   0.000011
    --30505140   0.000007
    --30505141   0.000004
    --30505142   0.000002
    x808058_CheckRightTime()
    
    if 1 ~= x808058_g_ExchangeLongzhu_Active then    --Ã»»î¶¯µÄÊ±ºò¾Í²»Ö´ÐÐ(ÈÝ´í´¦Àí,ÕýÈ·Á÷³Ì²»Ó¦µ÷ÓÃµ½ÕâÀï)
        return -1
    end
    
    if 1 == LongzhuIndex then
        local CheckOK = x808058_CheckPercentOK( 200, 1000000 )
        if 1 == CheckOK then
            return 30505136
        end
    end
    
    if 2 == LongzhuIndex then
        local CheckOK = x808058_CheckPercentOK( 50, 1000000 )
        if 1 == CheckOK then
            return 30505137
        end
    end
    
    return -1
    
end

function x808058_CheckEnoughItem( sceneId, selfId, targetId )
    
    local ListSize = getn( x808058_g_LongzhuList )

    for i=1, ListSize do
		local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x808058_g_LongzhuList[ i ] )
		if ItemCount < 2 then
		    return 0
		end
	end
	
	return 1
	
end

function x808058_DelNeedItem( sceneId, selfId, targetId )
    
    local ListSize = getn( x808058_g_LongzhuList )

    for i=1, ListSize do
		ret = LuaFnDelAvailableItem(sceneId, selfId, x808058_g_LongzhuList[ i ], 20)
		if ret ~= 1 then
			return -1   --¼ÙÈçÉ¾³ý²Ù×÷ÓÐÈÎºÎÒ»¸öÎïÆ·Ê§°Ü,ÔòÖÐ¶Ï²Ù×÷,ÈÏÎªÉ¾³ýÊ§°Ü
		end
	end
	
	return 1
	
end

function x808058_AwardItem( sceneId, selfId, targetId, type )

    local bEnough = x808058_CheckEnoughItem( sceneId, selfId, targetId )
    if 0 == bEnough then        --Ã»ÓÐ×ã¹»ÎïÆ·
		--"¶Ò»»Áú±¦±¦C¥n có ³à, ³È, »Æ, ÂÌ, Çà, À¶, ×ÏÉ«ÁúÖé¸÷Ò»¸ö£¬ÄúÉíÉÏµÄÁúÖé²»È«£¬Òò´ËÎÞ·¨¶Ò»»¡£"
		local strNotEnough = "Ð±i Long bài c¥n Item : Cu°ng, Bá . M²i loÕi 20 viên, các hÕ không có ðü Item, do ðó không th¬ ð±i.#r#G#bItem Cu°ng, Bá có th¬ sån · ác bá ác t£c và Quy.TC"
		BeginEvent(sceneId)
			AddText( sceneId, strNotEnough )
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )        
		return
    end


	BeginAddItem(sceneId)
		if type == 1 then
			AddItem( sceneId, x808058_g_LongpaiId, 1 )
		elseif type == 2 then
			AddItem( sceneId, x808058_g_Longpai75Id, 1 )
		end
	local Ret = EndAddItem(sceneId,selfId)
	
	if Ret > 0 then
	    local bDel = x808058_DelNeedItem( sceneId, selfId, targetId )
	    if 1 == bDel then
	        --¸øÓèÍæ¼ÒÎïÆ·
	        AddItemListToHuman(sceneId,selfId)
	        
	        --·¢²¼ÏµÍ³¹«¸æ
	        local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
			local PlayerName = GetName( sceneId, selfId )
			local PlayerInfoName = "#{_INFOUSR"..PlayerName .."}"
			local ItemInfo = "#{_INFOMSG".. szItemTransfer .."}"
			
			local strNotice = "#{EXCHANGE_LONGPAI_TEX02}"
			
			--"#P¾­¹ýÒ»·¬Å¬Á¦£¬ÖÕÓÚÊÕ¼¯È«ÁË¾Û¼¯ÁËÌìµØ¾«»ªµÄÆß¿ÅÁúÖé¡ª¡ª³àÉ«, ³ÈÉ«, »ÆÉ«, ÂÌÉ«, ÇàÉ«, À¶É«, ×ÏÉ«ÁúÖé¡£×÷Îª¸ÐÐ»£¬´óÀíµÄ¹¨²ÊÔÆÌØÔùËÍ¸øÆäÒ»¿é"
			local SysStr = PlayerInfoName..strNotice..ItemInfo.."#R"
			BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
		
	    --¹Ø±Õ½çÃæ
	    BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
	    end

	else
		--local strBagFull = "¶Ô²»Æð£¬ÄúµÄÎïÆ·À¸ÒÑ¾­Ã»ÓÐ¿Õ¼ä£¬Òò´ËÎÞ·¨¶Ò»»¡£"
		local strBagFull = "#{EXCHANGE_LONGPAI_TEX03}"
		BeginEvent(sceneId)
			AddText( sceneId, strBagFull )
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
	end

end

--**********************************
--Íæ¼Ò¼ñµ½ÁúÖéµÄ¹«¸æ
--**********************************
function x808058_PlayerPickUpLongZhu( sceneId, selfId, bagidx )

	local szItemTransfer = GetBagItemTransfer(sceneId,selfId,bagidx)
	local PlayerName = GetName( sceneId, selfId )
			
	local strNotice = format( "#{_INFOUSR%s}#P ðã ð±i thành công #{_INFOMSG%s}!", PlayerName, szItemTransfer )
	--BroadMsgByChatPipe( sceneId, selfId, strNotice, 4 )
    
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x808058_OnDefaultEvent( sceneId, selfId, targetId )
    
    x808058_CheckRightTime()
    
    if 1 ~= x808058_g_ExchangeLongzhu_Active then    --Ã»»î¶¯µÄÊ±ºò¾Í²»Ö´ÐÐ(ÈÝ´í´¦Àí,ÕýÈ·Á÷³Ì²»Ó¦µ÷ÓÃµ½ÕâÀï)
        return
    end
    
    local TextNum = GetNumText()

    if 1 == TextNum then
    	--x808058_AwardItem( sceneId, selfId, targetId )
    	
			local strLongpai = "#{EXCHANGE_LONGPAI_TEX07}"
			--local strLongpai75 = "#{EXCHANGE_LONGPAI_TEX08}"
			BeginEvent(sceneId)
				AddNumText(sceneId, x808058_g_ScriptId, strLongpai, 6, 3 )
				AddNumText(sceneId, x808058_g_ScriptId, strLongpai75, 6, 4 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
		elseif 2 == TextNum then
			local strNotEnough = "#{EXCHANGE_LONGPAI_TEX06}"
			BeginEvent(sceneId)
				AddText( sceneId, strNotEnough )
			EndEvent()
			DispatchEventList( sceneId, selfId, targetId )      
		elseif 3 == TextNum then
			x808058_AwardItem( sceneId, selfId, targetId, 1 )
		elseif 4 == TextNum then
			x808058_AwardItem( sceneId, selfId, targetId, 2 )
    end
    
end

--**********************************
--¼ì²âÊÇ·ñÕýÈ·µÄ»î¶¯Ê±¼ä
--**********************************
function x808058_CheckRightTime()

    --local DayTime = GetDayTime()
    
    --if DayTime < x808058_g_ActiveStartTime then
    --   x808058_g_ExchangeLongzhu_Active = 0
    --   return 0    --´ËÇ°·Ç»î¶¯Ê±¼ä
    --end
    
    --if DayTime > x808058_g_ActiveEndTime then
    --   x808058_g_ExchangeLongzhu_Active = 0
    --   return 0    --´Ëºó»î¶¯ÒÑ¾­½áÊø
    --end
    
    x808058_g_ExchangeLongzhu_Active = 1
    return 1
    
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x808058_OnEnumerate( sceneId, selfId, targetId )
    
    x808058_CheckRightTime()
    
    if 1 ~= x808058_g_ExchangeLongzhu_Active then
        return
    end

    --local strLongpai = "ÎÒÒª¶Ò»»ÁúÅÆ"
    --local strDesc = "¹ØÓÚ¶Ò»»ÁúÅÆ"
    
    local strLongpai = "#{EXCHANGE_LONGPAI_TEX04}"
    local strDesc = "#{EXCHANGE_LONGPAI_TEX05}"
    AddNumText(sceneId, x808058_g_ScriptId, strLongpai, 6, 1 )
    AddNumText(sceneId, x808058_g_ScriptId, strDesc, 0, 2 )
    
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x808058_CheckAccept( sceneId, selfId )

end

--**********************************
--½ÓÊÜ
--**********************************
function x808058_OnAccept( sceneId, selfId )
end

--**********************************
--·ÅÆú
--**********************************
function x808058_OnAbandon( sceneId, selfId )
end

--**********************************
--¼ÌÐø
--**********************************
function x808058_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x808058_CheckSubmit( sceneId, selfId )
end

--**********************************
--Ìá½»
--**********************************
function x808058_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x808058_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x808058_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x808058_OnItemChanged( sceneId, selfId, itemdataId )
end
