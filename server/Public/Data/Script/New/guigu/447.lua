--Đại lý NPC		Gieo trồng npc  1Gieo trồng Thăng cấp  2Gieo trồng Kỹ Có thể nói minh 
--Âu Dương đại thúc 
--Bình thường 

--Kịch bản gốc Hào 
x760447_g_ScriptId = 760447

--Sở có được Sự kiện IdDanh sách 
--estudy_zhongzhi = 713511
--elevelup_zhongzhi = 713570
--edialog_zhongzhi = 713610
x760447_g_eventList={760448}
--**********************************
--Sự kiện Danh sách 
--**********************************
function x760447_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_dali_0032}")
		for i, eventId in x760447_g_eventList do
			CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760447_OnDefaultEvent(sceneId, selfId,targetId)
	x760447_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sự kiện Danh sách Lựa chọn Hạng nhất 
--**********************************
function x760447_OnEventRequest(sceneId, selfId, targetId, eventId)
	for i, findId in x760447_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760447_g_ScriptId)
			return
		end
	end
end

--**********************************
--Tiếp thu Thử NPCCủa Nhiệm vụ 
--**********************************
function x760447_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760447_g_eventList do
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
function x760447_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cự tuyệt Lúc sau ,Yếu Phản hồi NPCSự Kiện Danh sách 
	for i, findId in x760447_g_eventList do
		if missionScriptId == findId then
			x760447_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiếp tục (Đã Tiếp Nhiệm vụ )
--**********************************
function x760447_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760447_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Đệ trình Đã Làm xong Của Nhiệm vụ 
--**********************************
function x760447_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760447_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--Tử vong Sự kiện 
--**********************************
function x760447_OnDie(sceneId, selfId, killerId)
end
