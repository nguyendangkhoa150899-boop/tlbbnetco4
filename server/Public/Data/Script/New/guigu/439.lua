--Đại lý NPC Hái thuốc Kỹ năng NPC  Bao hàm Công năng: 1Hái thuốc Kỹ năng Của Học tập 2Giảng giải Hái thuốc Kỹ năng 
--Lưu Ký Nô 
--Bình thường 

--Kịch bản gốc Hào 
x760439_g_ScriptId = 760439

--Cửa hàng Đánh số 
x760439_g_shoptableindex=73

--Sở có được Sự kiện IdDanh sách 
--estudy_caiyao = 713509
--elevelup_caiyao = 713568
--edialog_caiyao = 713608
--Sở có được Sự kiện IDDanh sách 
x760439_g_eventList={760440}
--**********************************
--Sự kiện Danh sách 
--**********************************
function x760439_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_dali_0027}")
	for i, eventId in x760439_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	--Cửa hàng Tuyển Hạng 
	--AddNumText(sceneId,x760439_g_ScriptId,"Mua sắm Công cụ",7,ABILITY_TEACHER_SHOP)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760439_OnDefaultEvent(sceneId, selfId,targetId)
	x760439_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sự kiện Danh sách Lựa chọn Hạng nhất 
--**********************************
function x760439_OnEventRequest(sceneId, selfId, targetId, eventId)
	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem(sceneId, selfId,targetId, x760439_g_shoptableindex)
	end
	for i, findId in x760439_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760439_g_ScriptId)
		return
		end
	end
end

--**********************************
--Tiếp thu Thử NPCCủa Nhiệm vụ 
--**********************************
function x760439_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760439_g_eventList do
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
function x760439_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cự tuyệt Lúc sau ,Yếu Phản hồi NPCSự Kiện Danh sách 
	for i, findId in x760439_g_eventList do
		if missionScriptId == findId then
			x760439_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiếp tục (Đã Tiếp Nhiệm vụ )
--**********************************
function x760439_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760439_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Đệ trình Đã Làm xong Của Nhiệm vụ 
--**********************************
function x760439_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760439_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--Tử vong Sự kiện 
--**********************************
function x760439_OnDie(sceneId, selfId, killerId)
end
