--Ngß¶i ch½i Tiªn vào Mµt cái area Th¶i Xúc phát 
function x760606_OnEnterArea(sceneId, selfId)
	if	GetLevel(sceneId, selfId)<10 then
		BeginEvent(sceneId)
			strText ="Ngß½i c¤p b§c Không ðü c¤p 10"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		CallScriptFunction((400900),"TransferFunc",sceneId, selfId, 195,269,178, 10)
	end
end

--Ngß¶i ch½i TÕi Mµt cái area Ngây ngß¶i Mµt ðoÕn th¶i gian Không ði T¡c Ðúng gi¶ Xúc phát 
function x760606_OnTimer(sceneId, selfId)
	-- Hào Mi¬u ,Khán — cái này area Ðình — lÕi bao lâu R°i 
	StandingTime = QueryAreaStandingTime(sceneId, selfId)
	-- 5Giây sau Nhßng Chßa Truy«n t¯ng 
	if StandingTime>= 5000 then
		x760606_OnEnterArea(sceneId, selfId)
		ResetAreaStandingTime(sceneId, selfId, 0)
	end
end

--Ngß¶i ch½i R¶i ði Mµt cái area Th¶i Xúc phát 
function x760606_OnLeaveArea(sceneId, selfId)
end
