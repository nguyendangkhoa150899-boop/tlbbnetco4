-- 领奖NPC

x100012_g_scriptId = 100012

--**********************************
--事件交互入口
--**********************************
function x100012_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 100 then
			BeginEvent(sceneId)
	   			AddText( sceneId, " 您好！您的等于不足100级！" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   		AddText( sceneId, "大于100级玩家可以进入通天塔地宫,地宫一共分为五层,每一层的爆率都是逐步提升的,顶层为BOSS,本地图怪物刷新时间较快,站的越高,享受的爆率越高!本地图可以任意宣战,经验值非常高!" )	
		   		--AddText( sceneId, "#cff66cc提示：#Y通天塔#G活动#Y全天皆可进入" )
		   		AddNumText( sceneId, x100012_g_scriptId, "参加勇闯通天塔", 6, 30 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--事件列表选中一项
--**********************************
function x100012_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 30 then
      
       local nQuarter = mod(GetQuarterTime(),100);
             if nQuarter < 0 or nQuarter >= 95  then
            BeginEvent(sceneId)
		AddText(sceneId,"活动时间为全天皆可进入!" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end

     CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 581, 255, 376,10 )--传送
    end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x100012_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x100012_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--消息提示
--**********************************
function x100012_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话提示
--**********************************
function x100012_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end
