--Phßþng minh NPC
--Bình thß¶ng ð® tØ 
--Bình thß¶ng 

--**********************************
--K¸ch bän g¯c Hào 
x760360_g_ScriptId = 760360

--CØa hàng Ðánh s¯ 
x760360_g_shoptableindex=73
--S· có ðßþc Sñ ki®n IDDanh sách 
x760360_g_eventList={713508,713567}
--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760360_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"  Có không — dã NgoÕi D­ dàng ÐÕt ðßþc Mö Cüa V¸ trí ,T¸nh Khai qu§t Xu¤t Phong phú Khoáng thÕch Th¸ Nghi®m chÑng Ngß½i Hay không là Mµt ngß¶i Ðü tß cách Thäi quáng Sß Cüa Tiêu chu¦n .#r  $N,Ngß½i Nªu có Cái gì Nghi ho£c Có th¬ Tiªn ðªn Höi ta .")
	for i, eventId in x760360_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	--CØa hàng Tuy¬n HÕng 
	AddNumText(sceneId,x760360_g_ScriptId,"Mua s¡m Công cø",7,ABILITY_TEACHER_SHOP)
	--AddNumText(sceneId, x760360_g_ScriptId,"Thäi quáng Gi¾i thi®u", 11, 100)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760360_OnDefaultEvent(sceneId, selfId,targetId)
	x760360_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760360_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{function_help_005}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end

	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem(sceneId, selfId,targetId, x760360_g_shoptableindex)
	end
	for i, findId in x760360_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760360_g_ScriptId)
		return
		end
	end

end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760360_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760360_g_eventList do
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
function x760360_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760360_g_eventList do
		if missionScriptId == findId then
			x760360_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760360_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760360_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760360_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760360_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760360_OnDie(sceneId, selfId, killerId)
end
