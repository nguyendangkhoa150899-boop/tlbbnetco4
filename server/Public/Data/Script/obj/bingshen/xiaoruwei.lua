-- Áì½±NPC

x894068_g_scriptId = 894068

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x894068_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"      Th§t không biªt s¯ng chªt là gì. Dám ðªn #YKhiêu chiªn #Wv¾i Ta sao")
		AddNumText( sceneId, x894068_g_scriptId, "#GKhiêu Chiªn...", 10, 200)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x894068_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 200 then
		BeginEvent(sceneId)
			AddText(sceneId,"  #cFF0000Th§t tiªc ! #WCác ngß½i chßa th¬ #GKhiêu Chiªn #Wv¾i ta ðßþc...")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end
