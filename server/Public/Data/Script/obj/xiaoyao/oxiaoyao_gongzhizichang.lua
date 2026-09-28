--åĞÒ£NPC
--¹«ÖÎ×Ó³¤
--ÆÕÍ¨

x014035_g_scriptId = 014035

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x014035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"G¥n ğây trong lúc vô ı ta ğã tìm ğßşc Xäo tßşng KÏ thß này, làm theo trong sách, quä nhiên ğã tÕo ra Thiên C½ Khôi L²i. Tính nång cüa chúng phi thß¶ng, dß¶ng nhß có th¬ suy nghî, có mu¯n thØ kiªn thÑc không?")
		AddNumText(sceneId,x014035_g_scriptId,"Ği thØ kiªn thÑc Thiên C½ Khôi L²i",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--ÊÂ¼şÁĞ±íÑ¡ÖĞÒ»Ïî
--**********************************
function x014035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<81  then	
			BeginEvent( sceneId )
			local strText = "Ğ×ng coi thß¶ng kÛ ngh® Công Dã TØ Trß·ng cüa ta, ğÆng c¤p chßa ğÕt ğªn c¤p 81, ta s¨ không ğ¬ cho ngß½i nhìn th¤y Thiên C½ Khôi L²i ğâu"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 144,51,129)
		end
	end
end
