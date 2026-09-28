--LÕc Dß½ng NPC
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760374_g_ScriptId = 760374


--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760374_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"#{MZZD_150812_1}")
	AddNumText(sceneId, x760374_g_ScriptId,"V« Trøc xu¤t Chiªn Minh Thành viên Bang hµi", 11, 100)
	--AddNumText(sceneId, x760374_g_ScriptId,"V« An toàn Tri thÑc Höi ðáp", 11, 200)	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760374_OnDefaultEvent(sceneId, selfId,targetId)
	x760374_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760374_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SLJC_150811_787}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	if GetNumText() == 200 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WHOATN_12103141_01}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end	

	for i, findId in x760374_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760374_g_ScriptId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760374_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760374_g_eventList do
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
function x760374_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760374_g_eventList do
		if missionScriptId == findId then
			x760374_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760374_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760374_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760374_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760374_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760374_OnDie(sceneId, selfId, killerId)
end
