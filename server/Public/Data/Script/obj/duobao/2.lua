-- 升级NPC

x890018_g_scriptId = 890018
--奖励标记
x890018_g_flag = {
    [80]	= MF_LINGQUYUANBAO80,
    [90]	= MF_LINGQUYUANBAO90,
    [100]	= MF_LINGQUYUANBAO100,
    [110]	= MF_LINGQUYUANBAO110,
    [120]	= MF_LINGQUYUANBAO120,
	}
x890018_g_Title		={}
x890018_g_Title[1] = "初级师傅"

--**********************************
--事件交互入口
--**********************************
function x890018_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText ="#ccc33cc$N#Y玩家欢迎你！这里是暗器雕纹服务"
		AddText( sceneId, strText )
	if GetLevel( sceneId, selfId ) >= 95 then
	       AddNumText( sceneId, x890018_g_scriptId, "点击进入升级程序", 5, 5551) 
	end 	
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function	x890018_OnEventRequest(sceneId, selfId, targetId, eventId)		
	if GetNumText()==	5551	then
		BeginEvent(sceneld)
			AddText(sceneld,strText)
		              AddNumText( sceneId,x890018_g_scriptld,	"#Y跑", 10, 5552)
              EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )


	elseif GetNumText() == 5552 then
--	local nStoneId = 10553137
--	local nStoneId = 30503901
	if LuaFnGetAvailableItemCount(sceneId, selfId, 31000005)>=1 then
                BeginEvent( sceneId ) 
			LuaFnDelAvailableItem(sceneId,selfId,31000005,1)--删除物品
                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 32691, 0)
			TryRecieveItem( sceneId,selfId,30505167,1)--给予物品
                        AddText( sceneId, "恭喜你雕纹成功" )
                EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
                else
                BeginEvent( sceneId ) 
	       		AddText( sceneId, "雕纹材料不全你搞什么飞机，小心扁你个小子" )
               	EndEvent( sceneId )
           	DispatchEventList( sceneId, selfId, targetId )
	end
end
--**********************************	
--对话提示	
--**********************************	
function	x890018_TalkMsg( sceneId, selfId, targetId, str)	
	BeginEvent(sceneId)	
		AddText(sceneId, str)	
	EndEvent(sceneId)	
	DispatchEventList(sceneId,selfId,targetId) 		
	end
		
end
	
	

