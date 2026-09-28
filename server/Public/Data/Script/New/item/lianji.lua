-- 领奖NPC

x000165_g_scriptId = 000165

--**********************************
--事件交互入口
--**********************************
function x000165_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "新宝石系统"
		AddText( sceneId, strText )
		AddNumText( sceneId, x000165_g_scriptId, "宝石琢刻", 2, 101 )
		AddNumText( sceneId, x000165_g_scriptId, "宝石分离", 2, 102 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000165_OnEventRequest( sceneId, selfId, targetId, eventId )


if  GetNumText() == 101 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 201210120 )
elseif GetNumText() == 102 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 201210121 )		
end
	
end


