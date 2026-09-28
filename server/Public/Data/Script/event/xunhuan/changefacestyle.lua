--µ÷ÕûÁ³ÐÍ
--½Å±¾ºÅ
x805029_g_ScriptId = 805029

--µ÷ÕûÁ³ÐÍUI 21

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x805029_OnEnumerate( sceneId, selfId, targetId )
	-- µ÷ÊÔÐÅÏ¢
	--BeginEvent(sceneId)
	--	AddText(sceneId, "½øÈëµ÷ÕûÁ³ÐÍ½Å±¾");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)	
	
	-- ÎªÊ²Ã´Òª NPC Ãû×Ö£¿
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 928)
	return
end

--**********************************
--µ÷ÕûÁ³ÐÍ
--**********************************
function x805029_FinishAdjust( sceneId, selfId, styleId)

	-- µÃµ½µ÷ÕûÁ³ÐÍËùÐèÎïÆ·µÄid¼°ÆäÊýÁ¿
	local ItemId, ItemCount = GetChangeFaceItemIdAndItemCount(styleId)
		
	-- ·µ»ØÖµ·Ç·¨
	if ItemId < 0 or ItemCount < 0 then
		return
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, ItemId )

	-- ÎïÆ·ÊÇ·ñ¹»ÓÃ»òËø¶¨
	if ItemCount > nItemNum then
		BeginEvent(sceneId)
			AddText(sceneId, "Các hÕ không có Ð¸nh nhan châu ho£c Ð¸nh nhan châu ðã b¸ khóa ð¸nh");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
		-- »ñµÃ¶¨ÑÕÖéÔÚ±³°üÖÐµÄÎ»ÖÃ£¨¶¨ÑÕÖé»áÔÚ¸Ä±äÁ³ÐÍµÄ¹ý³ÌÖÐ±»É¾³ý£¬ËùÒÔÐèÒªÏÈ±£´æËüµÄÐÅÏ¢£©
	local ItemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, ItemId, 0)
	local szItemTransfer = GetBagItemTransfer(sceneId, selfId, ItemPos)
	
	-- ÎïÆ·¼ì²âÍ¨¹ý£¬ÔÙ¼ì²éÍæ¼Ò½ðÇ®
	local moneyJZ = GetMoneyJZ (sceneId, selfId)
	local money = GetMoney (sceneId, selfId)
	
	-- ÎïÆ·ºÍ½ðÇ®¼ì²â¶¼Í¨¹ý
	if (moneyJZ + money >= 50000)	then	
		-- ÉèÖÃÍæ¼ÒÐÂÁ³ÐÍ£¨»áÔÚÕâ¸ö¹ý³ÌÖÐÏûºÄÎïÆ·ºÍ½ðÇ®£©
		local ret = ChangeHumanFaceModel( sceneId, selfId, styleId )
		if ret == 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"Thay ð±i khuôn m£t thành công.");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		
		-- ¸Ä±äÁ³ÐÍÊ§°Ü
		elseif ret == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"Hãy ch÷n khuôn m£t mu¯n ð±i.");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 3 then
			BeginEvent(sceneId)
				AddText(sceneId, "Các hÕ không có Ð¸nh nhan châu ho£c Ð¸nh nhan châu ðã b¸ khóa ð¸nh");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 4 then	
			BeginEvent(sceneId)
				AddText(sceneId, "Không ðü ngân lßþng!");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else
			return
		end

	-- ½ðÇ®²»×ã
	else
		BeginEvent(sceneId)
			AddText(sceneId, "Ngân lßþng các hÕ mang theo không ðü.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end	
	
	-- ·¢ËÍ¹ã²¥
	local message;	
	local randMessage = random(3);
	local nsex = LuaFnGetSex(sceneId, selfId)
	local str1,str2
	if nsex == 0  then
		str1 = "muµi ¤y"
		str2 = "ð©p"
	else
		str1 = "huynh ¤y"
		str2 = "ð©p trai"
	end
	
	if randMessage == 1 then
		message = format("#HCon ngß¶i mu¯n khuôn m£t, cây mu¯n vö cây, #W#{_INFOUSR%s}#H r¤t hi¬u ðÕo lý này nên hôm nay dùng #W#{_INFOMSG%s}#H ð¬ thay ð±i dung mÕo, làm cho Phan An phäi tÑc chªt, Ðiêu Thuy«n cûng phäi h± th©n!", LuaFnGetName(sceneId, selfId), szItemTransfer);
	elseif randMessage == 2 then
		message = format("#HMa Kính nói trên thª gi¾i này ngß¶i" .. str2 .. "ðã sinh ra r°i! Chính là #W#{_INFOUSR%s}#H lúc nãy con NhÕn l¾n làm r½i t× trên tr¶i xu¯ng, mau ði xem" .. str1 .. "ði, cái #W#{_INFOMSG%s}#H này sau khi sØ døng quä nhiên hi®u quä vô cùng!", LuaFnGetName(sceneId, selfId), szItemTransfer);
	else
		message = format("#HA! Sao cá trong dòng su¯i này ð«u ngØa bøng lên hªt ? Không l¨ b¸ trúng ðµc mà chªt ? Không phäi, thì ra là do #W#{_INFOUSR%s}#H m¾i v×a ði ngang qua, lû cá m¡c c·. Tr¶i Õ!" .. str1 .. "Dùng #W#{_INFOMSG%s}#H nên có 1 dung mÕo tuy®t thª nhß thª này!", LuaFnGetName(sceneId, selfId), szItemTransfer);
	end

	BroadMsgByChatPipe(sceneId, selfId, message, 4);
end
