--珍珑副本任务npc

--脚本号
x000090_g_scriptId = 000090


--所拥有的事件ID列表
x000090_g_eventList={401001,401002}

--**********************************
--事件列表
--**********************************
function x000090_UpdateEventList( sceneId, selfId,targetId )

	BeginEvent(sceneId)
	
		AddNumText( sceneId, x000090_g_scriptId, "Gi\190i thi\174u K\207 Cu\181c", 11, 10 )
	
		if sceneId == 0 then
			AddNumText( sceneId, x000090_g_scriptId, "V\224o Ph\242ng ngh\239 1 L\213c D\223\189ng", 9, 20 )
			AddNumText( sceneId, x000090_g_scriptId, "V\224o Ph\242ng ngh\239 2 L\213c D\223\189ng", 9, 21 )
			AddNumText( sceneId, x000090_g_scriptId, "V\171 Ph\242ng ngh\239", 11, 30 )
		elseif sceneId == 1 then
			AddNumText( sceneId, x000090_g_scriptId, "V\224o Ph\242ng ngh\239 T\244 Ch\226u", 9, 22 )
			AddNumText( sceneId, x000090_g_scriptId, "V\171 Ph\242ng ngh\239", 11, 31 )
		elseif sceneId == 2 then
			AddNumText( sceneId, x000090_g_scriptId, "V\224o Ph\242ng ngh\239 \208\213i L\253", 9, 23 )
			AddNumText( sceneId, x000090_g_scriptId, "V\171 Ph\242ng ngh\239", 11, 32 )
		end

		AddNumText( sceneId, x000090_g_scriptId, "L\224m sao nh\167n th\234m kinh nghi\174m khi \240\225nh c\182", 11, 519 )
		--[tx45411]AddNumText(sceneId, x000090_g_scriptId, "#{NSRQ_081110_2}", 11, 999); --zchw

		for i, findId in x000090_g_eventList do
			CallScriptFunction( x000090_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件交互入口
--**********************************
function x000090_OnDefaultEvent( sceneId, selfId,targetId )
	x000090_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000090_OnEventRequest( sceneId, selfId, targetId, eventId )

	--[tx45411]if GetNumText() == 999 then
		--BeginEvent(sceneId)					
		--	AddText( sceneId, "#{NSRQ_081110_3}" )						
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
		--return		
	--[/tx45411]end
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_063}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	if GetNumText() == 519 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{QJ_20080522_03}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	local NumText = GetNumText()
	if NumText == 20 then
		x000090_CheckCanEnterRest( sceneId, selfId, targetId, 418,32,16 )
		return
	elseif  NumText == 21 then
		x000090_CheckCanEnterRest( sceneId, selfId, targetId, 419,32,16 )
		return
	elseif  NumText == 22 then
		x000090_CheckCanEnterRest( sceneId, selfId, targetId, 518,32,16 )
		return
	elseif  NumText == 23 then
		x000090_CheckCanEnterRest( sceneId, selfId, targetId, 193,32,16 )
		return
	elseif  NumText == 30 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{QJXXS_1105_1}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif  NumText == 31 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{QJXXS_1105_2}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif  NumText == 32 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{QJXXS_1105_3}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	for i, findId in x000090_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000090_OnDie( sceneId, selfId, killerId )
end

--**********************************
--检测是否可以进入棋局休息室
--**********************************
function x000090_CheckCanEnterRest( sceneId, selfId, targetId, s, x, y )

	if LuaFnHasTeam(sceneId, selfId) ~= 0 then

		if LuaFnIsTeamLeader(sceneId, selfId) == 0 then
			BeginEvent(sceneId)	
				AddText( sceneId, "  Ch\239 nh\243m tr\223\183ng m\190i \240\223a \240\223\254c c\228 nh\243m v\224o Ph\242ng ngh\239." )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId)
		local nearMemberCount = GetNearTeamCount(sceneId, selfId)
		if teamMemberCount ~= nearMemberCount then
			BeginEvent(sceneId)	
				AddText( sceneId, "  C\243 th\224nh vi\234n trong nh\243m kh\244ng \183 g\165n \240\226y." )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		local memId;
		for	i = 0, nearMemberCount - 1 do
			memId = GetNearTeamMember(sceneId, selfId, i);
			NewWorld(sceneId, memId, s, x, y);
		end

	else

		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, s, x, y )

	end

end
