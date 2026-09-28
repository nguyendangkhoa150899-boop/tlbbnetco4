--»î¶¯¡ª¡ª¶Ò»»ÐÄ·¨¡¢ÃØ¼®
--MisDescBegin
--½Å±¾ºÅ
x808036_g_ScriptId = 808036
x808036_g_ExchangeXinfaBook_Active = 1

x808036_g_NeedItemCount_Miji = 7
x808036_g_NeedItemCount_Yaojue = 8
x808036_g_NeedItemID = 30505078
--MisDescEnd


--0ÉÙÁÖ 1Ã÷½Ì 2Ø¤°ï 3Îäµ± 4¶ëáÒ 5ÐÇËÞ 6´óÀí 7ÌìÉ½ 8ÏûÒ£
--************************************
--È¡µÃ½±ÀøÃØ¼®ID
--************************************
function x808036_GetAwardItemID_Miji( sceneId, selfId )
    local PlayerMenpai = GetMenPai( sceneId, selfId )
    local ItemID = -1;
    if 0 == PlayerMenpai then    --ÉÙÁÖ
        ItemID = 30308002
    end
    if 1 == PlayerMenpai then    --Ã÷½Ì
        ItemID = 30308003
    end
    if 2 == PlayerMenpai then    --Ø¤°ï
        ItemID = 30308004
    end
    if 3 == PlayerMenpai then    --Îäµ±
        ItemID = 30308005
    end
    if 4 == PlayerMenpai then    --¶ëáÒ
        ItemID = 30308006
    end
    if 5 == PlayerMenpai then    --ÐÇËÞ
        ItemID = 30308007
    end
    if 6 == PlayerMenpai then    --´óÀí
        ItemID = 30308008
    end
    if 7 == PlayerMenpai then    --ÌìÉ½
        ItemID = 30308009
    end
    if 8 == PlayerMenpai then    --ÏûÒ£
        ItemID = 30308010
    end

    return ItemID
end

--0ÉÙÁÖ 1Ã÷½Ì 2Ø¤°ï 3Îäµ± 4¶ëáÒ 5ÐÇËÞ 6´óÀí 7ÌìÉ½ 8ÏûÒ£
--************************************
--È¡µÃ½±ÀøÒª¾÷ID
--************************************
function x808036_GetAwardItemID_Yaojue( sceneId, selfId )
    local PlayerMenpai = GetMenPai( sceneId, selfId )
    local ItemID = -1;
    if 0 == PlayerMenpai then    --ÉÙÁÖ
        ItemID = 30308011
    end
    if 1 == PlayerMenpai then    --Ã÷½Ì
        ItemID = 30308012
    end
    if 2 == PlayerMenpai then    --Ø¤°ï
        ItemID = 30308013
    end
    if 3 == PlayerMenpai then    --Îäµ±
        ItemID = 30308014
    end
    if 4 == PlayerMenpai then    --¶ëáÒ
        ItemID = 30308015
    end
    if 5 == PlayerMenpai then    --ÐÇËÞ
        ItemID = 30308016
    end
    if 6 == PlayerMenpai then    --´óÀí
        ItemID = 30308017
    end
    if 7 == PlayerMenpai then    --ÌìÉ½
        ItemID = 30308018
    end
    if 8 == PlayerMenpai then    --ÏûÒ£
        ItemID = 30308019
    end

    return ItemID
end


--**************************************
--ÉèÖÃ±äÁ¿,±ê¼ÇÒÑ¾­¸øÓè¹ýÃØ¼®»òÕßÒª¾÷ÁË
--**************************************
function x808036_SetExchangeCompleteFlag( sceneId, selfId )
    SetMissionData( sceneId, selfId, MD_EXCHANGE_MIJIORYAOJUE, 1 )
end
--********************************************
--È¡µÃÊÇ·ñÒÑ¾­¸øÓè¹ýÃØ¼®»òÕßÒª¾÷ÁË.0ÎªÃ»¸øÓè¹ý
--********************************************
function x808036_GetExchangeCompleteFlag( sceneId, selfId )
    local CompleteFlag = GetMissionData( sceneId, selfId, MD_EXCHANGE_MIJIORYAOJUE ) --È¡³ö±êÖ¾
    
    if CompleteFlag > 0 then
        return 1
    else
        return 0    
    end
    
