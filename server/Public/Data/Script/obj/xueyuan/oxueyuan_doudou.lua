--NPC
--¶¹¶¹
--ÆÕÍ¨

--**********************************
--ÊÂ¼þ½»»¥Èë¿Ú
--**********************************
function x021203_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC¶Ô»°
--**********************************
		AddText(sceneId,"Các hÕ có phäi ðªn ðây g£p ta ðúng không? Bác LÕp và Viên Bình nói tÕi hÕ ðây không phäi là Ð§u Ð§u")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
