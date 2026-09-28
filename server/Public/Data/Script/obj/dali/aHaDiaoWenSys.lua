--脚本号
x391001_g_scriptId = 391001
--**********************************
--事件交互入口
--**********************************
function x391001_OnDefaultEvent( sceneId, selfId, targetId)
	BeginEvent(sceneId)     
		AddText(sceneId, "#G暂不开放暗器,坐骑,时装,百宝箱,百宝囊雕纹")
        AddNumText(sceneId, x391001_g_scriptId,"雕纹合成", 6, 1)
		AddNumText(sceneId, x391001_g_scriptId,"雕纹蚀刻", 6, 2)
		AddNumText(sceneId, x391001_g_scriptId,"雕纹强化", 6, 3)
		AddNumText(sceneId, x391001_g_scriptId,"雕纹拆除", 6, 4)
		AddNumText(sceneId, x391001_g_scriptId,"双极雕纹强化", 6, 6)
		AddNumText(sceneId, x391001_g_scriptId,"双极雕纹拆除", 6, 7)
		AddNumText(sceneId, x391001_g_scriptId,"关于装备雕纹", 11, 5)
		AddNumText(sceneId, x391001_g_scriptId,"我只是路过的", 8, 9999)
		EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x391001_OnEventRequest( sceneId, selfId, targetId, eventId )
	local key=GetNumText()
	if key==9999 then
		x391001_CloseMe(sceneId, selfId)
	elseif key==1 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000156)
	elseif key==2 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2000156)
	elseif key==3 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,2)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3000156)
	elseif key==4 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,3)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 4000156)
	elseif key==5 then
		BeginEvent(sceneId)     
			AddText(sceneId, "#{ZBDW_091105_21}")
		AddText(sceneId, "    #G小提示：右键点击装备、材料进行操作，只有特定高级装备才可以雕纹。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key==6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,4)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3770156)--3770156
	elseif key==7 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,5)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3780156)
	end
end
--**********************************
--对话窗口信息提示
--**********************************
function x391001_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--醒目提示
--**********************************
function x391001_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--关闭对话框
--**********************************
function x391001_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end