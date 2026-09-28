--ÓñÏªNPC
--ÂÜ²·
--ÆÕÍ¨

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x027003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Xin chào. #r#rTa là La B¯c. #r  Cha ta là T¯ Mçu La, #r#rM© ta là C± L² LÕp.#r  Muµi ta là Y Na. #r  ...#r  XØ lý xong")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
