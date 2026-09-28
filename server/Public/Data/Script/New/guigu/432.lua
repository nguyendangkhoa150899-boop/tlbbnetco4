--LÕc Dß½ng NPC
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760432_g_ScriptId = 760432


--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760432_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"M² D÷c theo Táng Tri«u Giang BÕn Mµt ðß¶ng Ðªn t§n ðây ,Ban ngày Tham T§p võ Ý ,Ban ðêm Quan tr¡c Tinh tßþng ,V¾i thanh S½n †n ¦n #Sông l¾n Thao thao Bên trong Lînh ngµ Kiªp phù du Huy«n bí ,LÕi cûng Thänh th½i !Thiªu hi®p Có th¬ Ði trß¾c Nhai Dß Ðäo ,Hòa Vân Phù #W#{_INFOAIM277,225,580,Tri«u T× Vû }Hai n½i Ðä Quái Lai ÐÕt ðßþc Võ Ý Nµi tÑc Tiªn hành Võ Ý Thång c¤p")
	AddNumText(sceneId, x760432_g_ScriptId,"V« Võ Ý", 11, 100)
	AddNumText(sceneId, x760432_g_ScriptId,"V« Võ Ý Thuµc tính", 11, 200)	
	AddNumText(sceneId, x760432_g_ScriptId,"V« Võ Ý Bí truy«n", 11, 300)		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760432_OnDefaultEvent(sceneId, selfId,targetId)
	x760432_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760432_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WYXT_20170803_06}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	if GetNumText() == 200 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WYXT_20170803_07}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end	
	if GetNumText() == 300 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WYXT_20170803_08}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end	

	for i, findId in x760432_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760432_g_ScriptId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760432_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760432_g_eventList do
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
function x760432_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760432_g_eventList do
		if missionScriptId == findId then
			x760432_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760432_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760432_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760432_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760432_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760432_OnDie(sceneId, selfId, killerId)
end
