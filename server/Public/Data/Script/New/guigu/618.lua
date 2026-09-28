--QuÖ C¯c NPC H÷c t§p Môn phái Sinh hoÕt KÛ nång 
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760618_g_ScriptId = 760618

--S· có ðßþc Sñ ki®n 
--estudy_molishu= 713521
--elevelup_molishu = 713580
--edialog_molishu = 701615

--S· có ðßþc Sñ ki®n IDDanh sách 
x760618_g_eventList={760619,760620,760621}	

--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760618_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"#{THD_190613_13}")
	for i, eventId in x760618_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	AddNumText(sceneId, x760618_g_ScriptId,"Truy nguyên Chi thu§t Gi¾i thi®u", 11, 100)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760618_OnDefaultEvent(sceneId, selfId,targetId)
	x760618_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760618_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SH_190614_23}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	for i, findId in x760618_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760618_g_ScriptId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760618_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760618_g_eventList do
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
function x760618_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760618_g_eventList do
		if missionScriptId == findId then
			x760618_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc #Ðã Tiªp Nhi®m vø #
--**********************************
function x760618_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760618_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760618_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760618_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760618_OnDie(sceneId, selfId, killerId)
end
