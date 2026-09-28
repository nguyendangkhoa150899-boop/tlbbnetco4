--ÂåÑôNPC
--ÇÇ¸´Ê¢
--ÆÕÍ¨
x000109_g_scriptId=000109

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x000109_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Có mu¯n tñ m· ti®m làm ông chü không? Ta có th¬ dÕy ngß½i")
		AddText(sceneId,"Shop ÐÕi Lý Ðã full vui lòng qua bên lÕc dß½ng")
		AddNumText(sceneId,x000109_g_scriptId,"Ki¬m tra t¤t cä thß½ng ðiªm",6,2)
		local strGUID = LuaFnGetGUID(sceneId,selfId)
	  --   if strGUID == 2030000017 or strGUID == 2010000074 or strGUID == 2010000257 or strGUID == 2010000103 or strGUID == 2010000107 or strGUID == 2010000069 or strGUID == 2010000157 or strGUID == 2010000295 or strGUID == 2010000158 or strGUID == 2010000211 or strGUID == 2010000099 or strGUID == 1010000012 or strGUID == 2010000368 or strGUID == 2010000138 or strGUID == 2010000084 or strGUID == 2010000079 or strGUID == 2010000376 or strGUID == 2010000136 or strGUID == 2010000438 or strGUID == 2010000501 or strGUID == 2010000196 or strGUID == 2010000282 or strGUID == 2010000501 or strGUID == 2010000516 or strGUID == 2010000177 or strGUID == 2010000180 or strGUID == 2010000445 or strGUID == 2010000416 or strGUID == 1010000799 or strGUID == 2010000252 or strGUID == 2010000082 or strGUID == 2010000106 or strGUID == 2010000067 or strGUID == 2010000076 or strGUID == 2010000101 or strGUID == 2010000462 or strGUID == 2010000066 or strGUID == 2010000310 or strGUID == 2010000115 or strGUID == 2010000422 or strGUID == 2010000553 or strGUID == 2010000121 or strGUID == 2010000171 or strGUID == 2010000536 or strGUID == 2010000132 or strGUID == 2010000273 or strGUID == 2010000073 or strGUID == 2010000481 or strGUID == 1010000055 or strGUID == 2010000093 or strGUID == 2010000395 or strGUID == 2010000366 or strGUID == 2010000370 or strGUID == 2010000064 or strGUID == 2010000465 or strGUID == 2010000444 or strGUID == 2010000410 or strGUID == 2010000476 or strGUID == 2010000601 or strGUID == 2010000599 or strGUID == 2010000225 or strGUID == 2010000420 or strGUID == 2010000104 or strGUID == 2010000156 or strGUID == 2010000412 or strGUID == 2010000505 or strGUID == 2010000403 or strGUID == 2010000534 or strGUID == 2010000481 or strGUID == 1010000298 or strGUID == 1010000317 or strGUID == 1010000080 or strGUID == 1010000007 or strGUID == 1010000255 or strGUID == 1010000039 or strGUID == 1010000215 or strGUID == 1010000009 or strGUID == 1010000075 or strGUID == 1010000075 or strGUID == 1010000507 or strGUID == 1010000070 or strGUID == 1010000044 or strGUID == 1010000020 or strGUID == 1010000452 or strGUID == 1010000452 or strGUID == 1010000703 or strGUID == 1010000462 or strGUID == 1010000514 or strGUID == 1010001002 or strGUID == 1010000976 or strGUID == 1010000462 or strGUID == 1010000671 or strGUID == 1010000579 or strGUID == 1010000485  or strGUID == 1010002437 or strGUID == 1010000429 or strGUID == 1010000160 or strGUID == 1010000029 or strGUID == 1010000630 or strGUID == 1010000688  or strGUID == 1010000062 or strGUID == 1010000031 or strGUID == 1010000320 or strGUID == 1010000016 or strGUID == 1010000023 or strGUID == 1010000129 or strGUID == 1010000029 or strGUID == 1010000245 or strGUID == 1010000077 or strGUID == 1010000294 or strGUID == 1010000143 or strGUID == 1010000334 or strGUID == 1010000071 or strGUID == 1010000071 or strGUID == 1010000309 or strGUID == 1010000280 or strGUID == 1010000621 or strGUID == 2010001961 or strGUID == 2010000154 or strGUID == 2010000096 or strGUID == 1010001550 or strGUID == 1010002343 or strGUID == 2010000812 or strGUID == 2010000369 or strGUID == 1010001810  or strGUID == 2010000112 or strGUID == 2010002096 or strGUID == 2010000923 or strGUID == 2010001116 or strGUID == 2010000437 or strGUID == 1010000555 or strGUID == 2010001117 or strGUID == 1010000256 or strGUID == 1010001354 or strGUID == 2010001875 or strGUID == 1010000921 or strGUID == 1010000003 or strGUID == 2030000251 or strGUID == 2030000012 or strGUID == 2030000064 or strGUID == 2030000150 or strGUID == 2030000057 or strGUID == 2030000095 or strGUID == 2030000178 or strGUID == 2030000289 or strGUID == 2030000152 or strGUID == 2030000145 or strGUID == 2030000312 or strGUID == 2030000187 or strGUID == 2030000189 or strGUID == 2030000161 or strGUID == 2030000189 or strGUID == 2030000061 or strGUID == 2030000175 or strGUID == 2010002521 or strGUID == 2030000021 or strGUID == 2030000523 or strGUID == 2030000526 or strGUID == 2030000527 or strGUID == 2030000528 or strGUID == 2030000076 or strGUID == 2030000138 or strGUID == 2030000264 or strGUID == 2030000193 or strGUID == 2030000193 or strGUID == 2030000173 or strGUID == 2030000046 or strGUID == 2030000185 or strGUID == 2030000309 or strGUID == 2030000441 or strGUID == 2030000441 or strGUID == 2030000896 or strGUID == 2030000229 or strGUID == 2030000280 or strGUID == 2030000100  or strGUID == 2030000153  or strGUID == 2030000315  or strGUID == 2030000137 or strGUID == 2030000034 or strGUID == 2030000382 or strGUID == 2030000091 or strGUID == 2030000042 or strGUID == 2030000011 or strGUID == 2030000013 or strGUID == 2030000032  or strGUID == 2030000778 or strGUID == 2030000026 or strGUID == 2030000515 or strGUID == 2030000403  or strGUID == 2030000018 or strGUID == 2030000384 or strGUID == 2030000386 or strGUID == 2030000410 or strGUID == 2030000422 or strGUID == 2030000031  or strGUID == 2030000183 or strGUID == 2030000033 or strGUID == 2030000339 or strGUID == 2030000691 or strGUID == 2030000516 or strGUID == 2030000420 then
		 if IsShutout( sceneId, selfId, ONOFF_T_PSHOP ) == 0 then
			AddNumText(sceneId,x000109_g_scriptId,"Xây dñng thß½ng ðiªm riêng",6,0)
		--	AddNumText(sceneId,x000109_g_scriptId,"#GNh§n Chß·ng Cñ Yªu Quyªt",6,99)
		else
			AddNumText(sceneId,x000109_g_scriptId,"Hüy gian hàng cüa ta",6,7)
		end
		AddNumText(sceneId,x000109_g_scriptId,"Quän lý thß½ng ðiªm riêng",6,1)
		AddNumText(sceneId,x000109_g_scriptId,"Ki¬m tra ti®m ðang chu¦n b¸ bán",6,3)
		AddNumText(sceneId,x000109_g_scriptId,"Gi¾i thi®u thß½ng ti®m ngß¶i ch½i",11,6)
		AddNumText(sceneId,x000109_g_scriptId,"Liên quan thu mua nguyên li®u",11,10)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************

