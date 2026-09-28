--楼兰NPC....
--缥缈峰接引使....

--脚本号
x900069_g_ScriptId = 900069


--所拥有的事件ID列表
x900069_g_eventList={900070}

--**********************************
--事件列表
--**********************************
function x900069_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		for i, eventId in x900069_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x900069_OnDefaultEvent( sceneId, selfId,targetId )
	x900069_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x900069_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x900069_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x900069_g_ScriptId )
		return
		end
	end
end
