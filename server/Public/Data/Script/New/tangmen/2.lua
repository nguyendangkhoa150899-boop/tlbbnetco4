--唐门NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x760001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{XMPTM_130813_15}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
