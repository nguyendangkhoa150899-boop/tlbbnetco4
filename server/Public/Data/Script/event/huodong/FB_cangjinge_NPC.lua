------***********
-----刷怪进入脚本
-----************
--脚本号
x807004_g_ScriptId	= 807004

--所拥有的事件ID列表
x807004_g_EventList	= { 807005 }
--接取任务的最低等级
x807004_g_minLevel			= 20

--**********************************
--事件列表
--**********************************
function x807004_UpdateEventList( sceneId, selfId, targetId )

		CallScriptFunction( x807004_g_EventList[1], "OnEnumerate", sceneId, selfId, targetId )
	
end

--**********************************
--事件交互入口
--**********************************
function x807004_OnDefaultEvent( sceneId, selfId, targetId )
	x807004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x807004_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x807004_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--接受此NPC的任务
--**********************************
function x807004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x807004_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--拒绝此NPC的任务
--**********************************
function x807004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--拒绝之后，要返回NPC的事件列表
	for i, findId in x807004_g_EventList do
		if missionScriptId == findId then
			x807004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--继续（已经接了任务）
--**********************************
function x807004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x807004_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--提交已做完的任务
--**********************************
function x807004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x807004_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--死亡事件
--**********************************
function x807004_OnDie( sceneId, selfId, killerId )
end

