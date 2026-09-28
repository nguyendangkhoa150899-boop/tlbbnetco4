--ÌÆÃÅNPC
--ÐÄ·¨
--ÆÕÍ¨

x760101_g_scriptId = 760101
x760101_g_shoptableindex=301
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x760101_OnDefaultEvent( sceneId, selfId,targetId )
	x760101_g_MenPai = GetMenPai(sceneId, selfId)
	if x760101_g_MenPai == 10 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{GUSU_MENPAI_31}")
			AddNumText(sceneId, x760101_g_scriptId, "Mua s¡m tiªn giai bí pháp: Li­u ph¤t y",7,30)
			AddNumText(sceneId, x760101_g_scriptId, "H÷c t§p kÛ nång",12,0)
			AddNumText(sceneId, x760101_g_scriptId, "V« tâm pháp gi¾i thi®u",11,10)
			AddNumText(sceneId, x760101_g_scriptId, "Môn phái tiªn giai gi¾i thi®u",11,13)
			AddNumText(sceneId, x760101_g_scriptId, "Kinh mÕch cùng bí pháp tu luy®n gi¾i thi®u",11,14)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId, "Ngß½i mu¯n tìm ta lu§n bàn võ công sao?" )
			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x760101_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_xinfajieshao_001}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	elseif GetNumText() == 11 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{JZBZ_081031_01}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif GetNumText() == 13 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{MPJJ_XT_110705_02}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return	
	elseif GetNumText() == 14 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{MPJJ_XT_110705_08}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return		
	elseif GetNumText() == 30 then
		DispatchShopItem( sceneId, selfId,targetId, x760101_g_shoptableindex )
		return		
	end	
	
	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 10 );
end
