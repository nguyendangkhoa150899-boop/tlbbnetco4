--Thành ph¯ NPC
--Îä´óÍþ

x805028_g_scriptId=805028
x805028_g_BuildingID16 = 11

--ËùÓµÓÐtoÕ ðµ ÊÂ¼þIDÁÐ±í
x805028_g_eventList = {600030} --zchw

-- ÈÎÎñ¼¯ÊÂ¼þ ID ÁÐ±í,ÕâÀàÊÂ¼þ°üº¬×ÓÊÂ¼þ
x805028_g_eventSetList = {600030}

x805028_TIME_2000_01_03_ = 946828868

x805028_g_BuffPalyer_25 = 60
x805028_g_BuffAll_15    = 62

x805028_g_BangGongLimit  = 20 --[tx43764]
x805028_g_Item = 40004426

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x805028_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	local PlayerName = GetName( sceneId, selfId )

	--Ðúng·ñÐúng±¾°ï³ÉÔ±
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText

	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "Ngß¶i nào! dám xông vào bang cüa ta!"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	BeginEvent( sceneId )
		strText = "Lão Võ là quan võ cüa b±n thành, m£c dù Võ m² thành thÕo võ ngh®, có c½ hµi có th¬ cùng ta thØ sÑc. Ðúng r°i, còn có ði«u gì chï giáo? Lão Cû là quan võ cüa B±n thành, m£c dù Võ mçu"
		AddText(sceneId,strText);
		AddText(sceneId, "    " .. PlayerName .. "! T¾i làm nhi®m vø qu¯c phòng!")
		if CityGetSelfCityID( sceneId, selfId ) == sceneId then
			for i, eventId in x805028_g_eventList do
				--PrintStr("eventId" .. eventId)
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end
		AddNumText( sceneId, x805028_g_scriptId, "C¯ng hiªn ði¬m #GQu¯c Phòng", 6, 7413 )
		AddNumText( sceneId, x805028_g_scriptId, "Gi¾i thi®u nhi®m vø qu¯c phòng", 11, 1 )
		AddNumText( sceneId, x805028_g_scriptId, "Tu sØa xây dñng l¥u kiªm", 6, 3 )
		AddNumText( sceneId, x805028_g_scriptId, "Tu luy®n t¤n công", 6, 4 )
		AddNumText( sceneId, x805028_g_scriptId, "Mua gi¤y v¨ phòng cø", 7, 5 )
		AddNumText( sceneId, x805028_g_scriptId, "Gi¾i thi®u võ phß¶ng", 11, 2 )

		-- Thành ph¯ ÁìË«
		AddNumText( sceneId, x805028_g_scriptId, "Lînh 2 l¥n kinh nghi®m", 6, 6 )
		
		AddNumText( sceneId, x805028_g_scriptId, "Lãnh 1 Ngân Bì L®nh Ti­n", 6, 7 )--[tx43764]

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x805028_OnDefaultEvent( sceneId, selfId,targetId )
	x805028_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- ÅÐ¶ÏÄ³cáiÊÂ¼þÐúng·ñ¿ÉÒÔÍ¨¹ý´Ë NPC Ö´ÐÐ
