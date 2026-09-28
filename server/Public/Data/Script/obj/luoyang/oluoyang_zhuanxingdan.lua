--×ªÐÔµ¤NPC Áõ¶Ü

--½Å±¾ºÅ
x000147_g_scriptId = 000147


--ËùÓµÓÐµÄÊÂ¼þIDÁÐ±í
x000147_g_eventList={0147000, 0147001, 0147002, 0147003, 0147004, 0147005, 0147006}
x000147_g_item_zhuanxingdan = 30900048


x000147_g_result_msg = {
	"#{ZXD_20080312_03}", --"ÄúÒÑ³É»éÎÞ·¨¸ü¸ÄÐÔ±ð£¬Çë½â³ý»éÒö¹ØÏµºóÔÙÊ¹ÓÃ¸ÃÎïÆ·"
	"#{ZXD_20080318_01}", --"¾àÀëÌ«Ô¶£¬×ªÐÔµ¤Ê¹ÓÃÊ§°Ü"
	"#{ZXD_20080318_02}", --"Ã»ÓÐ¿ÉÓÃµÄ×ªÐÔµ¤",
	"#{ZXD_20080318_03}", --"×é¶ÓÊ±ÎÞ·¨×ªÐÔ£¬ÇëÍË³ö×é¶Ó×´Ì¬ºóÔÙÊ¹ÓÃ",
	"#{ZXD_20080318_04}", --"°ÚÌ¯×´Ì¬Ê±ÎÞ·¨Ê¹ÓÃ×ªÐÔµ¤",
	"#{ZXD_20080318_05}"  --"³Ë×´Ì¬ÎÞ·¨Ê¹ÓÃ×ªÐÔµ¤"
}

--**********************************
--ÊÂ¼þÁÐ±í
--**********************************
function x000147_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "#{ZXD_20080312_01}" )
		AddNumText( sceneId, x000147_g_scriptId, "#{ZXD_20080318_06}", 6, 0147000)
		AddNumText( sceneId, x000147_g_scriptId, "#{ZXD_20080318_07}", 11, 0147001)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x000147_OnDefaultEvent( sceneId, selfId,targetId )
	x000147_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- ÊÂ¼þ´¦Àí
--**********************************
function x000147_OnEventRequest( sceneId, selfId, targetId, eventId )
	local request_id = GetNumText()
	print("function x000147_OnEventRequest")
	if request_id == 0147000 then
		local isMarried = LuaFnIsMarried(sceneId, selfId)
		if isMarried > 0 then
			BeginEvent(sceneId)
				AddText( sceneId, "#{ZXD_20080312_03}" )		
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x000147_g_item_zhuanxingdan)
		if itemCount < 1 then
			BeginEvent(sceneId)
				AddText( sceneId, "#{ZXD_20080312_04}" )		
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		--Í¨Öª¿Í»§¶Ë¿ªÊ¼×ªÐÔÑ¡Ôñ
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 0147000)
		
	elseif request_id == 0147003 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 0147005)
		
	elseif request_id == 0147004 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 0147006) --¹Ø±ÕNPC¶Ô»°¿ò
		
	elseif request_id == 0147001 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{ZXD_20080312_02}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
-- ÇëÇóÈ·ÈÏ½çÃæ
--**********************************
function x000147_OnZhuanXingRequest( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{ZXD_20080312_05}")
		AddNumText( sceneId, x000147_g_scriptId, "Ð°ng Ý", 6, 0147003)
		AddNumText( sceneId, x000147_g_scriptId, "Hüy", 6, 0147004)		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


--**********************************
-- ¿Í»§¶Ëµ÷ÓÃº¯Êý
--**********************************
function x000147_OnZhuanXingConfirm( sceneId, selfId, targetId, sex, hairColor, hairModel, faceModel, nFaceId)
	print("x000147_OnZhuanXingConfirm")
	local pre_condition = x000147_PreZhuanXingCondition( sceneId, selfId, targetId )
	if pre_condition == 0 then
		local is_suc = HumanZhuanXing(sceneId, selfId, sex, hairColor, hairModel, faceModel, nFaceId)
		if is_suc == 1 then
			LuaFnDelAvailableItem(sceneId, selfId, x000147_g_item_zhuanxingdan, 1)
			BeginEvent(sceneId)
				AddText(sceneId, "#{ZXD_20080312_06}")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)

			--±äÐÔÍ¬Ê±¼ÓÒ»¸öÉý¼¶ÌØÐ§
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 100 )
			return
		end
	elseif( pre_condition >= 1 and pre_condition <= 6 ) then
		BeginEvent(sceneId)
			AddText(sceneId, x000147_g_result_msg[pre_condition])
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end


--**********************************
-- ÊÇ·ñÂú×ã×ªÐÔÌõ¼þ
--**********************************
function x000147_PreZhuanXingCondition( sceneId, selfId, targetId )
	
	--ÒÑ¾­½á»é
	local isMarried = LuaFnIsMarried(sceneId, selfId)
	if isMarried == 1 then
		return 1
	end
	
	--¾àÀëÌ«Ô¶
	local isValidDistance = IsInDist( sceneId, selfId, targetId, 1000.0)
	if isValidDistance <= 0 then
		return 2
	end
	
	--Ã»ÓÐºÏ·¨ÎïÆ·
	local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x000147_g_item_zhuanxingdan)
	if itemCount <= 0 then
		return 3
	end
	
	--ÊÇ·ñ×é¶Ó
	local hasTeam = LuaFnHasTeam(sceneId, selfId)
	if hasTeam > 0 then
		return 4
	end
	
	--ÊÇ·ñ°ÚÌ¯
	local isStall = LuaFnIsStalling(sceneId, selfId)
	if isStall > 0 then
		return 5
	end

	--ÊÇ·ñÆï³Ë
	local isRiding = LuaFnIsRiding(sceneId, selfId)
	if isRiding > 0 then
		return 6
	end
	
	--¿ÉÒÔ×ªÐÔ
	return 0
end
