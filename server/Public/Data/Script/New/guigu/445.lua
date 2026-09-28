--Đại lý NPC		Câu cá npc		1Thăng cấp Câu cá Kỹ năng 		2Câu cá Kỹ Có thể nói minh 
--Mục Tử Lăng 
--Bình thường 

--Kịch bản gốc Hào 
x760445_g_ScriptId = 760445

--Cửa hàng Đánh số 
x760445_g_shoptableindex=73

--Sở có được Sự kiện IdDanh sách 
--estudy_diaoyu = 713510
--elevelup_diaoyu = 713569
--edialog_diaoyu = 713609
--Sở có được Sự kiện IDDanh sách 
x760445_g_eventList={760446}
--**********************************
--Sự kiện Danh sách 
--**********************************
function x760445_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_dali_0028}")
	for i, eventId in x760445_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	--Cửa hàng Tuyển Hạng 
	--AddNumText(sceneId,x760445_g_ScriptId,"Mua sắm Công cụ",7,ABILITY_TEACHER_SHOP)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760445_OnDefaultEvent(sceneId, selfId,targetId)
	x760445_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sự kiện Danh sách Lựa chọn Hạng nhất 
--**********************************
function x760445_OnEventRequest(sceneId, selfId, targetId, eventId)
	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem(sceneId, selfId,targetId, x760445_g_shoptableindex)
	end
	for i, findId in x760445_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760445_g_ScriptId)
		return
		end
	end
end

--**********************************
--Tiếp thu Thử NPCCủa Nhiệm vụ 
--**********************************
function x760445_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760445_g_eventList do
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
function x760445_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cự tuyệt Lúc sau ,Yếu Phản hồi NPCSự Kiện Danh sách 
	for i, findId in x760445_g_eventList do
		if missionScriptId == findId then
			x760445_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiếp tục (Đã Tiếp Nhiệm vụ )
--**********************************
function x760445_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760445_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Đệ trình Đã Làm xong Của Nhiệm vụ 
--**********************************
function x760445_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760445_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--Tử vong Sự kiện 
--**********************************
function x760445_OnDie(sceneId, selfId, killerId)
end
