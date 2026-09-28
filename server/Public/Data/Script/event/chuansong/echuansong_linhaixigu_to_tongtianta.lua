--玩家进入一个 area 时触发
function x400205_OnEnterArea( sceneId, selfId )
       --local nQuarter = mod(GetQuarterTime(),100);
       --if nQuarter < 80 or nQuarter > 88  then
          --x400205_NotifyTip( sceneId, selfId, "通天塔每天晚上20:00-22:00开放，当前时刻未开放！" )
       --return
       --end
       --CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 581,252,359) 
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400205_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400205_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400205_OnLeaveArea( sceneId, selfId )
end

--**********************************
--醒目提示
--**********************************
function x400205_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end