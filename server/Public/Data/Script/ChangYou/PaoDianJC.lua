--脚本号
x900076_g_scriptId = 900076


x900076_g_jifeng = {}				-- 每个玩家积分
x900076_g_HumanID = {}				-- 每个玩家ID
--**********************************
--心跳入口
--**********************************
function x900076_OnCharacterTimer( sceneId, objId, dataId, uTime )
   	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		 nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)			
		 x900076_OpenUi(sceneId, nHumanId)
	end

	
	
	
	--心跳入口
end

--**********************************
--泡点
--**********************************


--**********************************
--系统公告
--**********************************
function x900076_SysMsg( sceneId, groupId )
	if x900076_g_BossSysMsgByGroupID[groupId].isSended==0 then
		--BroadMsgByChatPipe( sceneId, 0, x900076_g_BossSysMsgByGroupID[groupId].Msg, 4 )
		AddGlobalCountNews( sceneId, x900076_g_BossSysMsgByGroupID[groupId].Msg )
		x900076_g_BossSysMsgByGroupID[groupId].isSended=1
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x900076_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

function x900076_OnPlayerEnter( sceneId, playerId ) 
            local playerName = LuaFnGetName( sceneId, playerId );
            local playerLv = GetLevel(sceneId, playerId)                                 
  		    SetPvpAuthorizationFlagByID(sceneId, playerId, 2, 1)   		         	
            SetUnitCampID(sceneId, playerId, playerId, playerId )            
       	    BroadMsgByChatPipe(sceneId, playerId, "#ccc33cc玩家【"..playerName.."】,等级："..playerLv.."级 进入激情泡点，究竟鹿死谁手，我们试目以待！", 4);   
       	    
end
--**********************************
--醒目提示
--**********************************
function x900076_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--关闭对话框
--**********************************
function x900076_OpenUi(sceneId, selfId)--泡点奖励
local zd = 100000  
local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
local nQuarter = mod(GetQuarterTime(),100);
if nQuarter >= 80  then--到点就传送出去
 x900076_NotifyTip( sceneId, selfId, "活动时间已过，自动传送出去" )
 CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 262, 250, 20 );
return
end
if nQuarter < 76  then--到点就传送出去
x900076_NotifyTip( sceneId, selfId, "活动没有开启，自动传送出去" )
CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 262, 250, 20 );
return
end
if nHumanCount >= 10 and nHumanCount <= 20 then
YuanBao(sceneId,selfId,-1,1,zd/2)
x900076_NotifyTip( sceneId, selfId, "恭喜您，成功泡得"..zd/2 .."元宝。当前人数为："..nHumanCount )
else
x900076_NotifyTip( sceneId, selfId, "恭喜您，超过20人。无奖励" )
end

end