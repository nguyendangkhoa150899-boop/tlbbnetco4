x402049_g_ScriptId = 402049


x402049_left 	=131.0000
x402049_right	=141.0000

x402049_top  	=130.0000
x402049_bottom  =137.0000


--Íæ¼Ò½øÈëÒ»¸ö area Ê±´¥·¢
function x402049_OnEnterArea( sceneId, selfId )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x402049_g_ScriptId);
		UICommand_AddString(sceneId, "GotoDali");
		UICommand_AddString(sceneId, "Các hÕ xác nh§n r¶i khöi Binh Thánh KÏ Tr§n sao?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 186,191,221)
end

--Íæ¼ÒÔÚÒ»¸ö area ´ôÁËÒ»¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x402049_OnTimer( sceneId, selfId )
	-- ºÁÃë£¬¿´ÔÚÕâ¸ö area Í£Áô¶à¾ÃÁË
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5ÃëºóÈÔÎ´´«ËÍ
	if StandingTime >= 5000 then
		x402049_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--Íæ¼ÒÀë¿ªÒ»¸ö area Ê±´¥·¢
function x402049_OnLeaveArea( sceneId, selfId )
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x402049_GotoDali( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾
	
	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x402049_left or
			targetX > x402049_right or
			targetZ < x402049_top  or
			targetZ > x402049_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ không n¢m trong khu vñc d¸ch chuy¬n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,268,247)
		
end
