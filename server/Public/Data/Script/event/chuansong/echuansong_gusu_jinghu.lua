x400166_g_ScriptId = 400166

x400166_left 	=160.0000
x400166_right	=168.0000

x400166_top  	=162.0000
x400166_bottom	=171.0000


--Íæ¼Ò½øÈëÒ»¸ö area Ê±´¥·¢
function x400166_OnEnterArea( sceneId, selfId )

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400166_g_ScriptId);
		UICommand_AddString(sceneId, "GotoJinghu");
		UICommand_AddString(sceneId, "Kinh H° là khu vñc không tång sát khí, c¥n chú ı ğªn sñ an toàn. Các hÕ xác nh§n không?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,277,46)
end

--Íæ¼ÒÔÚÒ»¸ö area ´ôÁËÒ»¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x400166_OnTimer( sceneId, selfId )
	-- ºÁÃë£¬¿´ÔÚÕâ¸ö area Í£Áô¶à¾ÃÁË
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5ÃëºóÈÔÎ´´«ËÍ
	if StandingTime >= 5000 then
		x400166_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--Íæ¼ÒÀë¿ªÒ»¸ö area Ê±´¥·¢
function x400166_OnLeaveArea( sceneId, selfId )
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x400166_GotoJinghu( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ĞĞ´Ë½Å±¾
	
	-- ¼ì²éÍæ¼ÒÊÇ²»ÊÇ»¹ÔÚÕâ¸ö·¶Î§ÄÚ
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,58,142)
		
end
