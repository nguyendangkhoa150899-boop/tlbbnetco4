--M¶ m¸t Phong Phó bän....
--Chiªn bÕi Ô Lão ðÕi Ð¯i thoÕi K¸ch bän g¯c....

--K¸ch bän g¯c Hào 
x760569_g_ScriptId = 760569

--Phó bän Logic K¸ch bän g¯c Hào....
x760569_g_FuBenScriptId = 002052


--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯....
--**********************************
function x760569_OnDefaultEvent(sceneId, selfId, targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Bän tôn Kª th×a Vô nhai tØ Sß phø Công lñc Hòa Sß bá Thiên S½n Ð°ng M² Võ công Tr· thành Tiêu dao phái Chß·ng môn nhân Ðóng giæ Dæ Lang hoàn Phúc ð¸a")
		AddNumText(sceneId, x760569_g_ScriptId,"Khiêu chiªn", 10, 1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760569_OnEventRequest(sceneId, selfId, targetId, eventId)
  if GetNumText() == 1 then

	--Nªu Ðang · Kích hoÕt BOSST¡c Phän h°i....
	if 1 == CallScriptFunction(x760569_g_FuBenScriptId,"IsSJZTimerRunning", sceneId) then
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

	--Phán ðoán Trß¾c m£t Hay không có th¬ Khiêu chiªn Lý Thu thüy....	


	--Nªu Ðang · cùng Khác BOSSChiªn ð¤u T¡c Phän h°i....
	local ret, msg = CallScriptFunction(x760569_g_FuBenScriptId,"CheckHaveBOSS", sceneId)
	if 1 == ret then
		BeginEvent(sceneId)
			AddText(sceneId, msg)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--M· ra M¶ m¸t Phong Tính gi¶ Khí Lai Kích hoÕt Chính mình....
	CallScriptFunction(x760569_g_FuBenScriptId,"OpenSJZTimer", sceneId, 7, x760569_g_ScriptId, -1,-1)
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
 end

  if GetNumText() == 2 then
   CallScriptFunction((400900),"TransferFunc", sceneId, selfId, 1, 195,215,10)--Truy«n t¯ng 
 end

end

--**********************************
--M¶ m¸t Phong Tính gi¶ Khí Cüa OnTimer....
--**********************************
function x760569_OnSJZTimer(sceneId, step, data1, data2)

	if 7 == step then
		CallScriptFunction(x760569_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 5 giây sau B¡t ð¥u")
		return
	end

	if 6 == step then
		CallScriptFunction(x760569_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 4 giây sau B¡t ð¥u")
		return
	end

	if 5 == step then
		CallScriptFunction(x760569_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 3 giây sau B¡t ð¥u")
		return
	end

	if 4 == step then
		CallScriptFunction(x760569_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 2 giây sau B¡t ð¥u")
		return
	end

	if 3 == step then
		CallScriptFunction(x760569_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 1 giây sau B¡t ð¥u")
		return
	end

	if 2 == step then
		--Ð« kÏ Chiªn ð¤u B¡t ð¥u....
		CallScriptFunction(x760569_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u B¡t ð¥u")
		--C¡t bö NPC....
		CallScriptFunction(x760569_g_FuBenScriptId,"DeleteBOSS", sceneId,"TaoQin_NPC")		
		return
	end

	if 1 == step then
		--Thành l§p BOSS....
		CallScriptFunction(x760569_g_FuBenScriptId,"CreateBOSS", sceneId,"PangQi_BOSS", -1, -1)
		return
	end

end

