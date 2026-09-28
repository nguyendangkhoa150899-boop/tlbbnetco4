-- ¶Ò»»ÓñÍÃÁåîõ

-- ½Å±¾ºÅ
x050017_g_ScriptId = 050017

x050017_g_eventId_cancel = 0;		-- È¡Ïû
x050017_g_eventId_redeem = 1;		-- ¶Ò»»
x050017_g_eventId_redeem_5 = 2;		-- ¶Ò»»5¼¶
x050017_g_eventId_redeem_45 = 3;	-- ¶Ò»»45¼¶
x050017_g_eventId_redeem_55 = 4;	-- ¶Ò»»55¼¶
x050017_g_eventId_redeem_65 = 5;	-- ¶Ò»»65¼¶
x050017_g_eventId_about = 10;		-- ¹ØÓÚ

--¶Ò»»ÁÐ±í
x050017_g_redeemList = {};
 x050017_g_redeemList[x050017_g_eventId_redeem_5] = {count=10, level=5, item=30505126, petName="Thö ng÷c"}
x050017_g_redeemList[x050017_g_eventId_redeem_45] = {count=45, level=45, item=30505127, petName="HÕo nguy®t thö ng÷c"}
x050017_g_redeemList[x050017_g_eventId_redeem_55] = {count=55, level=55, item=30505128, petName="Thi«m cung thö ng÷c"}
x050017_g_redeemList[x050017_g_eventId_redeem_65] = {count=65, level=65, item=30505129, petName="H¢ng nga thö ng÷c"}

--ÐèÇóµÀ¾ß
x050017_g_redeemItemId = 30505125;

