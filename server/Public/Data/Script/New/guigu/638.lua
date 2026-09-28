--Trình Thanh Sß½ng 

--K¸ch bän g¯c Hào 
x760638_g_scriptId = 760638


--S· có ðßþc Sñ ki®n IDDanh sách 
x760638_g_eventList={210209,210287}

--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760638_UpdateEventList(sceneId, selfId,targetId)
	
	local Menpai=LuaFnGetMenPai(sceneId,selfId)
	local PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex ="Sß muµi"
	else
		PlayerSex ="Sß ð®"
	end
	
	BeginEvent(sceneId)	
	if Menpai == 9 then
		AddText(sceneId,"#{THDRZ_190613_01}")
	elseif Menpai == MP_TANGMEN then
		AddText(sceneId,""..PlayerSex..",Ngß½i võ công Tiªn bµ Th§t nhanh A .#r#rChß·ng môn HÆn là Ng§n Coi tr÷ng Ngß½i ði ,Th§t là Hâm mµ .Ngã Cûng nên Tr· v« núi Bái kiªn Chß·ng môn .")
	else
		AddText(sceneId,"Ðã lâu Không có Nhìn th¤y ngß½i ,Dî Ngß½i nhß v§y Thiên tß ,Th§t ðáng tiªc Không · Ngã Ðào hoa Ðäo .")
	end
	
	if	GetLevel(sceneId, selfId)<=10	then
		AddNumText(sceneId,x760638_g_scriptId,"KhÑ Ðào hoa Ðäo Nhìn xem",9,0)
	end
	for i, eventId in x760638_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760638_OnDefaultEvent(sceneId, selfId,targetId)
	x760638_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760638_OnEventRequest(sceneId, selfId, targetId, eventId)
	if	GetNumText()==0	then
		if IsHaveMission(sceneId,selfId,4021)> 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ngß½i Có ThuÖ v§n Khoang chÑa hàng Trong ngß¶i ,Chúng ta D¸ch TrÕm không th¬ Vì ngß½i Cung c¤p Truy«n t¯ng Phøc vø .");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else	
			CallScriptFunction((400900),"TransferFunc",sceneId, selfId, 195,257,175)
		end

	elseif  GetNumText()==10	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{THDRZ_190613_50}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif  GetNumText()==11	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{THDRZ_190613_51}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif  GetNumText()==12	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{THDRZ_190613_52}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif  GetNumText()==13	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{THDRZ_190613_53}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	else
		for i, findId in x760638_g_eventList do
			if eventId == findId then
				CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId)
				return
			end
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760638_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760638_g_eventList do
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
function x760638_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760638_g_eventList do
		if missionScriptId == findId then
			x760638_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc #Ðã Tiªp Nhi®m vø #
--**********************************
function x760638_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760638_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760638_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760638_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760638_OnDie(sceneId, selfId, killerId)
end
