--ËùÓµÓĞµÄÊÂ¼şIDÁĞ±í
x400943_g_Transport = 400900

--Íæ¼Ò½øÈëÒ»¸ö area Ê±´¥·¢
function x400943_OnEnterArea( sceneId, selfId )
        if GetLevel( sceneId, selfId ) < 90 then 
		BeginEvent( sceneId )
			AddText( sceneId, "  Ngoài thành r¤t nguy hi¬m, vä lÕi ğÆng c¤p cüa các hÕ chßa ğªn 90, vì sñ an toàn cüa các hÕ, hãy luy®n lên c¤p 90 xong r°i có th¬ ra ngoài thành." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, -1 )
	else 
		CallScriptFunction((x400943_g_Transport), "TransferFunc",sceneId, selfId, 425, 31, 27, 90, 1000)
	end
	
end


--Íæ¼ÒÔÚÒ»¸ö area ´ôÁËÒ»¶ÎÊ±¼äÃ»×ßÔò¶¨Ê±´¥·¢
function x400943_OnTimer( sceneId, selfId )
	-- ºÁÃë£¬¿´ÔÚÕâ¸ö area Í£Áô¶à¾ÃÁË
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5ÃëºóÈÔÎ´´«ËÍ
	if StandingTime >= 5000 then
		x400943_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--Íæ¼ÒÀë¿ªÒ»¸ö area Ê±´¥·¢
function x400943_OnLeaveArea( sceneId, selfId )
end
