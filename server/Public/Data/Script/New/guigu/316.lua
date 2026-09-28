--Mµ Dung NPC 
--Vß½ng Chi Lâm 
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760316_g_ScriptId = 760316

--S· có ðßþc Sñ ki®n 
estudy_bugua = 760320
elevelup_bugua = 760321
edialog_bugua = 713611
--S· có ðßþc Sñ ki®n IDDanh sách 
x760316_g_eventList={estudy_bugua,elevelup_bugua}	
--MessageNum = 1		--MessageNumLà ð¯i ThoÕi Ðánh s¯ ,Dùng cho Thuyên chuy¬n B¤t ð°ng Ð¯i thoÕi 
--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760316_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"#{XMPGG_160823_61}")
	for i, eventId in x760316_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	AddNumText(sceneId, x760316_g_ScriptId,"Linh Ng÷c Thu§t Gi¾i thi®u", 11, 100)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760316_OnDefaultEvent(sceneId, selfId,targetId)
	x760316_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760316_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{XMPGG_160615_20}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	for i, findId in x760316_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760316_g_ScriptId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760316_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760316_g_eventList do
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
function x760316_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760316_g_eventList do
		if missionScriptId == findId then
			x760316_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760316_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760316_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760316_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760316_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760316_OnDie(sceneId, selfId, killerId)
end
