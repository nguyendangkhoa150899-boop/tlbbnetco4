-- 领奖NPC

x100014_g_scriptId = 100014

--**********************************
--事件交互入口
--**********************************
function x100014_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 110 then
			BeginEvent(sceneId)
	   			AddText( sceneId, " 您好！您的等于不足110级！" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   		AddText( sceneId, "110级以上的玩家在每周一19点寒冰海域开启 周三19点灭世火窟开启 周五19点蛊惑灵谷开启之后可以进入" )	
		   		AddText( sceneId, "#cff66cc提示：本活动为终极大型活动,详情请关注官方网站查看攻略!" )
		   		AddNumText( sceneId, x100014_g_scriptId, "寒冰海域Ａ点", 6, 101 )
				AddNumText( sceneId, x100014_g_scriptId, "寒冰海域Ｂ点", 6, 102 )
				AddNumText( sceneId, x100014_g_scriptId, "寒冰海域Ｃ点", 6, 103 )
				AddNumText( sceneId, x100014_g_scriptId, "灭世火窟Ａ点", 6, 301 )
				AddNumText( sceneId, x100014_g_scriptId, "灭世火窟Ｂ点", 6, 302 )
				AddNumText( sceneId, x100014_g_scriptId, "灭世火窟Ｃ点", 6, 303 )
				AddNumText( sceneId, x100014_g_scriptId, "蛊惑灵谷Ａ点", 6, 501 )
				AddNumText( sceneId, x100014_g_scriptId, "蛊惑灵谷Ｂ点", 6, 502 )
				AddNumText( sceneId, x100014_g_scriptId, "蛊惑灵谷Ｃ点", 6, 503 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--事件列表选中一项
--**********************************
function x100014_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 101 then
      
--       local nQuarter = mod(GetQuarterTime(),100);
 --            if nQuarter < 56 or nQuarter >= 60  then
--            BeginEvent(sceneId)
--		AddText(sceneId,"活动时间为每天14:00-15:00，现在无法进入通天塔地宫!" )
--		EndEvent(sceneId)
--		DispatchEventList(sceneId,selfId,targetId)
--		return 0
--	end

     CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 505, 95, 45,10 )--传送
    end

    if GetNumText() == 102 then	
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 505, 47, 97,10 )--传送	
	end
	if GetNumText() == 103 then	
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 505, 100, 150,10 )--传送	
	end
	if GetNumText() == 301 then	
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 506, 97, 34,10 )--传送	
	end
	if GetNumText() == 302 then	
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 506, 38, 98,10 )--传送	
	end
	if GetNumText() == 303 then	
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 506, 100, 150,10 )--传送	
	end
	if GetNumText() == 501 then	
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 507, 95, 63,10 )--传送	
	end
	if GetNumText() == 502 then	
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 507, 56, 98,10 )--传送	
	end
	if GetNumText() == 503 then	
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 507, 97, 125,10 )--传送	
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x100014_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x100014_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--消息提示
--**********************************
function x100014_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话提示
--**********************************
function x100014_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end
