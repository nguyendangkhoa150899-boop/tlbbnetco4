--M¶ m¸t Phong Phó bän....
--Cáp ÐÕi Bá Ð¯i thoÕi K¸ch bän g¯c....

--K¸ch bän g¯c Hào 
x760571_g_ScriptId = 760571

--Phó bän Logic K¸ch bän g¯c Hào....
x760571_g_FuBenScriptId = 002052

--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯....
--**********************************


function x760571_OnDefaultEvent(sceneId, selfId, targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Lý Thu thüy Cái kia ti®n nhân S¤n Ngã Ð°ng tØ Chi thân Là lúc Tß·ng Phái ngß¶i Lai Ðánh lén Ngã ,Mµt D­ dàng nhß v§y")
		AddNumText(sceneId, x760571_g_ScriptId,"Khiêu chiªn", 10, 1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760571_OnEventRequest(sceneId, selfId, targetId, eventId)

  if GetNumText() == 1 then

	--Nªu Ðang · Kích hoÕt BOSST¡c Phän h°i....
	if 1 == CallScriptFunction(x760571_g_FuBenScriptId,"IsSJZTimerRunning", sceneId) then
		return
	end

	--Có phäi hay không Ðµi trß·ng....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_20080521_07}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--Nªu Ðang · cùng Khác BOSSChiªn ð¤u T¡c Phän h°i....
	local ret, msg = CallScriptFunction(x760571_g_FuBenScriptId,"CheckHaveBOSS", sceneId)
	if 1 == ret then
		BeginEvent(sceneId)
			AddText(sceneId, msg)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--Phán ðoán Trß¾c m£t Hay không có th¬ Khiêu chiªn Tang Th± Công....	


	--M· ra M¶ m¸t Phong Tính gi¶ Khí Lai Kích hoÕt Chính mình....
	CallScriptFunction(x760571_g_FuBenScriptId,"OpenSJZTimer", sceneId, 7, x760571_g_ScriptId, -1,-1)

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
 end

  if GetNumText() == 2 then
	SetPos(sceneId, selfId, 72, 92)

 end

end

--**********************************
--M¶ m¸t Phong Tính gi¶ Khí Cüa OnTimer....
--**********************************
function x760571_OnSJZTimer(sceneId, step, data1, data2)

	if 7 == step then
		CallScriptFunction(x760571_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 5 Giây Sau B¡t ð¥u")
		return
	end

	if 6 == step then
		CallScriptFunction(x760571_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 4 Giây Sau B¡t ð¥u")
		return
	end

	if 5 == step then
		CallScriptFunction(x760571_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 3 Giây Sau B¡t ð¥u")
		return
	end

	if 4 == step then
		CallScriptFunction(x760571_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 2 Giây Sau B¡t ð¥u")
		return
	end

	if 3 == step then
		CallScriptFunction(x760571_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 1 Giây Sau B¡t ð¥u")
		return
	end

	if 2 == step then
		--Ð« kÏ Chiªn ð¤u B¡t ð¥u....
		CallScriptFunction(x760571_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u B¡t ð¥u")
		--C¡t bö NPC....
		CallScriptFunction(x760571_g_FuBenScriptId,"DeleteBOSS", sceneId,"LiFan_NPC")
		return
	end

	if 1 == step then
		--Thành l§p BOSS....
		CallScriptFunction(x760571_g_FuBenScriptId,"CreateBOSS", sceneId,"TaoQin_BOSS", -1, -1)
		return
	end

end

