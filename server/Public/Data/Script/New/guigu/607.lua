--Mµ Dung NPC
--Höi ðß¶ng 
--K¸ch bän g¯c Hào 
x760607_g_scriptId = 760607

--S· có ðßþc Sñ ki®n IDDanh sách 
x760607_g_eventList={760608}	

--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760607_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
		local PlayerName=GetName(sceneId,selfId)
		local PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex ="Cô nß½ng"
		else
			PlayerSex ="Thiªu hi®p"
		end
		AddText(sceneId,"#{THD_190613_22}")
		for i, eventId in x760607_g_eventList do
			CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760607_OnDefaultEvent(sceneId, selfId,targetId)
	x760607_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760607_OnEventRequest(sceneId, selfId, targetId, eventId)
	CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId)
	return
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760607_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760607_g_eventList do
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
function x760607_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760607_g_eventList do
		if missionScriptId == findId then
			x760607_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc #Ðã Tiªp Nhi®m vø #
--**********************************
function x760607_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760607_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760607_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760607_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760607_OnDie(sceneId, selfId, killerId)
end
