--Đại lý NPC		Chế Dược npc		1Học tập Chế Dược Kỹ năng 		2Trung y Kỹ Có thể nói minh 
--Phó Đương quy 
--Bình thường 

--Kịch bản gốc Hào 
x760441_g_ScriptId = 760441

--Sở có được Sự kiện IdDanh sách 
--estudy_zhiyao = 713503
--elevelup_zhiyao = 713562
--edialog_zhiyao = 713602
--Sở có được Sự kiện IDDanh sách 
x760441_g_eventList={760442}
--**********************************
--Sự kiện Danh sách 
--**********************************
function x760441_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_dali_0034}")
	for i, eventId in x760441_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760441_OnDefaultEvent(sceneId, selfId,targetId)
	x760441_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sự kiện Danh sách Lựa chọn Hạng nhất 
--**********************************
function x760441_OnEventRequest(sceneId, selfId, targetId, eventId)
	for i, findId in x760441_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760441_g_ScriptId)
			return
		end
	end
end

--**********************************
--Tiếp thu Thử NPCCủa Nhiệm vụ 
--**********************************
function x760441_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760441_g_eventList do
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
function x760441_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cự tuyệt Lúc sau ,Yếu Phản hồi NPCSự Kiện Danh sách 
	for i, findId in x760441_g_eventList do
		if missionScriptId == findId then
			x760441_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiếp tục (Đã Tiếp Nhiệm vụ )
--**********************************
function x760441_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760441_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Đệ trình Đã Làm xong Của Nhiệm vụ 
--**********************************
function x760441_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760441_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--Tử vong Sự kiện 
--**********************************
function x760441_OnDie(sceneId, selfId, killerId)
end
