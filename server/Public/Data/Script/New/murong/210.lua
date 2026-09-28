--Íæ¼Ò½øÈëÒ»¸ö area Ê±´¥·¢
function x760110_OnEnterArea( sceneId, selfId )
	if	GetLevel( sceneId, selfId)<10 then
		BeginEvent(sceneId)
			strText = "Nhî ðích ðÆng c¤p b¤t túc 10 c¤p"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 435,155,162, 10)
	end
end

--Íæ¼ÒÔÚÒ»¸ö area ´ôÁËÒ»¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x760110_OnTimer( sceneId, selfId )
	-- ºÁÃë£¬¿´ÔÚÕâ¸ö area Í£Áô¶à¾ÃÁË
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5ÃëºóÈÔÎ´´«ËÍ
	if StandingTime >= 5000 then
		x760110_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--Íæ¼ÒÀë¿ªÒ»¸ö area Ê±´¥·¢
function x760110_OnLeaveArea( sceneId, selfId )
end
