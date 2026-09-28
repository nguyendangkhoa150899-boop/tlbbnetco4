--NPC
--²©À­
--ÆÕÍ¨

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x021201_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC¶Ô»°
--**********************************
		AddText(sceneId,"Ngân Ngai Tuyªt Nguyên ð¥y nhæng nguy c½, khi ðªn ðây xin c¦n th§n.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
