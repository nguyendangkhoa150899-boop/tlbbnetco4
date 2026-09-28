--Mµ Dung NPC 
--Vß½ng Chi Lâm 
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760622_g_ScriptId = 760622

--S· có ðßþc Sñ ki®n 
estudy_bugua = 760623
elevelup_bugua = 760624
edialog_bugua = 713611
--S· có ðßþc Sñ ki®n IDDanh sách 
x760622_g_eventList={estudy_bugua,elevelup_bugua}	
--MessageNum = 1		--MessageNumLà ð¯i ThoÕi Ðánh s¯ ,Dùng cho Thuyên chuy¬n B¤t ð°ng Ð¯i thoÕi 
--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760622_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"#{THD_190613_15}")
	for i, eventId in x760622_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	AddNumText(sceneId, x760622_g_ScriptId,"Thông Cäm Gi¾i thi®u", 11, 100)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760622_OnDefaultEvent(sceneId, selfId,targetId)
	x760622_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760622_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SH_190614_23}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	for i, findId in x760622_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760622_g_ScriptId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760622_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760622_g_eventList do
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
function x760622_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760622_g_eventList do
		if missionScriptId == findId then
			x760622_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc #Ðã Tiªp Nhi®m vø #
--**********************************
function x760622_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760622_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760622_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760622_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760622_OnDie(sceneId, selfId, killerId)
end
