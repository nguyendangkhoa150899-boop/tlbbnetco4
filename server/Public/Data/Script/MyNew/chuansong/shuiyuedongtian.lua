-- 领奖NPC

x100013_g_scriptId = 100013

--**********************************
--事件交互入口
--**********************************
function x100013_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 90 then
			BeginEvent(sceneId)
	   			AddText( sceneId, " 您好！您的等于不足90级！" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   		AddText( sceneId, "这位英雄,若你想入得玄海,我定不阻拦。但前提是你武艺超凡,且习得避水之法。这样我才能引你前往水月洞天,并前往玄海之中。" )	
		   		AddText( sceneId, "#cff66cc提示：#Y鏖战九黎#G活动#Y全天开放!" )
		   		--AddNumText( sceneId, x100013_g_scriptId, "前往水月洞天", 6, 30 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--事件列表选中一项
--**********************************
function x100013_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 30 then
      
       local nQuarter = mod(GetQuarterTime(),100);--8-12 40 44  64 68
             if nQuarter < 0 or nQuarter >= 95    then
            BeginEvent(sceneId)
		AddText(sceneId,"#G现在不是活动时间，无法进入水月洞天!" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end

     CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 546, 67, 93,10 )--传送
    end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x100013_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x100013_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--消息提示
--**********************************
function x100013_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话提示
--**********************************
function x100013_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end
