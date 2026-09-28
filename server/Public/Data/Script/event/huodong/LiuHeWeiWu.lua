-- ÁùºÏÍþÎä 20090512
-- Ð»ãp

x889058_g_ScriptId = 889058


-- ÐèÇóÎïÆ·ID
x889058_g_NeedItemID		= {
													30504101,		-- ÁùºÏÁîÅÆ(¶«)
													30504102,		-- ÁùºÏÁîÅÆ(±±)
													30504103,		-- ÁùºÏÁîÅÆ(Î÷)
													30504104,		-- ÁùºÏÁîÅÆ(ÄÏ)
													30504105,		-- ÁùºÏÁîÅÆ(ÉÏ)
													30504106,		-- ÁùºÏÁîÅÆ(ÏÂ)
													}

-- ½±ÀøÏà¹Ø
x889058_g_AwradInfo		=	{
	{ItemId = 10422016, LackItemMsg = "Ð¬ ð±i #YTrùng Lâu Gi¾i #Wc¥n có #G6 t¤m #W#YLøc hþp l®nh bài #Wkhông gi¯ng nhau, mong thu th§p ðü #G6 t¤m #YLøc hþp l®nh bài #Wr°i hãy ðªn tìm ta.", RetDlg = "Cäm ½n các hÕ ðã c¯ng hiªn công sÑc cho tri«u ðình, v§t ph¦m #YTrùng Lâu Gi¾i #Wmong hãy giæ l¤y xem nhß quà cüa tri«u ðình ban t£ng.", Notice = "ÐÕt ðßþc v§t ph¦m: Trùng Lâu Gi¾i", BagFullDlg = "Mong hãy s¡p xªp 1 ô ðÕo cø tr¯ng, nªu không thì ta không th¬ ðßa #YTrùng Lâu Gi¾i #Wcho các hÕ."},	-- ÖØÂ¥½ä
	{ItemId = 10423024, LackItemMsg = "Ð¬ ð±i #YTrùng Lâu Ng÷c #Wc¥n có #G6 t¤m #W#YLøc hþp l®nh bài #W không gi¯ng nhau, mong thu th§p ðü #G6 t¤m #YLøc hþp l®nh bài #Wr°i hãy ðªn tìm ta.", RetDlg = "Cäm ½n các hÕ ðã c¯ng hiªn công sÑc cho tri«u ðình, v§t ph¦m #YTrùng Lâu Ng÷c #Wmong hãy giæ l¤y xem nhß quà cüa tri«u ðình ban t£ng.", Notice = "ÐÕt ðßþc v§t ph¦m: Trùng Lâu Ng÷c", BagFullDlg = "Xin hãy s¡p xªp 1 ô ðÕo cø tr¯ng, nªu không thì ta không th¬ ðßa #YTrùng Lâu Ng÷c #Wcho các hÕ."}	-- ÖØÂ¥Óñ
}


