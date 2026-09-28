--»î¶¯¡ª¡ª
--ÖÐÇï»î¶¯-ÍÅÔ²»¶ÇìÔÂ±ý»î¶¯

--½Å±¾ºÅ
x050020_g_ScriptId = 050020

--x050020_g_EndDayTime = 7290   --»î¶¯½áÊøÊ±¼ä 2007-10-18
x050020_g_EndDayTime = 8304   --»î¶¯½áÊøÊ±¼ä 2008-10-31,°üº¬µ±ÈÕ

x050020_g_PingFengSn = 40004428			--ÆÁ·çID
x050020_g_BianShenPieSn = 30505132	--Ò×ÈÝµ¤ÔÂ±ýID

x050020_g_strBianShenPieInfo = "#{ZHONGQIUBIANSHEN_001}"
x050020_g_strGongGaoInfo = {

	"#YNhÕc Thß¶ng Viên#P cß¶i to nói #W#{_INFOUSR%s}#P này ba cái #{_INFOMSG%s}#P h½n phân næa là t× #Y Dß Ðµc#P trong tay ðoÕn ðªn ði? Ta s¨ không nu¯t l¶i, này khóa #{_INFOMSG%s}#P chính là cüa ngß½i",
	"#YNhÕc Thß¶ng Viên#P kinh hãi #W#{_INFOUSR%s}#Pngß½i thª nhßng th§t sñ theo #YHòng hùng Vß½ng#P trong tay ðoÕt ðªn này tam kh¯i #{_INFOMSG%s}#P Này khóa #{_INFOMSG%s}#P nói cái gì cûng nh§n",
	"#YNhÕc Thß¶ng Viên#P nhìn #W#{_INFOUSR%s}#P theo #Y trong tay ðoÕt ðªn tam kh¯i #{_INFOMSG%s}#P m×ng rÞ nhß ðiên. Xu¤t ra mµt viên #{_INFOMSG%s}#P làm tÕ ½n",

}

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x050020_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x050020_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()

	if NumText == 101 then

		BeginEvent(sceneId)
			AddText(sceneId, x050020_g_strBianShenPieInfo)
			AddNumText(sceneId, x050020_g_ScriptId, "Ð±i l¤y", 6, 201 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 201 then

		--ÁìÒ×ÈÝµ¤ÔÂ±ý....
		x050020_GivePlayerPie( sceneId, selfId, targetId )
	elseif NumText == 102 then
	
		BeginEvent(sceneId)
			AddText(sceneId, "#{ZQHD_20070916_013}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

end

--**********************************
--ÁÐ¾ÙÊÂ¼þ
--**********************************
function x050020_OnEnumerate( sceneId, selfId, targetId )

	local isTime = x050020_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x050020_g_ScriptId, "Ta mu¯n biªn thân thành bánh trung thu", 6, 101 )													
end

--**********************************
--¼ì²â»î¶¯ÊÇ·ñÒÑ½áÊø
--**********************************
function x050020_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime <= x050020_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--¸øÍæ¼ÒÒ×ÈÝµ¤ÔÂ±ý
--**********************************
function x050020_GivePlayerPie( sceneId, selfId, targetId )

	--¹Ø±Õ¶Ô»°´°¿Ú....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

	--ÊÇ·ñÓÐ3¸ö....
	local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050020_g_PingFengSn)
	if itemCount < 3 then
		BeginEvent(sceneId)
			AddText( sceneId, "Nhi®m vø ðÕo cø không ðü, không th¬ ð±i l¤y" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--É¾³ýÇ°»ñÈ¡ÆÁ·çµÄTransfer....
	local pingFengPos = GetItemBagPos( sceneId, selfId, x050020_g_PingFengSn, 0 )
	if pingFengPos < 0 then
		BeginEvent(sceneId)
			AddText( sceneId, "Nhi®m vø ðÕo cø không ðü, không th¬ ð±i l¤y" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
	end
	local pingFengTransfer = GetBagItemTransfer(sceneId,selfId,pingFengPos)

	--¼ì²â±³°üÊÇ·ñÓÐµØ·½....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "Ba lô không gian không ðü" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--ÊÇ·ñÉ¾³ýÊ§°Ü....
	if 0 == DelItem(sceneId, selfId, x050020_g_PingFengSn, 3) then
		BeginEvent(sceneId)
			AddText( sceneId, "Nhi®m vø ðÕo cø không ðü, không th¬ ð±i l¤y" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	--¸øÎïÆ·²¢¹«¸æ....
	local BagIndex = TryRecieveItem( sceneId, selfId, x050020_g_BianShenPieSn, QUALITY_MUST_BE_CHANGE )
	if BagIndex ~= -1 then

		BeginEvent( sceneId )
			AddText( sceneId, "Chúc m×ng, ð±i ðßþc d¸ch dung ðan: Bánh trung thu" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )

		--ÊÀ½ç¹«¸æ....
		local ItemTransfer = GetBagItemTransfer(sceneId,selfId,BagIndex)
		local PlayerName = GetName(sceneId, selfId)
		local nMsgIndex = random(3)
		local str
		if nMsgIndex == 1 then
			str = format( x050020_g_strGongGaoInfo[1], PlayerName, pingFengTransfer, ItemTransfer )
		elseif nMsgIndex == 2 then
			str = format( x050020_g_strGongGaoInfo[2], PlayerName, pingFengTransfer, ItemTransfer )
		else
			str = format( x050020_g_strGongGaoInfo[3], PlayerName, pingFengTransfer, ItemTransfer )
		end
		BroadMsgByChatPipe( sceneId, selfId, str, 4 )

	end

end

--**********************************
--¼ì²â½ÓÊÜÌõ¼þ
--**********************************
function x050020_CheckAccept( sceneId, selfId )
end

--**********************************
--½ÓÊÜ
--**********************************
function x050020_OnAccept( sceneId, selfId )
end

--**********************************
--·ÅÆú
--**********************************
function x050020_OnAbandon( sceneId, selfId )
end

--**********************************
--¼ÌÐø
--**********************************
function x050020_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x050020_CheckSubmit( sceneId, selfId )
end

--**********************************
--Ìá½»
--**********************************
function x050020_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x050020_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--½øÈëÇøÓòÊÂ¼þ
--**********************************
function x050020_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x050020_OnItemChanged( sceneId, selfId, itemdataId )
end