end

--**********************************
--¼ì²âÊÇ·ñÓÐ×ã¹»µÄÎïÆ·ÓÃÀ´½»»»ÃØ¼®
--**********************************
function x808036_CheckEnoughItem_Miji( sceneId, selfId )
    local TianshuID = x808036_g_NeedItemID
    
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, TianshuID )
	if ItemCount < x808036_g_NeedItemCount_Miji then
		return 0
	end
    
    return 1
end
--**********************************
--¼ì²âÊÇ·ñÓÐ×ã¹»µÄÎïÆ·ÓÃÀ´½»»»Òª¾÷
--**********************************
function x808036_CheckEnoughItem_Yaojue( sceneId, selfId )
    local TianshuID = x808036_g_NeedItemID
    
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, TianshuID )
	if ItemCount < x808036_g_NeedItemCount_Yaojue then
		return 0
	end

    return 1
end

--**********************************
--¶Ò»»ÃØ¼®ºÍÒª¾÷
--**********************************
function x808036_Exchange_MijiAndYaojue( sceneId, selfId, targetId, ItemDesc, AddAward )
    --ItemDesc 1ÎªÃØ¼®2ÎªÒª¾÷
    local Item_Miji = 1
    local Item_Yaojue = 2
    
    local CompleteFlag = x808036_GetExchangeCompleteFlag( sceneId, selfId )
    if 1 == CompleteFlag then
        local strDirText05 = "Xin l²i, c½ hµi trao ð±i m§t t¸ch và yªu quyªt chï có mµt l¥n."
		BeginEvent(sceneId)
			AddText( sceneId, strDirText05 )
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
		return    
    end
    
    local strDirText00 = ""
    if Item_Miji == ItemDesc then
        local CanExchange = x808036_CheckEnoughItem_Miji( sceneId, selfId )
		if 1 ~= CanExchange then
	        strDirText00 = "Trao ð±i m§t t¸ch c¥n 7 trang còn thiªu cüa Thiên thß, s¯ lßþng cüa các hÕ chßa ðü. Hãy t§p hþp ðü r°i quay lÕi tìm tÕi hÕ."    
		end
    end
    
    if Item_Yaojue == ItemDesc then
        local CanExchange = x808036_CheckEnoughItem_Yaojue( sceneId, selfId )
		if 1 ~= CanExchange then
		    strDirText00 = "Trao ð±i yªu quyªt c¥n 8 trang còn thiªu cüa Thiên thß, s¯ lßþng cüa các hÕ chßa ðü. Hãy t§p hþp ðü r°i quay lÕi tìm tÕi hÕ."
		end        
    end
    
    if "" ~= strDirText00 then
        BeginEvent(sceneId)
				AddText( sceneId, strDirText00 )
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
		return
    end
    
    
    local PlayerLevel = GetLevel( sceneId, selfId )
    if PlayerLevel < 30 then
		BeginEvent( sceneId )
		    local strDirText04 = "Chï có t× c¤p ðµ 30 tr· lên m¾i có th¬ sØ døng các trang Thiên thß còn thiªu ð¬ trao ð±i m§t t¸ch và yªu quyªt"
		    AddText( sceneId, strDirText04 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return    
    end
    
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
		BeginEvent( sceneId )
		    local strDirText01 = "Túi ðñng ð° cüa các hÕ không ðü rµng, không th¬ nh§n ðßþc v§t ph¦m giäi thß·ng. Hãy sØa lÕi túi ðñng ð° r°i quay lÕi tìm tÕi hÕ."
		    AddText( sceneId, strDirText01 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
	
	if 0 == AddAward then  --²»ÕæÕý¸øÓèÎïÆ·,Ö»ÊÇ×öÒ»´Î¼ì²é
		BeginEvent(sceneId)
			local strDirText02 = "C½ hµi trao ð±i tâm pháp m§t t¸ch chï có 1 l¥n, sau khi ð±i mµt loÕi tâm pháp ho£c m§t t¸ch b¤t kÏ s¨ không th¬ ð±i sang loÕi khác. Các hÕ ð°ng ý trao ð±i không?"
			local strDirText03 = "Duy®t"
	        
			AddText( sceneId, strDirText02 )
	        
			if Item_Yaojue == ItemDesc then
				AddNumText(sceneId, x808036_g_ScriptId, strDirText03, 1, 4 )
			end
			if Item_Miji == ItemDesc then
				AddNumText(sceneId, x808036_g_ScriptId, strDirText03, 1, 3 )
			end
	        
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
    end
    
    if 1 == AddAward then   --´ËÊ±»á¸øÓèÎïÆ·
		if Item_Yaojue == ItemDesc then
			x808036_SetAward_Yaojue( sceneId, selfId, targetId )
		end
		if Item_Miji == ItemDesc then
		    x808036_SetAward_Miji( sceneId, selfId, targetId )
		end    
    end
        
end

--**********************************
--¶Ò»»ÃØ¼®
--**********************************
function x808036_Exchange_Miji( sceneId, selfId, targetId )
    x808036_Exchange_MijiAndYaojue( sceneId, selfId, targetId, 1, 0 )	
end

--**********************************
--¶Ò»»Òª¾÷
--**********************************
function x808036_Exchange_Yaojue( sceneId, selfId, targetId )
    x808036_Exchange_MijiAndYaojue( sceneId, selfId, targetId, 2, 0 )
end


--**********************************
--¸øÍæ¼ÒÒª¾÷
--**********************************
function x808036_SetAward_Yaojue( sceneId, selfId, targetId )
	local CompleteFlag = x808036_GetExchangeCompleteFlag( sceneId, selfId )

	if( CompleteFlag ~= 1 ) then    --±êÖ¾Îª1Îª³É¹¦
		x808036_SetExchangeCompleteFlag( sceneId, selfId )
		local Ret = LuaFnDelAvailableItem(sceneId, selfId, x808036_g_NeedItemID, x808036_g_NeedItemCount_Yaojue )
	    
	    if Ret > 0 then      --É¾³ýÊýÁ¿ºÍÒªÇóÊýÁ¿Ò»ÖÂ	        	      
			local AwardID = x808036_GetAwardItemID_Yaojue( sceneId, selfId )			    
			if -1 ~= AwardID then
				BeginAddItem(sceneId)        --¸øÓèÍæ¼ÒÒª¾÷
					AddItem( sceneId, AwardID, 1 )
				local Ret = EndAddItem(sceneId,selfId)
				if Ret > 0 then
					AddItemListToHuman(sceneId,selfId)
					local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					local PlayerName = GetName( sceneId, selfId )
					local PlayerInfoName = "#{_INFOUSR"..PlayerName .."}"
					local ItemInfo = "#{_INFOMSG".. szItemTransfer .."}"
					
					local SysStr = PlayerInfoName.."SØ døng "..(x808036_g_NeedItemCount_Yaojue).." các trang Thiên thß còn thiªu, trao ð±i thành công v¾i Cung Thái Vân(170,122) · ÐÕi Lý mµt quy¬n "..ItemInfo.."."
					BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
	
				end
				
			end
		end
		
	end
end

--**********************************
--¸øÍæ¼ÒÃØ¼®
--**********************************
function x808036_SetAward_Miji( sceneId, selfId, targetId )
	local CompleteFlag = x808036_GetExchangeCompleteFlag( sceneId, selfId )

	if( CompleteFlag ~= 1 ) then    --±êÖ¾Îª1Îª³É¹¦
		x808036_SetExchangeCompleteFlag( sceneId, selfId )
		local Ret = LuaFnDelAvailableItem(sceneId, selfId, x808036_g_NeedItemID, x808036_g_NeedItemCount_Miji )
	    
	    if Ret > 0 then      --É¾³ýÊýÁ¿ºÍÒªÇóÊýÁ¿Ò»ÖÂ	        	      
			local AwardID = x808036_GetAwardItemID_Miji( sceneId, selfId )			    
			if -1 ~= AwardID then
				BeginAddItem(sceneId)        --¸øÓèÍæ¼ÒÃØ¼®
					AddItem( sceneId, AwardID, 1 )
				local Ret = EndAddItem(sceneId,selfId)
				if Ret > 0 then
					AddItemListToHuman(sceneId,selfId)
					local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					local PlayerName = GetName( sceneId, selfId )
					local PlayerInfoName = "#{_INFOUSR"..PlayerName .."}"
					local ItemInfo = "#{_INFOMSG".. szItemTransfer .."}"
					
					local SysStr = PlayerInfoName.."SØ døng "..(x808036_g_NeedItemCount_Miji).." các trang Thiên thß còn thiªu, trao ð±i thành công v¾i Cung Thái Vân(170,122) · ÐÕi Lý mµt quy¬n "..ItemInfo.."."
					BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
	
				end
				
				
			end
		end
		
	end
	    
end


--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x808036_OnDefaultEvent( sceneId, selfId, targetId )
    
    x808036_CheckRightTime()
    
    if 1 ~= x808036_g_ExchangeXinfaBook_Active then    --Ã»»î¶¯µÄÊ±ºò¾Í²»Ö´ÐÐ(ÈÝ´í´¦Àí,ÕýÈ·Á÷³Ì²»Ó¦µ÷ÓÃµ½ÕâÀï)
        return
    end
    
    local TextNum = GetNumText()
    if TextNum == 1 then        --µãÁË¶Ò»»ÃØ¼®
        x808036_Exchange_Miji( sceneId, selfId, targetId )
    end
    
    if TextNum == 2 then        --µãÁË¶Ò»»Òª¾÷
        x808036_Exchange_Yaojue( sceneId, selfId, targetId )
	end
	
	if TextNum == 3 then        --µãÁË¶Ò»»ÃØ¼® --È·¶¨	    
	    x808036_Exchange_MijiAndYaojue( sceneId, selfId, targetId, 1, 1 )
    end
    
    if TextNum == 4 then        --µãÁË¶Ò»»Òª¾÷ --È·¶¨
        x808036_Exchange_MijiAndYaojue( sceneId, selfId, targetId, 2, 1 )
	end
	
    if TextNum == 5 then
        local strContex = "#{EXCHANGEXFMJ_HELP_001}"
        BeginEvent(sceneId)
            AddText( sceneId, strContex )
        EndEvent()
        DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--¼ì²âÊÇ·ñÕýÈ·µÄ»î¶¯Ê±¼ä
--**********************************
function x808036_CheckRightTime()
    local DayTime = GetDayTime()
    
    if DayTime < 7107 then      --07Äê107Ìì(4ÔÂ18ºÅ)
       x808036_g_ExchangeXinfaBook_Active = 0
       return 0    --´ËÇ°·Ç»î¶¯Ê±¼ä
    end
    
    if DayTime >= 7123 then      --07Äê114Ìì(5ÔÂ4ºÅ)
       x808036_g_ExchangeXinfaBook_Active = 0
       return 0    --´Ëºó»î¶¯ÒÑ¾­½áÊø
    end
    
    x808036_g_ExchangeXinfaBook_Active = 1
    return 1
    
end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x808036_OnEnumerate( sceneId, selfId, targetId )
    
    x808036_CheckRightTime()
    
    if 1 ~= x808036_g_ExchangeXinfaBook_Active then
        return
    end
    
    local strMiji = "Ð±i m§t t¸ch c¤p 35"
    local strYaojue = "Ð±i yªu quyªt c¤p 65"
    
    AddNumText(sceneId, x808036_g_ScriptId, strMiji, 1, 1 )
    AddNumText(sceneId, x808036_g_ScriptId, strYaojue, 1, 2 )
    
    AddNumText(sceneId, x808036_g_ScriptId, "V« ð±i m§t t¸ch, yªu quyªt", 11, 5 )
    
end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x808036_CheckAccept( sceneId, selfId )

end

--**********************************
--½ÓÊÜ
--**********************************
function x808036_OnAccept( sceneId, selfId )
end

--**********************************
--·ÅÆú
--**********************************
function x808036_OnAbandon( sceneId, selfId )
end

--**********************************
--¼ÌÐø
--**********************************
function x808036_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x808036_CheckSubmit( sceneId, selfId )
end

--**********************************
--Ìá½»
--**********************************
function x808036_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x808036_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x808036_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x808036_OnItemChanged( sceneId, selfId, itemdataId )
end
