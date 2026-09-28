--慕容NPC
--公冶坤
--普通

x002130_g_scriptId = 002130

--**********************************
--事件交互入口
--**********************************
function x002130_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"$N，慕容山庄的藏书水阁中收集了天下各派的武功秘籍，难易繁杂皆有，但最近频遭窃书贼困扰，你要进去查看一番吗？")
		AddNumText(sceneId,x002130_g_scriptId,"去击退窃贼！",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x002130_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<50  then	
			BeginEvent( sceneId )
			local strText = "要想捉拿窃贼，需得具备一定的本领，少侠你尚未达到#G50级#W，还是先去别处历练一番再来吧。"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 329,158,155)
		end
	end
end