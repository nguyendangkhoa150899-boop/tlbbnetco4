-- 892022
-- Cao Thái công Phï TrÕi Truy«n t¯ng Nhân 

--K¸ch bän g¯c Hào 
x892022_g_scriptId = 892022

--S· có ðßþc Sñ ki®n IDDanh sách 
x892022_g_eventList={}

--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x892022_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId," B¸ Ngß¶i khác Sát Sþ , Phäi r¶i khöi T¯ng Liêu ÐÕi chiªn , Phän h°i LÕc Dß½ng.")
	
	AddNumText(sceneId, x892022_g_scriptId,"R¶i khöi Sát Tinh",0,1)
	--AddNumText(sceneId, x891002_g_scriptId,"T¯ng Liêu ÐÕi chiªn Công lßþc",0,2)
	
	for i, eventId in x892022_g_eventList do
		CallScriptFunction(eventId,"OnEnumerate",sceneId, selfId, targetId)
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x892022_OnDefaultEvent(sceneId, selfId,targetId)
	x892022_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x892022_OnEventRequest(sceneId, selfId, targetId, eventId)
	
	if GetNumText() == 1 then
		local nStoneId = 0
		local nStoneCount = GetItemCount(sceneId, selfId, nStoneId)
		if nStoneCount>= 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"R¶i khöi Sát Tinh");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)		
			return 0
		end
		--LuaFnCancelSpecificImpact(sceneId,selfId,200)
       --LuaFnCancelSpecificImpact(sceneId,selfId,16115)
		CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 2, 160, 132, 10)

		return
	end

	if GetNumText() == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"T¯ng Liêu ÐÕi chiªn Vi #Y20: 00-21: 00##WTiªn vào Th¶i gian vì #Y19: 45-21: 00##cFF0000Vßþt qua Th¶i gian Tß½ng Không ðßþc tiªn vào , #Y21: 00#GT¯ng Liêu ÐÕi chiªn Th¶i gian Sau khi kªt thúc #WNgß¶i ch½i Tß½ng Truy«n ra Bän ð° !")
	AddText(sceneId,"#GQuy t¡c: #WNgß¶i ch½i Có th¬ Công kích T× Liêu Tiªn vào Ngß¶i ch½i Ðãn Không th¬ Công kích Ð°ng minh Cüa Ngß¶i ch½i.")
	AddText(sceneId,"#GBáo danh Th¶i gian: #WM²i ngày Vãn #Y19: 45-20: 00:#r #GÐÕi chiªn Th¶i gian: #WM²i ngày Vãn #Y20: 00-21: 00.")
	AddText(sceneId,"#cFF0000R½i xu¯ng: #W Ðiêu Vån Phù 9C¤p Ðá quý Chí tôn Sáo Th¥n binh Phù Tuyên Võ Chi Kh¤p Thanh Long Chi L® Chu Tß¾c Chi Höa BÕch h± C½n gi§n Th¥n thÕch Luân h°i Ch¶ v§t ph¦m Quân B¤t Trói ð¸nh.")
			AddNumText(sceneId, x889063_g_scriptId,"Hüy bö", 5, 4)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	end

	if GetNumText() == 4 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, targetId)
			EndUICommand(sceneId)
		DispatchUICommand(sceneId, selfId, 1000)
		return
	end

	for i, findId in x892022_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x892022_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x892022_g_eventList do
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
function x892022_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau , Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x892022_g_eventList do
		if missionScriptId == findId then
			x892022_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø)
--**********************************
function x892022_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x892022_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x892022_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x892022_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x892022_OnDie(sceneId, selfId, killerId)
end

