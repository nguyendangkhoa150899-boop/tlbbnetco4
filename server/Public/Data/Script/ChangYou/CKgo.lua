x151088_g_ScriptId = 151088

--x151088_left 	=290.0000
--x151088_right	=292.0000

--x151088_top  	=56.0000
--x151088_bottom	=61.0000


--Íæ¼Ò½øÈëÒ»¸ö area Ê±´¥·¢
ditu ={{519,73,45},{520,100,99},{427,38,24}
}
function x151088_OnEnterArea( sceneId, selfId )

BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x151088_g_ScriptId);
		UICommand_AddString(sceneId, "GotoPetisland_1");
		UICommand_AddString(sceneId, "#G thiªu hi®p: #W n½i này quái v§t ğã không d§y n±i ngài tiêu xài, vì càng nhanh chóng thång c¤p, #r#cFF0000 hay không lña ch÷n ği trß¾c tiªp theo bän ğ°?" );
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

--Íæ¼ÒÔÚÒ»¸ö area ´ôÁËÒ»¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x151088_OnTimer( sceneId, selfId )
	-- ºÁÃë£¬¿´ÔÚÕâ¸ö area Í£Áô¶à¾ÃÁË
	--StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5ÃëºóÈÔÎ´´«ËÍ
	--if StandingTime >= 5000 then
		--x151088_OnEnterArea( sceneId, selfId )
		--ResetAreaStandingTime( sceneId, selfId, 0 )
	--end
end

--Íæ¼ÒÀë¿ªÒ»¸ö area Ê±´¥·¢
function x151088_OnLeaveArea( sceneId, selfId )
end

--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x151088_GotoPetisland_1( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ĞĞ´Ë½Å±¾
	
	-- ¼ì²éÍæ¼ÒÊÇ²»ÊÇ»¹ÔÚÕâ¸ö·¶Î§ÄÚ
	--if sceneId ~= 39   then
		--ÄãÒÑ¾­²»ÔÚ¿É´«ËÍÇøÓò¡£
		--BeginEvent(sceneId)
		---	AddText(sceneId,"ÄãÒÑ¾­²»ÔÚ¿É´«ËÍÇøÓò¡£")
		--EndEvent(sceneId)
		--DispatchMissionTips(sceneId,selfId)
		--return
	--end
	
	--local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	--if 	targetX < x151088_left or
		--	targetX > x151088_right or
		--	targetZ < x151088_top  or
		--	targetZ > x151088_bottom   then
		
		--BeginEvent(sceneId)
		--	AddText(sceneId,"ÄãÒÑ¾­²»ÔÚ¿É´«ËÍÇøÓò¡£")
		--EndEvent(sceneId)
		--DispatchMissionTips(sceneId,selfId)
		--return
		--	
	--end
	local lev = GetLevel(sceneId, selfId)
	if  lev >= 30 and lev < 60 then
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 159,68,95) --·É¹ÅÄ¹
	elseif lev >= 60 and lev < 75 then
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 402,220,218)--·ÉµØÈı
	elseif lev >= 75 and lev < 90 then
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 538,31,33)--·ÉµØËÄ
	elseif lev >= 90 then
	ditunum = random(1,getn(ditu))
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, ditu[ditunum][1],ditu[ditunum][2],ditu[ditunum][3])--·É»ğÑæ
	end
	
		
end


--ZBQR¿ª´úÉÏÁËÒª·¢ÎÒĞ©Õ¹581
