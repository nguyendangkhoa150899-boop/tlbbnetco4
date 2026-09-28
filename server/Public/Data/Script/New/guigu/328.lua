--LÕc Dß½ng NPC
--Bình thß¶ng 

--K¸ch bän g¯c Hào 
x760328_g_ScriptId = 760328


--**********************************
--Sñ ki®n Danh sách 
--**********************************
function x760328_UpdateEventList(sceneId, selfId,targetId)
	BeginEvent(sceneId)
	AddText(sceneId,"  Không sai ,Ta chính là Tri«u ðình Ð£c phái Cüa #GÐi«u tra Ð£c sÑ #W,Chuyên môn Sßu t§p Thiên Long Ngß¶i ch½i Cüa Các loÕi Tình báo ,Ð¬ Chúng ta Càng t¯t Vì ðÕi gia phøc vø .Ðß½ng nhiên Giang h° Vi®c Không riêng Mu¯n dña Ta Ði«u tra c¦n th§n ,Hoàn Mu¯n dña Các v¸ Giang h° Thiªu hi®p H² trþ Cung c¤p Manh m¯i ,Cho nên M²i cách Mµt ðoÕn Th¶i gian ,Ngã Li«n ðem TÕi LÕc Dß½ng N½i này Tuyên b¯ Mµt l¥n Thiên Long Ði«u tra ,Nªu Na V¸ thiªu hi®p Nguy®n ý H² trþ Trä l¶i Mµt chút ThoÕi ,Ngã Tß½ng Không th¡ng cäm kích .")
	AddNumText(sceneId, x760328_g_ScriptId,"Tham gia Thiên Long Ði«u tra", 6, 100)
	AddNumText(sceneId, x760328_g_ScriptId,"V« Thiên Long Ði«u tra", 11, 200)	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--Sñ ki®n Lçn nhau Nh§p kh¦u 
--**********************************
function x760328_OnDefaultEvent(sceneId, selfId,targetId)
	x760328_UpdateEventList(sceneId, selfId, targetId)
end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760328_OnEventRequest(sceneId, selfId, targetId, eventId)
	if GetNumText() == 100 then
		BeginEvent(sceneId)
			AddText(sceneId,"  Ngßþng ngùng Nga ,G¥n nh¤t mµt l¥n Cüa #GThiên Long Ði«u tra #WÐã Kªt thúc ,Cäm TÕ thiªu hi®p Ð¯i ta Công tác Chú ý Dæ Duy trì .M²i l¥n Ði«u tra B¡t ð¥u th¶i ði¬m Ngã Ð«u ðem Dî Bßu ki®n Cüa Hình thÑc Thông tri Các V¸ thiªu hi®p ,M¶i Ngài Chú ý Ki¬m tra và nh§n .Hy v÷ng L¥n sau Ði«u tra B¡t ð¥u th¶i ði¬m ,Thiªu hi®p Có th¬ Ðúng hÕn Ðã ðªn ,Không c¥n LÕi bö lÞ Yêu !")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	if GetNumText() == 200 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WHOATN_12103139_01}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end	

	for i, findId in x760328_g_eventList do
		if eventId == findId then
			CallScriptFunction(eventId,"OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x760328_g_ScriptId)
			return
		end
	end
end

--**********************************
--Tiªp thu ThØ NPCCüa Nhi®m vø 
--**********************************
function x760328_OnMissionAccept(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760328_g_eventList do
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
function x760328_OnMissionRefuse(sceneId, selfId, targetId, missionScriptId)
	--Cñ tuy®t Lúc sau ,Yªu Phän h°i NPCSñ Ki®n Danh sách 
	for i, findId in x760328_g_eventList do
		if missionScriptId == findId then
			x760328_UpdateEventList(sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Tiªp tøc (Ðã Tiªp Nhi®m vø )
--**********************************
function x760328_OnMissionContinue(sceneId, selfId, targetId, missionScriptId)
	for i, findId in x760328_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnContinue", sceneId, selfId, targetId)
			return
		end
	end
end

--**********************************
--Ð® trình Ðã Làm xong Cüa Nhi®m vø 
--**********************************
function x760328_OnMissionSubmit(sceneId, selfId, targetId, missionScriptId, selectRadioId)
	for i, findId in x760328_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction(missionScriptId,"OnSubmit", sceneId, selfId, targetId, selectRadioId)
			return
		end
	end
end

--**********************************
--TØ vong Sñ ki®n 
--**********************************
function x760328_OnDie(sceneId, selfId, killerId)
end
