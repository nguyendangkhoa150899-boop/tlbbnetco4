--Vß½ng Bân Chi 

--K¸ch bän g¯c Hào 
x760615_g_scriptId = 760615

--S· có ðßþc Sñ ki®n IDDanh sách 
--x760615_g_eventList={228908}
x760615_g_eventList={229009,229012,808092,228912}
--x760615_g_eventList={}--201012,201111,201411,201412,201611,201612	,808004	

--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760615_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	local PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"ÐÕi Mµng Thùy Ngß¶i s¾m giác ngµ ,Bình sinh Ngã Tñ biªt .#rKhông biªt Hôm nay Ngß½i Mu¯n ðÕi Túy Vài l¥n ?")
	for i, eventId in x760615_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760615_OnDefaultEvent(sceneId, selfId,targetId)
	x760615_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760615_OnEventRequest(sceneId, selfId, targetId, eventId)
	for i, findId in x760615_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760615_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760615_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction(missionScriptId,"CheckAccept", sceneId, selfId)
			if ret> 0 then
				CallScriptFunction(missionScriptId,"OnAccept", sceneId, selfId, targetId)
			end
			return
		end
	end
end

--**********************************
--Cñ tuy®t ThØ NPCCüa Nhi®m vø 
--**********************************
function x760615_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760615_g_eventList do
		if missionScriptId == findId then
			x760615_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc #Ðã Tiªp Nhi®m vø #
--**********************************
function x760615_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760615_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760615_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760615_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760615_OnDie(sceneId, selfId, killerId)
end