--**********************************
function x805028_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805028_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805028_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐmµt Ïî
--**********************************
function x805028_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805028_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end
	if GetNumText() == 7413 then
		BeginEvent(sceneId)
			AddText( sceneId, "Ngß½i th§t sñ mu¯n dùng ði¬m c¯ng hiªn ð¬ gia tång ðµ Qu¯c Phòng cüa bang hµi?" )
			AddNumText( sceneId, x805028_g_scriptId, "Ðúng, ta ðã sÇn sàng!", 6, 74131 )
			AddNumText( sceneId, x805028_g_scriptId, "Hüy...", 6, 74130 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
	if GetNumText() == 74130 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
	if GetNumText() == 74131 then
		if CityGetAttr(sceneId, selfId, 6) <= 9 then
			BeginEvent(sceneId)
				AddText( sceneId, "Ði¬m c¯ng hiªn cüa ngß½i vçn chßa ðü 10, hãy mau ðóng góp thêm cho bang hµi." )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		BeginEvent(sceneId)
			AddText( sceneId, "Ta xin thay m£t m÷i ngß¶i ða tÕ ngß½i." )
			AddText( sceneId, "Ngß½i quä th§t r¤t hào phóng, ðúng là mµt ð¤ng anh tài." )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		CityChangeAttr(sceneId,selfId,GUILD_DEF_LEVEL,10)
		CityChangeAttr(sceneId,selfId,GUILD_CONTRIB_POINT,-10)
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
		local PlayerName = GetName(sceneId,selfId)
		local Str = format("@*;SrvMsg;GLD:#{_INFOUSR%s}#Y hªt lòng cho bang hµi, mang 10 ði¬m c¯ng hiªn ðªn ð¬ gia tång #GQu¯c Phòng#Y, th§t ðáng ngßÞng mµ!", PlayerName)
		BroadMsgByChatPipe(sceneId,selfId,Str,6)
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Defance_Mission_Help}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_WuFang}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	 elseif GetNumText() == 3 then
		BeginEvent(sceneId)
		AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
		AddText( sceneId, "ChÑc nång này s¡p ðßþc thñc hi®n" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 5 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )								--µ÷ÓÃThành ph¯ ÉÌµê½çÃæ
			UICommand_AddInt( sceneId, x805028_g_BuildingID16 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 104 )

	elseif GetNumText() == 6 then
		-- ¼ì²â°ï»áÐúng²»Ðúng´¦ÓÚµÍÎ¬»¤×´Ì¬,
		-- 1,¿´Íæ¼ÒThành ph¯ Ðúng²»Ðúng´¦ÓÚµÍÎ¬»¤×´Ì¬ÖÐ
		if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "  Hi®n b±n bang ðang · trÕng thái duy trì th¤p, m÷i phúc lþi ð«u không th¬ cung c¤p cho chß v¸, ð°ng cam cµng kh± c¯ g¡ng kiªm ðßþc càng nhi«u v¯n cho b±n thành vçn là t¯t nh¤t." )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		BeginEvent(sceneId)
			AddText( sceneId, " Hành t¦u trên giang h°, coi tr÷ng hi®u quä t¯c ðµ, có phäi mu¯n lînh th¶i gian g¤p ðôi kinh nghi®m không?" )
			AddNumText( sceneId, x805028_g_scriptId, "Nh§n 1 gi¶ g¤p ðôi kinh nghi®m", 6, 111 )
			AddNumText( sceneId, x805028_g_scriptId, "Nh§n 2 gi¶ g¤p ðôi kinh nghi®m", 6, 222 )
			AddNumText( sceneId, x805028_g_scriptId, "Nh§n 4 gi¶ g¤p ðôi kinh nghi®m", 6, 333 )
			AddNumText( sceneId, x805028_g_scriptId, "Xem th¶i gian nhân kinh nghi®m", 6, 444 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif GetNumText() == 7 then
	
		if GetItemCount(sceneId, selfId, x805028_g_Item) >= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_02}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		if CityGetAttr(sceneId, selfId, 6) < x805028_g_BangGongLimit   then --[tx43764]
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_03}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		BeginEvent(sceneId)
			AddText( sceneId, "#{YPLJ_090116_04}" )--[tx43764]
			AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_05}", 6, 8 )--[tx43764]
			AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_06}", 6, 9 )--[tx43764]
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
		
	elseif GetNumText() == 8 then
		if GetItemCount(sceneId, selfId, x805028_g_Item) >= 3  then
			return
		end

		local nGuildPoint = CityGetAttr(sceneId, selfId, 6)
		if nGuildPoint < x805028_g_BangGongLimit then --[tx43764]
			return
		end
		
		-- Ìí¼ÓÎïÆ·
		BeginAddItem(sceneId)
			AddItem( sceneId, x805028_g_Item, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		if ret ~= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_07}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		if CityChangeAttr(sceneId, selfId, 6, -x805028_g_BangGongLimit) ~= 1  then--[tx43764]
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_08}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		AddItemListToHuman(sceneId,selfId)
		
		BeginEvent(sceneId)
			AddText( sceneId, "#{YPLJ_090116_09}" )--[tx43764]
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
	
	elseif GetNumText() == 9 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
	
	elseif GetNumText() == 111 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 1)

	elseif GetNumText() == 222 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 2)

	elseif GetNumText() == 333 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 4)

	elseif GetNumText() == 444 then
		-- ²éÑ¯±¾ÖÜtoÕ ðµ Ë«±¶Kinh nghi®mÊ±¼ä
		local _,nCount = DEGetCount(sceneId, selfId)
		if nCount==0  then
			BeginEvent(sceneId)
				AddText(sceneId,"  Th§t ðáng tiªc, th¶i gian g¤p ðôi kinh nghi®m mà ta có th¬ cung c¤p cho ngß½i ðã là #R0 gi¶#W r°i.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		else
			BeginEvent(sceneId)
				AddText(sceneId,"  Th¶i gian g¤p ðôi kinh nghi®m trong tu¥n mà ta có th¬ cung c¤p cho ngß½i là #R" .. nCount .. " gi¶#W, mau t§n døng t¯t.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		end

	elseif GetNumText() == 201 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 202 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 204 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 300 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
	end
end

function x805028_DealDoubleExpTime(sceneId, selfId, targetId, nPoint)

	--  ðÕt ðßþcÍæ¼ÒTÕi °ï»áÖÐtoÕ ðµ µÈc¤p
	-- °ïÖ÷¿ÉÒÔ²»ÓÃÏûºÄ°ï¹±,¸±°ïÖ÷°ë¼Û
	local nGuildPos = GetGuildPos(sceneId, selfId)
	
	local BasePoint = 25
	if nGuildPos == 8  then
		BasePoint = 12.5
	elseif nGuildPos == 9  then
		BasePoint = 0
	else
		BasePoint = 25
	end
	
	local bTimeOk = 1
	
	-- °ïÖ÷Ðúng²»Ðúngµ±¹»Ê±¼ätoÕ ðµ ¼ì²â
	if nGuildPos==8 or nGuildPos==9  then
		local isPosLongEnough = IsGuildPosLongEnough(sceneId, selfId)
		if isPosLongEnough < 1 then
			bTimeOk = 0
			BasePoint = 25
		end
	else
		bTimeOk = -1
	end

	-- ¼ì²âÍæ¼ÒÐúng²»ÐúngÓÐ×ã¹»toÕ ðµ °ï»á¹±Ï×Öµ
	local nCity = CityGetAttr(sceneId, selfId, 6)
	if nCity < floor(BasePoint*nPoint)   then
		BeginEvent(sceneId)
			AddText(sceneId,"  Ðµ c¯ng hiªn bang hµi cüa ngß½i không ðü, có th¬ tiêu hao.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if BasePoint ~= 0  then
		if CityChangeAttr( sceneId, selfId, 6, -(floor(BasePoint*nPoint)) ) ~= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, " Kh¤u tr× ðµ c¯ng hiªn bang hµi th¤t bÕi, xin lúc sau thØ lÕi.." )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
	end
	
	local _,nCount = DEGetCount(sceneId, selfId)
	if nCount < nPoint    then
		return
	end

	local nCurHave = DEGetFreeTime(sceneId, selfId)
	nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)

	local nFreeTime = DEGetFreeTime(sceneId, selfId)

	-- ÏÈ¼ÆËãÏÂµ±Ç°Íæ¼ÒÉíÉÏÊ£ÏÂtoÕ ðµ Ê±¼ä
	local nTrueTime = nCurHave;

	if nTrueTime < 0 then
		nTrueTime = 0
	end

	-- »»cáiÐÂtoÕ ðµ ½Ó¿Ú
	WithDrawFreeDoubleExpTime(sceneId, selfId, 0, nPoint, 0 )

	local nCurTime = LuaFnGetCurrentTime()

	BeginEvent(sceneId)
		AddText(sceneId,"  Các hÕ ðã lînh thành công #R".. nPoint .." gi¶ #Wg¤p ðôi kinh nghi®m. Hi®n các hÕ có #Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. " phút #Wg¤p ðôi kinh nghi®m.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"  Các hÕ ðã lînh thành công #R".. nPoint .." gi¶ #Wg¤p ðôi kinh nghi®m. Hi®n các hÕ có #Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. " phút #Wg¤p ðôi kinh nghi®m.")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	if bTimeOk == 1  then
		if nGuildPos == 8  then -- ¸±°ïÖ÷
			BeginEvent(sceneId)
				AddText(sceneId,"  Do các hÕ ðäm nhi®m Phó bang chü trên 1 tu¥n, nên l¥n lînh song này hao t¯n ði¬m c¯ng hiªn bang hµi ðßþc giäm 1 nØa.")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif nGuildPos == 9  then  --°ïÖ÷
			BeginEvent(sceneId)
				AddText(sceneId,"  Do các hÕ ðäm nhi®m Bang chü trên 1 tu¥n, l¥n lînh song này không hao t¯n ði¬m c¯ng hiªn bang hµi.")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end

	-- Í¬²½Êý¾Ýµ½¿Í»§¶Ë
	SendDoubleExpToClient(sceneId,selfId)

end

--**********************************
--´¦ÀíÁìË«toÕ ðµ º¯Êý
--**********************************
function x805028_DoubleExpTime(sceneId, selfId, targetId, nTime)

	-- 1,¿´Íæ¼ÒThành ph¯ Ðúng²»Ðúng´¦ÓÚµÍÎ¬»¤×´Ì¬ÖÐ
	if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
		BeginEvent(sceneId)
			AddText( sceneId, "  Hi®n b±n bang ðang · trÕng thái duy trì th¤p, m÷i phúc lþi ð«u không th¬ cung c¤p cho chß v¸, ð°ng cam cµng kh± c¯ g¡ng kiªm ðßþc càng nhi«u v¯n cho b±n thành vçn là t¯t nh¤t." )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	-- ¼ì²âÐúng²»ÐúngC¥n ´ÓÐÂË¢ÐÂÊý¾Ý
	-- ÏÖTÕi Ê±¼ä
	local nCurTime = LuaFnGetCurrentTime()
	-- ÉÏ´ÎË¢ÐÂÊý¾ÝtoÕ ðµ Ê±¼ä
	local nPreTime = DEGetPreTime(sceneId, selfId)

	if (nCurTime - nPreTime  >= 3600*24*7)  or
		 (floor((nCurTime-x805028_TIME_2000_01_03_)/(3600*24*7)) ~= floor((nPreTime-x805028_TIME_2000_01_03_)/(3600*24*7)))   then
		----DESetLock(sceneId, selfId, 0)
		----DESetBeginTime(sceneId, selfId, 0)
		--DESetFreeTime(sceneId, selfId, 0)
		--DESetPreTime(sceneId, selfId, nCurTime)
		--DESetCount(sceneId, selfId, 5, 4, 0)

		DEResetWeeklyFreeTime(sceneId, selfId)
	end

	--
	x805028_AddDETime( sceneId, selfId, targetId, nTime, nCurTime, nPreTime )

end

function x805028_AddDETime(sceneId, selfId, targetId, nPoint, nCurTime, nPreTime)
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
		-- ÏÈ¼ÆËãÏÂµ±Ç°Íæ¼ÒÉíÉÏÊ£ÏÂtoÕ ðµ Ê±¼ä
		local nTrueTime = nCurHave;

		local nFreeTime = DEGetFreeTime(sceneId, selfId)

		if nTrueTime < 0 then
			nTrueTime = 0
		end

		-- ¿´»¹ÓÐÃ»ÓÐÊ±¼ä¿ÉÒÔLînh 
		local _,nCount = DEGetCount(sceneId, selfId)
		if(nCount <= 0)   then
			BeginEvent(sceneId)
				AddText(sceneId,"  Th¶i gian g¤p ðôi kinh nghi®m trong tu¥n cüa các hÕ hình nhß ðã dùng hªt r°i.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		if nCount < nPoint   then
			BeginEvent(sceneId)
				AddText(sceneId,"  Các hÕ không có nhi«u th¶i gian có th¬ nh§n")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- ¿´ÉíÉÏÐúng²»ÐúngÒÑ¾­ÓÐ±È½Ï¶àtoÕ ðµ Ê±¼äÁË,2Ð¡Ê±
		if nFreeTime >= 120*60   then
			BeginEvent(sceneId)
				AddText(sceneId,"  Th¶i gian kinh nghi®m g¤p ðôi các hÕ có ðßþc · ba thành ph¯ l¾n và thành ph¯ tñ xây ðã ðÕt mÑc gi¾i hÕn cao nh¤t ðßþc nh§n.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- ¼ì²âÍæ¼Ò²»ÄÜÓµÓÐ³¬¹ý4cáiÐ¡Ê±toÕ ðµ Ê±¼ä
		if nFreeTime + nPoint*3600 > 3600*4   then
			BeginEvent(sceneId)
				AddText(sceneId,"  Th¶i gian kinh nghi®m g¤p ðôi các hÕ có ðßþc · ba thành ph¯ l¾n và thành ph¯ tñ xây ðã ðÕt mÑc gi¾i hÕn cao nh¤t ðßþc nh§n.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- ¿´ÉíÉÏÐúng²»ÐúngÓÐ¶³½áÁËtoÕ ðµ Ê±¼ä
		if DEIsLock(sceneId,selfId)  > 0    then
			BeginEvent(sceneId)
				AddText(sceneId,"  Th¶i gian kinh nghi®m g¤p ðôi các hÕ có ðßþc · ba thành ph¯ l¾n và thành ph¯ tñ xây ðã ðÕt mÑc gi¾i hÕn cao nh¤t ðßþc nh§n.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			if (nTrueTime/60) > 0 then
				AddText(sceneId,"  Tu¥n này, các hÕ ðã lînh s¯ l¥n dß cüa th¶i gian g¤p ðôi kinh nghi®m #R" .. tostring(floor(nCount)) .. " gi¶#W, ðã có th¶i gian g¤p ðôi kinh nghi®m #Y" .. tostring(floor(nTrueTime/60)) .. " phút#W, các hÕ xác nh§n mu¯n lînh #Y" .. tostring(floor(nPoint*60)) .. " phút #W th¶i gian g¤p ðôi kinh nghi®m và ð°ng th¶i tiêu hao ðµ c¯ng hiªn bang phái" .. tostring(floor(nPoint*25)) .. "không ?#r Nªu các hÕ ðäm nhi®m Bang chü trên 1 tu¥n, có th¬ không c¥n hao t¯n ði¬m c¯ng hiªn bang hµi, Phó bang chü có th¬ giäm 1 nØa.");
			else
				AddText(sceneId,"  Tu¥n này, các hÕ ðã lînh s¯ l¥n dß cüa th¶i gian g¤p ðôi kinh nghi®m #R" .. tostring(floor(nCount)) .. " gi¶#W, các hÕ xác nh§n mu¯n lînh #Y" .. tostring(floor(nPoint*60)) .. " phút #W th¶i gian g¤p ðôi kinh nghi®m và ð°ng th¶i tiêu hao ðµ c¯ng hiªn bang phái" .. tostring(floor(nPoint*25)) .. "không ?#r Nªu các hÕ ðäm nhi®m Bang chü trên 1 tu¥n, có th¬ không c¥n hao t¯n ði¬m c¯ng hiªn bang hµi, Phó bang chü có th¬ giäm 1 nØa.");
			end
			-- Èç¹ûCái này Ê±ºòÍæ¼ÒÉíÉÏÓÐË«±¶Kinh nghi®mÒ©Ë®Ð§¹û,C¥n ¸øÍæ¼ÒÌáÊ¾
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x805028_g_BuffPalyer_25) == 1   
					or  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x805028_g_BuffAll_15) == 1
					then
				AddText(sceneId,"  #r#RXin chú ý: Trên ngß¶i các hÕ ðã có t°n tÕi th¶i gian nhân ðôi kinh nghi®m, có mu¯n xác nh§n nh§n lînh không?");
			end
			AddNumText(sceneId, x805028_g_scriptId, "Ðúng v§y, ta mu¯n lînh gi¶ g¤p ðôi kinh nghi®m", -1,200+nPoint )
			AddNumText(sceneId, x805028_g_scriptId, "Không, ta nh¤n sai r°i", -1,300 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

end


--**********************************
--Tiªp thø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x805028_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805028_NotifyFailTips( sceneId, selfId, "Ngß½i hi®n không th¬ nh§n nhi®m vø này" )
		elseif ret == -2 then
			x805028_NotifyFailTips( sceneId, selfId, "Không th¬ tiªp nh§n nhi«u nhi®m vø" )
		end

		return
	end
end

--**********************************
--¾Ü¾ø´ËNPCtoÕ ðµ ÈÎÎñ
--**********************************
function x805028_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805028_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--¼ÌÐø(ÒÑ¾­½ÓÁËÈÎÎñ)
--**********************************
function x805028_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--Ìá½»ÒÑ×öÍêtoÕ ðµ ÈÎÎñ
--**********************************
function x805028_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--ËÀÍöÊÂ¼þ
--**********************************
function x805028_OnDie( sceneId, selfId, killerId )
end

function x805028_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
