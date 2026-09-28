--慕容NPC
--慕容弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x002122_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{GUSU_MENPAI_25}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
