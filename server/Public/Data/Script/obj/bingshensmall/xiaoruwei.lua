-- Áì½±NPC

x895068_g_scriptId = 895068

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x895068_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Thiên ðß¶ng hæu lµ quân b¤t t¦u, ð¸a ngøc vô môn t¯ng thßþng lai!")
		AddNumText( sceneId, x895068_g_scriptId, "#c00ff00Chiªn ð¤u", 10, 200)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--ÊÂ¼þÁÐ±íÑ¡ÖÐÒ»Ïî
--**********************************
function x895068_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 200 then
		BeginEvent(sceneId)
			AddText(sceneId,"Huynh ð® ð°ng tâm chiªn ð¤u, chúng ta s¨ cùng các ngß½i chiªn ð¤u!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end
