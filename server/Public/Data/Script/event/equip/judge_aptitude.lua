--×°±¸×ÊÖÊ¼ø¶¨
--½Å±¾ºÅ
x809261_g_ScriptId = 809261

--×°±¸×ÊÖÊ¼ø¶¨UI 1001

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x809261_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--×°±¸×ÊÖÊ¼ø¶¨
--**********************************
function x809261_FinishAdjust( sceneId, selfId, nItemIndex)
	local ret = LuaFnIsItemLocked( sceneId, selfId, nItemIndex)
	
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"Trang b¸ không th¬ dùng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsJudgeApt( sceneId, selfId, nItemIndex )
	if ret == -1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Không th¬ sØ døng v§t ph¦m này");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"V§t ph¦m này ðã giám ð¸nh ch¤t lßþng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 2 then
		BeginEvent(sceneId)
		AddText(sceneId,"V§t ph¦m này chßa giám ð¸nh, không th¬ tiªn hành giám ð¸nh ch¤t lßþng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 3 then
		BeginEvent(sceneId)
		AddText(sceneId,"V§t ph¦m này không có tß ch¤t, không th¬ tiªn hành giám ð¸nh ch¤t lßþng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	money = GetMoney( sceneId, selfId )+GetMoneyJZ(sceneId, selfId);
	equip_level = GetBagItemLevel( sceneId, selfId, nItemIndex )
	need_money = 20000
	if equip_level < 10 then
		need_money = 10
	elseif equip_level < 20 then
		need_money = 100
	elseif equip_level < 30 then
		need_money = 1000
	elseif equip_level < 40 then
		need_money = 3000
	elseif equip_level < 50 then
		need_money = 4000
	elseif equip_level < 60 then
		need_money = 5000
	elseif equip_level < 70 then
		need_money = 6000
	elseif equip_level < 80 then
		need_money = 7000
	elseif equip_level < 90 then
		need_money = 8000
	elseif equip_level < 100 then
		need_money = 10000
	elseif equip_level < 110 then
		need_money = 20000
	elseif equip_level < 120 then
		need_money = 30000
	else
		need_money = 40000
	end
	
	if money < need_money then
		BeginEvent(sceneId)
		AddText(sceneId,"Không ðü ngân lßþng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local jiaoZi, jinBi = LuaFnCostMoneyWithPriority( sceneId, selfId, need_money )
	if jiaoZi == -1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Không biªt l²i");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnJudgeApt( sceneId, selfId, nItemIndex )
	if ret == 1 then
		-- [08/10] giam dinh ghi ten: ten nguoi giam dinh hien duoi cac dong thuoc tinh (cho ten nguoi che tao)
		LuaFnSetItemCreator( sceneId, selfId, nItemIndex, GetName( sceneId, selfId ) )
		LuaFnRefreshItemInfo( sceneId, selfId, nItemIndex )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		BeginEvent(sceneId)
		AddText(sceneId,"Giám ð¸nh tß ch¤t trang b¸ thành công");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		BeginEvent(sceneId)
		AddText(sceneId,"Không biªt l²i");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
end




--**********************************
--ÖØÐÂ¼ø¶¨×°±¸×ÊÖÊ(Ï´×ÊÖÊ)
--**********************************
-- [NetCo4 10/10] CUSTOM % TAY TU CHAT (trang admin bot: Cong cu > Custom tay tu chat). Doc file moi lan tay, sua file co hieu luc ngay.
-- Engine goc (dich nguoc Server.elf): moi lan tay quay lai CA 6 chi so, moi chi so deu trong [cot 94 EquipBase, 255],
-- % = ItemAptRate.txt (250 = 20%, 251 = 25, 252 = 30, 253 = 35, 254 = 45, 255 = 60). Engine khong co ham GHI tu chat ->
-- chon moc dich theo file roi goi lai LuaFnReSetItemApt (trong server, khong ton them Kim Cuong Sa) toi khi % cong/thu CAO NHAT
-- cua mon (GetItemApt loai 1-4) bang dung moc, toi da 3000 lan. Tu chat ra la that -> tooltip client van dung.
-- File ./txt/NetCo4Cfg/tuchat.txt: "bat 1" = bat (khong co file / "bat 0" = engine goc); "<moc> <ti le %>" voi moc
-- 60 / 45 / 35 / 30 / 25 / 20 = ti le tay ra DUNG moc do; phan con lai (100 - tong) ra duoi 20%.
x809261_NetCo4_TCFile = "./txt/NetCo4Cfg/tuchat.txt"
x809261_NetCo4_TCMoc = { 60, 45, 35, 30, 25, 20 }

function x809261_NetCo4_TCCfg()
	local cfg = { bat = 0, p = {} }
	local h = openfile( x809261_NetCo4_TCFile, "r" )
	if h == nil then
		return cfg
	end
	local line = read( h, "*l" )
	while line do
		local _, _, k, v = strfind( line, "^%s*(%w+)%s+([%d%.]+)" )
		if k == "bat" then
			cfg.bat = tonumber( v ) or 0
		elseif k and tonumber( k ) then
			cfg.p[ tonumber( k ) ] = tonumber( v ) or 0
		end
		line = read( h, "*l" )
	end
	closefile( h )
	return cfg
end

-- % cong/thu cao nhat cua mon (GetItemApt loai 1-4; loai 5-6 la ne / chinh xac, tran 20%; chi so mon khong co -> 0)
function x809261_NetCo4_TCMax( sceneId, selfId, idx )
	local m = 0
	for t = 1, 4 do
		local v = GetItemApt( sceneId, selfId, idx, t )
		if v and v > m then
			m = v
		end
	end
	return m
end

function x809261_NetCo4_TuChat( sceneId, selfId, idx, ret )
	if ret ~= 1 and ret ~= 2 and ret ~= 3 then
		return ret
	end
	local cfg = x809261_NetCo4_TCCfg()
	if cfg.bat ~= 1 then
		return ret
	end
	local m = x809261_NetCo4_TCMax( sceneId, selfId, idx )
	if m <= 0 then
		return ret
	end
	local r = random( 1, 10000 )
	local cong = 0
	local dich = 0
	for i = 1, getn( x809261_NetCo4_TCMoc ) do
		local moc = x809261_NetCo4_TCMoc[ i ]
		cong = cong + floor( ( cfg.p[ moc ] or 0 ) * 100 + 0.5 )
		if dich == 0 and r <= cong then
			dich = moc
		end
	end
	local lan = 0
	while lan < 3000 do
		if dich > 0 and m == dich then
			break
		end
		if dich == 0 and m < 20 then
			break
		end
		local r2 = LuaFnReSetItemApt( sceneId, selfId, idx )
		if r2 ~= 1 and r2 ~= 2 and r2 ~= 3 then
			break
		end
		ret = r2
		lan = lan + 1
		m = x809261_NetCo4_TCMax( sceneId, selfId, idx )
	end
	return ret
end

function x809261_FinishReAdjust( sceneId, selfId, nEquItemIndex )

	-- ¼ì²â×°±¸ÊÇ·ñ¿ÉÓÃ....
	local ret = LuaFnIsItemLocked( sceneId, selfId, nEquItemIndex)
	if ret ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"Trang b¸ không sÇn dùng.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ¼ì²âÊÇ·ñÓÐ½ð¸ÕÉ°....
	itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, 30008034)
	itemCount2 = LuaFnGetAvailableItemCount(sceneId, selfId, 30008048)
	if itemCount < 1 and itemCount2 < 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ thiªu Kim Cß½ng Sa ho£c Kim Cß½ng Töa.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ¼ì²â×°±¸×ÊÖÊµÄ¼ø¶¨Çé¿ö....
	ret = LuaFnIsJudgeApt( sceneId, selfId, nEquItemIndex )
	if ret == -1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Không th¬ sØ døng v§t ph¦m này");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"V§t ph¦m này vçn chßa giám ð¸nh tß ch¤t qua, xin hãy tiªn hành giám ð¸nh tß ch¤t trang b¸ trß¾c.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--if ret == 1 then
	-- 1 ´ú±íÒÑ¾­¼ø¶¨¹ý×ÊÖÊ....
	--end
	if ret == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"V§t ph¦m này vçn chßa giám ð¸nh qua, xin hãy tiªn hành giám ð¸nh trß¾c.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"V§t ph¦m này không có tß ch¤t, không th¬ tiªn hành giám ð¸nh ch¤t lßþng.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ¼ì²â½ðÇ®ÊÇ·ñ¹»....
	money = GetMoney( sceneId, selfId )+GetMoneyJZ(sceneId, selfId);
	equip_level = GetBagItemLevel( sceneId, selfId, nEquItemIndex )
	need_money = 20 * equip_level + 50
	
	if money < need_money then
		BeginEvent(sceneId)
			AddText(sceneId,"Ngân lßþng các hÕ mang theo không ðü.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--¼ì²é×°±¸ÊÇ·ñÊÇ°ó¶¨
	ret = LuaFnGetItemBindStatus( sceneId, selfId, nEquItemIndex )
	--¿Û³ý¹æÔòÊÇ£º°ó¶¨ÓÅÏÈ£¬È»ºóÊÇ½ð¸ÕÉ°ÓÅÏÈ¡£Ò²¾Í¿Û³ý´ÎÐòÊÇ°ó¶¨½ð¸ÕÉ°£¬°ó¶¨½ð¸Õï±£¬½ð¸ÕÉ°£¬½ð¸Õï±
	--ÕÒ°ó¶¨½ð¸ÕÉ°
	local ShaPos = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008034, tonumber(1) )
	
	local needBind = 0
	
	if ret == 0 then
		if ShaPos ~= -1 then
			needBind = 1
		end
	end
	
	local ShaPos2 = -1
	if ShaPos == -1 then --ÕÒ°ó¶¨½ð¸Õï±
		ShaPos2 = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008048, tonumber(1))
	end
	
	if ret == 0 then
		if ShaPos2 ~= -1 then
			needBind = 1
		end
	end
	
	if ShaPos == -1 and ShaPos2 == -1 then --ÕÒ½ð¸ÕÉ°
		ShaPos = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008034, tonumber(0))
	end
	
	if ShaPos == -1 and ShaPos2 == -1 then --ÕÒ½ð¸Õï±
		ShaPos2 = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008048, tonumber(0))
	end

	local ShaInfo = 0
	-- ¿Û½ð¸ÕÉ°»ò½ð¸Õï±....
	if ShaPos ~= -1 then
		ShaInfo = GetBagItemTransfer( sceneId, selfId, ShaPos )
	
		ret = LuaFnEraseItem(sceneId, selfId, ShaPos)
		if ret ~= 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"Kim Cß½ng Sa không th¬ dùng");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	elseif ShaPos2 ~= -1 then
		ShaInfo = GetBagItemTransfer( sceneId, selfId, ShaPos2 )

		local r, t = LuaFnEraseItemTimes( sceneId, selfId, ShaPos2, 11 )

			BeginEvent(sceneId)
			local	szMsg				= format( "Kim Cß½ng Töa s¯ l¥n sØ døng còn lÕi %d/%d", tonumber(t), tonumber(11) );
			AddText(sceneId,szMsg);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
	end
	
	-- ÖØÐÂ¼ø¶¨×°±¸×ÊÖÊ....
	
	ret = LuaFnReSetItemApt( sceneId, selfId, nEquItemIndex )
	ret = x809261_NetCo4_TuChat( sceneId, selfId, nEquItemIndex, ret )   -- [NetCo4 10/10] custom % tay tu chat
	if ret == 1 or ret == 2 or ret == 3 then
		-- [08/10] giam dinh ghi ten: ten nguoi giam dinh hien duoi cac dong thuoc tinh (cho ten nguoi che tao)
		LuaFnSetItemCreator( sceneId, selfId, nEquItemIndex, GetName( sceneId, selfId ) )
		LuaFnRefreshItemInfo( sceneId, selfId, nEquItemIndex )
	end
	if ret == 1 then

		-- ¿ÛÇ®....
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money ) --zchw

		-- ¼Ó¼ø¶¨³É¹¦ÌØÐ§....
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
		--°ó¶¨
		if needBind == 1 then
			LuaFnItemBind( sceneId, selfId, nEquItemIndex )
		end

		BeginEvent(sceneId)
			AddText(sceneId,"Giám ð¸nh lÕi tß ch¤t thành công");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return

	elseif ret == 2 or ret == 3 then -- zchw for notice
		
		-- [ QUFEI 2007-09-17 17:22 UPDATE BugID 25245 ]
		-- ¿ÛÇ®....
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money ) --zchw

		-- ¼Ó¼ø¶¨³É¹¦ÌØÐ§....
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
		--°ó¶¨
		if needBind == 1 then
			LuaFnItemBind( sceneId, selfId, nEquItemIndex )
		end

		BeginEvent(sceneId)
			AddText(sceneId,"Giám ð¸nh lÕi tß ch¤t thành công");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)

		--·¢¹«¸æ....
		x809261_ReAdjustNotify( sceneId, selfId, ret, ShaPos, ShaPos2, ShaInfo, nEquItemIndex )

		return

	else
	
		BeginEvent(sceneId)
		AddText(sceneId,"Không biªt l²i");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return

	end

