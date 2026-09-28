--Người chơi Tiến vào Một cái area Thời Xúc phát 
function x760418_OnEnterArea(sceneId, selfId)
	CallScriptFunction((400900),"TransferFunc",sceneId, selfId, 2,159,132)
end

--Người chơi Tại Một cái area Ngây người Một đoạn thời gian Không đi Tắc Đúng giờ Xúc phát 
function x760418_OnTimer(sceneId, selfId)
	-- Hào Miểu ,Khán Ở cái này area Đình Ở lại bao lâu Rồi 
	StandingTime = QueryAreaStandingTime(sceneId, selfId)
	-- 5Giây sau Nhưng Chưa Truyền tống 
	if StandingTime>= 5000 then
		x760418_OnEnterArea(sceneId, selfId)
		ResetAreaStandingTime(sceneId, selfId, 0)
	end
end

--Người chơi Rời đi Một cái area Thời Xúc phát 
function x760418_OnLeaveArea(sceneId, selfId)
end
