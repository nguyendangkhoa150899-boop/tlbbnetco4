--Cát Quang Bµi 

--K¸ch bän g¯c Hào 
x760433_g_scriptId = 760433

--S· có ðßþc Sñ ki®n IDDanh sách 
x760433_g_eventList={}	

--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760433_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	local PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JXPVP_170814_126}")
	AddNumText(sceneId, x760433_g_ScriptId,"V« Ngû phß½ng Kính", 11, 100)	
	AddNumText(sceneId, x760433_g_ScriptId,"V« Quét sÕch: CØu Lê Dß nghi®t Nhi®m vø", 11, 200)		
	for i, eventId in x760433_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
		
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760433_OnDefaultEvent(sceneId, selfId,targetId)
	x760433_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760433_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{JXPVP_170814_07}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	if GetNumText() == 200 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{JXMR_171027_08}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end	
	for i, findId in x760433_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760433_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760433_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction(missionScriptId,"CheckAccept", sceneId, selfId)
			if ret> 0 then
              if floor(GetMissionData(sceneId,selfId,XINSHOURENWU)/10) ~= GetDayTime() then
               SetMissionData(sceneId,selfId,XINSHOURENWU,GetDayTime()*10)
              end
               if mod(GetMissionData(sceneId,selfId,XINSHOURENWU),10)>= 50 then
                 x760433_NotifyTip(sceneId, selfId,"M²i ngày Chï có th¬ T¯ 50ThÑ Quét sÕch: CØu Lê Dß nghi®t Nhi®m vø ,Ngß½i Hôm nay ðã Ðã làm 50L¥n ,M¶i Ngày mai LÕi ðªn Ba !")
                 return
               end
               SetMissionData(sceneId,selfId,XINSHOURENWU,GetMissionData(sceneId,selfId,XINSHOURENWU)+1)
			  CallScriptFunction(missionScriptId,"OnAccept", sceneId, selfId)
               x760433_NotifyTip(sceneId, selfId,"Thành công Nh§n Quét sÕch: CØu Lê Dß nghi®t Nhi®m vø ,ChÕy nhanh ði Hoàn thành Ba !")
			end
			return
		end
	end
end

--**********************************
--Cñ tuy®t ThØ NPCCüa Nhi®m vø 
--**********************************
function x760433_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760433_g_eventList do
		if missionScriptId == findId then
			x760433_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760433_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760433_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760433_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760433_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760433_OnDie(sceneId, selfId, killerId)
end

function x760433_NotifyTip(sceneId, selfId, Msg)
	BeginEvent(sceneId)
		AddText(sceneId, Msg)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