end


--**********************************
--ÖØÐÂ¼ø¶¨×°±¸×ÊÖÊ¹«¸æ
--**********************************
function x809261_ReAdjustNotify( sceneId, selfId, ret, ShaPos, ShaPos2, ShaInfo, nEquItemIndex )

	local Name = GetName(sceneId, selfId)		
	local itemInfo = GetBagItemTransfer( sceneId, selfId, nEquItemIndex )
	local strText
	local nEquipID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nEquItemIndex )

	--Ö»ÓÐÌØ¶¨¼¸ÀàµÄ×°±¸Ï´³öÁË250ÒÔÉÏµÄ×ÊÖÊÊ±....ÔÊÐí·¢Ï´³ö³¬¼¶×°±¸µÄ¹«¸æ....
	--1Ã±×Ó 2ÒÂ·þ 3ÊÖÌ× 4Ð¬ 15»¤¼ç
	-- Ìí¼Ó 0ÎäÆ÷¡¢6£¬11½äÖ¸£¨2¸ö£©¡¢12,13»¤·û£¨2¸ö£©
	if ret == 3 then
		local EquipPoint = GetItemEquipPoint( nEquipID )
		if EquipPoint~= 1 and EquipPoint~= 2 and EquipPoint~= 3 and EquipPoint~= 4 and EquipPoint~= 15  and EquipPoint ~= 0 and EquipPoint ~= 6 and EquipPoint ~= 11 and EquipPoint ~= 12 and EquipPoint ~= 13 and EquipPoint ~= 17 and EquipPoint ~= 18 and EquipPoint ~= 16 and EquipPoint ~= 8 and EquipPoint ~= 10 then
			ret = 2
		end
	end


	--Èç¹û×ÊÖÊÏ´µ½ÁË250ÒÔÉÏ¾Í»á·¢Ï´³ö³¬¼¶×°±¸µÄ¹«¸æ....
	if ret == 3 then

		if ShaPos ~= -1 then
			--strText = format("#W#{_INFOUSR%s}#{AQ_16}#{_INFOMSG%s}#{AQ_17}#{_INFOMSG%s}#{AQ_18}", Name, ShaInfo, itemInfo);
			--BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		elseif ShaPos2 ~= -1 then
			--strText = format("#W#{AQ_28}#{_INFOUSR%s}#H dùng #{_INFOMSG%s}#{AQ_29}#{_INFOMSG%s}#{AQ_30}", Name, ShaInfo, itemInfo);
			--BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		end

	end


	--Èç¹û×ÊÖÊÃ»ÓÐÏ´µ½ÁË250ÒÔÉÏ....µ«Ò²ÒÑ¾­´ïµ½ÓÅÐã....¾Í»á·¢Ï´³öÆÕÍ¨×°±¸µÄ¹«¸æ....
	if ret == 2 then

		if ShaPos ~= -1 then
			local rand = random( 4 )
			if rand == 1 then
				--strText = format("#W#{_INFOUSR%s}#{AQ_1}#{_INFOMSG%s}#{JinGangSha_1B}#{_INFOMSG%s}#{AQ_6}", Name, ShaInfo, itemInfo )
			elseif rand == 2 then
				--strText = format("#W#{_INFOUSR%s}#{AQ_3}#{_INFOMSG%s}#{JinGangSha_2B}#{_INFOMSG%s}#{AQ_8}", Name, ShaInfo, itemInfo )
			elseif rand == 3 then
				--strText = format("#W#{_INFOUSR%s}#{AQ_5}#{_INFOMSG%s}#{JinGangSha_3B}#{_INFOMSG%s}#{AQ_2}", Name, ShaInfo, itemInfo )
			elseif rand == 4 then
				--strText = format("#W#{_INFOUSR%s}#{AQ_7}#{_INFOMSG%s}#{JinGangSha_4B}#{_INFOMSG%s}#{AQ_4}", Name, ShaInfo, itemInfo )
			end
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		elseif ShaPos2 ~= -1 then
			local rand = random( 3 )
			if rand == 1 then
				--strText = format("#W#{_INFOUSR%s}#{AQ_19}#{_INFOMSG%s}#{AQ_20}#{_INFOMSG%s}#{AQ_21}", Name, ShaInfo, itemInfo )
			elseif rand == 2 then
				--strText = format("#W#{_INFOUSR%s}#{AQ_22}#{_INFOMSG%s}#{AQ_23}#{_INFOMSG%s}#{AQ_24}", Name, ShaInfo, itemInfo )
			elseif rand == 3 then
				--strText = format("#W#{AQ_25}#{_INFOUSR%s}#{AQ_26}#{_INFOMSG%s}#{AQ_27}#{_INFOMSG%s}.", Name, ShaInfo, itemInfo )
			end
			--BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		end

	end


end
