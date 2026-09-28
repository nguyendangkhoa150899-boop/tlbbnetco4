--Mµ Dung NPC
--Höi ðß¶ng 
--K¸ch bän g¯c Hào 
x760311_g_scriptId = 760311

--S· có ðßþc Sñ ki®n IDDanh sách 
x760311_g_eventList={760312}	

--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760311_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		local PlayerName=GetName(sceneId,selfId)
		local PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex ="Cô nß½ng"
		else
			PlayerSex ="Thiªu hi®p"
		end
		AddText(sceneId,"  Này quÖ C¯c Bên trong Có Tr§n pháp Bäo hµ ,Nhßþc Tß·ng Ði trß¾c Các n½i Dò höi ,Còn thïnh Do Ngã Vì ngß½i Dçn ðß¶ng .")
		for i, eventId in x760311_g_eventList do
			CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760311_OnDefaultEvent(sceneId, selfId,targetId)
	x760311_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760311_OnEventRequest(sceneId, selfId, targetId, eventId)
	CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId)
	return
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760311_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760311_g_eventList do
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
function x760311_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760311_g_eventList do
		if missionScriptId == findId then
			x760311_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760311_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760311_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760311_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760311_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760311_OnDie(sceneId, selfId, killerId)
end
