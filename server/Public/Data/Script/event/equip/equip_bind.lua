--×°±¸°ó¶¨
--½Å±¾ºÅ
x809266_g_ScriptId = 809266

--×°±¸°ó¶¨UI 1005

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x809266_OnEnumerate( sceneId, selfId, targetId )
	
end

--**********************************
--×°±¸°ó¶¨
--**********************************
function x809266_FinishBind( sceneId, selfId, itemIndex1, itemIndex2 )
	local text = ""
	local ret = LuaFnIsItemLocked( sceneId, selfId, itemIndex1 )
	
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"Trang b¸ này không th¬ dùng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- ñÒÉÙÎ¢£¬2008.6.11¡£ÖØÂ¥½ä10422016£¬ÖØÂ¥Óñ10423024ÎÞ·¨Ãú¿Ì¡£
	local itemTableIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, itemIndex1 )
	if itemTableIndex == 10422016 or itemTableIndex == 10423024 then
		BeginEvent(sceneId)
		AddText(sceneId,"Trang b¸ này không th¬ kh¡c minh");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsItemAvailable( sceneId, selfId, itemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Kh¡c minh phù không th¬ dùng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local equip_level = GetBagItemLevel( sceneId, selfId, itemIndex1 )
	local gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, itemIndex2 )
	if equip_level < 50 then
		if gem_index ~= 30900013 then
			--µÍ¼¶Ëø¶¨·û
			BeginEvent(sceneId)
			AddText(sceneId,"Trang b¸ kh¡c minh c¥n có kh¡c minh phù c¤p th¤p.");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	else
		if gem_index ~= 30900014 then
			--¸ß¼¶Ëø¶¨·û
			BeginEvent(sceneId)
			AddText(sceneId,"Trang b¸ kh¡c minh c¥n có kh¡c minh phù c¤p cao.");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	end
	
	local EquipPoint = LuaFnGetBagEquipType( sceneId, selfId, itemIndex1 )
	local need_money = 0
	local HumanMoney = LuaFnGetMoney( sceneId, selfId ) + GetMoneyJZ(sceneId, selfId);
	if EquipPoint == HEQUIP_WEAPON or EquipPoint == HEQUIP_ARMOR then
		need_money = 500 + equip_level * 200
	else
		need_money = 250 + equip_level * 100
	end
	
	if HumanMoney < need_money then
		text="Mu¯n kh¡c trang b¸ này c¥n #{_EXCHG%d}, ngân lßþng trên ngß¶i các hÕ không ðü"
		text=format( text, need_money )
		BeginEvent(sceneId)
		AddText(sceneId,text);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--¼ì²éÊÇ·ñÄÜ¹»Ëø¶¨
	ret = LuaFnLockCheck( sceneId, selfId, itemIndex1, need_money )

	if ret == 0 then --³É¹¦ÁË
		text="Trang b¸ kh¡c thành công"
		LuaFnEquipLock( sceneId, selfId, itemIndex1 )
		LuaFnEraseItem( sceneId, selfId, itemIndex2 )
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
		
		szTranItm	= GetBagItemTransfer( sceneId, selfId, itemIndex1 )
		if szTranItm ~= nil then
			--szMsg		= format( "#W#{_INFOUSR%s}#{AQ_9}#W#{_INFOMSG%s}#{AQ_10}",
			--						LuaFnGetName( sceneId, selfId ), szTranItm )
									
			--¹«¸æ¾«¼ò£¬ÐèÇóµÈ¼¶30ÒÔÏÂµÄ×°±¸£¬²»·¢Ãú¿Ì¹«¸æ						
			if (equip_level >= 30) then
				--AddGlobalCountNews( sceneId, szMsg )
			end
			
		end
	end

	if ret == -1 then
		text="Không biªt l²i"
	end
	
	if ret == -2 then
		text="Không dùng ðßþc trang b¸ này"
	end
	
	if ret == -3 then
		text="Trang b¸ ðã ðßþc kh¡c"
	end

	BeginEvent(sceneId)
	AddText(sceneId,text);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end



--**********************************
--×°±¸½â³ý°ó¶¨
--**********************************
function x809266_FinishUnBind( sceneId, selfId, itemIndex1, itemIndex2 )
	local text = ""
	local ret = LuaFnIsItemLocked( sceneId, selfId, itemIndex1 )
	
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"Trang b¸ chßa kh¡c minh, không c¥n tiªn hành tr× minh.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsItemAvailable( sceneId, selfId, itemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Tr× minh phù không th¬ dùng.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	

	local need_money = 10000
	local HumanMoney = LuaFnGetMoney( sceneId, selfId ) + GetMoneyJZ(sceneId, selfId);
	
	if HumanMoney < need_money then
		text="Mu¯n tr× minh trang b¸ c¥n #{_EXCHG%d}, ngân lßþng trên ngß¶i các hÕ không ðü"
		text=format( text, need_money )
		BeginEvent(sceneId)
		AddText(sceneId,text);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--¼ì²éÊÇ·ñÄÜ¹»³ýÃú
	ret = LuaFnUnLockCheck( sceneId, selfId, itemIndex1, need_money )

	if ret == 0 then --³É¹¦ÁË
		LuaFnEquipUnLock( sceneId, selfId, itemIndex1 )
		LuaFnEraseItem( sceneId, selfId, itemIndex2 )
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
		
		szTranItm	= GetBagItemTransfer( sceneId, selfId, itemIndex1 )
		if szTranItm ~= nil then
			text		= format( "#{_INFOMSG%s} tr× minh thành công",
									szTranItm )
			--AddGlobalCountNews( sceneId, szMsg )
		end
	end

	if ret == -1 then
		text="Không biªt l²i"
	end
	
	if ret == -2 then
		text="Không dùng ðßþc trang b¸ này"
	end
	
	if ret == -3 then
		text="Trang b¸ chßa kh¡c minh, không c¥n tiªn hành tr× minh."
	end

	BeginEvent(sceneId)
	AddText(sceneId,text);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
