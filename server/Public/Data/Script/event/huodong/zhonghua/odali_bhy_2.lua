--种花子脚本一

--脚本号
x002112_g_scriptId = 002112

--所拥有的事件ID列表
--x002112_g_eventList={002091, 002101, 002106, 002107, 002108, 002109}
x002112_g_eventList={002101}
--**********************************
--事件列表
--**********************************
function x002112_UpdateEventList( sceneId, selfId, targetId )
	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )

	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
	AddText( sceneId, "    #G就像我师傅说的那样，大理果然是个美丽的地方，四季如春。对于一个种花人来说，这里就是一个天堂。今年我师傅带来了一些西域的花种，希望在这美丽的城市也能落地发芽，但需要一些爱花的人来培育。只要你的级别满足20级，就可以在我这领任务了。" )
    AddNumText( sceneId, x002112_g_ScriptId, "离开……", 15, 0 )
	for i, eventId in x002112_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件交互入口
--**********************************
function x002112_OnDefaultEvent( sceneId, selfId, targetId )
	x002112_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002112_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
   
if nNumText==0  then
	-- 关闭窗口
       BeginUICommand(sceneId)
       EndUICommand(sceneId)
       DispatchUICommand(sceneId,selfId, 1000)
       return
	end

	--*********************
for i, findId in x002112_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
end

end
--**********************************
--接受此NPC的任务
--**********************************


function x002112_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	
	for i, findId in x002112_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end

end
--**********************************
--拒绝此NPC的任务
--**********************************
function x002112_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002112_g_eventList do
		if missionScriptId == findId then
			x002112_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--继续（已经接了任务）
--**********************************
function x002112_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	
	for i, findId in x002112_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--提交已做完的任务
--**********************************
function x002112_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002112_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--死亡事件
--**********************************
function x002112_OnDie( sceneId, selfId, killerId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x002112_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end