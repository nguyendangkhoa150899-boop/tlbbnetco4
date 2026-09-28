--石林NPC
--雷蒙
--普通

--**********************************
--事件交互入口
--**********************************
function x026006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"L鬷 M鬾g ~~")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
