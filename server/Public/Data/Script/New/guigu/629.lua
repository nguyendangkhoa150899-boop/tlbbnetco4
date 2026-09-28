--K¸ch bän g¯c Hào 
x760629_g_scriptId = 760629

--Møc tiêu NPC
x760629_g_name	="u nguy"


x760629_g_RelationEventList={760630}

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760629_OnDefaultEvent(sceneId, selfId, targetId)
	x760629_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760629_UpdateEventList(sceneId, selfId, targetId)
	BeginEvent(sceneId)
		local i
		local eventId
		AddText(sceneId,"#{THD_190613_51}")
		for i, eventId in x760629_g_RelationEventList do
			CallScriptFunction(eventId,"OnEnumerate", sceneId, selfId, targetId)
		end
		--AddNumText(sceneId, x760629_g_scriptId,"#{THD_190613_51}", 11, 1111);
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760629_OnEventRequest(sceneId, selfId, targetId, eventId)
	local i
	local findId
	if GetNumText() == 1111 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{THD_190613_51}")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	for i, findId in x760629_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760629_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	local i
	local findId
	for i, findId in x760629_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnAccept", sceneId, selfId)
			return
		end
	end
end

--**********************************
--Cñ tuy®t ThØ NPCCüa Nhi®m vø 
--**********************************
function x760629_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	local i
	local findId
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760629_g_RelationEventList do
		if missionScriptId == findId then
			x760629_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end
