x002136_g_ScriptId = 002136

x002136_left 	=158.0000
x002136_right	=164.0000

x002136_top  	=166.0000
x002136_bottom	=171.0000


--玩家进入一个 area 时触发
function x002136_OnEnterArea( sceneId, selfId )

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x002136_g_ScriptId);
		UICommand_AddString(sceneId, "GotoJinghu3");
		UICommand_AddString(sceneId, "镜湖为不加杀气场景，请注意安全。你确认要进入吗？");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

--玩家在一个 area 呆了一段时间没走则定时触发
function x002136_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x002136_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x002136_OnLeaveArea( sceneId, selfId )
end

--**********************************
--任务入口函数
--**********************************
function x002136_GotoJinghu3( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	-- 检查玩家是不是还在这个范围内
	if sceneId ~= 195   then
		--你已经不在可传送区域。
		BeginEvent(sceneId)
			AddText(sceneId,"你已经不在可传送区域。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x002136_left or
			targetX > x002136_right or
			targetZ < x002136_top  or
			targetZ > x002136_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"你已经不在可传送区域。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,54,142)
		
end
