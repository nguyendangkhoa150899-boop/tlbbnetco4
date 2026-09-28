--脚本号
x125019_g_scriptId = 125019

--**********************************
--刷怪逻辑
--**********************************
function x125019_OnCharacterTimer( sceneId, objId, dataId, uTime )
	local nHour	 = GetHour()--小时
	local nMinute = GetMinute()--分钟

	if sceneId==414 then
	   if (nHour==0 or nHour==10 or nHour==12 or nHour==14 or nHour==16 or nHour==18 or nHour==20 or nHour==22) then
	            CallScriptFunction(125020,"OnSceneTimer",sceneId)
	   end
	end
end

--**********************************
--刷BOSS
--**********************************
function x125019_CreateMonster( sceneId )

end

--**********************************
--系统公告
--**********************************
function x125019_SysMsg( sceneId, groupId )

end

--**********************************
--对话窗口信息提示
--**********************************
function x125019_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end


--**********************************
--醒目提示
--**********************************
function x125019_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--关闭对话框
--**********************************
function x125019_CloseMe(sceneId, selfId)
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