--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x889058_OnEnumerate( sceneId, selfId, targetId )
	
	AddNumText( sceneId, x889058_g_ScriptId, "#GÐ±i Løc Hþp L®nh Bài l¤y Trùng Lâu Gi¾i", 6, 10 )					-- °´Å¥£º ÁùºÏÍþÎä
	AddNumText( sceneId, x889058_g_ScriptId, "#GGi¾i thi®u HÕ Chi V§n", 11, 11 )				-- °´Å¥£º ÁùºÏÍþÎä½éÉÜ
	
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x889058_OnDefaultEvent( sceneId, selfId, targetId )

	local nNumText = GetNumText( )
	
	if( nNumText == 10 ) then
		-- µã»÷ ÁùºÏÍþÎä
		-- BeginEvent( sceneId )
		-- AddText( sceneId, "#{LHZD_090513_01}#r" )
		-- for i, item in x889058_g_AwradInfo do
		-- 	AddRadioItemBonus( sceneId, item.ItemId, 1 )
		-- end
		-- EndEvent(sceneId)
		-- DispatchEventList( sceneId, selfId, targetId )
		-- DispatchMissionContinueInfo( sceneId, selfId, targetId, x889058_g_ScriptId, 0 )
		x889058_GiveGift( sceneId, selfId, targetId, 10422016 )
	elseif( nNumText == 11 ) then
		-- µã»÷ ÁùºÏÍþÎä½éÉÜ
		BeginEvent( sceneId )	
			AddText( sceneId, "Ð¬ cäm kích sñ üng hµ cüa các game thü ðã üng hµ Thiên Long Bát Bµ,  nhân c½ hµi kh·i ðµng phiên bän m¾i l¥n này,  s¨ tung m£t hàng L­ Bao Nguyên Bäo bán · Ti®m Nguyên Bäo #Y HÕ Chi V§n #W. SØ døng s¨ nh§n ðßþc #Y Thiên Cang Cß¶ng Hóa Tinh Hoa #W,  #Y Thiên Cang Cß¶ng Hoá Lµ#W,  #Y Cån C¯t Ðan#W,  #Y Th¶i Trang#W,  #Y Thú CßÞi:  Nhß Ý Hùng#W,  #Y Thú CßÞi:  Tuyªt Khiêu#W,  #Y TrÑng Trân Thú:  Hùng Miêu#W,  #Y Bäo ThÕch C¤p 3 #W,  #Y Bäo ThÕch C¤p 7,  #Y Trân Thú Qu¥n KÛ Nång Thß#W và nhi«u ph¥n thß·ng khác nhß  #YL®nh Bài Løc Hþp #W. 100 Nguyên Bäo có th¬ ð±i ðßþc g¤p #G 5 l¥n #W giá tr¸ thñc, ðáng giá l¡m!  #r    Ðông Tây Nam B¡c Thßþng HÕ,  g÷i là Løc Hþp. Nªu có sÑc mÕnh Løc Hþp, có th¬ uy ch¤n b¯n phß½ng, ch¤n ðµng thiên hÕ. #r    Ta ðang thu th§p sÑc mÕnh Løc Hþp trong #Y L®nh Bài Løc Hþp #W, nªu ngß½i mang cho ta 6 mänh #Y L®nh Bài Løc Hþp #W#G khác nhau #W, có th¬ ðªn ð±i v¾i ta #Y Tr÷ng Lâu Gi¾i#W. L®nh Bài Løc Hþp g°m #YL®nh Bài Løc Hþp (ðông)#W,  #YL®nh Bài Løc Hþp (tây)#W,  #YL®nh Bài Løc Hþp (nam)#W,  #YL®nh Bài Løc Hþp (b¡c)#W,  #YL®nh Bài Løc Hþp (thßþng)#W,  #YL®nh Bài Løc Hþp (hÕ)#W. #r    #Y Trùng Lâu Gi¾i#W là Th¥n Khí hiªm có, là trang b¸ trß¾c nay chßa t×ng xu¤t hi®n #G 9 sao #W. Thuµc tính cüa nó thª nào? Nång lñc ðªn mÑc nào? Ðªn trang chü tham khäo. Ch¡c ch¡n s¨ mong mu¯n ðßþc nó!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	end
		
end


--**********************************
--·µ»Ø¶Ô»°
--**********************************
function x889058_ReturnDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ReturnTips
--**********************************
function x889058_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--½ÓÊÜ
--**********************************
function x889058_OnAccept( sceneId, selfId )
	
end

--**********************************
--·ÅÆú
--**********************************
function x889058_OnAbandon( sceneId, selfId )
end

--**********************************
--¼ÌÐø
--**********************************
function x889058_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x889058_CheckSubmit( sceneId, selfId )
	

	
end

--**********************************
--Ìá½»
--**********************************
function x889058_GiveGift( sceneId, selfId, targetId, selectRadioId )
	
	
	local LackItemMsg, RetDlg, Notice, BagFullDlg

	for i, ItemInfo in x889058_g_AwradInfo do
		if( ItemInfo.ItemId == selectRadioId ) then
			LackItemMsg		= ItemInfo.LackItemMsg
			RetDlg 				= ItemInfo.RetDlg
			Notice 				= ItemInfo.Notice
			BagFullDlg		= ItemInfo.BagFullDlg
			break
		end
	end
	
	-- ÅÐ¶ÏÎïÆ·ÊÇ·ñ¹»
	for i, itemId in x889058_g_NeedItemID do
		if( LuaFnGetAvailableItemCount( sceneId, selfId, itemId ) < 1 ) then
			x889058_ReturnDlg( sceneId, selfId, targetId, LackItemMsg )
			return
		end
	end
	
	-- ¿ÛÎïÆ·
	for i, itemId in x889058_g_NeedItemID do
		if( LuaFnDelAvailableItem( sceneId, selfId, itemId, 1) < 1 ) then
			x889058_ReturnDlg( sceneId, selfId, targetId, LackItemMsg )
			return
		end
	end
	
	-- ¼ì²é±³°ü¿Õ¼ä
	BeginAddItem(sceneId)
	AddItem(sceneId, selectRadioId, 1)
	local bBagOk = LuaFnEndAddItemIgnoreFatigueState(sceneId, selfId)
	if bBagOk < 1 then
		x889058_ReturnDlg( sceneId, selfId, targetId, BagFullDlg )
		return
	else
		-- Ìí¼ÓÎïÆ·
		LuaFnAddItemListToHumanIgnoreFatigueState( sceneId, selfId )
		
		-- Í¨Öª
		x889058_Tips( sceneId, selfId, Notice )
		x889058_ReturnDlg( sceneId, selfId, targetId, RetDlg )
		
		-- ¹«¸æ
		local playerName = GetName(sceneId,selfId)
		local itemTransInfo = GetItemTransfer( sceneId, selfId, 0 )
		broadcastMsg	=	"#{_INFOUSR"..playerName.."}".."##cfabf8fThu th§p ðü 6 t¤m #YLøc hþp l®nh bài #cfabf8f, tìm ðªn #GTô Châu (170, 138 )#RLß½ng Sß Thành #cfabf8fð¬ ð±i l¤y Th¥n Khí.".."#{_INFOMSG"..itemTransInfo.."}".."#cfabf8f ! "
	end
	
	BroadMsgByChatPipe( sceneId, selfId, broadcastMsg, 4 )
end
	

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x889058_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x889058_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x889058_OnItemChanged( sceneId, selfId, itemdataId )
end

