--×°±¸¼õÉÙÐÞÀíÊ§°Ü´ÎÊý
--½Å±¾ºÅ
x809265_g_ScriptId = 809265

--¼õÉÙÐÞÀíÊ§°Ü´ÎÊýUI 1005

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x809265_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--¼õÉÙÐÞÀíÊ§°Ü´ÎÊý
--**********************************
function x809265_EquipFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2)

	local ret = LuaFnIsItemLocked( sceneId, selfId, nItemIndex1 )
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"Không dùng ðßþc trang b¸ này");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Không th¬ sØ døng nhu§n v§t lµ");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemIndex2);


	local sy_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nItemIndex2 )
	if sy_index ~= 30900007 and sy_index ~= 30900000   then
		BeginEvent(sceneId)
		AddText(sceneId,"Giäm s¯ l¥n sØa chæa th¤t bÕi c¥n có nhu§n v§t lµ");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	local	text	= "SØa chæa thành công"
	local money = GetMoney( sceneId, selfId )
	local jiaozi = GetMoneyJZ(sceneId, selfId);
	local need_money = GetBagItemLevel( sceneId, selfId, nItemIndex1 ) * 1
	if money+jiaozi < need_money then
		text="HÕ s¯ l¥n sØa chæa trang b¸ th¤t bÕi c¥n có #{_MONEY%d}, ngân lßþng trên ngß¶i các hÕ không ðü"
		text=format( text, need_money )
		BeginEvent(sceneId)
		AddText(sceneId,text);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	local szMsg;
	local szName;
	szName = GetName( sceneId, selfId );		
	
	if sy_index == 30900007  then
		ret = LuaFnFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2, 1 )
		--szMsg = format( "#W#{_INFOUSR%s}#c00FFFF sau khi ðã sØ døng #W#{_INFOMSG%s}#c00FFFF, h°i phøc thành công s¯ l¥n sæa chæa cüa trang b¸ là 1 l¥n, tránh gãy vÞ sau 3 l¥n sØa chæa trang b¸ th¤t bÕi. ", szName, szTransfer );
	elseif sy_index == 30900000  then
		ret = LuaFnFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2, 0 )
		--szMsg = format( "#W#{_INFOUSR%s}#c00FFFF sau khi ðã sØ døng #W#{_INFOMSG%s}#c00FFFF, h°i phøc thành công s¯ l¥n sæa chæa cüa trang b¸ là 3 l¥n, tránh gãy vÞ sau 3 l¥n sØa chæa trang b¸ th¤t bÕi. ", szName, szTransfer );
	end

	if ret == 0 then
		LuaFnCostMoneyWithPriority( sceneId, selfId, 5000 ) --zchw
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);

		
		--AddGlobalCountNews( sceneId, szMsg )
		
	end
	
	if ret == -1 then
		text="L²i không xác ð¸nh"
	end

	if ret == -2 then
		text="Không dùng ðßþc trang b¸ này"
	end
	
	if ret == -3 then
		text="Không th¬ sØ døng nhu§n v§t lµ"
	end

	if ret == -4 then
		text="S¯ l¥n sØa chæa th¤t bÕi ðã th¤p nh¤t"
	end

	BeginEvent(sceneId)
		AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
