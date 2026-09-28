--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x013017_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Mu礽 mu礽 Thi阯 Ti阯")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
