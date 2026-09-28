x400027_g_ScriptId = 400027

x400027_left 	=90.0000
x400027_right	=101.0000

x400027_top  	=190.0000
x400027_bottom	=198.0000


--Íæ¼Ò½øÈëÒ»¸ö area Ê±´¥·¢
function x400027_OnEnterArea( sceneId, selfId )
	if	GetLevel( sceneId, selfId)<20 then
		BeginEvent(sceneId)
			strText = "ÐÆng c¤p cüa các hÕ không ðü c¤p 20"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400027_g_ScriptId);
		UICommand_AddString(sceneId, "GotoJinghu1");
		UICommand_AddString(sceneId, "Kinh H° là khu vñc không tång sát khí, c¥n chú ý ðªn sñ an toàn. Các hÕ xác nh§n không?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,45,264, 20)
	end
end

--Íæ¼ÒÔÚÒ»¸ö area ´ôÁËÒ»¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x400027_OnTimer( sceneId, selfId )
	-- ºÁÃë£¬¿´ÔÚÕâ¸ö area Í£Áô¶à¾ÃÁË
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5ÃëºóÈÔÎ´´«ËÍ
	if StandingTime >= 5000 then
		x400027_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--Íæ¼ÒÀë¿ªÒ»¸ö area Ê±´¥·¢
function x400027_OnLeaveArea( sceneId, selfId )
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x400027_GotoJinghu1( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾
	
	-- ¼ì²éÍæ¼ÒÊÇ²»ÊÇ»¹ÔÚÕâ¸ö·¶Î§ÄÚ
	if sceneId ~= 12   then
		--Các hÕ ðã không n¢m trong khu vñc d¸ch chuy¬n.
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ ðã không n¢m trong khu vñc d¸ch chuy¬n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400027_left or
			targetX > x400027_right or
			targetZ < x400027_top  or
			targetZ > x400027_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ ðã không n¢m trong khu vñc d¸ch chuy¬n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,34,233, 20)
		
end
