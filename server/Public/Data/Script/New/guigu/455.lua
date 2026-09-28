-- K¸ch bän g¯c Hào 
x760455_g_scriptId = 760455
-- CØa hàng Hào 
x760455_g_ShopTabId = 80
x760455_g_ShopTabId1 = 81
--S· có ðßþc Sñ ki®n IDDanh sách 
x760455_g_eventList = { }

x760455_g_ControlScript = 050009
x760455_g_ExchangeList = { id = 40004303, name ="Tinh Ch¤t Bµt mì", cost = 20 }

--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760455_UpdateEventList(sceneId, selfId, targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{SHJNZJ_110907_40}")
		AddNumText(sceneId,x760455_g_scriptId,"Thiên Hoang c± Cänh DßÞng sinh Ðß¶ng",7,1111)
		AddNumText(sceneId,x760455_g_scriptId,"Thiên Hoang c± Cänh Thñc Kinh Ðß¶ng",7,1112)		
		AddNumText(sceneId, x760455_g_scriptId,"V« N¤u nß¾ng TÕo ngh®", 11, 8888)		
		if CallScriptFunction(x760455_g_ControlScript,"IsMidAutumnPeriod", sceneId, selfId)> 0 then
			--AddNumText(sceneId, x760455_g_scriptId,"Ð±i l¤y Nguyên li®u n¤u ån", 6, 1)
			--AddNumText(sceneId, x760455_g_scriptId,"Nguyên li®u n¤u ån Có ích lþi gì", 11, 8888)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760455_OnDefaultEvent(sceneId, selfId, targetId)
	x760455_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760455_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 1111 then
		DispatchShopItem(sceneId, selfId, targetId, x760455_g_ShopTabId);
	end
	if GetNumText() == 1112 then
		DispatchShopItem(sceneId, selfId, targetId, x760455_g_ShopTabId1);
	end	
	local i, findId
	for i, findId in x760455_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent", sceneId, selfId, targetId)
			return
		end
	end
	if GetNumText()>= 8888 then
	 BeginEvent(sceneId)
		AddText(sceneId,"#{SHJNZJ_110907_60}")
	 EndEvent(sceneId)
	 DispatchEventList(sceneId,selfId,targetId)
      return
    end
	if CallScriptFunction(x760455_g_ControlScript,"IsMidAutumnPeriod", sceneId, selfId)> 0 then
		if GetNumText() == 1 then
			local score = GetMissionData(sceneId, selfId, MD_MIDAUTUMN_SCORE)
			if score <x760455_g_ExchangeList.cost then
				x760455_NotifyFailBox(sceneId, selfId, targetId," Mu¯n ð±i Mµt ph¥n".. x760455_g_ExchangeList.name..
				",Yêu c¥u Tích phân".. x760455_g_ExchangeList.cost.."Ði¬m ,Ngß½i hi®n tÕi Chï có".. score.."Phân ,Tña h° Không ðü A .")
				return
			end

			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i Trß¾c m¡t Cüa Trung thu Tích phân Vi".. score.."Phân ,Ð±i l¤y Mµt ph¥n"..
					x760455_g_ExchangeList.name..",Yêu c¥u Tích phân".. x760455_g_ExchangeList.cost.."Ði¬m ,Ngß½i Xác ð¸nh mu¯n Hoán MÕ ?")

				AddNumText(sceneId, x760455_g_scriptId,"Xác ð¸nh mu¯n Hoán", -1, 3)
				AddNumText(sceneId, x760455_g_scriptId,"Ta chï Th¸ Ði ngang qua", -1, 4)
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
		elseif GetNumText() == 2 then
			x760455_NotifyFailBox(sceneId, selfId, targetId," TÕi LÕc Dß½ng Khß½ng Lí (127,"..
				"154),Tô Châu Bao Thª Vinh (190,168),ÐÕi lý Ð² TØ Ð¢ng (109,170)Phân bi®t Hoán"..
				"Ba loÕi B¤t ð°ng Nguyên li®u n¤u ån H§u ,Tìm Tô Châu (193,148)NhÕc Thß¶ng Viên Truy«n t¯ng Ðªn Tây H° T¾i ð±i Trung thu"..
				"Ð£c thù V§t ph¦m .")
			return
		elseif GetNumText() == 3 then
			local score = GetMissionData(sceneId, selfId, MD_MIDAUTUMN_SCORE)
			if score <x760455_g_ExchangeList.cost then
				return
			end

			if LuaFnTryRecieveItem(sceneId, selfId, x760455_g_ExchangeList.id, QUALITY_MUST_BE_CHANGE) <0 then
				x760455_NotifyFailBox(sceneId, selfId, targetId," Tay näi ðã ð¥y.")
			end

			score = score - x760455_g_ExchangeList.cost
			SetMissionData(sceneId, selfId, MD_MIDAUTUMN_SCORE, score)
			x760455_NotifyFailBox(sceneId, selfId, targetId," Còn th×a Tích phân: ".. score..".")
			return
		elseif GetNumText() == 4 then
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId, selfId, 1000)
		end
		return
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760455_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	local i, findId
	for i, findId in x760455_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction(missionScriptId,"CheckAccept", sceneId, selfId)
			if ret> 0 then
				CallScriptFunction(missionScriptId,"OnAccept", sceneId, selfId)
			end
			return
		end
	end
end

--**********************************
--Cñ tuy®t ThØ NPCCüa Nhi®m vø 
--**********************************
function x760455_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	local i, findId
	for i, findId in x760455_g_eventList do
		if missionScriptId == findId then
			x760455_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760455_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	local i, findId
	for i, findId in x760455_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760455_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760455_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760455_OnDie(sceneId, selfId, killerId)
end

--**********************************
--Ð¯i thoÕi CØa s± Tin tÑc Ð« kÏ 
--**********************************
function x760455_NotifyFailBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end
