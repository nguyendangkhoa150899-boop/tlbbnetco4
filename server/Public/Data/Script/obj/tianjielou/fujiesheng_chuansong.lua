--付劫生

--脚本号
x002930_g_scriptId = 002930


--所拥有的事件ID列表
x002930_g_eventList={808138}

--**********************************
--事件列表
--**********************************
function x002930_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)

	for i, eventId in x002930_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	
	
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002930_OnDefaultEvent( sceneId, selfId,targetId )
	x002930_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002930_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x002930_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002930_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002930_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x002930_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002930_g_eventList do
		if missionScriptId == findId then
			x002930_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002930_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002930_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002930_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002930_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002930_OnDie( sceneId, selfId, killerId )
end

--**********************************
--时钟事件
--**********************************
function x002930_OnCharacterTimer( sceneId, selfId, dataId, nowtime )
--场景号，ObjID，怪物表号，时间值(毫秒)

end





