--ÌÆÃÅNPC
--ÐÄ·¨
--ÆÕÍ¨

x760004_g_scriptId = 760004
x760004_g_shoptableindex=303
--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x760004_OnDefaultEvent( sceneId, selfId,targetId )
	x760004_g_MenPai = GetMenPai(sceneId, selfId)
	if x760004_g_MenPai == 11 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{XMPTM_130813_09}")
			AddNumText(sceneId, x760004_g_scriptId, "mua: lßu vân thï",7,30)			
			AddNumText(sceneId, x760004_g_scriptId, "H÷c kÛ nång",12,0)
			AddNumText(sceneId, x760004_g_scriptId, "gi¾i thiêu",11,10)
			AddNumText(sceneId, x760004_g_scriptId, "tiªn c¤p gi¾i thi®u",11,13)
			AddNumText(sceneId, x760004_g_scriptId, "kinh mÕch gi¾i thi®u",11,14)			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			AddText(sceneId,"ÎÒÊÇÌÆÔÀ³å£¬ÄãÓÐºÎÊÂ°¡£¿")
			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x760004_OnEventRequest( sceneId, selfId, targetId, eventId )
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
		DispatchShopItem( sceneId, selfId,targetId, x760004_g_shoptableindex )
		return		
	end
	
	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 11 );
end