--»î¶¯Ê±¼ä
x050017_g_StartDayTime = 8257   --»î¶¯¿ªÊ¼Ê±¼ä 2008-9-14,°üº¬µ±ÈÕ
x050017_g_EndDayTime = 8304   --»î¶¯½áÊøÊ±¼ä 2008-10-31,°üº¬µ±ÈÕ

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x050017_OnEnumerate( sceneId, selfId, targetId )
	local check = x050017_IsMidAutumnPeriod(sceneId, selfId);
	if not check or check ~= 1 then
		return
	end
	AddNumText(sceneId, x050017_g_ScriptId, "Ta mu¯n ð±i thö ng÷c", 6, x050017_g_eventId_redeem);
	--AddNumText(sceneId, x050017_g_ScriptId, "V« thö ng÷c chuông", 11, x050017_g_eventId_about);
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x050017_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾
	local selEventId = GetNumText();
	if selEventId then
		if selEventId == x050017_g_eventId_redeem then
			BeginEvent(sceneId);
				AddText( sceneId, "#{YUTUXIAFAN_DB1}");
				AddNumText(sceneId, x050017_g_ScriptId, "Ð±i l¤y Thö ng÷c 5 c¤p", 6, x050017_g_eventId_redeem_5);
				AddNumText(sceneId, x050017_g_ScriptId, "Ð±i l¤y HÕo nguy®t thö ng÷c 45 c¤p", 6, x050017_g_eventId_redeem_45);
				AddNumText(sceneId, x050017_g_ScriptId, "Ð±i l¤y Thi«m cung thö ng÷c 55 c¤p", 6, x050017_g_eventId_redeem_55);
				AddNumText(sceneId, x050017_g_ScriptId, "Ð±i l¤y H¢ng nga thö ng÷c 65 c¤p", 6, x050017_g_eventId_redeem_65);
				AddNumText(sceneId, x050017_g_ScriptId, "TÕm th¶i không ð±i", 6, x050017_g_eventId_cancel);
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
			return 1;
		elseif selEventId == x050017_g_eventId_redeem_5
			or selEventId == x050017_g_eventId_redeem_45
			or selEventId == x050017_g_eventId_redeem_55
			or selEventId == x050017_g_eventId_redeem_65 then
			local redeemItem = x050017_g_redeemList[selEventId];
			if not redeemItem then
				x050017_NotifyBox(sceneId, selfId, targetId, "Chßa m· ðÕo cø, không th¬ ð±i!");
				return 0;
			end
			
			local redeemItemName = GetItemName(sceneId, x050017_g_redeemItemId);
			local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050017_g_redeemItemId);
			if not itemCount or itemCount < redeemItem.count then
				x050017_NotifyBox(sceneId, selfId, targetId, "Ð±i "..GetItemName(sceneId, redeemItem.item).." c¥n "..redeemItem.count.." cái "..redeemItemName.." ngài trên ngß¶i "..redeemItemName.." không ðü, không th¬ ð±i");
				return 0;
			end
			
			local addItemIndex;
			BeginAddItem(sceneId);
				addItemIndex = AddItem(sceneId, redeemItem.item, 1);
			local ret = EndAddItem(sceneId, selfId);
			if not ret or ret ~= 1 then
				x050017_NotifyBox(sceneId, selfId, targetId, "Tay nãy ð¥y ho£c các hÕ ðang m®t möi không th¬ ð±i");
				return 0;
			end
			
			local delRet = LuaFnDelAvailableItem(sceneId, selfId, x050017_g_redeemItemId, redeemItem.count);
			if not delRet or delRet ~= 1 then
				x050017_NotifyBox(sceneId, selfId, targetId, "Không th¬ kh¤u tr× "..GetItemName(sceneId, redeemItem.item)..".");
				return 0;
			end
			
			AddItemListToHuman(sceneId, selfId);
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
			
			local itemTransfer;
			if addItemIndex and addItemIndex  > -1 then
				itemTransfer = GetItemTransfer(sceneId, selfId, addItemIndex);
			end
			
			if itemTransfer then
				if selEventId == x050017_g_eventId_redeem_45 then
					msg = "#YNhÕc Thß¶ng Viên#P các v¸ xem#W#{_INFOUSR"..GetName(sceneId, selfId).."}# s¡p dùng #{_INFOMSG"..itemTransfer.."}#P ðáng yêu #GHÕo nguy®t thö ng÷c #W";
				elseif selEventId == x050017_g_eventId_redeem_55 then
					msg = "#YNhÕc Thß¶ng Viên#P nß½ng tØ, mau ra ðây xem #W#{_INFOUSR"..GetName(sceneId, selfId).."}# lÕi dùng #{_INFOMSG"..itemTransfer.."} tri®u h°i #GThi«m cung thö ng÷c #P";
				elseif selEventId == x050017_g_eventId_redeem_65 then
					msg = "#YNhÕc Thß¶ng Viên#P cùng Lão thei6n gia a! ChÆng l¨ là trong truy«n thuyªt thö ng÷c t±ng ðµng viên b¤t thành #W#{_INFOUSR"..GetName(sceneId, selfId).."}# cûng ð±i #{_INFOMSG"..itemTransfer.."} tri®u h°i #GH¢ng nga thö ng÷c";
				else
					msg = "#YNhÕc Thß¶ng Viên#P sét ðánh lÕp! Tr¶i mßa lÕp! Thö ng÷c lÕi hÕ phàm #W#{_INFOUSR"..GetName(sceneId, selfId).."}# chiªm ðßþc trong truy«n thuyªt #{_INFOMSG"..itemTransfer.."} r¯t cuµc có th¬ tri®u h°i #G Thö ng÷c";
				end
				
				if msg then
					BroadMsgByChatPipe(sceneId, selfId, msg, 4);
				end
			end
			
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
			return 1;
		elseif selEventId == x050017_g_eventId_cancel then
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		elseif selEventId == x050017_g_eventId_about then
			BeginEvent(sceneId);
				AddText( sceneId, "#{YUTUXIAFAN_ABOUT}");
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
			return 1;
		end
	end
end

--**********************************
--¶Ô»°´°¿ÚÐÅÏ¢ÌáÊ¾
--**********************************
function x050017_NotifyBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÐÑÄ¿ÐÅÏ¢ÌáÊ¾
--**********************************
function x050017_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--»î¶¯ÊÇ·ñ¿ªÆô
--**********************************
function x050017_IsMidAutumnPeriod(sceneId, selfId)
	local curDay = GetDayTime();
	if not curDay then
		return 0;
	end

	if curDay < x050017_g_StartDayTime or curDay > x050017_g_EndDayTime then
		return 0;
	end

	return 1
end
