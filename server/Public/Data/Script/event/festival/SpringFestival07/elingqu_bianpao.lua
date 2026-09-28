--»î¶¯¡ª¡ª
--´º½Ú»î¶¯-ÁìÈ¡±ÞÅÚ

--½Å±¾ºÅ
x050054_g_ScriptId = 050054
--»î¶¯Ê±¼ä
x050054_g_StartDayTime = 8030   --»î¶¯½áÊøÊ±¼ä 2008-1-31
x050054_g_EndDayTime = 8044   --»î¶¯½áÊøÊ±¼ä 2008-2-14

--±ÞÅÚID
x050054_g_BianPaoID = 30505165

--x050054_g_strPlayerLvErr = "ÄãÈ¥Õ¨ÄêÊÞ£¡ÌìÄÄ£¬Äã»¹ÊÇ²»ÒªÈ¥ÁË£¬ÄêÊÞºÃ¿ÉÅÂµÄ£¬Äã»¹²»µ½10¼¶ÄØ£¬¸ù±¾²»¿ÉÄÜ´ò¹ýËüµÄ£¡"
--x050054_g_strNotSpace = "ÄúµÄ°ü¹üÃ»ÓÐ×ã¹»¿Õ¼ä£¬ÇëÕûÀíºóÔÙÀ´ÁìÈ¡¡£"
--x050054_g_strYiLingQu = "ÄãÒÑ¾­ÒªÁËºÜ¶à±ÞÅÚÁËÀ²£¡Äã¿ìÈ¥Õ¨ÄêÊÞ°É£¡µùËµÄêÊÞÅÜÁËÎÒÃÇµÄÉú»î¾ÍºÃÆðÀ´À²£¡"
--x050054_g_strGetBianPao = "ËÍÄãÒ»Ã¶±ÞÅÚ£¡¾ÍÒ»Ã¶Å¶£¡Äã¿´ÆðÀ´ºÃÀ÷º¦µÄ£¬Ò»¶¨ÄÜ¹»°ÑÄêÊÞ´ò°Ü£¡ÖÁÉÙ¡­¡­Ò²ÄÜ°ÑËüÏÅÅÜ°É¡£"

x050054_g_strPlayerLvErr = "#{NSBS_20071228_04}"
x050054_g_strNotSpace = "Tay näi cüa các hÕ không ðü không gian, hãy xªp lÕi và ðªn nh§n sau."
x050054_g_strYiLingQu = "#{NSBS_20071228_05}"
x050054_g_strGetBianPao = "#{NSBS_20071228_06}"

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x050054_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x050054_CheckRightTime()
	if 1 ~= isTime then
		return
	end
	
	local NumText = GetNumText()

	if NumText == 101 then
		--Áì¸öÈË±ÞÅÚ....
		x050054_GiveSelfBianPao( sceneId, selfId, targetId )
	end
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x050054_OnEnumerate( sceneId, selfId, targetId )

    local isTime = x050054_CheckRightTime()
    if 1 == isTime then
			AddNumText(sceneId, x050054_g_ScriptId, "Cho ta mµt quä pháo", 6, 101 )													
    end

end

--**********************************
--¼ì²â»î¶¯ÊÇ·ñÒÑ½áÊø
--**********************************
function x050054_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x050054_g_StartDayTime and curDayTime <= x050054_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--Áì¸öÈË±ÞÅÚ
--**********************************
function x050054_GiveSelfBianPao( sceneId, selfId, targetId )

	--¼ì²âÍæ¼ÒµÈ¼¶....
	if x050054_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--½ñÌìÒÑ¾­Áì¹ýµÄÊýÁ¿....
	local num = GetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_NUMBER )
	--ÉÏ´ÎÁìÈ¡Ê±¼ä....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_DAYTIME )
	local CurDayTime = GetDayTime()
	
	if CurDayTime <= lastDayTime then		
		if num >10 then--ÁìÈ¡ÊýÁ¿³¬¹ý10
			BeginEvent(sceneId)
				AddText( sceneId, x050054_g_strYiLingQu )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	else
		num = 50;
	end

	--¼ì²â±³°üÊÇ·ñÓÐµØ·½....
	if x050054_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	
	if x050054_GivePlayerBianPao( sceneId, selfId, targetId ) ==1 then
		SetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_DAYTIME, CurDayTime )
		SetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_NUMBER, num )
	end
	
end

	
--**********************************
--¼ì²âÍæ¼ÒµÈ¼¶ÊÇ·ñ·ûºÏÒªÇó
--**********************************
function x050054_CheckPlayerLv( sceneId, selfId, targetId )

	if GetLevel( sceneId, selfId ) < 10 then
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strPlayerLvErr )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		return 1
	end

end

--**********************************
--¼ì²âÍæ¼Ò±³°ü¿Õ¼äÊÇ·ñ×ã¹»
--**********************************
function x050054_CheckPacketSpace( sceneId, selfId, targetId )

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strNotSpace )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		return 1
	end

end

--**********************************
--¸øÍæ¼Ò±ÞÅÚ
--**********************************
function x050054_GivePlayerBianPao( sceneId, selfId, targetId )
			
	--¸ø±ÞÅÚ1×Ô¼ºµÄ....
	--local BagIndex = TryRecieveItem( sceneId, selfId, x050054_g_BianPaoID, QUALITY_MUST_BE_CHANGE )

	--if BagIndex ~= -1 then
		--LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
	--end
	BeginAddItem(sceneId)
	AddItem( sceneId, x050054_g_BianPaoID , 50 )
	local canAdd1 = EndAddItem(sceneId,selfId)
			
	if canAdd1 == 0  then
		--BeginEvent( sceneId )
			--AddText( sceneId, "ÄúµÄÎïÆ·À¸Ã»ÓÐ×ã¹»¿Õ¼ä£¬ÇëÏÂ´ÎÁìÈ¡Ê±Áô³ö×ã¹»ÎïÆ·À¸¿Õ¼ä¡£" )
		--EndEvent( sceneId )
		--DispatchMissionTips( sceneId, selfId )
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strNotSpace )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		AddItemListToHuman(sceneId,selfId)
				--local transfer = GetItemTransfer(sceneId,selfId,0)
				
				--local str1 = format( "#{_INFOUSR%s}", GetName(sceneId, selfId))
				--local str2 = format("#W#{_INFOMSG%s}", transfer)
				--local strMsg = str1..x500501_g_strDieNotice0..str2..x500501_g_strDieNotice1				
				--BroadMsgByChatPipe(sceneId, selfId, strMsg, 4)	
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strGetBianPao )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 1	
	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x050054_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x050054_OnAccept( sceneId, selfId )
end

--**********************************
--·ÅÆú
--**********************************
function x050054_OnAbandon( sceneId, selfId )
end

--**********************************
--¼ÌÐø
--**********************************
function x050054_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x050054_CheckSubmit( sceneId, selfId )
end

--**********************************
--Ìá½»
--**********************************
function x050054_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x050054_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x050054_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x050054_OnItemChanged( sceneId, selfId, itemdataId )
end
