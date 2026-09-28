--±¦²Ø¶´Ò»ÖÁÎå²ãNPC
--Ò¦·ò¡¡Ò¦¹«¡¡Ò¦²®¡¡Ò¦ÖÙ¡¡Ò¦Êå
--Ò©µê

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x039001_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Bäo tàng ğµng vô s¯ bäo v§t, nhßng cûng nguy hi¬m vÕn ph¥n, ğÕi hi®p ngß½i phäi chu¦n b¸ chu ğáo ğ¤y!")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
