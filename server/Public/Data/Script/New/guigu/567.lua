--M¶ m¸t Phong Phó bän....
--Tang Th± Công Ð¯i thoÕi K¸ch bän g¯c....

--K¸ch bän g¯c Hào 
x760567_g_ScriptId = 760567

--Phó bän Logic K¸ch bän g¯c Hào....
x760567_g_FuBenScriptId = 002052

--**********************************
--Nhi®m vø Nh§p kh¦u Hàm s¯....
--**********************************
function x760567_OnDefaultEvent(sceneId, selfId, targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"Ðáng tiªc Ta này 70 Nåm Công lñc N¯i nghi®p không ngß¶i")
		AddNumText(sceneId, x760567_g_ScriptId,"Khiêu chiªn", 10, 1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--Sñ ki®n Danh sách Lña ch÷n HÕng nh¤t 
--**********************************
function x760567_OnEventRequest(sceneId, selfId, targetId, eventId)
  if GetNumText() == 1 then
	--Nªu Ðang · Kích hoÕt BOSST¡c Phän h°i....
	if 1 == CallScriptFunction(x760567_g_FuBenScriptId,"IsSJZTimerRunning", sceneId) then
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
	local ret, msg = CallScriptFunction(x760567_g_FuBenScriptId,"CheckHaveBOSS", sceneId)
	if 1 == ret then
		BeginEvent(sceneId)
			AddText(sceneId, msg)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--M· ra M¶ m¸t Phong Tính gi¶ Khí Lai Kích hoÕt Chính mình....
	CallScriptFunction(x760567_g_FuBenScriptId,"OpenSJZTimer", sceneId, 7, x760567_g_ScriptId, -1, -1)

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
 end

  if GetNumText() == 2 then
	SetPos(sceneId, selfId, 72, 33)
 end

end

--**********************************
--M¶ m¸t Phong Tính gi¶ Khí Cüa OnTimer....
--**********************************
function x760567_OnSJZTimer(sceneId, step, data1, data2)

	if 7 == step then
		CallScriptFunction(x760567_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 5 giây sau B¡t ð¥u")
		return
	end

	if 6 == step then
		CallScriptFunction(x760567_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 4 giây sau B¡t ð¥u")
		return
	end

	if 5 == step then
		CallScriptFunction(x760567_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 3 giây sau B¡t ð¥u")
		return
	end

	if 4 == step then
		CallScriptFunction(x760567_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 2 giây sau B¡t ð¥u")
		return
	end

	if 3 == step then
		CallScriptFunction(x760567_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u 1 giây sau B¡t ð¥u")
		return
	end

	if 2 == step then
		--Ð« kÏ Chiªn ð¤u B¡t ð¥u....
		CallScriptFunction(x760567_g_FuBenScriptId,"TipAllHuman", sceneId,"Chiªn ð¤u B¡t ð¥u")
		--C¡t bö NPC....
		CallScriptFunction(x760567_g_FuBenScriptId,"DeleteBOSS", sceneId,"QinYun_NPC")
		return
	end

	if 1 == step then
		--Thành l§p BOSS....
		CallScriptFunction(x760567_g_FuBenScriptId,"CreateBOSS", sceneId,"QinYun_BOSS", -1, -1)
		return
	end

end

