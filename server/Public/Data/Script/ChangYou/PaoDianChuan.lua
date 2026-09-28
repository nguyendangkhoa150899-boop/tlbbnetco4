---2018年经典游戏巨作致青春·复古龙城争霸脚本
---作者Q546528533  请勿删除或篡改作者信息
---陆续放出更多功能

x900075_g_ScriptId	= 900075
x900075_g_hudongtime ={ {10,5},{11,1}}
--**********************************
--事件交互入口
--**********************************
function x900075_OnDefaultEvent( sceneId, selfId, targetId )
local nWeek = GetTodayWeek()
BeginEvent( sceneId )
	AddText( sceneId, "#G亲爱的玩家.欢迎你来到#Y大型互站#G[激情泡点]#G。#r#Y  时间：#G[每天]#R19:00-20:00" )
	AddText( sceneId, "#I激情泡点开启后，玩家可进入去泡点。每分钟会奖励10万元宝。当场景玩家数超过#G10#I个时，奖励减少一半，#G20#I个时，将所有人没有奖励，场景内为个人混战模式。" )
	AddNumText( sceneId, x900075_g_ScriptId, "开始激情泡点", 2, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x900075_OnEventRequest( sceneId, selfId, targetId, eventId )

local nQuarter = mod(GetQuarterTime(),100);
if GetNumText() == 1 then--满血满怒
 if nQuarter >= 80 then--满血满怒
 x900075_NotifyFailTips( sceneId, selfId, "时间已过，无法进入激情泡点" )
 return
 end
if nQuarter < 76 then
x900075_NotifyFailTips( sceneId, selfId, "还没到时间，无法进入激情泡点" )
return
end
CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 444, 31, 31, 20 );  
return

end

end
--**********************************
-- 对话窗口信息提示
--**********************************
function x900075_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x900075_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--对话窗口信息提示
--**********************************
function x900075_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--恢复血和气
--**********************************
function x900075_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	RestoreRage( sceneId, selfId )
end