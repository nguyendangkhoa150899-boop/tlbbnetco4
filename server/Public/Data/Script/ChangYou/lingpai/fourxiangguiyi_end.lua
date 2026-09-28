----四象归一结束脚本，重新刷新一下BUFF
x808231_g_scriptId = 808245
function x808245_OnImpactFadeOut( sceneId, selfId, impactId )
	local old_buffid = GetMissionData(sceneId,selfId,MD_LINGPAI_BUFFID)
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, old_buffid , 0 ) ----加集成属性
	SetMissionData(sceneId,selfId,MD_LINGPAI_BUFFID,0)
end
function x808245_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
	AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--DJZVMRU作式了中以我些开作

--上了要发我些展581581481
