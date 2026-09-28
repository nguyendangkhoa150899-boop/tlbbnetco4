--洛阳NPC
--歌伎
--普通
x000045_g_ScriptId = 000045
--**********************************
--事件交互入口
--**********************************
function x000045_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我是小丫鬟，主子的事情我可不知道。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--远程调用
--**********************************
function x000045_MyCallScript( sceneId, selfId, clickId)
     if clickId == 1 then  --打开界面
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 201705081 )
        return
     end

     if clickId == 2 then  --打开界面
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 201705091 )
        return
     end
end
