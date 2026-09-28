--NPC
--Ô¬Æ½
--ÆÕÍ¨

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x021202_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC¶Ô»°
--**********************************
		AddText(sceneId,"Các hÕ ðã t×ng nhìn th¤y ngß¶i Tuyªt trong bång ðµng chßa? TÕi hÕ ðây r¤t mu¯n biªt tên ngß¶i tuyªt ¤y t× ðâu ðªn.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