--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî

--**********************************

function x000109_OnEventRequest( sceneId, selfId, targetId, eventId )

--0.½¨Á¢×Ô¼ºµÄÉÌµê->ÏÔÊ¾½¨µêÌõ¿î->ÓÉ¿Í»§¶ËÇëÇó½¨µê
		if	GetNumText()==0	then

			BeginEvent(sceneId)

				AddText(sceneId,"#{PS_OPEN_SHOP_NOTICE}")

			EndEvent(sceneId)

			DispatchMissionDemandInfo(sceneId,selfId,targetId,x000109_g_scriptId,0,1)


		--1.¹ÜÀí×Ô¼ºµêÆÌ
		elseif	GetNumText()==1	then

			--1.0Í¨¹ýµêÆÌÃûÀ´ÅÐ¶¨ÊÇ·ñ´ËµêÒÑ¾­´ò¿ª
			strShop0Name = LuaFnGetShopName(sceneId, selfId, 0)
			strShop1Name = LuaFnGetShopName(sceneId, selfId, 1)

			--1.1Ã»µêÆÌÖ±½Ó·¢´íÎóÌáÊ¾
			if((strShop0Name == "")and(strShop1Name == "")) then
				BeginEvent(sceneId)

					strText = "Xin l²i, ngß½i hình nhß không có ti®m!"

					AddText(sceneId,strText);

				EndEvent(sceneId)

				DispatchMissionTips(sceneId,selfId)

			--1.2ÓÐµêÆÌ¸ù¾Ý²»Í¬Çé¿ö²»Í¬´¦Àí
			else
				--1.2.1ÓÐÁ½¸öµêÆÌ£¬µÈ´ý½øÒ»²½Ñ¡Ôñ
				if((strShop0Name ~= "") and (strShop1Name ~= "")) then
						BeginEvent(sceneId)

							AddText(sceneId,"Hà hà, té ra trß·ng qu¥y t¾i r°i, xin höi các hÕ mu¯n t¾i xem gian ti®m nào?")

							if GetPlayerShopFrezeType(sceneId, selfId, 0) == 1 then
								AddNumText(sceneId,x000109_g_scriptId,"#cCCCCCCTi®m 1 "..strShop0Name,-1,4)
							else
								AddNumText(sceneId,x000109_g_scriptId,"Ti®m 1 "..strShop0Name,-1,4)
							end
							if GetPlayerShopFrezeType(sceneId, selfId, 1) == 1 then
								AddNumText(sceneId,x000109_g_scriptId,"#cCCCCCCTi®m 2 "..strShop1Name,-1,5)
							else
								AddNumText(sceneId,x000109_g_scriptId,"Ti®m 2 "..strShop1Name,-1,5)
							end

						EndEvent(sceneId)
						DispatchEventList(sceneId,selfId,targetId)

				--1.2.2Ö»ÓÐÒ»¸öÖ±½Ó´ò¿ªÕâ¸ö
				elseif(strShop0Name ~= "") then
						LuaFnOpenPlayerShop(sceneId, selfId, targetId, 0)

				--1.2.3Ö»ÓÐÒ»¸öÖ±½Ó´ò¿ªÕâ¸ö
				elseif(strShop1Name ~= "") then
						LuaFnOpenPlayerShop(sceneId, selfId, targetId, 1)
				end

			end

		--2.²ì¿´ËùÓÐÉÌµêµÄÁÐ±í

		elseif	GetNumText()==2	then

			DispatchPlayerShopList( sceneId, selfId, targetId )

		--3.²ì¿´ËùÓÐÅÌ³öÉÌµêµÄÁÐ±í
		elseif	GetNumText()==3	then

			DispatchPlayerShopSaleOutList( sceneId, selfId, targetId )

		--4.²ì¿´×Ô¼ºÉíÉÏµÄÖ¸¶¨ÉÌµê
		elseif	GetNumText()==4	then

			LuaFnOpenPlayerShop(sceneId, selfId, targetId, 0)

		--5.²ì¿´×Ô¼ºÉíÉÏµÄÖ¸¶¨ÉÌµê
		elseif	GetNumText()==5	then

			LuaFnOpenPlayerShop(sceneId, selfId, targetId, 1)
		
		--6.Íæ¼ÒÉÌµê½éÉÜ
		elseif	GetNumText()==6	then

			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_048}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		--7.ÔÙ´ÎÈ·ÈÏÊÇ·ñÉ¾µê
		elseif	GetNumText()==7	then
	
			--1.0Í¨¹ýµêÆÌÃûÀ´ÅÐ¶¨ÊÇ·ñ´ËµêÒÑ¾­´ò¿ª
			local strShop0Name = LuaFnGetShopName(sceneId, selfId, 0)
			local strShop1Name = LuaFnGetShopName(sceneId, selfId, 1)

			--1.1Ã»µêÆÌÖ±½Ó·¢´íÎóÌáÊ¾
			if((strShop0Name == "")and(strShop1Name == "")) then
				BeginEvent(sceneId)
					strText = "Các hÕ ít nh¤t phäi có 1 gian hàng"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			else
				BeginEvent(sceneId)
					AddText(sceneId,"#{UnregisterShopHelp}")
					AddNumText(sceneId,x000109_g_scriptId,"Duy®t",6,8)
					AddNumText(sceneId,x000109_g_scriptId,"R¶i khöi",6,9)
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end

		--7.É¾!
		elseif	GetNumText()==8	then
			local canErase = CanErasePlayerShop(sceneId, selfId)
			if(canErase == 1) then
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 1000)
				ErasePlayerShop(sceneId,selfId)
				local msg = format("Chúc m×ng các hÕ hüy bö thành công, ti«n v¯n trong gian hàng ðã hoàn trä cho các hÕ, vui lòng ki¬m tra lÕi.");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
				
				msg = format("Xóa bö cØa hàng thành công.");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
				
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 19810222)
			elseif canErase == -1 then
				local msg = format("CØa hàng này ðã b¸ ðóng lÕi.");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			else
				local msg = format("Thß½ng ti®m cüa các hÕ vçn còn thß½ng ph¦m, khi nào tr¯ng hãy ðªn tìm ta.");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			end
		elseif	GetNumText()==9	then
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)
		elseif	GetNumText()==10	then
			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_101}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end

	if GetNumText() == -99 then
	    if GetMissionData( sceneId, selfId, FREECCYQ )  == 2 then
            x000109_NotifyFailBox( sceneId, selfId, targetId, "#GChào bÕn, bÕn ðã sØ døng chÑc nång này. M²i ngß¶i chï ðßþc dùng chÑc nång này mµt l¥n." )
			return
        end
		local FreeDC = LuaFnGetPropertyBagSpace(sceneId,selfId)
		if FreeDC < 1 then
			BeginEvent( sceneId )
				AddText( sceneId, "#GTrong túi #YÐÕo cø #Gkhông có ðü 10 ô tr¯ng.")
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end	
		local CCYQ = 30008053 --CCYQ--
			local NewItem = TryRecieveItem(sceneId,selfId,CCYQ,1)
            LuaFnItemBind( sceneId, selfId, TryRecieveItem(sceneId, selfId, NewItem) )
		SetMissionData(sceneId,selfId,FREECCYQ,2)
		BeginEvent( sceneId )
			AddText( sceneId, "Nh§n thß·ng thành công" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,148,0)
		local PlayerName = GetName(sceneId,selfId)
		local strText = "#GChúc m×ng #ccc33cc"..PlayerName.." #Gðã nh§n thành công ph¥n thß·ng #HEvent Share + Tag tên #Gtrên #YFanpage"
		BroadMsgByChatPipe(sceneId,selfId,strText,4)
	end
end

function x000109_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************

--¼ÌÐø

--**********************************

function x000109_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	ApplyPlayerShop( sceneId, selfId, targetId )

end
