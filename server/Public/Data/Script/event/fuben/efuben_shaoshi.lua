x402050_g_ScriptId = 402050


x402050_left 	=139.0000
x402050_right	=222.0000

x402050_top  	=142.0000
x402050_bottom  =222.0000


--Íæ¼Ò½øÈëÒ»¸ö area Ê±´¥·¢
function x402050_OnEnterArea( sceneId, selfId )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x402050_g_ScriptId);
		UICommand_AddString(sceneId, "GotoDali");
		UICommand_AddString(sceneId, "Các hÕ xác nh§n r¶i khöi Thiªu Th¤t S½n sao?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 186,191,221)
end

--Íæ¼ÒÔÚÒ»¸ö area ´ôÁËÒ»¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x402050_OnTimer( sceneId, selfId )
	-- ºÁÃë£¬¿´ÔÚÕâ¸ö area Í£Áô¶à¾ÃÁË
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5ÃëºóÈÔÎ´´«ËÍ
	if StandingTime >= 5000 then
		x402050_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--Íæ¼ÒÀë¿ªÒ»¸ö area Ê±´¥·¢
function x402050_OnLeaveArea( sceneId, selfId )
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êý
--**********************************
function x402050_GotoDali( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ÐÐ´Ë½Å±¾
	
	--ÊÇ·ñÊÇ¸±±¾
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x402050_left or
			targetX > x402050_right or
			targetZ < x402050_top  or
			targetZ > x402050_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Các hÕ không n¢m trong khu vñc d¸ch chuy¬n.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,265,247)
		
end
