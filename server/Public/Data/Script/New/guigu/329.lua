--LÕc Dß½ng NPC
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760329_g_ScriptId = 760329


--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760329_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId," Ngài Biªt TÕi Internet Trung Ngài HÆn là nhß thª nào Bäo hµ Chính mình tin tÑc An toàn Ma ?Nªu Ngài Biªt ðªn l¶i nói Ngã Li«n t¾i Khäo Khäo Ngài ,Toàn bµ Trä l¶i Ðúng r°i S¨ có Khen thß·ng U !#r  #GM£t khác ,M§t Bäo TÕp ÐÆng An toàn Thi th¯ Nh¤t ð¸nh phäi Ð¸nh kÏ Ð±i m¾i ,Nhß v§y Tài Có th¬ bäo ðäm Tài khoän Cüa Kéo dài An toàn .")
	AddNumText(sceneId, x760329_g_ScriptId,"V« Du l¸ch +", 11, 100)
	AddNumText(sceneId, x760329_g_ScriptId,"V« An toàn Tri thÑc Höi ðáp", 11, 200)	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760329_OnDefaultEvent(sceneId, selfId,targetId)
	x760329_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760329_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WHOATN_12103140_01}")
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

	for i, findId in x760329_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760329_g_ScriptId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760329_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760329_g_eventList do
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
function x760329_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760329_g_eventList do
		if missionScriptId == findId then
			x760329_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760329_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760329_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760329_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760329_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760329_OnDie(sceneId, selfId, killerId)
end
