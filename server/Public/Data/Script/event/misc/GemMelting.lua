--±¦Ê¯ÈÛÁ¶

--½Å±¾ºÅ
x800118_g_ScriptId	= 800118


function x800118_OnGemMelting( sceneId, selfId, GemItemPos1, GemItemPos2, GemItemPos3, NeedItemPos )

	if GemItemPos1 == -1 or GemItemPos2 == -1 or GemItemPos3 == -1 or NeedItemPos == -1 then
		return
	end

	--ÊÇ·ñÔÚ°²È«Ê±¼äÄÚ....Õâ¸öÅÐ¶Ïº¯ÊýÀïÃæ×Ô¼ºÓÐÌáÊ¾ÐÅÏ¢....
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return
	end
	
	-- ²»ÔÊÐíÓÐÖØ¸´µÄbagIndexList³öÏÖ added by dun.liu 2009.2.5
	if ScriptGlobal_IsUniqueNumberTable({GemItemPos1, GemItemPos2, GemItemPos3}) == 0 then
		return
	end

	local GemItemID1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemItemPos1 )
	local GemItemID2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemItemPos2 )
	local GemItemID3 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemItemPos3 )
	local NeedItemID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, NeedItemPos )

	--¼ì²âÊÇ·ñÊÇÓÐÍ¬ÑùµÄ±¦Ê¯....
	if GemItemID1 ~= GemItemID2 or GemItemID1 ~= GemItemID3 then
		x800118_NotifyTip( sceneId, selfId, "LoÕi hình bäo thÕch không ð°ng nh¤t, Bäo ThÕch luy®n th¤t bÕi." )
		return
	end

	--¼ì²âÊÇ·ñ¿ÉÒÔÈÛÁ¶....
	local ProductID, NeedID, NeedMoney = LuaFnGetGemMeltingInfo( GemItemID1 )
	if  -1 == ProductID then
		x800118_NotifyTip( sceneId, selfId, "bäo thÕch không th¬ luy®n, Bäo ThÕch luy®n th¤t bÕi." )
		return
	end

	--¼ì²âÊÇ·ñÓÐËùÐèÎïÆ·....
	if NeedID ~= NeedItemID then
		x800118_NotifyTip( sceneId, selfId, "Thiªu v§t ph¦m dung luy®n, Bäo ThÕch luy®n th¤t bÕi" )
		return
	end

	--¼ì²â½ðÇ®ÊÇ·ñ×ã¹»....
	local PlayerMoney = GetMoney( sceneId, selfId ) +  GetMoneyJZ(sceneId, selfId)  --½»×ÓÆÕ¼° Vega
	if PlayerMoney < NeedMoney then
		x800118_NotifyTip( sceneId, selfId, "Ti«n tài không ðü, Bäo ThÕch luy®n th¤t bÕi." )
		return
	end

	--¼ì²â²úÎïÊÇ·ñÐèÒª°ó¶¨....
	local bNeedBind = 0
	if LuaFnGetItemBindStatus(sceneId, selfId, GemItemPos1) == 1 then
	  bNeedBind = 1
	end
	if LuaFnGetItemBindStatus(sceneId, selfId, GemItemPos2) == 1 then
	  bNeedBind = 1
	end
	if LuaFnGetItemBindStatus(sceneId, selfId, GemItemPos3) == 1 then
	  bNeedBind = 1
	end
	if LuaFnGetItemBindStatus(sceneId, selfId, NeedItemPos) == 1 then
	  bNeedBind = 1
	end

	--¿Û³ý±¦Ê¯ºÍËùÐèÎïÆ·....
	--local GemItemInfo = GetBagItemTransfer( sceneId, selfId, GemItemPos1 )
	local NeedItemInfo = GetBagItemTransfer( sceneId, selfId, NeedItemPos )

	local ret = -1
	ret = LuaFnIsItemAvailable( sceneId, selfId, GemItemPos1 )
	if ret ~= 1 then
		x800118_NotifyTip( sceneId, selfId, "Bäo thÕch không th¬ sØ døng, Bäo ThÕch luy®n th¤t bÕi." )
		return
	end
	ret = LuaFnIsItemAvailable( sceneId, selfId, GemItemPos2 )
	if ret ~= 1 then
		x800118_NotifyTip( sceneId, selfId, "Bäo thÕch không th¬ sØ døng, Bäo ThÕch luy®n th¤t bÕi." )
		return
	end
	ret = LuaFnIsItemAvailable( sceneId, selfId, GemItemPos3 )
	if ret ~= 1 then
		x800118_NotifyTip( sceneId, selfId, "Bäo thÕch không th¬ sØ døng, Bäo ThÕch luy®n th¤t bÕi." )
		return
	end
	ret = LuaFnIsItemAvailable( sceneId, selfId, NeedItemPos )
	if ret ~= 1 then
		x800118_NotifyTip( sceneId, selfId, "V§t ph¦m c¥n dung luy®n không ðúng, Bäo ThÕch luy®n th¤t bÕi" )
		return
	end


	-- ±ØÐë±£Ö¤¿Û³ýÎïÆ·È«²¿³É¹¦£¬ÈÎºÎÒ»´ÎÊ§°Ü¶¼µ¼ÖÂÎÞ·¨ºÏ³É±¦Ê¯£¬²¢ÇÒÒÑ¾­¿Û³ýµÄ±¦Ê¯²»¹é»¹£¬added by dun.liu 2009.2.5
	if LuaFnEraseItem( sceneId, selfId, GemItemPos1 ) == 0 then
		x800118_NotifyTip( sceneId, selfId, "Kh¤u tr× v§t ph¦m th¤t bÕi, không th¬ dung luy®n bäo thÕch." )
		return
	end
	
	if LuaFnEraseItem( sceneId, selfId, GemItemPos2 ) == 0 then
		x800118_NotifyTip( sceneId, selfId, "Kh¤u tr× v§t ph¦m th¤t bÕi, không th¬ dung luy®n bäo thÕch." )
		return
	end
	
	if LuaFnEraseItem( sceneId, selfId, GemItemPos3 ) == 0 then
		x800118_NotifyTip( sceneId, selfId, "Kh¤u tr× v§t ph¦m th¤t bÕi, không th¬ dung luy®n bäo thÕch." )
		return
	end
	
	if LuaFnEraseItem( sceneId, selfId, NeedItemPos ) == 0 then
		x800118_NotifyTip( sceneId, selfId, "Kh¤u tr× v§t ph¦m th¤t bÕi, không th¬ dung luy®n bäo thÕch." )
		return
	end


	--¿ÛÇ®....
	ret = LuaFnCostMoneyWithPriority( sceneId, selfId, NeedMoney )      --½»×ÓÆÕ¼° Vega
	if ret < 0 then
		x800118_NotifyTip( sceneId, selfId, "Ti«n tài không ðü, Bäo ThÕch luy®n th¤t bÕi." )
		return
	end

	--¸øÍæ¼ÒÈÛÁ¶ºóµÄ±¦Ê¯....²»ÓÃ¼ì²â±³°üÊÇ·ñÓÐµØ·½....Ã»µØ·½Ç°±ßÒ²del³öµØ·½ÁË....
	local BagIndex = TryRecieveItem( sceneId, selfId, ProductID, QUALITY_MUST_BE_CHANGE )
	if BagIndex == -1 then
		x800118_NotifyTip( sceneId, selfId, "Tay näi ðã ð¥y, Bäo ThÕch luy®n th¤t bÕi." )
		return
	end
	if bNeedBind == 1 then
		LuaFnItemBind(sceneId, selfId, BagIndex)
	end
	local ProductItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )

	--Í³¼Æ....
	LuaFnAuditGemMelting( sceneId, selfId, GemItemID1, GemItemID2, GemItemID3, NeedItemID, ProductID )

	--ÐÑÄ¿ÌáÊ¾....
	x800118_NotifyTip( sceneId, selfId, "Mang 3 viên (#{_ITEM"..GemItemID1.."}) thành công luy®n thành mµt viên (#{_ITEM"..ProductID.."})" )

	--¹«¸æ....
	if LuaFnGetItemQuality(ProductID) >= 5 then
		local MeltingNPCTbl =
		{
			[0]   = "LÕc Dß½ng (178,185) Bành Hoài Ng÷c",
			[420] = "Thúc Hà C± Tr¤n (134,84) Kinh Khäm Thñc",
			[186] = "Lâu Lan (74,161) Kh¡c Lý Mµc",
		}
		local NPCInfo = MeltingNPCTbl[sceneId]
		local PlayerName = GetName(sceneId, selfId)
		--local strText = format("#{JKBS_081021_016}#{_INFOUSR%s}#{JKBS_081021_017}#{_ITEM%s}#{JKBS_081021_018}#{_INFOMSG%s}#{JKBS_081021_019}%s#{JKBS_081021_020}#{_INFOMSG%s}#{JKBS_081021_021}", PlayerName, GemItemID1, NeedItemInfo, NPCInfo, ProductItemInfo )
		--BroadMsgByChatPipe(sceneId,selfId, strText, 4)
	end

	--ÈÛÁ¶³É¹¦ÌØÐ§....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)

end

--**********************************
--ÐÑÄ¿ÌáÊ¾
--**********************************
function x800118_NotifyTip( sceneId, selfId, Msg )

	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
