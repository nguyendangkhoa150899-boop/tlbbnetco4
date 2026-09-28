--[ ´´½¨ÈË QUFEI 2007-12-15 16:40 UPDATE BugID 26242 ]
--µ÷ÕûÍ·Ïñ
--½Å±¾ºÅ
x805030_g_ScriptId = 805030

--µ÷ÕûÍ·ÏñUI 112730

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x805030_OnEnumerate( sceneId, selfId, targetId )
	-- µ÷ÊÔÐÅÏ¢
	--BeginEvent(sceneId)
	--	AddText(sceneId, "½øÈëµ÷ÕûÍ·Ïñ½Å±¾");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)	
	
	-- ÎªÊ²Ã´Òª NPC Ãû×Ö£¿
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 112730)
	return
end

--**********************************
--µ÷ÕûÍ·Ïñ
--**********************************
function x805030_FinishAdjust( sceneId, selfId, styleId )
	
	-- Í·ÏñÎ´Ñ¡ÖÐ»òÑ¡ÖÐÎÞÐ§
	if styleId <= 0 then														
		x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_004}" )
		return		
	end
	
	-- µÃµ½µ÷ÕûÍ·ÏñËùÐèÎïÆ·µÄid¼°ÆäÊýÁ¿
	local ItemId, ItemCount = GetChangeHeadInfo(styleId)
		
	-- ·µ»ØÖµ·Ç·¨
	if ItemId < 0 or ItemCount < 0 then
		return
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, ItemId )

	--ÏûºÄÎïÆ·ÊÇ·ñ¹»ÓÃ»òËø¶¨
	if ItemCount > nItemNum then
		x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_005}" )
		return
	end

	-- ÎïÆ·¼ì²âÍ¨¹ý£¬ÔÙ¼ì²éÍæ¼Ò½ðÇ®
	local moneyJZ = GetMoneyJZ (sceneId, selfId);
	local money = GetMoney (sceneId, selfId);
	
	-- ÎïÆ·ºÍ½ðÇ®¼ì²â¶¼Í¨¹ý
	if (moneyJZ + money >= 50000)	then
		-- ÉèÖÃÍæ¼ÒÐÂÍ·Ïñ£¨»áÔÚÕâ¸ö¹ý³ÌÖÐÏûºÄÎïÆ·ºÍ½ðÇ®£©
		local ret = ChangePlayerHeadImage( sceneId, selfId, styleId )	
		if ret == 0  then																--³É¹¦
			x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_010}" )		
					
		-- ÒÔÏÂÎª²Ù×÷Ê§°ÜÊ±µÄ²¿·Ö´íÎóÐÅÏ¢
		elseif ret == 1 then														--ËùÑ¡µÄÍ·ÏñÓëÍæ¼Òµ±Ç°µÄÍ·ÏñÒ»ÖÂ
			x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_009}" )				
			return
		elseif ret == 3 then														--Ã»ÓÐÐèÒªÏûºÄµÄÎïÆ·»ò¸ÃÎïÆ·±»Ëø¶¨
			x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_005}" )				
			return
		else
			return
		end
	
	-- ½ðÇ®²»×ã	
	else
		x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_006}" )						
		return
	end
	
	-- ·¢²¼¹«¸æ
	local message;
	if random(2) == 1 then
		message = format("#W#{_INFOUSR%s}#{INTERHEAD_XML_007}", LuaFnGetName(sceneId, selfId));
	else
		message = format("#W#{INTERHEAD_XML_011}#{_INFOUSR%s}#{INTERHEAD_XML_012}", LuaFnGetName(sceneId, selfId));
	end

	BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
	-- ¼ÇÂ¼³É¹¦ÐÞ¸ÄÍ·ÏñµÄÍæ¼ÒÈÕÖ¾
	AuditChangeHead( sceneId, selfId, styleId )
		
end

--**********************************
-- ÆÁÄ»ÉÏµÄÐÑÄ¿ÌáÊ¾
--**********************************
function x805030_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--Ô¶³Ìµ÷ÓÃ2
--**********************************
function x805030_HeadFrame( sceneId, selfId, laceId, pos)
  if laceId < 0 or laceId > 10 or laceId == nil then
     return
  end
  if pos < 0 or pos > 29 or pos == nil then
     return
  end 
  local myItems = LuaFnGetItemTableIndexByIndex( sceneId, selfId, pos)
  local myHeadFrame = GetMissionData(sceneId,selfId,MY_HEADLACE_XIEZI)
  if myHeadFrame < 0 or myHeadFrame > 10 or myHeadFrame == nil then
     SetMissionData(sceneId,selfId,MY_HEADLACE_XIEZI,0)
     myHeadFrame = 0
  end
  if myHeadFrame == laceId then
     x805030_NotifyTip( sceneId, selfId, "Các hÕ ðang sØ døng khuôn m£t này r°i thay ð±i làm chi næa" )
     return
  end
  if myItems ~= 38010001 then
     x805030_NotifyTip( sceneId, selfId, "v§t ph¦m thay ð±i khuôn m£t không ðúng" )
     return
  end
  if LuaFnEraseItem( sceneId, selfId, pos) ~= 1 then
     x805030_NotifyTip( sceneId, selfId, "kh¤u tr× th¤t bÕi" )	
     return
  end

  SetMissionData(sceneId,selfId,MY_HEADLACE_XIEZI,laceId)
  x805030_NotifyTip( sceneId, selfId, "Chúc m×ng các hÕ thay ð±i khuôn m£t thành công" )

  BeginUICommand(sceneId)
  EndUICommand(sceneId)
  DispatchUICommand(sceneId,selfId,2017101201)

  return
end
