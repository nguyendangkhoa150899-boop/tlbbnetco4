x402048_g_ScriptId = 402048


x402048_left 	=107.0000
x402048_right	=117.0000

x402048_top  	=107.0000
x402048_bottom  =114.0000


--Íæ¼Ò½øÈëÒ»¸ö area Ê±´¥·¢
function x402048_OnEnterArea( sceneId, selfId )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x402048_g_ScriptId);
		UICommand_AddString(sceneId, "GotoSuzhou");
		UICommand_AddString(sceneId, "Các hÕ xác nh§n r¶i khöi TÑ Tuy®t Trang sao?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 186,191,221)
end

--Íæ¼ÒÔÚÒ»¸ö area ´ôÁËÒ»¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x402048_OnTimer( sceneId, selfId )
	-- ºÁÃë£¬¿´ÔÚÕâ¸ö area Í£Áô¶à¾ÃÁË
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5ÃëºóÈÔÎ´´«ËÍ
	if StandingTime >= 5000 then
		x402048_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--Íæ¼ÒÀë¿ªÒ»¸ö area Ê±´¥·¢
function x402048_OnLeaveArea( sceneId, selfId )
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x402048_GotoSuzhou( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾
	
	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x402048_left or
			targetX > x402048_right or
			targetZ < x402048_top  or
			targetZ > x402048_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ không n¢m trong khu vñc d¸ch chuy¬n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1,194,215)
		
end
