--NPC
--ÄþÁî¸ç
--ÆÕÍ¨

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x021200_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC¶Ô»°
--**********************************
		AddText(sceneId,"Các hÕ ðã t×ng nghe qua câu chuy®n v« hÕnh phúc cüa Ð§u Ð§u chßa?")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
