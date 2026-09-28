--Đại lý NPC
--Đồng Hóa Thiết 
--Thải quáng Đại sư 

--Kịch bản gốc Hào 
x760443_g_ScriptId = 760443

--Cửa hàng Đánh số 
x760443_g_shoptableindex=73

--Sở có được Sự kiện 
--estudy_caikuang = 713508
--elevelup_caikuang = 713567
--edialog_caikuang = 713607
--Sở có được Sự kiện IDDanh sách 
x760443_g_eventList={760444}
--**********************************
--Sự kiện Danh sách 
--**********************************
function x760443_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_dali_0026}")
	for i, eventId in x760443_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	--Cửa hàng Tuyển Hạng 
	--AddNumText(sceneId,x760443_g_ScriptId,"Mua sắm Công cụ",7,ABILITY_TEACHER_SHOP)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760443_OnDefaultEvent(sceneId, selfId,targetId)
	x760443_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sự kiện Danh sách Lựa chọn Hạng nhất 
--**********************************
function x760443_OnEventRequest(sceneId, selfId, targetId, eventId)
	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem(sceneId, selfId,targetId, x760443_g_shoptableindex)
	end
	for i, findId in x760443_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760443_g_ScriptId)
		return
		end
	end
end

--**********************************
--Tiếp thu Thử NPCCủa Nhiệm vụ 
--**********************************
function x760443_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760443_g_eventList do
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
--Cự tuyệt Thử NPCCủa Nhiệm vụ 
--**********************************
function x760443_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cự tuyệt Lúc sau ,Yếu Phản hồi NPCSự Kiện Danh sách 
	for i, findId in x760443_g_eventList do
		if missionScriptId == findId then
			x760443_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiếp tục (Đã Tiếp Nhiệm vụ )
--**********************************
function x760443_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760443_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Đệ trình Đã Làm xong Của Nhiệm vụ 
--**********************************
function x760443_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760443_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--Tử vong Sự kiện 
--**********************************
function x760443_OnDie(sceneId, selfId, killerId)
end
